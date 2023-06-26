# 01. 项目简介

# 01\. 简介

大家好，我是 QFramework 的作者 凉鞋，QFramework 从第一次代码提交到现在快 7 年了（2015 年 12 月 ~ 2022 年 7 月）了，而经过了 7 年时间的打磨，我们终于迎来了 v1.0 版本。

此教程，将收录于 QFramework 的官方文档，发布于 [qframework.cn](http://qframework.cn)，同时也会包含在 QFramework.Toolkits 的编辑器内置文档中。

## QFramework 简介

QFramework 是一套渐进式、快速开发框架，适用于任何类型的游戏及应用项目。

QFramework 包含一套 开发架构 和 大量的工具集。

QFramework 特性速览：

*   开发架构（QFramework.cs v1.0）
    *   简单、易上手、强大
    *   MVC
    *   IOC、分层支持
    *   CQRS 支持
    *   符合 SOLID原则
    *   可以使用 DDD 的方式设计项目
    *   不到 1000 行代码
*   工具集（QFramework.Toolkits v0.16）
    *   UIKit 界面&View快速开发&管理解决方案
        *   UI、GameObject 的代码生成&自动赋值
        *   界面管理
        *   层级管理
        *   界面堆栈
        *   默认使用 ResKit 方式管理界面资源
        *   可自定义界面的加载、卸载方式
        *   Manager Of Manager 架构集成（不推荐使用）
    *   ResKit 资源快速开发&管理解决方案
        *   AssetBundle 提供模拟模式，开发阶段无需打包即可加载资源
        *   资源名称代码生成支持
        *   同一个 API 可加载 AssetBundle、Resources、网络 和 自定义来源的资源
        *   提供一套引用计数的资源管理模型
    *   AudioKit 音频管理解决方案
        *   提供背景音乐、人声、音效 三种音频播放 API
        *   音量控制
        *   默认使用 ResKit 方式管理音频资源
        *   可自定义音频的加载、卸载方式
    *   CoreKit 提供大量的代码工具
        *   ActionKit：动作序列执行系统
        *   CodeGenKit：代码生成 & 自动序列化赋值工具
        *   EventKit：提供基于类、字符串、枚举以及信号类型的事件工具集
        *   FluentAPI：对大量的 Unity 和 C# 常用的 API 提供了静态扩展的封装（链式 API）
        *   IOCKit：提供依赖注入容器
        *   LocaleKit：本地化&多语言工具集
        *   LogKit：日志工具集
        *   PackageKit：包管理工具，由此可更新框架和对应的插件模块。
        *   PoolKit：对象池工具集，提供对象池的基础上，也提供 ListPool 和 Dictionary Pool 等工具。
        *   SingletonKit：单例工具集
        *   TableKit：提供表格类数据结构的工具集

QFramework 的设计哲学是从每个细节上提升开发效率。

同时 QFramework 还包含丰富的生态。

_QFrameowrk.Toolkits 内置编辑器_

[![](https://file.liangxiegame.com/d15a75ba-8d6d-4d77-b096-a93c559d29b9.png)](https://file.liangxiegame.com/d15a75ba-8d6d-4d77-b096-a93c559d29b9.png)

_资源_

| <br>**版本**<br> | <br><br> | <br><br> |
| ---| ---| --- |
| <br>QFramework.cs<br> | <br>QFramework 本体架构的实现<br> | <br><br> |
| <br>QFramework.cs 示例<br> | <br>QFramework.cs 与官方示例： CounterApp、《点点点》、FlappyBird、CubeMaster、ShootingEditor2D、贪吃蛇等<br> | <br><br> |
| <br>QFramework.Toolkits<br> | <br>QFramework 集成 CoreKit/UIKit/ActionKit/ResKit/PackageKit/AudioKit 等全部官方工具（已包含 QFramework.cs 和 示例)<br> | <br><br> |
| <br>QFramework.Toolkits.Demo.WuZiQi<br> | <br>使用 QFramework.Toolkits 开发的五子棋 Demo（需要安装好 QFramework.Toolkits）<br> | <br><br> |
| <br>QFramework.Toolkits.Demo.Saolei<br> | <br>使用 QFramework.Toolkits 开发的扫雷 Demo（需要安装好 QFramework.Toolkits）<br> | <br><br> |
| <br>QFramework.ToolKitsPro<br> | <br>在 ToolKits 基础上集成更多好用的工具的版本（已包含 QFramework.Toolkits）<br> | <br>[AssetStore](http://u3d.as/SJ9)<br> |
| <br>**群友案例**<br> | <br><br> | <br><br> |
| <br>赛车游戏《Crazy Car》<br> | <br>群友 [TastSong](https://github.com/TastSong) 使用 QF 进行重构的开源赛车游戏<br> | <br>[游戏主页(Github](https://github.com/TastSong/CrazyCar))<br> |
| <br>**社区**<br> | <br><br> | <br><br> |
| <br>QQ 群:623597263<br> | <br>交流群<br> | <br>[点击加群](http://shang.qq.com/wpa/qunwpa?idkey=706b8eef0fff3fe4be9ce27c8702ad7d8cc1bceabe3b7c0430ec9559b3a9ce66)<br> |
| <br>github issue<br> | <br>github 社区<br> | <br>[地址](https://github.com/liangxiegame/QFramework/issues/new)<br> |
| <br>gitee issue<br> | <br>gitee 社区（国内访问快）<br> | <br>[地址](https://gitee.com/liangxiegame/QFramework/issues)<br> |
| <br>**教程**<br> | <br><br> | <br><br> |
| <br>《框架搭建 决定版》<br> | <br>教程 QFramework 的核心架构是怎么演化过来的？<br> | <br>[课程主页](https://learn.u3d.cn/tutorial/framework_design)|[学生课堂笔记1](https://github.com/Haogehaojiu/FrameworkDesign)|[学生课堂笔记2](https://github.com/Haogehaojiu/ShootingEditor2D)<br> |
| <br>**产品案例**<br> | <br><br> | <br><br> |
| <br>独立游戏《鬼山之下》<br> | <br>使用 QF 制作的独立游戏<br> | <br>[游戏主页(Steam)](https://store.steampowered.com/app/1517160/_/)<br> |
| <br>手机游戏《谐音梗挑战》<br> | <br>使用 QF 制作的手机游戏<br> | <br>[游戏主页(TapTap)](https://www.taptap.com/app/201075)<br> |
| <br>独立游戏《推灭泡泡姆》<br> | <br>‍QF 群友，大学生团队制作的独立游戏，终于等到上架啦，亲自游玩过，很好玩，大家多多支持呀（P.S 使用 QF.cs 作为架构开发的哦）<br> | <br>[游戏主页(TapTap)](https://www.taptap.com/app/233228)<br> |
| <br>**官方工具**（独立版本，不互相依赖)<br> | <br><br> | <br><br> |
| <br>SingletonKit<br> | <br>易上手功能强大的单例工具，由 QF 官方维护<br> | <br>[github](https://github.com/liangxiegame/SingletonKit)|[gitee](https://gitee.com/liangxiegame/SingletonKit)<br> |
| <br>ExtensionKit<br> | <br>易上手功能强大的 C#/UnityAPI 的静态扩展 ，由 QF 官方维护<br> | <br>[github](https://github.com/liangxiegame/ExtensionKit)|[gitee](https://gitee.com/liangxiegame/ExtensionKit)<br> |
| <br>IOCKit<br> | <br>易上手功能强大的 IOC 容器 ，由 QF 官方维护<br> | <br>[github](https://github.com/liangxiegame/IOCKit)|[gitee](https://gitee.com/liangxiegame/IOCKit)<br> |
| <br>TableKit<br> | <br>一套类似表格的数据结构（List<List<T>>)，兼顾查询效率和联合强大的查询功能，由 QF 官方维护<br> | <br>[github](https://github.com/liangxiegame/TableKit)|[gitee](https://gitee.com/liangxiegame/TableKit)<br> |
| <br>PoolKit<br> | <br>对象池工具，由 QF 官方维护<br> | <br>[github](https://github.com/liangxiegame/PoolKit)|[gitee](https://gitee.com/liangxiegame/PoolKit)<br> |
| <br>LogKit<br> | <br>日志工具，由 QF 官方维护<br> | <br>[github](https://github.com/liangxiegame/LogKit)|[gitee](https://gitee.com/liangxiegame/LogKit)<br> |
| <br>ActionKit<br> | <br>动作序列工具，由 QF 官方维护<br> | <br>[github](https://github.com/liangxiegame/ActionKit)|[gitee](https://gitee.com/liangxiegame/ActionKit)<br> |
| <br>ResKit<br> | <br>资源管理工具，由 QF 官方维护<br> | <br>[github](https://github.com/liangxiegame/ResKit)|[gitee](https://gitee.com/liangxiegame/ResKit)<br> |
| <br>UIKit<br> | <br>UIKit 是一套 UI/View 开发解决方案，由 QF 官方维护<br> | <br>[github](https://github.com/liangxiegame/UIKit)|[gitee](https://gitee.com/liangxiegame/UIKit)<br> |
| <br>AudioKit<br> | <br>一套音频管理工具，由 QF 官方维护<br> | <br>[github](https://github.com/liangxiegame/AudioKit)|[gitee](https://gitee.com/liangxiegame/AudioKit)<br> |
| <br>PackageKit<br> | <br>一套包管理工具，可以通过 PackageKit 安装旧版本的 QFramework，以及大量的解决方案。<br> | <br>[github](https://github.com/liangxiegame/PackageKit)|[gitee](https://gitee.com/liangxiegame/PackageKit)<br> |
| <br>**其他相关教程**<br> | <br><br> | <br><br> |
| <br>《独立游戏体验计划》（猫叔）<br> | <br>独立游戏制作体验教程，有用到 QFramework.cs<br> | <br>[b 站](https://space.bilibili.com/656352)<br> |
| <br>《原创独立游戏制作》（凉鞋）<br> | <br>原创独立游戏制作教程，有用到 QFramework.cs<br> | <br>[b 站](https://space.bilibili.com/60450548/channel/collectiondetail?sid=125221)<br> |

**典型的 QFramework.cs 架构代码**

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

**典型的 QFramework.Toolkits 代码**

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

## 大量的示例

### 小游戏《点点点》

[![](https://file.liangxiegame.com/5a10aa95-4c93-4dae-acec-667a113c30ca.gif)](https://file.liangxiegame.com/5a10aa95-4c93-4dae-acec-667a113c30ca.gif)

### 小游戏《FlappyBird》

[![](https://file.liangxiegame.com/9845122b-93d9-4106-a027-2d7c129a096a.gif)](https://file.liangxiegame.com/9845122b-93d9-4106-a027-2d7c129a096a.gif)

作者：王二 soso [https://github.com/so-sos-so](https://github.com/so-sos-so)

### 小游戏《Cube Master》

[![](https://file.liangxiegame.com/f51abab0-9dc9-478b-b1f1-67f2cd588477.gif)](https://file.liangxiegame.com/f51abab0-9dc9-478b-b1f1-67f2cd588477.gif)



作者：王二 soso [https://github.com/so-sos-so](https://github.com/so-sos-so)

### 简易关卡编辑器2D

[![](https://file.liangxiegame.com/6492498b-6c22-478d-8785-9f43453c34db.gif)](https://file.liangxiegame.com/6492498b-6c22-478d-8785-9f43453c34db.gif)

[![](https://file.liangxiegame.com/34b775c6-6a49-4141-9b9a-1377a6c15673.gif)](https://file.liangxiegame.com/34b775c6-6a49-4141-9b9a-1377a6c15673.gif)

### 小游戏《贪吃蛇》

[![](https://file.liangxiegame.com/ac70d14e-ea89-445d-899e-06f18f11f8d1.gif)](https://file.liangxiegame.com/ac70d14e-ea89-445d-899e-06f18f11f8d1.gif)

作者：一只皮皮虾 [https://gitee.com/PantyNeko/](https://gitee.com/PantyNeko/)

以上的示例都是由 QFramework.cs 制作而成的官方示例。

另外还有群友制作的开源游戏

### CrazyCar

Unity制作的联机赛车游戏，后台为SpringBoot + Mybatis；游戏采用QFramework框架，支持KCP和WebSocket网络(商用级)

[![](https://file.liangxiegame.com/0ab6cb1d-2374-4aa2-b27d-f04eb72792cd.png)](https://file.liangxiegame.com/0ab6cb1d-2374-4aa2-b27d-f04eb72792cd.png)

[![](https://file.liangxiegame.com/a113dcba-9ba8-4a40-b000-be3b61719ecc.png)](https://file.liangxiegame.com/a113dcba-9ba8-4a40-b000-be3b61719ecc.png)

[![](https://file.liangxiegame.com/9075c10d-6d21-411c-b1a4-7f92a08f9bfa.png)](https://file.liangxiegame.com/9075c10d-6d21-411c-b1a4-7f92a08f9bfa.png)

[![](https://file.liangxiegame.com/32b48b5b-cdcc-433e-b1b2-4b1333211a70.png)](https://file.liangxiegame.com/32b48b5b-cdcc-433e-b1b2-4b1333211a70.png)



[![](https://file.liangxiegame.com/bda476e4-0ede-4fd9-a5bb-e993bce8a786.png)](https://file.liangxiegame.com/bda476e4-0ede-4fd9-a5bb-e993bce8a786.png)

[![](https://file.liangxiegame.com/158b0ce0-6e67-47c5-81b5-cee6388dd99c.png)](https://file.liangxiegame.com/158b0ce0-6e67-47c5-81b5-cee6388dd99c.png)

[![](https://file.liangxiegame.com/2bd0ef1f-d639-48e8-8c48-320995d20de4.png)](https://file.liangxiegame.com/2bd0ef1f-d639-48e8-8c48-320995d20de4.png)

[![](https://file.liangxiegame.com/aa337718-b868-41d2-bc6b-2ef51c157481.png)](https://file.liangxiegame.com/aa337718-b868-41d2-bc6b-2ef51c157481.png)



[![](https://file.liangxiegame.com/06157781-3271-438c-bf3f-613e6ec00fb0.png)](https://file.liangxiegame.com/06157781-3271-438c-bf3f-613e6ec00fb0.png)

作者: TastSone [https://github.com/TastSong](https://github.com/TastSong)

项目地址: [https://github.com/TastSong/CrazyCar](https://github.com/TastSong/CrazyCar)

## 案例《五子棋》

[![](https://file.liangxiegame.com/a76bc24a-1828-46f2-94c5-8bd24884f932.png)](https://file.liangxiegame.com/a76bc24a-1828-46f2-94c5-8bd24884f932.png)

源码地址:

*   github [https://github.com/liangxiegame/QFramework](https://github.com/liangxiegame/QFramework)
*   gitee [https://gitee.com/liangxiegame/QFramework](https://gitee.com/liangxiegame/QFramework)

[![](https://file.liangxiegame.com/3abceb70-2d17-4457-aff1-ef8a6ef4bd66.png)](https://file.liangxiegame.com/3abceb70-2d17-4457-aff1-ef8a6ef4bd66.png)

## 案例《扫雷》

作者：Joker

[![](https://file.liangxiegame.com/c6116b7e-a08b-4c13-ae64-7053be3c503c.png)](https://file.liangxiegame.com/c6116b7e-a08b-4c13-ae64-7053be3c503c.png)

源码地址:

*   github [https://github.com/liangxiegame/QFramework](https://github.com/liangxiegame/QFramework)
*   gitee [https://gitee.com/liangxiegame/QFramework](https://gitee.com/liangxiegame/QFramework)

[![](https://file.liangxiegame.com/6482d4eb-5af9-4932-a2f8-2164cb22e931.png)](https://file.liangxiegame.com/6482d4eb-5af9-4932-a2f8-2164cb22e931.png)

## 本教程简介

在上一版官方教程《QFramework 使用指南 2020》写完之后，经过两年（2022 年），QFramework 改进了很多工具的使用体验，同时又新增了一套非常简单且强大的开发架构，这样就迎来了 QFramework 第一个正式版本 QFramework v1，这样就导致导致 QFramework 的推荐使用的 API 发生了一些变化，虽然旧版本的 API 还能用，但是按照《QFramework 使用指南 2020》写的很多代码会报很多警告，这会让很多初学者感到疑惑，所以笔者打算在《QFramework 使用指南 2020》的基础上，重制一套新的 QFramework 使用教程，名字叫做《QFramework v1.0 使用指南》。

教程分为架构篇和工具集篇，架构篇着重介绍 QFramework.cs 这套架构入门以及使用规范，工具篇着重介绍 QFramework 中的大量的工具集的使用。