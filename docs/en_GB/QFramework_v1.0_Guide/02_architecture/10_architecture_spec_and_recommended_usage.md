# 10. Architecture Specification and Recommended Usage

The QFramework architecture provides four levels:

* Presentation layer: IController
* System layer: ISystem
* Data layer: IModel
* Utility layer: IUtility

In addition to the four levels, concepts and tools such as Command, Query, Event, and BindableProperty are also provided.

Here are some rules for the levels:

* Presentation layer: ViewController layer. IController interface, responsible for the presentation when receiving input and state changes. In general, MonoBehaviour is the presentation layer.
    * Can get System, Model
    * Can send Command, Query
    * Can listen to Event

The interface definition of Controller is as follows:

```plain
#region Controller
public interface IController : IBelongToArchitecture, ICanSendCommand, ICanGetSystem, ICanGetModel,ICanRegisterEvent, ICanSendQuery
{
}

#endregion
```

* System layer: System layer. ISystem interface, helps IController to bear some logic, such as timing system, mall system, achievement system, etc., shared by multiple presentation layers.
    * Can get System, Model
    * Can listen to Event
    * Can send Event

The interface definition of System is as follows:

```plain
#region System
public interface ISystem : IBelongToArchitecture, ICanSetArchitecture, ICanGetModel, ICanGetUtility,ICanRegisterEvent, ICanSendEvent, ICanGetSystem
{
    void Init();
}
```

* Data layer: Model layer. IModel interface, responsible for defining data and providing methods for data addition, deletion, modification, and query.
    * Can get Utility
    * Can send Event

The interface definition of Model is as follows:

```plain
public interface IModel : IBelongToArchitecture, ICanSetArchitecture, ICanGetUtility, ICanSendEvent
{
    void Init();
}
```

* Utility layer: Utility layer. IUtility interface, responsible for providing infrastructure, such as storage methods, serialization methods, network connection methods, Bluetooth methods, SDK, framework inheritance, etc. Can't do anything, can integrate third-party libraries or encapsulate APIs.

The interface definition of Utility is as follows:

```plain
#region Utility
public interface IUtility
{
}

#endregion
```

* Command: Command, responsible for data addition, deletion, and modification.
    * Can get System, Model
    * Can send Event, Command

The interface definition of Command is as follows:

```plain
public interface ICommand : IBelongToArchitecture, ICanSetArchitecture, ICanGetSystem, ICanGetModel, ICanGetUtility,ICanSendEvent, ICanSendCommand, ICanSendQuery
{
    void Execute();
}
```

* Query: Query, responsible for data query.
    * Can get System, Model
    * Can send Query

```plain
public interface IQuery<TResult> : IBelongToArchitecture, ICanSetArchitecture, ICanGetModel, ICanGetSystem,ICanSendQuery
{
    TResult Do();
}
```

* General rules:
    * IController must use Command to change the state of ISystem and IModel.
    * After the state of ISystem and IModel changes, notify IController using events or BindableProperty.
    * IController can obtain ISystem and IModel objects for data queries.
    * ICommand and IQuery cannot have states.
    * The upper layer can directly obtain the lower layer, and the lower layer cannot obtain the upper layer object.
    * Use events for communication from the lower layer to the upper layer.
    * Use method calls for communication from the upper layer to the lower layer (only for queries, use Command for state changes). The interaction logic of IController is a special case and can only use Command.

The general rules are an ideal set of rules, but in actual projects, it is likely that some modifications need to be made to the above rules.

The modification method is very simple. For example, if I want IController to be able to send events, we only need to add an ICanSendEvent interface to the IController interface, as shown below:

```plain
    #region Controller
 public interface IController : IBelongToArchitecture, ICanSendCommand, ICanGetSystem, ICanGetModel,
        ICanRegisterEvent, ICanSendQuery,
        ICanSendEvent // +
    {
    }

    #endregion
```

In this way, we can send events in the Controller object through this.SendEvent.

If you intend to learn or study the QFramework architecture, I recommend that you first practice projects according to the default architecture specifications of QFramework.

If you intend to use QFramework to do projects immediately, you can gradually introduce QFramework concepts based on your original development habits, such as using BindableProperty and Architecture to solve the problem of Model and data updates at the beginning.

Then gradually use Command to solve the problem of bloated interaction logic, and so on, until you can fully master all concepts and finally modify and customize the QFramework.cs source code.

## Summary

1. 4-layer architecture, from top to bottom: Controller, System, Model, Utility
2. The upper layer can obtain the lower layer, but the lower layer cannot obtain the upper layer.
3. The upper layer notifies the lower layer using method calls.
4. The lower layer notifies the upper layer using events.
5. Through interfaces, you can have flexible control over the capabilities of each level. For example, adding an implementation interface to Controller can increase the ability to send events.
