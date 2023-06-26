# 19. Architecture in Mind

QFramework.cs provides tools such as MVC, layering, CQRS, event-driven, and data-driven, as well as architecture usage specifications.

When you become proficient in using QFramework, you can reach the state of having architecture in mind.

If you reach this state, you are no longer the same person you were before (just kidding).

Having architecture in mind means that you can practice QFramework architecture in a project without relying on QFramework.cs.

An example of this is shown below:

```plain
using System;
using System.Collections.Generic;
using UnityEngine;

namespace QFramework.Example
{
    public class ArchitectureInHeartExample : MonoBehaviour
    {

        #region Framework
        public interface ICommand
        {
            void Execute();
        }

        public class BindableProperty<T>
        {
            private T mValue = default;

            public T Value
            {
                get => mValue;
                set
                {
                    if (mValue != null && mValue.Equals(value)) return;
                    mValue = value;
                    OnValueChanged?.Invoke(mValue);
                }
            }

            public event Action<T> OnValueChanged = _ => { };
        }

        #endregion
        #region 定义 Model
        public static class CounterModel
        {
            public static BindableProperty<int> Counter = new BindableProperty<int>()
            {
                Value = 0
            };
        }

        #endregion
        #region 定义 Command
        public struct IncreaseCountCommand : ICommand
        {
            public void Execute()
            {
                CounterModel.Counter.Value++;
            }
        }

        public struct DecreaseCountCommand : ICommand
        {
            public void Execute()
            {
                CounterModel.Counter.Value--;
            }
        }
        #endregion
        private void OnGUI()
        {
            if (GUILayout.Button("+"))
            {
                new IncreaseCountCommand().Execute();
            }

            GUILayout.Label(CounterModel.Counter.Value.ToString());

            if (GUILayout.Button("-"))
            {
                new DecreaseCountCommand().Execute();
            }
        }
    }
}
```

The above image shows the implementation of a counter application.

In this implementation, none of the contents of QFramework.cs were used, but a counter application implementation that conforms to the QFramework.cs architecture specification was written.

When you become proficient in using QFramework.cs, you can write projects according to the QFramework.cs architecture specification even without using QFramework.cs in the future. At this point, whether or not you have QFramework.cs doesn't matter because the QFramework.cs architecture specification is already ingrained in you.

When you become proficient in using QFramework.cs, if one day you study web front-end, server, or app development, you will find that many of their frameworks have similarities with the QFramework.cs architecture. In fact, the development experience accumulated through QFramework.cs can be directly applied to other fields of development.

This is because QFramework.cs was originally designed to blend and simplify a large number of architecture concepts from other fields, such as Redux (Flux) in React, domain-driven design, CQRS, repository patterns, etc. in .Net Core development, and MVC, MVP, MVVM, etc. in app development.

Let's take a brief look at these diagrams, and you will understand.

First, the workflow of Redux in front-end React is as follows:

[![](https://file.liangxiegame.com/8b854e1e-4772-4a79-b595-c0ded004a569.png)](https://file.liangxiegame.com/8b854e1e-4772-4a79-b595-c0ded004a569.png)

The React Components correspond to the Controller in QFramework.cs.

Action + Reducers correspond to Command in QFramework.cs.

Store corresponds to Model in QFramework.cs.

Next is domain-driven design:

[![](https://file.liangxiegame.com/f966558b-c616-46cd-9eee-4ba56de64b2c.png)](https://file.liangxiegame.com/f966558b-c616-46cd-9eee-4ba56de64b2c.png)

The Interface corresponds to IController.

Application corresponds to ISystem.

Domain corresponds to Model.

Infrustracture corresponds to Utility + part of Model.

Next, let's look at CQRS. CQRS is generally a pattern included in domain-driven design, as shown in the following figure:

[![](https://file.liangxiegame.com/5f45fb20-537e-4574-80ac-c8d6a2d7921e.png)](https://file.liangxiegame.com/5f45fb20-537e-4574-80ac-c8d6a2d7921e.png)

The User Interface corresponds to IController.

Command and Query correspond to Command and Query.

Domain Model and Data correspond to Model.

Event corresponds to Event.

Very close.

Next, let's look at the repository pattern:

[![](https://file.liangxiegame.com/5bf7ddeb-702d-4e05-aa4a-b3751a7547eb.png)](https://file.liangxiegame.com/5bf7ddeb-702d-4e05-aa4a-b3751a7547eb.png)

There is no specific diagram for the repository pattern, and this diagram was randomly found online, which clearly expresses the structure of the repository pattern.

The IRepository corresponds to IModel.

Repository corresponds to AbstractModel.

IBookRepository corresponds to ICounterModel.

BookRespository corresponds to CounterModel.

Using ICounterModel and CounterModel as examples is not very appropriate because CounterModel only has one Counter data.

A more suitable example is IStudentModel and StudentModel, because StudentModel will maintain a List of Students.

The advantage of the repository pattern is that it allows the upper layer (System, Controller) to focus on the functionality of data addition, deletion, modification, and retrieval, rather than the specific implementation of these operations. This is because on the server side, data is stored in a database, which has many types, such as MySQL, MongoDB, etc. During server-side development, it is very likely to use SQLite or MongoDB in the development stage, while using MySQL or PostgreSQL in the production environment. Therefore, in statically typed languages, the repository pattern will work with ORM to allow developers to focus on data manipulation and the relationships between data, rather than specific query statements, which can improve development efficiency.

Finally, MVC, MVP, and MVVM will not be introduced here. The implementation of MVP and MVVM will use BindableProperty, and some will be implemented in the form of reflection.

The BindableProperty in QFramework.cs and the MVC layering come from these architectures.

Now, why does QFramework.cs integrate these architectural concepts?

Because around 2019, the author happened to study React development in his spare time for a year, and used React frontend development to do some SideProjects, while the server used .Net Core. In addition, the author had previous experience in iOS, Android, and other development. At that time, the author suddenly found that many of these architectural concepts in these fields are similar, and may be called one thing in one field and just have a different name in another field. So the idea of integrating these architectural concepts together and removing the cumbersome parts while retaining the useful parts came up, and the design of QFramework.cs began.

What are the benefits of mixing and simplifying these concepts in QFramework.cs?

First of all, QFramework.cs is a very easy-to-use architecture, because the MVC three-layer concept makes everyone feel very familiar, so the learning curve is not very high.

Secondly, QFramework.cs is an architecture that can improve everyone's technical level. In terms of architecture, the ceiling is the implementation of domain-driven design, which is the content that architects must study. If QFramework.cs is familiar, it will be much easier to study domain-driven design, which will greatly improve the level of architecture, and QFramework.cs is a simplified version of the implementation of domain-driven design.

Then QFramework.cs can be used for system design, games, projects, and plugins, because many of the author's own projects, plugins, and servers are built using the QFramework.cs architecture.

Finally, QFramework.cs itself is very powerful, easy to use, simple, code is concise, maintainability is strong, development efficiency is high, customizability is strong, and extensibility is strong, because QFramework.cs absorbs the advantages of many other architectural fields, and has also undergone a lot of polishing in many projects, with a total code of about 900 lines.

If you want to further strengthen these concepts, the best way is to try to learn the architectures of other fields, such as:

* React and Redux
* Java/.Net Core and DDD implementation, CQRS, repository pattern
* MVC, MVP, MVVM in app development

That's all for this content.
