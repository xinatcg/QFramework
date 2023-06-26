# 15. Additional Content: GridKit Two-Dimensional Grid Data Structure

In the process of game development, we often need to deal with two-dimensional grid data, such as elimination games, Tetris, various chess games, and the tile data of Tilemap that we use most frequently. All of these require a two-dimensional grid data structure.

In the GameMaker Studio engine, such data structures are provided directly at the engine level, named ds\_grid.

Inspired by GameMaker Studio's ds\_grid, QFramework has also implemented a similar data structure, named EasyGrid, with sample code as follows:

```plain
using UnityEngine;

namespace QFramework.Example
{
    public class GridKitExample : MonoBehaviour
    {
        // Start is called before the first frame updatevoid Start()
        {
            var grid = new EasyGrid<string>(4, 4);

            grid.Fill("Empty");
            
            grid[2, 3] = "Hello";

            grid.ForEach((x, y, content) => Debug.Log($"({x},{y}):{content})");

            grid.Clear();
        }
    }
}
```

After running, the code is as follows:

```plain
(0,0):Empty
(0,1):Empty
(0,2):Empty
(0,3):Empty
(1,0):Empty
(1,1):Empty
(1,2):Empty
(1,3):Empty
(2,0):Empty
(2,1):Empty
(2,2):Empty
(2,3):Hello
(3,0):Empty
(3,1):Empty
(3,2):Empty
(3,3):Empty
```

Okay, that's a brief introduction to GridKit.

## More Content

*   Reproduced please indicate the address: [liangxiegame.com](https://liangxiegame.com/) (first release) WeChat public account: Liangxie's Notes
*   QFramework homepage: [qframework.cn](https://qframework.cn/)
*   QFramework communication group: 623597263
*   QFramework Github address: [https://github.com/liangxiegame/qframework](https://github.com/liangxiegame/qframework)
*   QFramework Gitee address: [https://gitee.com/liangxiegame/QFramework](https://gitee.com/liangxiegame/QFramework)
*   GamePix Independent Game Academy & Unity Advanced Small Class Address: [https://www.gamepixedu.com/](https://www.gamepixedu.com/)
