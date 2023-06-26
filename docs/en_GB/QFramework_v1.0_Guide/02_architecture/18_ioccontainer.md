# 18. Built-in Tool: IOCContainer

The module registration and retrieval in the QFramework architecture is implemented through IOCContainer.

IOC stands for Inversion of Control, which means Inversion of Control Container.

The essence of its technology is very simple, essentially a dictionary, where the Key is Type and the Value is Object, that is: Dictionary<Type, object>.

The IOCContainer in the QFramework architecture is a very simple version of the Inversion of Control Container, which only supports the registration of objects as singletons.

In general, other Inversion of Control Containers will have various object registration modes, and some even have built-in object pools and object factories, such as Zenject.

However, let's not worry about those for now. If we start with the simplest version, other versions will be easier to learn.

Let's take a look at the basic usage of IOCContainer.

The code is as follows:

```plain
using System;
using UnityEngine;

namespace QFramework.Example
{
    public class IOCContainerExample : MonoBehaviour
    {

        public class SomeService
        {
            public void Say()
            {
                Debug.Log("SomeService Say Hi");
            }
        }


        public interface INetworkService
        {
            void Connect();
        }

        public class NetworkService : INetworkService
        {
            public void Connect()
            {
                Debug.Log("NetworkService Connect Succeed");
            }
        }

        private void Start()
        {
            var container = new IOCContainer();

            container.Register(new SomeService());

            container.Register<INetworkService>(new NetworkService());


            container.Get<SomeService>().Say();
            container.Get<INetworkService>().Connect();
        }
    }
}

// 输出结果:
// SomeService Say Hi
// NetworkService Connect Succeed
```

Very simple.

But for many beginners, they may not know how to use IOCContainer or understand it.

Here is a simple explanation: using IOCContainer makes it easier to design modules that comply with the Dependency Inversion Principle.

The support for designing modules using interfaces in the QFramework architecture is also supported by IOCContainer, and using IOCContainer also makes it easier to design layered architectures.

That's all for IOCContainer.
