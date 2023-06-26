# 04. Introduction to Event

Let's take a look at the current code:

```plain
using UnityEngine;
using UnityEngine.UI;

namespace QFramework.Example
{

    // 1. 定义一个 Model 对象
    public class CounterAppModel : AbstractModel
    {
        public int Count;

        protected override void OnInit()
        {
            Count = 0;
        }
    }


    // 2.定义一个架构（提供 MVC、分层、模块管理等）
    public class CounterApp : Architecture<CounterApp>
    {
        protected override void Init()
        {
            // 注册 Model
            this.RegisterModel(new CounterAppModel());
        }
    }

    // 引入 Command
    public class IncreaseCountCommand : AbstractCommand
    {
        protected override void OnExecute()
        {
            this.GetModel<CounterAppModel>().Count++;
        }
    }

    public class DecreaseCountCommand : AbstractCommand
    {
        protected override void OnExecute()
        {
            this.GetModel<CounterAppModel>().Count--;
        }
    }

    // Controller
    public class CounterAppController : MonoBehaviour , IController 
/* 3.实现 IController 接口 */
    {
        // View
        private Button mBtnAdd;
        private Button mBtnSub;
        private Text mCountText;

        // 4. Model
        private CounterAppModel mModel;

        void Start()
        {
            // 5. 获取模型
            mModel = this.GetModel<CounterAppModel>();

            // View 组件获取
            mBtnAdd = transform.Find("BtnAdd").GetComponent<Button>();
            mBtnSub = transform.Find("BtnSub").GetComponent<Button>();
            mCountText = transform.Find("CountText").GetComponent<Text>();


            // 监听输入
            mBtnAdd.onClick.AddListener(() =>
            {
                // 交互逻辑
                this.SendCommand<IncreaseCountCommand>();
                // 表现逻辑
                UpdateView();        
            });

            mBtnSub.onClick.AddListener(() =>
            {
                // 交互逻辑
                this.SendCommand<DecreaseCountCommand>();
                // 表现逻辑
                UpdateView();
            });

            UpdateView();
        }

        void UpdateView()
        {
            mCountText.text = mModel.Count.ToString();
        }

        // 3.public 
        IArchitecture GetArchitecture()
        {
            return CounterApp.Interface;
        }

        private void OnDestroy()
        {
            // 8. 将 Model 设置为空
            mModel = null;
        }
    }
}
```

We have introduced Command to help the Controller share some of the interaction logic.

However, the code that represents the logic doesn't look very intelligent at the moment.

The code that represents the logic is as follows:

```plain
// 监听输入
mBtnAdd.onClick.AddListener(() =>
{
    // 交互逻辑
    this.SendCommand<IncreaseCountCommand>();
    // 表现逻辑
    UpdateView();        
});

mBtnSub.onClick.AddListener(() =>
{
    // 交互逻辑
    this.SendCommand<DecreaseCountCommand>();
    // 表现逻辑
    UpdateView();
});
```

After each logic call, the representation logic part needs to be manually called once (UpdateView method).

In a project, the number of calls to the representation logic will be at least as many as the number of calls to the interaction logic. Because as soon as the data is modified, the corresponding changes in the data must be represented on the interface.

And this part of the code that calls the representation logic will also be very large, so we introduce an event mechanism to solve this problem.

The use of this event mechanism is actually used together with Command. Here is a simple pattern, as shown in the figure below:

[![](https://file.liangxiegame.com/60ccd370-7c2c-4792-8435-ff5427dc5a1b.png)](https://file.liangxiegame.com/60ccd370-7c2c-4792-8435-ff5427dc5a1b.png)

That is, modify the data through Command, and send the corresponding data change event when the data is modified.

This is a simplified version of the CQRS principle, that is, the Command Query Responsibility Separation principle.

Introducing this principle will easily implement an event-driven, data-driven architecture.

In QFramework, the usage is very simple, the code is as follows:

```plain
using UnityEngine;
using UnityEngine.UI;

namespace QFramework.Example
{

    // 1. 定义一个 Model 对象
    public class CounterAppModel : AbstractModel
    {
        public int Count;

        protected override void OnInit()
        {
            Count = 0;
        }
    }


    // 2.定义一个架构（提供 MVC、分层、模块管理等）
    public class CounterApp : Architecture<CounterApp>
    {
        protected override void Init()
        {
            // 注册 Model
            this.RegisterModel(new CounterAppModel());
        }
    }

    // 定义数据变更事件
    public struct CountChangeEvent // ++
    {

    }

    // 引入 Command
    public class IncreaseCountCommand : AbstractCommand 
    {
        protected override void OnExecute()
        {
            this.GetModel<CounterAppModel>().Count++;
            this.SendEvent<CountChangeEvent>(); // ++
        }
    }

    public class DecreaseCountCommand : AbstractCommand
    {
        protected override void OnExecute()
        {
            this.GetModel<CounterAppModel>().Count--;
            this.SendEvent<CountChangeEvent>(); // ++
        }
    }

    // Controller
     public class CounterAppController : MonoBehaviour , IController 
    /* 3.实现 IController 接口 */
    {
        // Viewprivate Button mBtnAdd;
        private Button mBtnSub;
        private Text mCountText;

        // 4. Model
        private CounterAppModel mModel;

        void Start()
        {
            // 5. 获取模型
            mModel = this.GetModel<CounterAppModel>();

            // View 组件获取
            mBtnAdd = transform.Find("BtnAdd").GetComponent<Button>();
            mBtnSub = transform.Find("BtnSub").GetComponent<Button>();
            mCountText = transform.Find("CountText").GetComponent<Text>();


            // 监听输入
            mBtnAdd.onClick.AddListener(() =>
            {
                // 交互逻辑
                this.SendCommand<IncreaseCountCommand>();
            });

            mBtnSub.onClick.AddListener(() =>
            {
                // 交互逻辑
                this.SendCommand(new DecreaseCountCommand(/* 这里可以传参（如果有） */));
            });

            UpdateView();

            // 表现逻辑
            this.RegisterEvent<CountChangeEvent>(e =>
            {
                UpdateView();

            }).UnRegisterWhenGameObjectDestroyed(gameObject);
        }

        void UpdateView()
        {
            mCountText.text = mModel.Count.ToString();
        }

        // 3.public 
        IArchitecture GetArchitecture()
        {
            return CounterApp.Interface;
        }

        private void OnDestroy()
        {
            // 8. 将 Model 设置为空
            mModel = null;
        }
    }
}
```

The code is very simple.

The flow chart is as follows:

[![](https://file.liangxiegame.com/43474a6f-6a18-4d97-bdb9-9319a77481b9.png)](https://file.liangxiegame.com/43474a6f-6a18-4d97-bdb9-9319a77481b9.png)

The running result is as follows:

[![](https://file.liangxiegame.com/1b934e4f-8f72-44c2-800a-a97f1e707950.gif)](https://file.liangxiegame.com/1b934e4f-8f72-44c2-800a-a97f1e707950.gif)

After introducing the event mechanism and the CQRS principle, our code for representing logic has been greatly reduced.

From the original two active calls

```plain
// 监听输入
mBtnAdd.onClick.AddListener(() =>
{
    // 交互逻辑
    this.SendCommand<IncreaseCountCommand>(); // 没有参数构造的命令支持泛型
    // 表现逻辑
    UpdateView();
});

mBtnSub.onClick.AddListener(() =>
{
    // 交互逻辑
    this.SendCommand(new DecreaseCountCommand()); // 也支持直接传入对象（方便通过构造传参)
    // 表现逻辑
    UpdateView();
});
```

It became a place to listen for events and receive events for calls.

```plain
// 监听输入
mBtnAdd.onClick.AddListener(() =>
{
    // 交互逻辑
    this.SendCommand<IncreaseCountCommand>(); // 没有参数构造的命令支持泛型
});

mBtnSub.onClick.AddListener(() =>
{
    // 交互逻辑
    this.SendCommand(new DecreaseCountCommand()); // 也支持直接传入对象（方便通过构造传参)
});

UpdateView();

// 表现逻辑
this.RegisterEvent<CountChangeEvent>(e =>
{
    UpdateView();
}).UnRegisterWhenGameObjectDestroyed(gameObject);
```

This has eased a lot of interaction logic.

OK, so far, we have used a qualified implementation of MVC, and the most important concept in the concepts provided by QFramework has been touched upon, that is, CQRS, using Command to modify data, and sending data change events after the data is modified.

The current schematic is as follows:

[![](https://file.liangxiegame.com/d25c65e0-25ba-43ca-9060-69bd51efaf46.png)](https://file.liangxiegame.com/d25c65e0-25ba-43ca-9060-69bd51efaf46.png)

Learning up to this point, the use of the QFramework architecture can be considered a real entry.

However, there are still some concepts to be continued in the next article.

## Summary

1. By using the event method to decouple the update of the representation logic, it means that we do not need to actively call the representation logic, but define the representation logic, and then send the corresponding event when the data changes. The representation logic only needs to subscribe to this event and define the corresponding execution logic. This way, no matter which role changes the data, it is responsible for sending events at the same time.
2. CQRS:
