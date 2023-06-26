# 17. Built-in Tool: BindableProperty

In this section, we will introduce BindableProperty.

BindableProperty provides an object that combines data and data change events.

## Basic Usage

```plain
using UnityEngine;

namespace QFramework.Example
{
    public class BindablePropertyExample : MonoBehaviour
    {
        private BindableProperty<int> mSomeValue = new BindableProperty<int>(0);

        private BindableProperty<string> mName = new BindableProperty<string>("QFramework");

        void Start()
        {
            mSomeValue.Register(newValue =>
            {
                Debug.Log(newValue);
            }).UnRegisterWhenGameObjectDestroyed(gameObject);

            mName.RegisterWithInitValue(newName =>
            {
                Debug.Log(mName);
            }).UnRegisterWhenGameObjectDestroyed(gameObject);
        }

        void Update()
        {

            if (Input.GetMouseButtonDown(0))
            {
                mSomeValue.Value++;
            }
        }
    }
}


// 输出结果// QFramework// 按下鼠标左键,输出:// 1// 按下鼠标左键,输出:// 2
```

It's very simple.

We have already introduced BindableProperty when we were writing the CounterApp, so we will end the introduction here.
