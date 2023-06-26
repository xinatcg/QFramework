# 16. Additional Content: LiveCodingKit - A Powerful Tool for Coding on the Fly

When developing with Unity, every time we write or modify a piece of code, we need to stop the game, write the code, wait for it to compile, and then run the game again.

In many cases, this process can be quite tedious and time-consuming, as developers have to wait and manually operate the game.

After experiencing the GMLive plugin in GameMakerStudio, I found that the experience of being able to see the results of code writing without stopping the game was very smooth.

So I wrote a similar solution called LiveCodingKit in QFramework.

The usage is very simple. First, in the QFramework editor, you can see the LiveCodingKit panel as shown below:

![](https://file.liangxiegame.com/4e7b25f6-cb59-4283-8e74-9d2c951c39e5.png?ynotemdtimestamp=1675741287837)

Make sure it is checked.

Then, according to your needs, select the corresponding operation when the compilation is completed. In general, reloading the current scene is enough.

Of course, if there are dependencies between scenes, you can choose to restart the game.

Then run a scene with a script at will. I chose the example that comes with QFramework, as shown below:

![](https://file.liangxiegame.com/907db129-95aa-4674-a63a-3c47f82d4dc9.png?ynotemdtimestamp=1675741287837)

Then add the following code:

```plain
public partial class UIBasicPanel : UIPanel
{
   protected override void OnInit(IUIData uiData = null)
   {
      mData = uiData as UIBasicPanelData ?? new UIBasicPanelData();
      
      BtnStart.onClick.AddListener(() =>
      {
         Debug.Log("开始游戏");
      });

      BtnStart.Rotation(Quaternion.Euler(0, 0, 90)); // 新增代码
   }
   
```

After that, go back to Unity and wait for the compilation to finish (without stopping the running).

After the compilation is completed, the result is as follows:

![](https://file.liangxiegame.com/5185ab09-938c-4bd7-9259-6ff08ebaf779.png?ynotemdtimestamp=1675741287837)

OK, the result is correct.

This is the introduction of LiveCodingKit. It is very convenient when you need to adjust some values in the code and write OnGUI code. Of course, there are also some situations where it is not applicable, which requires everyone to experience it themselves.

## More content

*   Reproduced please indicate the address: [liangxiegame.com](https://liangxiegame.com/) (first release) WeChat public account: Liangxie's Notes
*   QFramework homepage: [qframework.cn](https://qframework.cn/)
*   QFramework communication group: 623597263
*   QFramework Github address: [https://github.com/liangxiegame/qframework](https://github.com/liangxiegame/qframework)
*   QFramework Gitee address: [https://gitee.com/liangxiegame/QFramework](https://gitee.com/liangxiegame/QFramework)
*   GamePix Independent Game Academy & Unity Advanced Small Class Address: [https://www.gamepixedu.com/](https://www.gamepixedu.com/)
