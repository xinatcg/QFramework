# 12. Paper Design

As QFramework supports MVC, layered architecture, and CQRS, and provides usage specifications, it can achieve a high degree of standardization. With a high degree of standardization, there are conditions for paper design.

Suppose we want to implement a function where the main character eats coins and the number of coins increases. We can design the diagram in the following order.

First, we need to determine the data structure.

We can use a class diagram to determine this, or we can use a simpler method to draw it.

Then, we need to determine how the presentation layer displays the coins.

Next, we need to start designing the command.

Then, we can draw the trigger and update diagrams.

This way, the idea of a coin-eating function is designed.

Of course, this example of eating coins is very simple.

However, I suggest that if you are not very familiar with the QFramework architecture, it is more appropriate to use such small functions to do some paper design.

When you are very familiar with the QFramework architecture, you can design more complex functions on paper, such as skill systems, enhanced item systems, backpack systems, task systems, and so on.

Let's take a look at a picture in the first article.

This picture is actually a paper design diagram, that is, when the main character kills an enemy, it triggers the score change and achievement completion functions.

This kind of diagram, plus the coin-eating diagram, is the functional diagram in QFramework paper design.

In addition to the functional diagram, there is also the architecture diagram in QFrameowrk paper design.

The architecture diagram is shown below:

The architecture diagram only lists which module is in which level and does not show how to interact specifically.

The function shows the specific logical control flow of a function.

In general, neither the architecture diagram nor the functional diagram is necessary.

The functional diagram was more used to help people who were not familiar with QFramework to sort out their ideas in the early days.

But there are also times when developers are not at their computers, and the project is relatively tight. At this time, paper design will come in handy.

Developers can completely implement the functional ideas of the entire project on paper.

Another usage is that after the developers receive the requirements, they can gather all the developers for a meeting, read the planning document together, and use paper design to implement the functional ideas of the entire project. Then, the workload of coding and specific implementation can be assigned to each person, which is also a usage.

In short, paper design is a very useful method.

Some people may ask, is there a format to follow for paper design?

The answer is no.

If you are used to using UML class diagrams, then use UML class diagrams to draw. If you are used to using squares, circles, and corners, then use squares, circles, and corners. If you are used to using pen and paper, then use pen and paper.

In short, use whatever is fast and convenient.

Paper design is not only convenient for function implementation, but also for communication within the team. For example, if a developer has no idea how to implement a function, he can ask the lead or QFramework expert to use a piece of paper to sort out the ideas, so that the developer can implement it after receiving the paper. You can also ask the developer to design it on paper first, and then give this paper to the lead or QFramework expert. The lead or QFramework expert can verify it before coding and implementation.

Alright, that's all for the introduction and some extended usage of paper design.
