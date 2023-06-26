# 02. MVC in QFramework

/

QFramework is based on the MVC development pattern.

So let's start learning QFramework from the most familiar MVC architecture.

Let's first create a very simple counter application.

First, we use UGUI to create the simplest interface, as shown in the figure below:

[![](https://file.liangxiegame.com/902ef543-64b1-45ad-ae45-ea180ebec133.png)](https://file.liangxiegame.com/902ef543-64b1-45ad-ae45-ea180ebec133.png)

The scene structure is shown below:

[![](https://file.liangxiegame.com/1db2c50c-cb8b-4b1c-92f6-432ff4083105.png)](https://file.liangxiegame.com/1db2c50c-cb8b-4b1c-92f6-432ff4083105.png)

After copying, we create a script called CounterAppController, with the following code:

```plain
using UnityEngine;
using UnityEngine.UI;

namespace QFramework.Example
{
    // Controllerpublic class CounterAppController : MonoBehaviour
    {
        // View
        private Button mBtnAdd;
        private Button mBtnSub;
        private Text mCountText;

        // Modelprivate int mCount = 0;

        void Start()
        {
            // View 组件获取
            mBtnAdd = transform.Find("BtnAdd").GetComponent<Button>();
            mBtnSub = transform.Find("BtnSub").GetComponent<Button>();
            mCountText = transform.Find("CountText").GetComponent<Text>();


            // 监听输入
            mBtnAdd.onClick.AddListener(() =>
            {
                // 交互逻辑
                mCount++;
                // 表现逻辑
                UpdateView();        
            });

            mBtnSub.onClick.AddListener(() =>
            {
                // 交互逻辑
                mCount--;
                // 表现逻辑
                UpdateView();
            });

            UpdateView();
        }

        void UpdateView()
        {
            mCountText.text = mCount.ToString();
        }
    }
}
```

The code is very simple, this is a very simple implementation of MVC.

We attach this script to the Canvas node, and the Unity result is as follows:

[![](https://file.liangxiegame.com/1b934e4f-8f72-44c2-800a-a97f1e707950.gif)](https://file.liangxiegame.com/1b934e4f-8f72-44c2-800a-a97f1e707950.gif)

Very simple.

At this point, we have not imported our QFramework yet, don't worry, let's first look at the concepts introduced in the code.

First is Model, View, and Controller.

The code for Model is as follows:

```plain
// Model
private int mCount = 0;
```

Very simple, only one member variable, but it is not actually a Model here. It is just a data that needs to be displayed in the View. We will explain why it is not a Model later.

The code for View is as follows:

```plain
// View
private Button mBtnAdd;
private Button mBtnSub;
private Text mCountText;
```

The code for View is also very simple. In the MVC definition of QFramework, View provides references to key components, such as these three components that need to be used in the Controller code. Other components such as Canvas Scaler are not needed by the Controller for now, so they don't need to be declared.

The code for Controller is as follows:

```plain
void Start()
{
    ...

    // 监听输入
    mBtnAdd.onClick.AddListener(() =>
    {
        // 交互逻辑
        mCount++;
        // 表现逻辑
        UpdateView();        
    });

    mBtnSub.onClick.AddListener(() =>
    {
        // 交互逻辑
        mCount--;
        // 表现逻辑
        UpdateView();
    });

    UpdateView();
}

void UpdateView()
{
    mCountText.text = mCount.ToString();
}
```

The above is the code for Controller.

Okay, let's take a look at the complete code again.

```plain
using UnityEngine;
using UnityEngine.UI;

namespace QFramework.Example
{
    // Controllerpublic class CounterAppController : MonoBehaviour
    {
        // Viewprivate Button mBtnAdd;
        private Button mBtnSub;
        private Text mCountText;

        // Modelprivate int mCount = 0;

        void Start()
        {
            // View 组件获取
            mBtnAdd = transform.Find("BtnAdd").GetComponent<Button>();
            mBtnSub = transform.Find("BtnSub").GetComponent<Button>();
            mCountText = transform.Find("CountText").GetComponent<Text>();


            // 监听输入
            mBtnAdd.onClick.AddListener(() =>
            {
                // 交互逻辑
                mCount++;
                // 表现逻辑
                UpdateView();        
            });

            mBtnSub.onClick.AddListener(() =>
            {
                // 交互逻辑
                mCount--;
                // 表现逻辑
                UpdateView();
            });

            UpdateView();
        }

        void UpdateView()
        {
            mCountText.text = mCount.ToString();
        }
    }
}
```

For now, for logic like the counter, the above code is completely fine.

But we need to look at the problem with a developmental perspective.

If this is a startup project, then it is very likely that a lot of business logic needs to be added next.

Among them, it is very likely that mCount will be used in multiple Controllers, and even some other logic needs to be written for mCount, such as adding 5 points when mCount is increased, or mCount needs to be stored, etc. In short, mCount may develop into a data that needs to be shared in the future, but mCount currently only belongs to CounterAppController, which is obviously not enough for the future.

We need to make the member variable mCount a shared data, and the fastest way is to make the mCount variable a static variable or a singleton, but although this is very fast to write, it will cause many problems in later maintenance.

And the QFramework architecture provides the concept of Model.

Let's use it.

First, we import the QFramework architecture.

Importing the QFramework is very simple, just copy the code of QFramework.cs to the Unity project.

QFramework.cs address:

* Gitee: [https://gitee.com/liangxiegame/QFramework/blob/master/QFramework.cs](https://gitee.com/liangxiegame/QFramework/blob/master/QFramework.cs)
* Github: [https://github.com/liangxiegame/QFramework/blob/master/QFramework.cs](https://github.com/liangxiegame/QFramework/blob/master/QFramework.cs)

After importing, we will change the code of CounterAppController to the following:

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

        // 3.指定架构
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

Okay, the code introduces two new concepts, one is Architecture, and the other is Model.

Architecture is used to manage modules, or Architecture provides a complete set of architectural solutions, and module management and providing MVC are only a small part of its functionality.

We run Unity and the result is as follows:

[![](https://file.liangxiegame.com/aa28ef15-11e9-49f2-9536-9db18b025a8f.gif)](https://file.liangxiegame.com/aa28ef15-11e9-49f2-9536-9db18b025a8f.gif)

The operation is correct.

Okay, we have started using the MVC architecture provided by QFramework.

One thing to note here is that the introduction of Model is to solve the problem of data sharing, not just to separate data and presentation. This is a very important point.

Data sharing is divided into two types: spatial sharing and temporal sharing.

Spatial sharing is simple, that is, the code of multiple points needs to access the data in the Model.

Temporal sharing is storage function, which stores the data before the last time the App was closed in a file, and obtains the data before the last time the App was closed when it is opened this time.

Although we have started using MVC, there are still many problems with this MVC, and we will continue to solve them in the next article.



## Summary Notes



1. Manually complete the simplest MVC design and implement a counter
2. QFramework simplest introduction
3. QFramework Architecture and Model usage
    1. Model ➝ AbstractModel abstract class
    2. Architecture ➝ Architecture abstract class
        1. Architecture registers Model
    3. Controller ➝ IController
        1. Controller needs to get Architecture, and there is a static method to get instance in Architecture abstract class
        2. Controller needs to define Model, and all data operations are based on Model
4. Model independent functions, data sharing and data and presentation separation
