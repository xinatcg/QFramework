# 13. Other Event Tools

In addition to supporting TypeEventSystem and EasyEvent, QFramework also supports EnumEventSystem and StringEventSystem.

## EnumEventSystem

EnumEventSystem was formerly known as QEventSystem in the old version of QFramework.

```plain
using UnityEngine;

namespace QFramework
{
    public class EnumEventExample : MonoBehaviour
    {
        #region 事件定义public enum TestEvent
        {
            Start,
            TestOne,
            End,
        }

        public enum TestEventB
        {
            Start = TestEvent.End, // 为了保证每个消息 Id 唯一，需要头尾相接
            TestB,
            End,
        }

        #endregion 事件定义void Start()
        {
            EnumEventSystem.Global.Register(TestEvent.TestOne, OnEvent);
        }

        void OnEvent(int key, params object[] obj)
        {
            switch (key)
            {
                case (int) TestEvent.TestOne:
                    Debug.Log(obj[0]);
                    break;
            }
        }

        private void Update()
        {
            if (Input.GetMouseButtonDown(0))
            {
                EnumEventSystem.Global.Send(TestEvent.TestOne, "Hello World!");
            }
        }

        private void OnDestroy()
        {
            EnumEventSystem.Global.UnRegister(TestEvent.TestOne, OnEvent);
        }
    }
}
```

## StringEventSystem

StringEventSystem was formerly known as MsgDispatcher in the old version.

```plain
using UnityEngine;

namespace QFramework
{
    public class EnumEventExample : MonoBehaviour
    {
        #region 事件定义public enum TestEvent
        {
            Start,
            TestOne,
            End,
        }

        public enum TestEventB
        {
            Start = TestEvent.End, // 为了保证每个消息 Id 唯一，需要头尾相接
            TestB,
            End,
        }

        #endregion 事件定义void Start()
        {
            EnumEventSystem.Global.Register(TestEvent.TestOne, OnEvent);
        }

        void OnEvent(int key, params object[] obj)
        {
            switch (key)
            {
                case (int) TestEvent.TestOne:
                    Debug.Log(obj[0]);
                    break;
            }
        }

        private void Update()
        {
            if (Input.GetMouseButtonDown(0))
            {
                EnumEventSystem.Global.Send(TestEvent.TestOne, "Hello World!");
            }
        }

        private void OnDestroy()
        {
            EnumEventSystem.Global.UnRegister(TestEvent.TestOne, OnEvent);
        }
    }
}
// 输出结果// 点击鼠标左键// Hello World
```

## StringEventSystem

```plain
using UnityEngine;

namespace QFramework.Example
{
    public class StringEventSystemExample : MonoBehaviour
    {
        void Start()
        {
            StringEventSystem.Global.Register("TEST_ONE", () =>
            {
                Debug.Log("TEST_ONE");
            }).UnRegisterWhenGameObjectDestroyed(gameObject);

            // 事件 + 参数
            StringEventSystem.Global.Register<int>("TEST_TWO", (count) =>
            {
                Debug.Log("TEST_TWO:" + count);

            }).UnRegisterWhenGameObjectDestroyed(gameObject);
        }

        private void Update()
        {
            if (Input.GetMouseButtonDown(0))
            {
                StringEventSystem.Global.Send("TEST_ONE");
                StringEventSystem.Global.Send("TEST_TWO",10);

            }
        }
    }
}

// 输出结果// 点击鼠标左键// TEST_ONE// TEST_TWO:10
```

## Comparison

*   TypeEventSystem:
    *   Concise event body definition
    *   More suitable for designing frameworks
    *   Supports struct for better memory performance
    *   Uses reflection, relatively poor CPU performance
*   EasyEvent
    *   Convenient, easy to use, high development efficiency
    *   Good CPU and memory performance, close to delegates
    *   Limited functionality
    *   More suitable for designing general-purpose tools, such as universal backpacks, global lifecycle triggers, etc.
    *   StringEventSystem and TypeEventSystem are implemented by EasyEvent at the bottom.
*   EnumEventSystem
    *   Uses enumeration as the event ID, more suitable for long-link communication with protobuf or messages with message IDs on the server side
    *   Good performance
    *   There is maintenance cost for using enumeration to define message bodies
*   StringEventSystem
    *   Uses strings as event IDs, more suitable for communication with other script layers, such as Lua, ILRuntime, PlayMaker, etc.
    *   Average performance

Currently, the official recommendation is to use TypeEventSystem and EasyEvent.

Choose EnumEventSystem for network communication.

Choose StringEventSystem for communication with other script layers.
