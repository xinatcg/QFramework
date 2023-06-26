# 15. Built-in Tool: TypeEventSystem

In addition to providing a framework, QFramework also provides three tools that can be used independently of the framework: TypeEventSystem, EasyEvent, BindableProperty, and IOCContainer.

These tools were not intentionally provided, but were created by combining these three tools in the design of QFramework's architecture.

In this article, we will learn how to use TypeEventSystem.

## Basic Usage

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

This is the most basic usage of TypeEventSystem.

## Event Inheritance Support

In addition to basic usage, TypeEventSystem's events also support inheritance.

The sample code is as follows:

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

The code is not difficult.

## Manual Unregistration of TypeEventSystem

If you want to control the unregistration of TypeEventSystem instead of automatic unregistration, it is also very simple. The code is as follows:

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

The code is also very simple.

## Interface Event

TypeEventSystem also supports interface event mode. The sample code is as follows:

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

The code is very simple.

Similarly, interface events also support inheritance between events.

Interface events have better constraints, and you can write less code by completing the implementation of the interface through the code generation of the IDE, which is inspired by CorgiEngine and TopDownEngine.

## How to Automatically Destroy Non-MonoBehavior Scripts

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

## Summary

If you want to manually unregister, you must create a method to receive events.

For automatic unregistration, use delegates directly.

Both have their own advantages and disadvantages, use them as needed.

In addition, it is best to use struct for event definition, because struct has less gc and can achieve better performance.

Interface events have better constraints and can also improve development efficiency through IDE code generation.

In summary, TypeEventSystem is a very powerful event tool.

  

## Learning Summary

  

### Interface Usage Example, Why Can RegisterEvent Be Accessed Using "this" (C# Feature)?

  

In the `Start()` method of the `TypeEventSystemInterfaceExample` class, `RegisterEvent` method can be accessed using the `this` keyword because the `RegisterEvent` method is defined as an extension method in the static class `OnGlobalEventExtension`, and the first parameter type of this extension method is `IOnEvent<T>`.

In C#, **extension methods are a special type of static method** that can be defined in a static class and used like instance methods. When an instance of a type calls an extension method, the compiler automatically passes that instance as the first parameter, so that it can be used in the method body.

In this case, the first parameter type of the `RegisterEvent` method is `IOnEvent<T>`, and the `TypeEventSystemInterfaceExample` class implements the `IOnEvent<InterfaceEventA>` and `IOnEvent<InterfaceEventB>` interfaces, so it is an instance of these two interface types. Therefore, in the `Start()` method, the `RegisterEvent` method can be called using `this.RegisterEvent<InterfaceEventA>()` and `this.RegisterEvent<InterfaceEventB>()`, where the `this` keyword represents the current instance of the `TypeEventSystemInterfaceExample` class.

By using extension methods, we can use the `RegisterEvent` method in the instance of the `TypeEventSystemInterfaceExample` class, making the code more readable and concise.
