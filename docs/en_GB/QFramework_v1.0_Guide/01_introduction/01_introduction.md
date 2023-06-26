# 01. Project Introduction

# 01\. Introduction

Hello everyone, I am Liangxie, the author of QFramework. QFramework has been around for almost 7 years now, from the first code submission in December 2015 to July 2022. After 7 years of polishing, we finally welcome version 1.0.

This tutorial will be included in the official documentation of QFramework, published on [qframework.cn](http://qframework.cn), and will also be included in the built-in documentation of QFramework.Toolkits.

## Introduction to QFramework

QFramework is a progressive and fast development framework suitable for any type of game and application project.

QFramework includes a development architecture and a large number of toolkits.

QFramework feature overview:

*   Development architecture (QFramework.cs v1.0)
    *   Simple, easy to use, and powerful
    *   MVC
    *   IOC, layered support
    *   CQRS support
    *   Compliant with SOLID principles
    *   Can be designed using DDD
    *   Less than 1000 lines of code
*   Toolkits (QFramework.Toolkits v0.16)
    *   UIKit interface & view rapid development & management solution
        *   UI, GameObject code generation & automatic assignment
        *   Interface management
        *   Hierarchy management
        *   Interface stack
        *   Default use of ResKit to manage interface resources
        *   Customizable interface loading and unloading methods
        *   Manager Of Manager architecture integration (not recommended)
    *   ResKit resource rapid development & management solution
        *   AssetBundle provides simulation mode, resources can be loaded without packaging during development
        *   Resource name code generation support
        *   The same API can load resources from AssetBundle, Resources, network, and custom sources
        *   Provides a reference counting resource management model
    *   AudioKit audio management solution
        *   Provides three types of audio playback APIs: background music, vocals, and sound effects
        *   Volume control
        *   Default use of ResKit to manage audio resources
        *   Customizable audio loading and unloading methods
    *   CoreKit provides a large number of code tools
        *   ActionKit: action sequence execution system
        *   CodeGenKit: code generation & automatic serialization assignment tool
        *   EventKit: provides a set of event tools based on class, string, enumeration, and signal types
        *   FluentAPI: provides static extensions for a large number of commonly used Unity and C# APIs (chain API)
        *   IOCKit: provides a dependency injection container
        *   LocaleKit: localization & multilingual toolset
        *   LogKit: log toolset
        *   PackageKit: package management tool, which can update the framework and corresponding plugin modules.
        *   PoolKit: object pool toolset, providing not only object pool but also ListPool and Dictionary Pool tools.
        *   SingletonKit: singleton toolset
        *   TableKit: provides a set of tools for table-like data structures.

The design philosophy of QFramework is to improve development efficiency from every detail.

At the same time, QFramework also includes a rich ecosystem.

_Built-in editor in QFrameowrk.Toolkits_

[![](https://file.liangxiegame.com/d15a75ba-8d6d-4d77-b096-a93c559d29b9.png)](https://file.liangxiegame.com/d15a75ba-8d6d-4d77-b096-a93c559d29b9.png)

_Resources_

| **Version** |  |  |
| ---| ---| --- |
| QFramework.cs | Implementation of QFramework's main architecture |  |
| QFramework.cs example | CounterApp, "Dian Dian Dian", FlappyBird, CubeMaster, ShootingEditor2D, Snake, etc. |  |
| QFramework.Toolkits | QFramework integrates all official tools such as CoreKit/UIKit/ActionKit/ResKit/PackageKit/AudioKit (including QFramework.cs and examples) |  |
| QFramework.Toolkits.Demo.WuZiQi | Five-in-a-row demo developed using QFramework.Toolkits (requires QFramework.Toolkits installation) |  |
| QFramework.Toolkits.Demo.Saolei | Minesweeper demo developed using QFramework.Toolkits (requires QFramework.Toolkits installation) |  |
| QFramework.ToolKitsPro | A version that integrates more useful tools on the basis of ToolKits (including QFramework.Toolkits) | [AssetStore](http://u3d.as/SJ9) |
| **Community Cases** |  |  |
| Racing game "Crazy Car" | Open source racing game refactored by TastSong using QF | [Game homepage (Github)](https://github.com/TastSong/CrazyCar) |
| **Community** |  |  |
| QQ group: 623597263 | Communication group | [Click to join the group](http://shang.qq.com/wpa/qunwpa?idkey=706b8eef0fff3fe4be9ce27c8702ad7d8cc1bceabe3b7c0430ec9559b3a9ce66) |
| github issue | Github community | [Address](https://github.com/liangxiegame/QFramework/issues/new) |
| gitee issue | Gitee community (faster access in China) | [Address](https://gitee.com/liangxiegame/QFramework/issues) |
| **Tutorials** |  |  |
| "Framework Construction Final Version" | How QFramework's core architecture evolved tutorial? | [Course homepage](https://learn.u3d.cn/tutorial/framework_design) | [Student classroom notes 1](https://github.com/Haogehaojiu/FrameworkDesign) | [Student classroom notes 2](https://github.com/Haogehaojiu/ShootingEditor2D) |
| **Product Cases** |  |  |
| Independent game "Under Ghost Mountain" | Independent game made using QF | [Game homepage (Steam)](https://store.steampowered.com/app/1517160/_/) |
| Mobile game "Homophonic Challenge" | Mobile game made using QF | [Game homepage (TapTap)](https://www.taptap.com/app/201075) |
| Independent game "Push and Destroy Bubble Mom" | Independent game made by QF group members, a college student team, finally launched, personally played, very fun, everyone supports it (P.S developed using QF.cs as the architecture) | [Game homepage (TapTap)](https://www.taptap.com/app/233228) |
| **Official Tools** (independent version, not dependent on each other) |  |  |
| SingletonKit | Easy-to-use and powerful singleton tool, maintained by QF official | [github](https://github.com/liangxiegame/SingletonKit) | [gitee](https://gitee.com/liangxiegame/SingletonKit) |
| ExtensionKit | Easy-to-use and powerful static extension of C#/UnityAPI, maintained by QF official | [github](https://github.com/liangxiegame/ExtensionKit) | [gitee](https://gitee.com/liangxiegame/ExtensionKit) |
| IOCKit | Easy-to-use and powerful IOC container, maintained by QF official | [github](https://github.com/liangxiegame/IOCKit) | [gitee](https://gitee.com/liangxiegame/IOCKit) |
| TableKit | A data structure similar to a table (List<List<T>>), which balances query efficiency and powerful query functions, maintained by QF official | [github](https://github.com/liangxiegame/TableKit) | [gitee](https://gitee.com/liangxiegame/TableKit) |
| PoolKit | Object pool tool, maintained by QF official | [github](https://github.com/liangxiegame/PoolKit) | [gitee](https://gitee.com/liangxiegame/PoolKit) |
| LogKit | Log tool, maintained by QF official | [github](https://github.com/liangxiegame/LogKit) | [gitee](https://gitee.com/liangxiegame/LogKit) |
| ActionKit | Action sequence tool, maintained by QF official | [github](https://github.com/liangxiegame/ActionKit) | [gitee](https://gitee.com/liangxiegame/ActionKit) |
| ResKit | Resource management tool, maintained by QF official | [github](https://github.com/liangxiegame/ResKit) | [gitee](https://gitee.com/liangxiegame/ResKit) |
| UIKit | UIKit is a UI/View development solution, maintained by QF official | [github](https://github.com/liangxiegame/UIKit) | [gitee](https://gitee.com/liangxiegame/UIKit) |
| AudioKit | A set of audio management tools, maintained by QF official | [github](https://github.com/liangxiegame/AudioKit) | [gitee](https://gitee.com/liangxiegame/AudioKit) |
| PackageKit | A set of package management tools that can install old versions of QFramework and a large number of solutions through PackageKit. | [github](https://github.com/liangxiegame/PackageKit) | [gitee](https://gitee.com/liangxiegame/PackageKit) |
| **Other Related Tutorials** |  |  |
| "Independent Game Experience Plan" (Cat Uncle) | Independent game production experience tutorial, using QFramework.cs | [b station](https://space.bilibili.com/656352) |
| "Original Independent Game Production" (Liang Xie) | Original independent game production tutorial, using QFramework.cs | [b station](https://space.bilibili.com/60450548/channel/collectiondetail?sid=125221) |

**Typical QFramework.cs architecture code**

```plain
namespace QFramework.Exmaple
{
    public class CounterAppController : MonoBehaviour , IController
    {
        // Viewprivate Button mBtnAdd;
        private Button mBtnSub;
        private Text mCountText;

        // Modelprivate ICounterAppModel mModel;

        void Start()
        {
            // 获取模型
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
                // 交互逻辑this.SendCommand(new DecreaseCountCommand(/* 这里可以传参（如果有） */));
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

        public IArchitecture GetArchitecture()
        {
            return CounterApp.Interface;
        }

        private void OnDestroy()
        {

            mModel = null;
        }
    }
}
```

**Typical QFramework.Toolkits code**

```plain
using QFramework;
using UnityEngine;
using UnityEngine.UI;

namespace liangxiegame
{
    public partial class UIGamePanel : UIPanel
    {
        private ResLoader mResLoader;

        protected override void OnInit(IUIData uiData = null)
        {
            mResLoader = ResLoader.Allocate();

            mResLoader.LoadSync<GameObject>("GameplayRoot")
                .Instantiate()
                .Identity()
                .GetComponent<GameplayRoot>()
                .InitGameplayRoot();


            BtnPause.onClick.AddListener(() =>
            {
                AudioKit.PlaySound("btn_click");

                ActionKit.Sequence()
                    .Callback(() => BtnPause.interactable = false)
                    .Callback(() => BtnPause.PlayBtnFadeAnimation())
                    .Delay(0.3f)
                    .Callback(() => UIKit.OpenPanel<UIPausePanel>())
                    .Start(this);
            });
        }

        protected override void OnClose()
        {
            mResLoader.Recycle2Cache();
            mResLoader = null;
        }
    }
}
```

## A large number of examples

### Mini game "Click Click Click"

[![](https://file.liangxiegame.com/5a10aa95-4c93-4dae-acec-667a113c30ca.gif)](https://file.liangxiegame.com/5a10aa95-4c93-4dae-acec-667a113c30ca.gif)

### Mini game "FlappyBird"

[![](https://file.liangxiegame.com/9845122b-93d9-4106-a027-2d7c129a096a.gif)](https://file.liangxiegame.com/9845122b-93d9-4106-a027-2d7c129a096a.gif)

Author: Wang Er soso [https://github.com/so-sos-so](https://github.com/so-sos-so)

### Mini game "Cube Master"

[![](https://file.liangxiegame.com/f51abab0-9dc9-478b-b1f1-67f2cd588477.gif)](https://file.liangxiegame.com/f51abab0-9dc9-478b-b1f1-67f2cd588477.gif)

Author: Wang Er soso [https://github.com/so-sos-so](https://github.com/so-sos-so)

### Simple Level Editor 2D

[![](https://file.liangxiegame.com/6492498b-6c22-478d-8785-9f43453c34db.gif)](https://file.liangxiegame.com/6492498b-6c22-478d-8785-9f43453c34db.gif)

[![](https://file.liangxiegame.com/34b775c6-6a49-4141-9b9a-1377a6c15673.gif)](https://file.liangxiegame.com/34b775c6-6a49-4141-9b9a-1377a6c15673.gif)

### Mini game "Snake"

[![](https://file.liangxiegame.com/ac70d14e-ea89-445d-899e-06f18f11f8d1.gif)](https://file.liangxiegame.com/ac70d14e-ea89-445d-899e-06f18f11f8d1.gif)

Author: A Shrimp [https://gitee.com/PantyNeko/](https://gitee.com/PantyNeko/)

The above examples are official examples made with QFramework.cs.

In addition, there are open source games made by group members.

### CrazyCar

A Unity-made online racing game with SpringBoot + Mybatis backend; the game uses the QFramework framework and supports KCP and WebSocket networks (commercial level)

[![](https://file.liangxiegame.com/0ab6cb1d-2374-4aa2-b27d-f04eb72792cd.png)](https://file.liangxiegame.com/0ab6cb1d-2374-4aa2-b27d-f04eb72792cd.png)

[![](https://file.liangxiegame.com/a113dcba-9ba8-4a40-b000-be3b61719ecc.png)](https://file.liangxiegame.com/a113dcba-9ba8-4a40-b000-be3b61719ecc.png)

[![](https://file.liangxiegame.com/9075c10d-6d21-411c-b1a4-7f92a08f9bfa.png)](https://file.liangxiegame.com/9075c10d-6d21-411c-b1a4-7f92a08f9bfa.png)

[![](https://file.liangxiegame.com/32b48b5b-cdcc-433e-b1b2-4b1333211a70.png)](https://file.liangxiegame.com/32b48b5b-cdcc-433e-b1b2-4b1333211a70.png)

[![](https://file.liangxiegame.com/bda476e4-0ede-4fd9-a5bb-e993bce8a786.png)](https://file.liangxiegame.com/bda476e4-0ede-4fd9-a5bb-e993bce8a786.png)

[![](https://file.liangxiegame.com/158b0ce0-6e67-47c5-81b5-cee6388dd99c.png)](https://file.liangxiegame.com/158b0ce0-6e67-47c5-81b5-cee6388dd99c.png)

[![](https://file.liangxiegame.com/2bd0ef1f-d639-48e8-8c48-320995d20de4.png)](https://file.liangxiegame.com/2bd0ef1f-d639-48e8-8c48-320995d20de4.png)

[![](https://file.liangxiegame.com/aa337718-b868-41d2-bc6b-2ef51c157481.png)](https://file.liangxiegame.com/aa337718-b868-41d2-bc6b-2ef51c157481.png)



[![](https://file.liangxiegame.com/06157781-3271-438c-bf3f-613e6ec00fb0.png)](https://file.liangxiegame.com/06157781-3271-438c-bf3f-613e6ec00fb0.png)

Author: TastSone [https://github.com/TastSong](https://github.com/TastSong)

Project Address: [https://github.com/TastSong/CrazyCar](https://github.com/TastSong/CrazyCar)

## Case "Gobang"

[![](https://file.liangxiegame.com/a76bc24a-1828-46f2-94c5-8bd24884f932.png)](https://file.liangxiegame.com/a76bc24a-1828-46f2-94c5-8bd24884f932.png)

Source Code:

*   Github [https://github.com/liangxiegame/QFramework](https://github.com/liangxiegame/QFramework)
*   Gitee [https://gitee.com/liangxiegame/QFramework](https://gitee.com/liangxiegame/QFramework)

[![](https://file.liangxiegame.com/3abceb70-2d17-4457-aff1-ef8a6ef4bd66.png)](https://file.liangxiegame.com/3abceb70-2d17-4457-aff1-ef8a6ef4bd66.png)

## Case "Minesweeper"

Author: Joker

[![](https://file.liangxiegame.com/c6116b7e-a08b-4c13-ae64-7053be3c503c.png)](https://file.liangxiegame.com/c6116b7e-a08b-4c13-ae64-7053be3c503c.png)

Source Code:

*   Github [https://github.com/liangxiegame/QFramework](https://github.com/liangxiegame/QFramework)
*   Gitee [https://gitee.com/liangxiegame/QFramework](https://gitee.com/liangxiegame/QFramework)

[![](https://file.liangxiegame.com/6482d4eb-5af9-4932-a2f8-2164cb22e931.png)](https://file.liangxiegame.com/6482d4eb-5af9-4932-a2f8-2164cb22e931.png)

## Introduction to this tutorial

After the completion of the previous official tutorial "QFramework User Guide 2020", two years have passed (2022), and QFramework has improved the user experience of many tools, and has also added a very simple and powerful development architecture. This has ushered in the first official version of QFramework, QFramework v1, which has caused some changes in the recommended APIs for QFramework. Although the APIs of the old version can still be used, many codes written according to the "QFramework User Guide 2020" will generate many warnings, which will make many beginners confused. Therefore, the author plans to remake a new QFramework usage tutorial based on the "QFramework User Guide 2020", called "QFramework v1.0 User Guide".

"The tutorial is divided into two parts: Architecture and Toolset. The Architecture part focuses on introducing the QFramework.cs architecture and usage specifications, while the Toolset part focuses on introducing the usage of a large number of toolsets in QFramework."
