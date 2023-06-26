# 01. Introduction to QFramework.Toolkits

QFramework.Toolkits is a solution that includes QFramework.cs and a large number of toolkits.

Before QFramework v1.0, QFramework.Toolkits was QFramework itself. However, starting from QFramework v1.0, QFramework has its own development architecture - QFramework.cs, so the original QFramework became QFramework.Toolkits.

QFramework.Toolkits, also known as the QFramework toolkit, is a **ready-to-use, progressive** and **rapid development** framework. Its goal is to be the **first framework** for companies, independent developers, and Unity3D beginners without framework experience. The framework has accumulated solutions for various technical directions in multiple projects. It has low learning costs, low access costs (low intrusiveness), low refactoring costs, and low secondary development costs. The documentation is rich.

The design philosophy of QFramework.Toolkits is to pursue the ultimate development efficiency and development experience.

**Overview of QFramework.Toolkits Features**

*   Toolkits (QFramework.Toolkits v0.16)
    *   UIKit interface & View rapid development & management solution
        *   Code generation & automatic assignment of UI and GameObject
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
        *   ActionKit: Action sequence execution system
        *   CodeGenKit: Code generation & automatic serialization assignment tool
        *   EventKit: Provides a set of event toolkits based on classes, strings, enumerations, and signal types
        *   FluentAPI: Provides static extensions for a large number of commonly used Unity and C# APIs (chain API)
        *   IOCKit: Provides a dependency injection container
        *   LocaleKit: Localization & multilingual toolkits
        *   LogKit: Log toolkits
        *   PackageKit: Package management tool, which can update the framework and corresponding plug-in modules.
        *   PoolKit: Object pool toolkit, which provides not only object pool but also ListPool and Dictionary Pool tools.
        *   SingletonKit: Singleton toolkit
        *   TableKit: Provides a set of tools for table-like data structures

**Typical QFrameowrk.Toolkits Code**

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
