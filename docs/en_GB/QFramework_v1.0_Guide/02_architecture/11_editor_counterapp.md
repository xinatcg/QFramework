# 11. Speedy Implementation of EditorCounterApp and Development Mode for Main Programmers

First, let's implement something fun, which is to quickly implement an editor version of CounterApp based on the CounterApp that has already been implemented.

The code is very simple, as follows:

```plain
#if UNITY_EDITORusing System;
using UnityEditor;
using UnityEngine;

namespace QFramework.Example
{
    public class EditorCounterAppWindow : EditorWindow,IController
    {

        [MenuItem("QFramework/Example/EditorCounterAppWindow")]
        static void Open()
        {
            GetWindow<EditorCounterAppWindow>().Show();
        }

        private ICounterAppModel mCounterAppModel;

        private void OnEnable()
        {
            mCounterAppModel = this.GetModel<ICounterAppModel>();
        }

        private void OnDisable()
        {
            mCounterAppModel = null;
        }

        private void OnGUI()
        {
            if (GUILayout.Button("+"))
            {
                this.SendCommand<IncreaseCountCommand>();
            }

            GUILayout.Label(mCounterAppModel.Count.Value.ToString());


            if (GUILayout.Button("-"))
            {
                this.SendCommand<DecreaseCountCommand>();
            }
        }

        public IArchitecture GetArchitecture()
        {
            return CounterApp.Interface;
        }
    }
}

#endif
```

The amount of code is not much, and the running result is as follows:

[![](https://file.liangxiegame.com/3b685522-d4ef-4648-ba3d-5726aaee7b62.png)](https://file.liangxiegame.com/3b685522-d4ef-4648-ba3d-5726aaee7b62.png)

This way, the editor version of CounterApp is implemented very quickly.

Because the App written by QFramework can reuse the bottom three layers.

As shown in the figure:

[![](https://file.liangxiegame.com/fc803d9e-2868-4b5b-af29-d39dd9e37891.png)](https://file.liangxiegame.com/fc803d9e-2868-4b5b-af29-d39dd9e37891.png)

The communication methods between the bottom three layers and the presentation layer are Command, Callback/Event, and Method/Query.

We can analogize the presentation layer to the front-end of a webpage, and the bottom three layers to the server.

So Command, Callback/Event, and Method/Query are actually similar to the interface or protocol of HTTP or TCP.

As long as the interface or protocol is well agreed upon, the front-end does not need to care about the specific implementation of the server, and the server does not need to care about the specific implementation of the front-end.

This achieves the separation of work between the presentation layer and the bottom three layers when dividing labor among different people.

And I have done such a project before.

In the project, I was responsible for implementing the bottom three layers, and then coordinating with the server to adjust the data and interface. For the display of data, I used a fast interface writing solution, such as xmllayout or delight, which is very fast for writing interfaces and can be used to implement system prototypes.

Then, after the data and interface were adjusted, the system prototype was implemented, and the work of designing the interface, the scene flow, and the presentation was assigned to my beginner colleagues. As long as they looked at the implemented system prototype, they knew which Command/Query to call, which events to listen to, or which methods to call, so they could do a good job of dividing labor and cooperation.

It is represented by a picture as follows:

[![](https://file.liangxiegame.com/430968f9-68a8-470a-8450-b70316a31419.png)](https://file.liangxiegame.com/430968f9-68a8-470a-8450-b70316a31419.png)

Of course, this is only one of the project development modes.

As time goes by, my beginner colleagues gradually became familiar with this architecture and were able to write the bottom three layers themselves, so I slowly delegated the workload of the bottom layer and had nothing to do myself.

Well, this is a sharing of a development mode that I once used, and the specific development mode needs to be formulated according to the actual situation. The simplest way is to first follow the original development mode, and then gradually master this architecture and improve the previous development mode after mastering it.

That's all for this article.

  

## Summary

  

1. [Delight](https://delight-dev.github.io/) is an open-source component-oriented framework for Unity
2. [**XmlLayout**](https://assetstore.unity.com/packages/tools/gui/xmllayout-xml-driven-ui-framework-61090) is a framework for Unity UI which allows you to develop professional, fully functional user interfaces and UI elements using XML.
3. The bottom three layers can be shared.
