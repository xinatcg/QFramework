# 09. SingletonKit 单例模板套件

SingletonKit 是 QFramework 的第一个收集的工具，经过了 7 年的迭代，现在已经非常成熟了。

好久不见 ！之前想着让各位直接用 QFramework，但是后来想想，如果正在进行的项目直接使用QFramework，这样风险太高了，要改的代码太多，所以打算陆续独立出来一些工具和模块,允许各位一个模块一个模块的进行更换，减少更换带来的风险。

## QSingleton:

  之前有几篇文章介绍过单例模板在 Unity 中的几种实现。之后又参考了其他的单例库的实现，借鉴(chao)了它们的优点,借鉴了哪里有声明原作者。

## 快速开始:

实现一个继承 MonoBehaviour 的单例类

```plain
namespace QFramework.Example
{
    [MonoSingletonPath("[Audio]/AudioManager")]
    public class AudioManager : ManagerBase,ISingleton
    {
        public static AudioManager Instance
        {
            get { return QMonoSingletonProperty<AudioManager>.Instance; }
        }

        public void OnSingletonInit()
        {

        }

        public void Dispose()
        {
            QMonoSingletonProperty<AudioManager>.Dispose();
        }


        public void PlaySound(string soundName)
        {

        }

        public void StopSound(string soundName)
        {

        }
    }
}
```

结果如下:

  

  

这样从头到尾都很！优！雅！

## C# 单例类

*   Singleton.cs

```plain
public class GameDataManager : Singleton<GameDataManager>
{
    private static int mIndex = 0;

    private Class2Singleton() {}

    public override void OnSingletonInit()
    {
        mIndex++;
    }

    public void Log(string content)
    {
        Debug.Log(""GameDataManager"" + mIndex + "":"" + content);
    }
}

GameDataManager.Instance.Log(""Hello"");
// GameDataManager1:OnSingletonInit:Hello
GameDataManager.Instance.Log(""Hello"");
// GameDataManager1:OnSingletonInit:Hello
GameDataManager.Instance.Dispose();
```

只需简单继承QSingleton，并声明非public构造方法即可。如果有需要获取单例初始化的时机，则可以选择重载OnSingletonInit方法。

## 结果:

```plain
Hello World!
Hello World!
```

## Mono 单例

*   MonoSingleton.cs

```plain
public class GameManager : MonoSingleton<GameManager>
{
  public override void OnSingletonInit()
  {
      Debug.Log(name + "":"" + ""OnSingletonInit"");
  }

  private void Awake()
  {
      Debug.Log(name + "":"" + ""Awake"");
  }

  private void Start()
  {
      Debug.Log(name + "":"" + ""Start"");
  }

  protected override void OnDestroy()
  {
      base.OnDestroy();

      Debug.Log(name + "":"" + ""OnDestroy"");
  }
}
```

var gameManager = GameManager.Instance; // GameManager:OnSingletonInit // GameManager:Awake // GameManager:Start // --------------------- // GameManager:OnDestroy

```plain
## Mono 属性单例
代码如下:

* MonoSingletonProperty.cs
```cs
public class GameManager : MonoBehaviour,ISingleton
{
    public static GameManager Instance
    {
        get { return MonoSingletonProperty<GameManager>.Instance; }
    }

    public void Dispose()
    {
        MonoSingletonProperty<GameManager>.Dispose();
    }

    public void OnSingletonInit()
    {
        Debug.Log(name + "":"" + ""OnSingletonInit"");
    }

    private void Awake()
    {
        Debug.Log(name + "":"" + ""Awake"");
    }

    private void Start()
    {
        Debug.Log(name + "":"" + ""Start"");
    }

    protected void OnDestroy()
    {
        Debug.Log(name + "":"" + ""OnDestroy"");
    }
}
var gameManager = GameManager.Instance;
// GameManager:OnSingletonInit
// GameManager:Awake
// GameManager:Start
// ---------------------
// GameManager:OnDestroy
```

## C# 属性单例

代码如下：

*   SingletonProperty.cs

```plain
public class GameDataManager : ISingleton
{
  public static GameDataManager Instance
  {
      get { return SingletonProperty<GameDataManager>.Instance; }
  }

  private GameDataManager() {}

  private static int mIndex = 0;

  public void OnSingletonInit()
  {
      mIndex++;
  }

  public void Dispose()
  {
      SingletonProperty<GameDataManager>.Dispose();
  }

  public void Log(string content)
  {
      Debug.Log(""GameDataManager"" + mIndex + "":"" + content);
  }
}
```

GameDataManager.Instance.Log(""Hello""); // GameDataManager1:OnSingletonInit:Hello

GameDataManager.Instance.Log(""Hello""); // GameDataManager1:OnSingletonInit:Hello

GameDataManager.Instance.Dispose();

```plain
## MonoSingletPath 重命名


代码如下：
MonoSingletonPath.cs：

```cs
namespace QFramework.Example
{
    using UnityEngine;

    [MonoSingletonPath("[Example]/MonoSingeltonPath")]
    class ClassUseMonoSingletonPath : QMonoSingleton<ClassUseMonoSingletonPath>
    {

    }

    public class MonoSingletonPath : MonoBehaviour
    {
        private void Start()
        {
            var intance = ClassUseMonoSingletonPath.Instance;
        }
    }
}
```

## 结果:

  

## PersistentMonoSingleton

当场景里包含两个 PersistentMonoSingleton，保留先创建的

```plain
public class GameManager : PersistentMonoSingleton<GameManager>
{

}

IEnumerator Start()
{
    var gameManager = GameManager.Instance;

    var newGameManager = new GameObject().AddComponent<GameManager>();

    yield return new WaitForEndOfFrame();

    Debug.Log(FindObjectOfTypes<GameManager>().Length);
    // 1
    Debug.Log(gameManager == null);
    // false
    Debug.Log(newGameManager == null);
    // true
}
```

## ReplaceableMonoSingleton

当场景里包含两个 ReplaceableMonoSingleton，保留最后创建的

```plain
public class GameManager : ReplaceableMonoSingleton<GameManager>
{

}

IEnumerator Start()
{
    var gameManager = GameManager.Instance;

    var newGameManager = new GameObject().AddComponent<GameManager>();

    yield return new WaitForEndOfFrame();

    Debug.Log(FindObjectOfTypes<GameManager>().Length);
    // 1
    Debug.Log(gameManager == null);
    // true
    Debug.Log(newGameManager == null);
    // false
}
```

关于 SingletonKit 的介绍就到这。