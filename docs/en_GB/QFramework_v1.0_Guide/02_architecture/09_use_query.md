# 09. Introduction to Query

Query is the Q in CQRS, which stands for Query in Command Query Responsibility Separation.

We have already introduced Command.

Query is the corresponding query object to Command.

Firstly, the presentation logic in the Controller is mostly about receiving data change events and querying the Model or System. When querying, sometimes it is necessary to perform composite queries, such as querying multiple Models together, and the queried data may need to be transformed. This type of query involves a lot of code, especially for simulation or data-heavy projects. Therefore, QFramework supports the concept of Query to solve this problem.

The usage is also very simple, consistent with the usage of Command. Here we write a small App called QueryExampleApp, the code is as follows:

```plain
using System.Collections.Generic;
using UnityEngine;

namespace QFramework.Example
{
    public class QueryExampleController : MonoBehaviour,IController
    {
        public class StudentModel : AbstractModel
        {

            public List<string> StudentNames = new List<string>()
            {
                "张三",
                "李四"
            };

            protected override void OnInit()
            {

            }
        }

        public class TeacherModel : AbstractModel
        {
            public List<string> TeacherNames = new List<string>()
            {
                "王五",
                "赵六"
            };

            protected override void OnInit()
            {

            }
        }

        // Architecture
        public class QueryExampleApp : Architecture<QueryExampleApp>
        {
            protected override void Init()
            {
                this.RegisterModel(new StudentModel());
                this.RegisterModel(new TeacherModel());
            }
        }


        /// <summary>
        /// 获取学校的全部人数
        /// </summary>
        public class SchoolAllPersonCountQuery : AbstractQuery<int>
        {
            protected override int OnDo()
            {
                return this.GetModel<StudentModel>().StudentNames.Count +
                       this.GetModel<TeacherModel>().TeacherNames.Count;
            }
        }

        private int mAllPersonCount = 0;

        private void OnGUI()
        {
            GUILayout.Label(mAllPersonCount.ToString());

            if (GUILayout.Button("查询学校总人数"))
            {
                mAllPersonCount = this.SendQuery(new SchoolAllPersonCountQuery());
            }
        }

        public IArchitecture GetArchitecture()
        {
            return QueryExampleApp.Interface;
        }
    }
}
```

The code is not difficult.

After running, when the query button is pressed, the result is as follows:

[![](https://file.liangxiegame.com/1736bf69-b795-408a-8c09-6e413f57b0b1.png)](https://file.liangxiegame.com/1736bf69-b795-408a-8c09-6e413f57b0b1.png)

Okay, this is the end of the Query example.

Query is an optional concept. If the data query logic in the game is not very heavy, it can be written directly in the presentation logic of the Controller. However, if the data query is relatively heavy or the project scale is very large, it is best to use Query to handle the query logic.

Command is generally responsible for data addition, deletion, and modification, while Query is responsible for data retrieval.

If the game needs to synchronize data from the server, the request to pull server data can be written in Query, while the request to add, delete, and modify server data can be written in Command.

Okay, that's all about Query.
