# 08. Designing Modules with Interfaces (Dependency Inversion Principle)

QFramework itself supports the Dependency Inversion Principle, which means that all module access and interaction can be completed through interfaces. The code is as follows:

```plain
using UnityEngine;
using UnityEngine.UI;

namespace QFramework.Example
{

    // 1. 定义一个 Model 对象
    public interface ICounterAppModel : IModel
    {
        BindableProperty<int> Count { get; }
    }
    public class CounterAppModel : AbstractModel,ICounterAppModel
    {
        public BindableProperty<int> Count { get; } = new BindableProperty<int>();

        protected override void OnInit()
        {
            var storage = this.GetUtility<IStorage>();

            // 设置初始值（不触发事件）
            Count.SetValueWithoutEvent(storage.LoadInt(nameof(Count)));

            // 当数据变更时 存储数据
            Count.Register(newCount =>
            {
                storage.SaveInt(nameof(Count),newCount);
            });
        }
    }

    public interface IAchievementSystem : ISystem
    {

    }

    public class AchievementSystem : AbstractSystem ,IAchievementSystem
    {
        protected override void OnInit()
        {
            this.GetModel<ICounterAppModel>() // -+
                .Count
                .Register(newCount =>
                {
                    if (newCount == 10)
                    {
                        Debug.Log("触发 点击达人 成就");
                    }
                    else if (newCount == 20)
                    {
                        Debug.Log("触发 点击专家 成就");
                    }
                    else if (newCount == -10)
                    {
                        Debug.Log("触发 点击菜鸟 成就");
                    }
                });
        }
    }

    public interface IStorage : IUtility
    {
        void SaveInt(string key, int value);
        int LoadInt(string key, int defaultValue = 0);
    }

    public class Storage : IStorage
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
            // 注册 System 
            this.RegisterSystem<IAchievementSystem>(new AchievementSystem()); 

            // 注册 Model
            this.RegisterModel<ICounterAppModel>(new CounterAppModel());

            // 注册存储工具的对象
            this.RegisterUtility<IStorage>(new Storage());
        }
    }

    // 引入 Command
    public class IncreaseCountCommand : AbstractCommand 
    {
        protected override void OnExecute()
        {
            var model = this.GetModel<ICounterAppModel>();

            model.Count.Value++; // -+
        }
    }

    public class DecreaseCountCommand : AbstractCommand
    {
        protected override void OnExecute()
        {
            this.GetModel<ICounterAppModel>().Count.Value--; // -+
        }
    }

    // Controller
  public class CounterAppController : MonoBehaviour , IController /* 3.实现 IController 接口 */
    {
        // View
        private Button mBtnAdd;
        private Button mBtnSub;
        private Text mCountText;

        // 4. Model
        private ICounterAppModel mModel;

        void Start()
        {
            // 5. 获取模型
            mModel = this.GetModel<ICounterAppModel>();

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

            // 表现逻辑
            mModel.Count.RegisterWithInitValue(newCount => // -+
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

The code is not difficult.

All module registration, module acquisition, and other code are completed through interfaces, which conforms to the Dependency Inversion Principle in the SOLID principle.

Designing modules through interfaces can make it easier for us to think about the interaction and responsibilities between modules themselves, rather than specific implementations, and can reduce a lot of interference in the design process.

Of course, there are many other benefits to developing in an interface-oriented way, which everyone will gradually experience as they use it.

One important thing is that we previously mentioned Storage. If we want to switch the storage API from PlayerPrefs to EasySave, we don't need to modify the Storage object, but just extend an IStorage interface. The pseudo code is as follows:

```plain
    public class EasySaveStorage : IStorage
    {
        public void SaveInt(string key, int value)
        {
            // todo
        }

        public int LoadInt(string key, int defaultValue = 0)
        {
            // todothrow new System.NotImplementedException();
        }
    }
```

The pseudo code for registering modules is as follows:

```plain
    // 定义一个架构（用于管理模块）
    public class CounterApp : Architecture<CounterApp>
    {
        protected override void Init()
        {
            // 注册成就系统
            this.RegisterSystem<IAchievementSystem>(new AchievementSystem());

            this.RegisterModel<ICounterAppModel>(new CounterAppModel());

            // 注册存储工具对象
            // this.RegisterUtility<IStorage>(new Storage());
            this.RegisterUtility<IStorage>(new EasySaveStorage());
        }
    }
```

In this way, all storage code at the bottom is switched to EasySave storage, and replacing a set of solutions is very simple.

Okay, that's all for the feature of designing modules with interfaces.

That's all for this content.

## Summary Notes

1. Dependency Inversion Principle
2. Generally speaking, in each component, if you need to get other components, you use the methods provided by Architecture to get them, and these methods are all based on interfaces. The specific type information is passed in through generics, such as:
    1. CounterApp registers components using RegisterXXX
    2. CounterAppController calls Command using SendCommand
    3. System gets Model using GetModel
    4. Command gets Model using GetModel
    5. Model gets Utility using GetUtility

Attached is a class diagram to help understand the DIP principle:

![](https://cdn.jsdelivr.net/gh/storageimgbed/storage@img/images/20230624162529.png)
