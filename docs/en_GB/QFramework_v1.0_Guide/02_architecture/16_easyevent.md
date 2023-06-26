# 16. Built-in Tool: EasyEvent

TypeEventSystem is based on EasyEvent.

EasyEvent is also a tool that can be used independently of the architecture.

Let's learn the basic usage here.

## Basic Usage

The code is as follows:

```plain
using UnityEngine;

namespace QFramework.Example
{
    public class EasyEventExample : MonoBehaviour
    {
        private EasyEvent mOnMouseLeftClickEvent = new EasyEvent();

        private EasyEvent<int> mOnValueChanged = new EasyEvent<int>();

        public class EventA : EasyEvent<int,int> { }

        private EventA mEventA = new EventA();

        private void Start()
        {
            mOnMouseLeftClickEvent.Register(() =>
            {
                Debug.Log("鼠标左键点击");
            }).UnRegisterWhenGameObjectDestroyed(gameObject);

            mOnValueChanged.Register(value =>
            {

                Debug.Log($"值变更:{value}");
            }).UnRegisterWhenGameObjectDestroyed(gameObject);


            mEventA.Register((a, b) =>
            {
                Debug.Log($"自定义事件:{a} {b}");
            }).UnRegisterWhenGameObjectDestroyed(gameObject);
        }

        private void Update()
        {
            if (Input.GetMouseButtonDown(0))
            {
                mOnMouseLeftClickEvent.Trigger();
            }

            if (Input.GetMouseButtonDown(1))
            {
                mOnValueChanged.Trigger(10);
            }

            // 鼠标中键
            if (Input.GetMouseButtonDown(2))
            {
                mEventA.Trigger(1,2);
            }
        }
    }
}

// 输出结果：
// 按鼠标左键时，输出:
// 鼠标左键点击
// 按鼠标右键时，输出:
// 值变更:10
// 按鼠标中键时，输出:
// 自定义事件:1 2
```

The basic usage is very simple.

EasyEvent supports up to three generics.

## Advantages of EasyEvent

EasyEvent is an alternative to C# delegates and events.

Compared to C# delegates and events, the advantage of EasyEvent is that it can be automatically unregistered.

Compared to TypeEventSystem, the advantage is that it is lighter, in most cases, there is no need to declare an event class, and its performance is better (close to C# delegates).

The disadvantage is that the parameters it carries do not have names and need to be defined by yourself.

When designing some general systems, EasyEvent will come in handy, such as backpack systems, dialogue systems, and TypeEventSystem is a very good example.

In the early stages of a project, EasyEvent will also play a very important role. The events in the QFramework architecture are actually a bit cumbersome to write. At this time, using EasyEvent can achieve faster development efficiency. Using the events in the QFramework architecture will play a big role in larger projects. It is more convenient for collaboration, easier to maintain, and easier to standardize.

Well, that's all about EasyEvent.
