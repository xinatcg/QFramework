# 05. Introduction to Utility

In this article, we will support the storage function of CounterApp.

The code is also very simple, just modify part of the Model code, as follows:

```plain
    // 定义一个 Model 对象
    public class CounterAppModel : AbstractModel
    {
        private int mCount;

        public int Count
        {
            get => mCount;
            set
            {
                if (mCount != value)
                {
                    mCount = value;
                    PlayerPrefs.SetInt(nameof(Count),mCount);
                }
            }
        }

        protected override void OnInit()
        {
            Count = PlayerPrefs.GetInt(nameof(Count), mCount);
        }
    }
```

This supports very basic data storage functionality.

Of course, there are still some problems. If in the future we need to store a lot of data, the Model layer will be filled with a lot of storage and loading related code.

Also, if we don't want to use PlayperPrefs in the future and want to use EasySave or SQLite, it will cause a lot of modification work.

Therefore, QFramework provides a Utility layer specifically designed to solve the above two problems. The usage is very simple, as follows:

```plain
using UnityEngine;
using UnityEngine.UI;

namespace QFramework.Example
{

    // 1. 定义一个 Model 对象
    public class CounterAppModel : AbstractModel
    {
        private int mCount;

        public int Count
        {
            get => mCount;
            set
            {
                if (mCount != value)
                {
                    mCount = value;
                    this.GetUtility<Storage>().SaveInt(nameof(Count), Count);
                }
            }
        }

        protected override void OnInit()
        {
            var storage = this.GetUtility<Storage>();

            Count = storage.LoadInt(nameof(Count));

            // 可以通过 CounterApp.Interface 监听数据变更事件
            CounterApp.Interface.RegisterEvent<CountChangeEvent>(e =>
            {
                this.GetUtility<Storage>().SaveInt(nameof(Count), Count);
            });
        }
    }

    // 定义 utility 层
    public class Storage : IUtility
    {
        public void SaveInt(string key, int value)
        {
            PlayerPrefs.SetInt(key,value);
        }

        public int LoadInt(string key, int defaultValue = 0)
        {
            return PlayerPrefs.GetInt(key, defaultValue);
        }
    }


    // 2.定义一个架构（提供 MVC、分层、模块管理等）
    public class CounterApp : Architecture<CounterApp>
    {
        protected override void Init()
        {
            // 注册 Model
            this.RegisterModel(new CounterAppModel());

            // 注册存储工具的对象  !!!!
            this.RegisterUtility(new Storage());
        }
    }

    // 定义数据变更事件public struct CountChangeEvent // ++
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
        // View
        private Button mBtnAdd;
        private Button mBtnSub;
        private Text mCountText;

        // 4. Modelprivate CounterAppModel mModel;

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
                // 交互逻辑this.SendCommand<IncreaseCountCommand>();
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

        // 3.public IArchitecture GetArchitecture()
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

The code is very simple. Let's run Unity to see the result:

[![](https://file.liangxiegame.com/1c622976-b32a-4b62-92a3-d34b2c628e27.gif)](https://file.liangxiegame.com/1c622976-b32a-4b62-92a3-d34b2c628e27.gif)

The operation is correct.

So when we want to replace the PlayerPrefs solution with EasySave, we only need to modify the code in Storage.

Finally, the flowchart is given below:

[![](https://file.liangxiegame.com/f2329b2f-700a-4693-b22e-b1afc50c7364.png)](https://file.liangxiegame.com/f2329b2f-700a-4693-b22e-b1afc50c7364.png)

Okay, that's all for this article.
