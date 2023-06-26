# 10. FSMKit State Machine

QFramework comes with a simple state machine, which can be used as follows:

## Chained Mode

```plain
using UnityEngine;

namespace QFramework.Example
{
    public class IStateBasicUsageExample : MonoBehaviour
    {
        public enum States
        {
            A,
            B
        }

        public FSM<States> FSM = new FSM<States>();

        void Start()
        {
            FSM.State(States.A)
                .OnCondition(()=>FSM.CurrentStateId == States.B)
                .OnEnter(() =>
                {
                    Debug.Log("Enter A");
                })
                .OnUpdate(() =>
                {

                })
                .OnFixedUpdate(() =>
                {

                })
                .OnGUI(() =>
                {
                    GUILayout.Label("State A");
                    if (GUILayout.Button("To State B"))
                    {
                        FSM.ChangeState(States.B);
                    }
                })
                .OnExit(() =>
                {
                    Debug.Log("Enter B");

                });

            FSM.State(States.B)
                .OnCondition(() => FSM.CurrentStateId == States.A)
                .OnGUI(() =>
                {
                    GUILayout.Label("State B");
                    if (GUILayout.Button("To State A"))
                    {
                        FSM.ChangeState(States.A);
                    }
                });

            FSM.StartState(States.A);
        }

        private void Update()
        {
            FSM.Update();
        }

        private void FixedUpdate()
        {
            FSM.FixedUpdate();
        }

        private void OnGUI()
        {
            FSM.OnGUI();
        }

        private void OnDestroy()
        {
            FSM.Clear();
        }
    }
}
```

After running, the result is as follows:

[![](https://file.liangxiegame.com/c263fec3-02eb-4af6-bb84-a3310440cfa9.gif)](https://file.liangxiegame.com/c263fec3-02eb-4af6-bb84-a3310440cfa9.gif)

No problem.

## Class Mode

Chained mode is suitable for quick development or stages with few states.

If there are many states or corresponding code, class mode can be used, as shown in the following code:

```plain
using UnityEngine;

namespace QFramework.Example
{
    public class IStateClassExample : MonoBehaviour
    {

        public enum States
        {
            A,
            B,
            C
        }

        public FSM<States> FSM = new FSM<States>();

        public class StateA : AbstractState<States,IStateClassExample>
        {
            public StateA(FSM<States> fsm, IStateClassExample target) : base(fsm, target)
            {
            }

            protected override bool OnCondition()
            {
                return mFSM.CurrentStateId == States.B;
            }

            public override void OnGUI()
            {
                GUILayout.Label("State A");

                if (GUILayout.Button("To State B"))
                {
                    mFSM.ChangeState(States.B);
                }
            }
        }


        public class StateB: AbstractState<States,IStateClassExample>
        {
            public StateB(FSM<States> fsm, IStateClassExample target) : base(fsm, target)
            {
            }

            protected override bool OnCondition()
            {
                return mFSM.CurrentStateId == States.A;
            }

            public override void OnGUI()
            {
                GUILayout.Label("State B");

                if (GUILayout.Button("To State A"))
                {
                    mFSM.ChangeState(States.A);
                }
            }
        }

        private void Start()
        {
            FSM.AddState(States.A, new StateA(FSM, this));
            FSM.AddState(States.B, new StateB(FSM, this));

            // 支持和链式模式混用
            // FSM.State(States.C)
            //     .OnEnter(() =>
            //     {
            //
            //     });

            FSM.StartState(States.A);
        }

        private void OnGUI()
        {
            FSM.OnGUI();
        }

        private void OnDestroy()
        {
            FSM.Clear();
        }
    }
}
```

After running, the result is as follows:

[![](https://file.liangxiegame.com/c263fec3-02eb-4af6-bb84-a3310440cfa9.gif)](https://file.liangxiegame.com/c263fec3-02eb-4af6-bb84-a3310440cfa9.gif)

That's all about the introduction of the state machine.
