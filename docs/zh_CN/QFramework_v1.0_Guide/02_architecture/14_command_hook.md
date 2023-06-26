# 14. Command 拦截

QFramework 提供了拦截 Command 的 API。

我们尝试在 CounterApp 中实现一个 Command 日志。

代码很简单，如下:

```plain
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

    protected override void ExecuteCommand(ICommand command)
    {
        Debug.Log("Before " + command.GetType().Name + "Execute");
        base.ExecuteCommand(command);
        Debug.Log("After " + command.GetType().Name + "Execute");
    }
}
```

只需要在 Architecture 中覆写 ExecuteCommand 即可。

运行之后，笔者随意点击了几次按钮，结果如下:

[![](https://file.liangxiegame.com/96bdc2f4-222d-4e91-a10e-dc2128e50fb4.png)](https://file.liangxiegame.com/96bdc2f4-222d-4e91-a10e-dc2128e50fb4.png)

这样就实现了一个非常简单的 Command 日志功能。

## 有了 Command 拦截有什么用？

有了 Command 拦截功能，我们可以做非常多的事情，比如：

*   Command 日志可以用来方便调试
*   可以实现 Command 中间件模式 可以写各种各样额度 Command 中间件，比如 Command 日志中间件
*   可以方便你先撤销功能
*   可以用 Command 做自动化测试
*   等等

好了这篇就介绍到这里。

  

## 总结笔记

  

1. 实现原理就是在 Architecture 内覆盖 ExecuteCommand 方法. 默认的方式就是执行 Command, 覆写后可以执行而外逻辑, 同时执行原方法.

  

![](https://cdn.jsdelivr.net/gh/storageimgbed/storage@img/images/20230625072313.png)