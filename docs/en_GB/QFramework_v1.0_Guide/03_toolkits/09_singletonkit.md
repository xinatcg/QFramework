# 09. SingletonKit Singleton Template Kit

SingletonKit is the first tool collected by QFramework. After 7 years of iteration, it is now very mature.

Long time no see! I used to think that everyone could use QFramework directly, but later I thought that if the ongoing project uses QFramework directly, the risk is too high and there are too many codes to be changed. So I plan to gradually separate some tools and modules, allowing everyone to replace them module by module to reduce the risk of replacement.

## QSingleton:

Several articles have introduced several implementations of singleton templates in Unity before. Later, I also referred to the implementation of other singleton libraries, learned from their advantages, and declared the original author.

## Quick Start:

Implement a singleton class that inherits from MonoBehaviour

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

The result is as follows:

  

  

This is very elegant from start to finish!

## C# Singleton Class

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

Simply inherit QSingleton and declare a non-public constructor. If you need to get the timing of singleton initialization, you can choose to overload the OnSingletonInit method.

## Result:

```plain
Hello World!
Hello World!
```

## Mono Singleton

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

```
public void Log(string content)
{
    Debug.Log(""GameDataManager"" + mIndex + "":"" + content);
}
```

GameDataManager.Instance.Log(""Hello""); // GameDataManager1:OnSingletonInit:Hello

GameDataManager.Instance.Log(""Hello""); // GameDataManager1:OnSingletonInit:Hello

GameDataManager.Instance.Dispose();

```plain
## Rename MonoSingletPath


Code as follows:
MonoSingletonPath.cs:

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

## Result:

  

## PersistentMonoSingleton

When there are two PersistentMonoSingleton in the scene, keep the one created first.

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

When there are two ReplaceableMonoSingleton in the scene, keep the one created last.

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

That's all about the introduction of SingletonKit.
