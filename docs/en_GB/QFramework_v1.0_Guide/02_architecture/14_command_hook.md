# 14. Command interception

QFramework provides an API for intercepting Commands.

We will try to implement a Command log in the CounterApp.

The code is very simple, as follows:

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

Just override ExecuteCommand in Architecture.

After running, the author clicked the button a few times at random, and the result is as follows:

[![](https://file.liangxiegame.com/96bdc2f4-222d-4e91-a10e-dc2128e50fb4.png)](https://file.liangxiegame.com/96bdc2f4-222d-4e91-a10e-dc2128e50fb4.png)

This implements a very simple Command log function.

## What is the use of Command interception?

With Command interception, we can do a lot of things, such as:

*   Command logs can be used for easy debugging
*   Middleware mode can be implemented in Command. Various Command middleware can be written, such as Command log middleware
*   It can easily implement undo functionality
*   Command can be used for automated testing
*   And so on

Okay, that's all for this article.

## Summary Notes

1. The implementation principle is to override the ExecuteCommand method in Architecture. The default way is to execute the Command. After overriding, additional logic can be executed while executing the original method.

![](https://cdn.jsdelivr.net/gh/storageimgbed/storage@img/images/20230625072313.png)
