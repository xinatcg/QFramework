# 15. 内置工具：TypeEventSystem

QFramework 除了提供了一套架构之外，QFramework 还提供三个可以脱离架构使用的工具 TypeEventSystem、EasyEvent、BindableProperty、IOCContainer。

这些工具并不是有意提供，而是 QFramework 的架构在设计之初是通过这三个工具组合使用而成的。

在这一篇，我们来学习 TypeEventSystem 的使用。

## 基本使用

```plain
using UnityEngine;

namespace QFramework.Example
{
    public class TypeEventSystemBasicExample : MonoBehaviour
    {
        public struct TestEventA
        {
            public int Age;
        }

        private void Start()
        {
            TypeEventSystem.Global.Register<TestEventA>(e =>
            {
                Debug.Log(e.Age);
            }).UnRegisterWhenGameObjectDestroyed(gameObject);
        }

        private void Update()
        {
            // 鼠标左键点击
            if (Input.GetMouseButtonDown(0))
            {
                TypeEventSystem.Global.Send(new TestEventA()
                {
                    Age = 18
                });
            }

            // 鼠标右键点击
            if (Input.GetMouseButtonDown(1))
            {
                TypeEventSystem.Global.Send<TestEventA>();
            }
        }
    }
}

// 输出结果// 点击鼠标左键，则输出:// 18// 点击鼠标右键，则输出:// 0
```

这就是 TypeEventSystem 的最基本用法。

## 事件继承支持

除了基本用法，TypeEventSystem 的事件还支持继承关系。

示例代码如下:

```plain
using UnityEngine;

namespace QFramework.Example
{
    public class TypeEventSystemInheritEventExample : MonoBehaviour
    {
        public interface IEventA
        {

        }

        public struct EventA : IEventA
        {

        }

        public struct EventB : IEventA
        {

        }

        private void Start()
        {
            TypeEventSystem.Global.Register<IEventA>(e =>
            {
                if (e is EventA)
                {
                    Debug.Log("TypeEvent Inherit EventA " + e.GetAge());
                }
                if (e is EventB)
                {
                    Debug.Log("TypeEvent Inherit EventB " + e.GetAge());
                }
              Debug.Log(e.GetType().Name);
            }).UnRegisterWhenGameObjectDestroyed(gameObject);
        }

        private void Update()
        {
            if (Input.GetMouseButtonDown(0))
            {
                TypeEventSystem.Global.Send<IEventA>(new EventB());
                // 无效
                TypeEventSystem.Global.Send<EventB>();
            }
        }
    }
}


// 输出结果:// 当按下鼠标左键时，输出:// EventB
```

代码不难。

## TypeEventSystem 手动注销

如果想控制 TypeEventSystem 的注销，而不是自动注销也很简单，代码如下:

```plain
using UnityEngine;

namespace QFramework.Example
{
    public class TypeEventSystemUnRegisterExample : MonoBehaviour
    {

        public struct EventA
        {

        }

        private void Start()
        {
            TypeEventSystem.Global.Register<EventA>(OnEventA);
        }

        void OnEventA(EventA e)
        {

        }

        private void OnDestroy()
        {
            TypeEventSystem.Global.UnRegister<EventA>(OnEventA);
        }
    }
}
```

代码也很简单。

## 接口事件

TypeEventSystem 还支持接口事件模式，示例代码如下:

```plain
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace QFramework.Example
{
    public struct InterfaceEventA
    {

    }

    public struct InterfaceEventB
    {

    }

    public class InterfaceEventModeExample : MonoBehaviour
        , IOnEvent<InterfaceEventA>
        , IOnEvent<InterfaceEventB>
    {
        public void OnEvent(InterfaceEventA e)
        {
            Debug.Log(e.GetType().Name);
        }

        public void OnEvent(InterfaceEventB e)
        {
            Debug.Log(e.GetType().Name);
        }

        private void Start()
        {
            this.RegisterEvent<InterfaceEventA>()
                .UnRegisterWhenGameObjectDestroyed(gameObject);

            this.RegisterEvent<InterfaceEventB>();
        }

        private void OnDestroy()
        {
            this.UnRegisterEvent<InterfaceEventB>();
        }

        private void Update()
        {
            if (Input.GetMouseButtonDown(0))
            {
                TypeEventSystem.Global.Send<InterfaceEventA>();
                TypeEventSystem.Global.Send<InterfaceEventB>();
            }
        }
    }
}

// 输出结果
// 当按下鼠标左键时，输出:
// InterfaceEventA// InterfaceEventB
```

代码很简单。

同样接口事件也支持事件之间的继承。

接口事件拥有更好的约束，只要完成实现接口，就可以通过 IDE 的代码生成少写很多代码，其灵感受 CorgiEngine、TopDownEngine 启发。

## 非 MonoBehavior 脚本如何自动销毁

```plain
public class NoneMonoScript : IUnRegisterList
{
    public List<IUnRegister> UnregisterList { get; } = new List<IUnRegister>();


    void Start()
    {
        TypeEventSystem.Global.Register<EasyEventExample.EventA>(a =>
        {

        }).AddToUnregisterList(this);
    }

    void OnDestroy()
    {
        this.UnRegisterAll();
    }
}
```

## 小结

如果想手动注销，必须要创建一个用于接收事件的方法。

而用自动注销则直接用委托即可。

这两个各有优劣，按需使用。

另外，事件的定义最好使用 struct，因为 struct 的 gc 更少，可以获得更好的性能。

接口事件拥有更好的约束，也可以通过 IDE 的代码生成来提高开发效率。

总之 TypeEventSystem 是一个非常强大的事件工具。

  

## 学习总结

  

### 接口使用案例, 为什么可以用 this 访问 RegisterEvent (C# 特性)?

  

在 `TypeEventSystemInterfaceExample` 类的 `Start()` 方法中，可以使用 `this` 关键字访问 `RegisterEvent` 方法，是因为 `RegisterEvent` 方法是作为扩展方法定义在静态类 `OnGlobalEventExtension` 中，并且该扩展方法的第一个参数类型为 `IOnEvent<T>`。

在 C# 中，**扩展方法是一种特殊的静态方法**，**它可以在静态类中定义，并且可以像实例方法一样使用**。当一个类型的实例调用扩展方法时，编译器会自动将该实例作为扩展方法的第一个参数传递，以便在方法体内使用。

在这种情况下，`RegisterEvent` 方法的第一个参数类型为 `IOnEvent<T>`，而 `TypeEventSystemInterfaceExample` 类实现了 `IOnEvent<InterfaceEventA>` 和 `IOnEvent<InterfaceEventB>` 接口，因此它是这两个接口类型的实例。所以在 `Start()` 方法中，可以使用 `this.RegisterEvent<InterfaceEventA>()` 和 `this.RegisterEvent<InterfaceEventB>()` 的方式调用 `RegisterEvent` 方法，其中的 `this` 关键字代表当前 `TypeEventSystemInterfaceExample` 类的实例。

通过使用扩展方法，我们可以在 `TypeEventSystemInterfaceExample` 类的实例中使用 `RegisterEvent` 方法，使代码更具可读性和简洁性。