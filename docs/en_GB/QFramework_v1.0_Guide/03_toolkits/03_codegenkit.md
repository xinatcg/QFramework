# 03. CodeGenKit Script Generation

In this article, we will learn about a feature that almost every project needs and benefits from: automatic script generation and binding, also known as script generation.

## Basic Usage

First, let's create some GameObjects with parent-child structures in the scene, as shown below:

[![](https://file.liangxiegame.com/ed37997b-614b-4fb1-baa8-c23d7748c67d.png)](https://file.liangxiegame.com/ed37997b-614b-4fb1-baa8-c23d7748c67d.png)

Then, attach a ViewController to the Player using the shortcut key (Alt + V), as shown in the following figure:

[![](https://file.liangxiegame.com/cfb5f767-120f-4e0f-a69b-bdef1b6e9c98.png)](https://file.liangxiegame.com/cfb5f767-120f-4e0f-a69b-bdef1b6e9c98.png)

Then fill in the component information that was just added:

[![](https://file.liangxiegame.com/a2bc2a07-02bf-46e3-ad65-36309c290bce.png)](https://file.liangxiegame.com/a2bc2a07-02bf-46e3-ad65-36309c290bce.png)

Here, you can fill in the namespace, the name of the script to be generated, and the directory where the script will be generated. Of course, you can also drag the directory to the large block directly.

If you drag the directory, the script generation directory will be automatically filled in, as shown in the following figure:

[![](https://file.liangxiegame.com/41f2abac-2fcf-4c03-8ba0-ab45f71859f3.png)](https://file.liangxiegame.com/41f2abac-2fcf-4c03-8ba0-ab45f71859f3.png)

Next, we can attach a Bind component to a child node of the Player GameObject (shortcut key, alt + b), as shown below:

[![](https://file.liangxiegame.com/e818f0e5-6bfc-436b-8f61-20fb90da4bd6.png)](https://file.liangxiegame.com/e818f0e5-6bfc-436b-8f61-20fb90da4bd6.png)

The component attached to Weapon is shown below:

[![](https://file.liangxiegame.com/04e7c9a4-0bc6-4257-9793-41531c3faa64.png)](https://file.liangxiegame.com/04e7c9a4-0bc6-4257-9793-41531c3faa64.png)

After that, we can click the Generate Code button in the figure or the Generate Code button on the ViewController of the Player, either of which can be clicked.

After clicking, the code will be generated and compiled, and the result is as follows:

Script directory:

[![](https://file.liangxiegame.com/d3fc5522-6655-4318-8bec-7f4721753110.png)](https://file.liangxiegame.com/d3fc5522-6655-4318-8bec-7f4721753110.png)

Let's take a look at the Inspector of the Player in the scene as shown below:

[![](https://file.liangxiegame.com/07c51906-6c1d-49be-bb9b-faef8ce999ae.png)](https://file.liangxiegame.com/07c51906-6c1d-49be-bb9b-faef8ce999ae.png)

We can see that the Player automatically gets a reference to Weapon.

Moreover, Weapon can be accessed directly in Player.cs, as shown in the following figure:

[![](https://file.liangxiegame.com/3a9f0ac1-c05c-4cdf-b442-c33fadb6897a.png)](https://file.liangxiegame.com/3a9f0ac1-c05c-4cdf-b442-c33fadb6897a.png)

## Incremental Generation

Let's take a look at the directory again:

[![](https://file.liangxiegame.com/47398560-791c-4e41-8586-6b76347f2758.png)](https://file.liangxiegame.com/47398560-791c-4e41-8586-6b76347f2758.png)

There are two files here, Player and Player.Designer.

Player is used to write logic, so it is only generated once.

Player.Designer will be regenerated every time you click to generate code.

Let's take a look at the code for Player.Designer:

```plain
// Generate Id:471bf5e6-b60b-42b8-b5c8-b070a963ab4ausing UnityEngine;

// 1.请在菜单 编辑器扩展/Namespace Settings 里设置命名空间
// 2.命名空间更改后，生成代码之后，需要把逻辑代码文件（非 Designer）的命名空间手动更改
namespace QFramework.Example
{
    public partial class Player
    {

        public Transform Weapon;

    }
}
```

There is only one Weapon in the code.

Next, we attach the Bind script to another child GameObject of Player, as follows:

[![](https://file.liangxiegame.com/acde8a1e-2e6f-4bee-8aa9-02cec82f2808.png)](https://file.liangxiegame.com/acde8a1e-2e6f-4bee-8aa9-02cec82f2808.png)

Then click to generate the code, as follows:

[![](https://file.liangxiegame.com/991db32f-8212-4d7a-8176-0065cebad93f.png)](https://file.liangxiegame.com/991db32f-8212-4d7a-8176-0065cebad93f.png)

After generating, the result is as follows:

Player has an additional Ground Check.

[![](https://file.liangxiegame.com/d769f7e4-1e70-4dfc-9962-27d6b99998a4.png)](https://file.liangxiegame.com/d769f7e4-1e70-4dfc-9962-27d6b99998a4.png)

Let's take a look at the code for Player.Designer:

```plain
// Generate Id:f512c2ed-6243-4a89-897e-bdaaabe50d63using UnityEngine;

// 1.请在菜单 编辑器扩展/Namespace Settings 里设置命名空间
// 2.命名空间更改后，生成代码之后，需要把逻辑代码文件（非 Designer）的命名空间手动更改
namespace QFramework.Example
{
    public partial class Player
    {

        public Transform Weapon;

        public Transform GroundCheck;

    }
}
```

This time there is an additional GroundCheck.

The code for Player has not changed.

So every time the code is generated, Player.cs is only generated once, and Player.Designer.cs is regenerated every time, so you can safely write code in Player.cs.

## Type Selection

Previously, we bound GameObjects of type Transform using Bind. This time, let's try binding other types.

We attach a Sprite Renderer to the Weapon GameObject as shown below:

[![](https://file.liangxiegame.com/913a4dcb-7e35-433c-a50a-454614ddf89d.png)](https://file.liangxiegame.com/913a4dcb-7e35-433c-a50a-454614ddf89d.png)

Then, we click on the Bind type, and it displays as follows:

[![](https://file.liangxiegame.com/9ff5d52d-61bb-43b7-b4f0-5e9c118329e1.png)](https://file.liangxiegame.com/9ff5d52d-61bb-43b7-b4f0-5e9c118329e1.png)

That is to say, Bind can select the components attached to this GameObject.

We select the Sprite Render type, as follows:

[![](https://file.liangxiegame.com/720ec620-1ca4-42b7-afa8-ec94ee846d06.png)](https://file.liangxiegame.com/720ec620-1ca4-42b7-afa8-ec94ee846d06.png)

Then click to generate the code, and the result is as follows:

[![](https://file.liangxiegame.com/dd6a1012-6721-4c71-9291-de008a5b8614.png)](https://file.liangxiegame.com/dd6a1012-6721-4c71-9291-de008a5b8614.png)

The Weapon referenced by Player has changed from Transform type to Sprite Renderer type.

The code for Player.Designer.cs has changed to the following:

```plain
// Generate Id:de59e915-d1b6-40aa-a8e5-6fc4a8bf8e3eusing UnityEngine;

// 1.请在菜单 编辑器扩展/Namespace Settings 里设置命名空间
// 2.命名空间更改后，生成代码之后，需要把逻辑代码文件（非 Designer）的命名空间手动更改
namespace QFramework.Example
{
    public partial class Player
    {

        public UnityEngine.SpriteRenderer Weapon;

        public Transform GroundCheck;

    }
}
```

Weapon has changed from Transform type to SpriteRenderer type.

Now we can get the Weapon of type SpriteRenderer in Player.cs, as shown in the following figure:

[![](https://file.liangxiegame.com/534d8275-5d63-4307-89a8-378722f0bffc.png)](https://file.liangxiegame.com/534d8275-5d63-4307-89a8-378722f0bffc.png)

## How to set the default namespace and script generation directory

It's simple, open the QFramework editor panel (shortcut key: ctrl + e or ctrl + shift + e).

[![](https://file.liangxiegame.com/4322e7cc-8f5e-4e45-abbe-d63110d2e605.png)](https://file.liangxiegame.com/4322e7cc-8f5e-4e45-abbe-d63110d2e605.png)

You can change the default namespace and default script generation location in the CodeGenKit settings.

Of course, you can also set it in the ViewController Inspector.

First, let's change the namespace and script generation path as follows:

[![](https://file.liangxiegame.com/72f7df2a-40cb-443c-a1f3-f4c5d5656a4b.png)](https://file.liangxiegame.com/72f7df2a-40cb-443c-a1f3-f4c5d5656a4b.png)

Then we create a GameObject and add the ViewController component to it, and the result is as follows:

[![](https://file.liangxiegame.com/f461ade5-8cf6-4bfd-a94d-c86f523cf8e8.png)](https://file.liangxiegame.com/f461ade5-8cf6-4bfd-a94d-c86f523cf8e8.png)

This way, the default namespace takes effect.

## ViewController and ViewController nesting

ViewController can be nested with ViewController.

We create a WeaponEffect GameObject in the Player's Weapon GameObject as follows:

[![](https://file.liangxiegame.com/e9ef6d43-7e8c-42ff-9593-76dced914c7a.png)](https://file.liangxiegame.com/e9ef6d43-7e8c-42ff-9593-76dced914c7a.png)

Then add the Bind script to WeaponEffect, as follows:

[![](https://file.liangxiegame.com/0eed4e49-2a89-4d36-af02-4e42647cfe3a.png)](https://file.liangxiegame.com/0eed4e49-2a89-4d36-af02-4e42647cfe3a.png)

Then add the ViewController script to Weapon, as follows:

[![](https://file.liangxiegame.com/e0b90b3b-cf9a-4688-ab6d-c73c8feb9f72.png)](https://file.liangxiegame.com/e0b90b3b-cf9a-4688-ab6d-c73c8feb9f72.png)

Let's change the script generation directory to the same directory as Player.cs, as follows:

[![](https://file.liangxiegame.com/f7c52c1e-0437-48a3-b3e1-7c9d77a080bf.png)](https://file.liangxiegame.com/f7c52c1e-0437-48a3-b3e1-7c9d77a080bf.png)

Click Generate Code, as shown below:

[![](https://file.liangxiegame.com/29e139ca-9fc4-4422-9d4c-7831ad6d75c6.png)](https://file.liangxiegame.com/29e139ca-9fc4-4422-9d4c-7831ad6d75c6.png)

After the generation is complete, let's change the Bind type on Weapon to Weapon, as follows:

[![](https://file.liangxiegame.com/54a25732-61ea-4dd9-84dd-7bb80d66fd2d.png)](https://file.liangxiegame.com/54a25732-61ea-4dd9-84dd-7bb80d66fd2d.png)

Then click Generate Code on Bind, and the result is as follows:

[![](https://file.liangxiegame.com/83beb081-fb7a-48df-85f5-5caf01cac1fb.png)](https://file.liangxiegame.com/83beb081-fb7a-48df-85f5-5caf01cac1fb.png)

This way, the ViewController is nested and bound to the ViewController.

In Player.cs, you can call the child GameObject of Weapon as follows:

[![](https://file.liangxiegame.com/c29ba2f9-39b0-436a-8084-781edaf959fe.png)](https://file.liangxiegame.com/c29ba2f9-39b0-436a-8084-781edaf959fe.png)

Of course, you can also write Weapon's own logic in Weapon.cs.

## Generate Prefab

In the ViewController or the Inspector of the generation script, there is an option to generate a prefab.

[![](https://file.liangxiegame.com/f88d06e7-2b95-47fe-ac91-c446fc550447.png)](https://file.liangxiegame.com/f88d06e7-2b95-47fe-ac91-c446fc550447.png)

After checking it, it will be shown as follows:

[![](https://file.liangxiegame.com/0b9de93d-12c9-498f-b38c-c2682aa98287.png)](https://file.liangxiegame.com/0b9de93d-12c9-498f-b38c-c2682aa98287.png)

Here, you can modify the directory to be generated. The author chooses to be consistent with the directory generated by the script, as follows:

[![](https://file.liangxiegame.com/7628fcb6-c9de-4fe5-9f80-8967d745b3aa.png)](https://file.liangxiegame.com/7628fcb6-c9de-4fe5-9f80-8967d745b3aa.png)

Then click to generate the code, and the result is as follows:

The Player in the scene becomes a prefab.

[![](https://file.liangxiegame.com/9e71ac1b-874e-47dd-b9ab-8d64e605f8a1.png)](https://file.liangxiegame.com/9e71ac1b-874e-47dd-b9ab-8d64e605f8a1.png)

The prefab is also in the generated directory.

[![](https://file.liangxiegame.com/18caef79-77b1-41a6-a102-9d53683be04d.png)](https://file.liangxiegame.com/18caef79-77b1-41a6-a102-9d53683be04d.png)

## Why?

Why create a CodeGenKit?

Because creating script directories, creating script files, declaring member variables or getting references to child nodes through transform.Find, then attaching scripts, and drag-and-drop assignments are all very time-consuming and cumbersome. If we can optimize this part of the workload through code generation and automatic assignment, the development efficiency of the project will be greatly improved.

The ViewController in CodeGenKit can not only be used for ordinary GameObjects, but also supports UI components such as NGUI and UGUI.

Well, that's all about the introduction of script generation.
