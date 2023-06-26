# 03. Introduction to Command

Let's review the current code as follows:

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
            // 注册 Modelthis.RegisterModel(new CounterAppModel());
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
                // 6. 交互逻辑
                mModel.Count++;
                // 表现逻辑
                UpdateView();        
            });

            mBtnSub.onClick.AddListener(() =>
            {
                // 7. 交互逻辑
                mModel.Count--;
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

Now, the problem of data sharing is solved by introducing the Model.

It is emphasized again here that **data that needs to be shared should be placed in the Model, and data that does not need to be shared should not be placed in the Model if possible**.

Although the Model has been introduced, there are still many problems with this set of code as the project scales.

The most serious and common one is that the Controller will become more and more bloated.

Let's analyze why the Controller will become more and more bloated. Let's first look at the code for listening to user input, as follows:

```plain
// 监听输入
mBtnAdd.onClick.AddListener(() =>
{
    // 交互逻辑
    mModel.Count++;
    // 表现逻辑
    UpdateView();        
});

mBtnSub.onClick.AddListener(() =>
{
    // 交互逻辑
    mModel.Count--;
    // 表现逻辑
    UpdateView();
});
```

In the code for processing user input, the author wrote comments on the interaction logic and presentation logic.

What are **interaction logic** and **presentation logic**?

Very simple.

**Interaction logic** is the logic from user input to data change.

The order is View->Controller->Model.

**Presentation logic** is the logic from data change to display on the interface.

The order is Model->Controller->View.

As shown in the following figure:

[![](https://file.liangxiegame.com/0b4e1255-ee5d-4223-97a6-2e49cf68715c.png)](https://file.liangxiegame.com/0b4e1255-ee5d-4223-97a6-2e49cf68715c.png)

Although the interaction logic and presentation logic are easy to understand, they are very important because the concepts of QFramework are based on these two concepts.

The interaction logic and presentation logic of View, Model, and Controller form a closed loop. It constitutes a complete MVC loop.

The reason why the Controller itself is bloated is that it is responsible for two responsibilities, namely, the interaction logic of changing Model data and the presentation logic of updating to the interface after Model data changes.

In a project of a certain scale, there are many presentation logic and interaction logic. A Controller can easily reach thousands of lines of code.

**Most MVC solutions solve the problem of bloated Controller by introducing Command, that is, introducing the command pattern to share the responsibility of Controller's interaction logic.**

QFramework also uses the same method to solve the problem of bloated Controller.

We changed the code to the following:

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
    public class IncreaseCountCommand : AbstractCommand // ++
    {
        protected override void OnExecute()
        {
            this.GetModel<CounterAppModel>().Count++;
        }
    }

    public class DecreaseCountCommand : AbstractCommand // ++
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

        // 3.
        public IArchitecture GetArchitecture()
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

The code is very simple, and we represent it with a flowchart as follows:

[![](https://file.liangxiegame.com/6544f785-0389-46bc-813d-b9c77abdd336.png)](https://file.liangxiegame.com/6544f785-0389-46bc-813d-b9c77abdd336.png)

Run Unity, the result is as follows:

[![](https://file.liangxiegame.com/1b934e4f-8f72-44c2-800a-a97f1e707950.gif)](https://file.liangxiegame.com/1b934e4f-8f72-44c2-800a-a97f1e707950.gif)

No change, running correctly.

You may ask, is it necessary to create a Command object for a simple data addition and subtraction operation? It seems unnecessary and the code is longer.

If there is only one simple data addition and subtraction operation in the entire project, using Command is a bit redundant, but the interaction logic of a general project is very complex, and the code volume is also very large. The use of Command vocabulary plays a role throughout the project.

Specifically, using Command can bring many conveniences, such as:

*   Command can be reused, and Command can also call Command
*   Command can easily implement undo function if App or game needs it
*   If certain specifications are followed, automated testing can be implemented using Command.
*   Command can customize the Command queue, and can also make Command execute in a specific way
*   A Command can also be encapsulated as a data request in Http or TCP
*   Command can implement Command middleware mode
*   And so on

OK, by introducing Command, the interaction logic of the Controller is helped to be shared. The Controller becomes a thin layer. When it is necessary to modify the Model, the Controller only needs to call a simple Command.

The most obvious advantage of Command is:

*   Even if the code is messy, it is only messy in a Command object and will not affect other objects.
*   Encapsulating methods into Command objects can realize operations such as organizing, sorting, and delaying Command objects.

Here's the translation:

You will gradually experience more benefits through practice.

The current MVC process is as follows:

[![](https://file.liangxiegame.com/5ddfe754-110f-4417-8e29-d890e36d4a7a.png)](https://file.liangxiegame.com/5ddfe754-110f-4417-8e29-d890e36d4a7a.png)

That's all for this content.
