# Coding conventions

Although the Internet is full of conventions and guidelines, I have also
"developed" some personal conventions over time. This file describes generic
conventions and has some interesting references.

As always, take things with a grain of salt. These conventions work for me;
they won't necessarily work for you.

## Testing

[Sandy Metz@Magic tricks of testing] (https://www.youtube.com/watch?v=URSWYvyc42M)
* TODO: brief resume.

### Coplien articles and related stuff

Coplien has written two articles about TDD. Here are links to both, as well as links to some replies.

[Why most unit testing is a waste of time](http://www.rbcs-us.com/documents/Why-Most-Unit-Testing-is-Waste.pdf)
* TODO: resume the article.

[Why most unit testing is a waste of time (Segue)](http://www.rbcs-us.com/documents/Segue.pdf)
* TODO: read and resume.


[Judging Coplien's articles](https://theholyjava.wordpress.com/2015/01/26/challenging-myself-with-copliens-why-most-unit-testing-is-waste/)
This one analyzes Coplien's articles and gives further references.
* TODO: read and resume.

[A response to Coplien's articles](http://henrikwarne.com/2014/09/04/a-response-to-why-most-unit-testing-is-waste/)
This one is a reply that seems to challenge Coplien's views.
* TODO: read and resume.

### Monte Carlo reliability techniques

I first started searching for references about Monte Carlo techniques after reading Coplien's articles.
It is really hard to thing articles about this subject applied to software. It seems much more
to be closely related to hardware. Still, I was able to find the following article. Although seeming
a bit of hardcore and going through great lengths in order to illustrate the concept, it is very useful.

[Article about Monte Carlo in practice](http://www-cs-students.stanford.edu/~briank/BrianKorverMonteCarlo.pdf)

## Clean Code[r]

Read [the book](http://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882/ref=sr_1_1?ie=UTF8&qid=1443206748&sr=8-1&keywords=clean+code)
by Uncle Bob. Another good one is his [Clean Coder](http://www.amazon.com/The-Clean-Coder-Professional-Programmers/dp/0137081073/ref=pd_sim_14_1?ie=UTF8&refRID=0AFQQ6DX9HRTZTH8FTP4&dpID=512NzCU0wfL&dpSrc=sims&preST=_AC_UL160_SR123%2C160_).

### Clean Code

This one deals mainly with coding conventions. It is written with examples in Java,
and is a very profitable reading. For me, the most important part of the book is about
comments. In that chapter, Uncle Bob mainly states that "comments usually mean that the
programmer has failed to express his idea with code". Of course, this is not
the case and he also gives examples of good comments.

* Informative comments.
    * These are usually to make explicit the intent of a some piece of code
    that can't be expressed succintly in code. For example, patterns that a regex
    should match.

    * Regarding regex, you can use comments but I personally find them to be
    very use to defend and express match patterns in terms of unit tests.

* Explanation of intent.
    * These can be generic. YMMV, but for example, they can be used to make explicit
    the reason why your algorithm work.

    * Another interesting possibility is to write comments like **"This code is ugly but
    for performance reasons. Keep that in mind"**.

* Clarification.
    * Usually for clarifying what your code is checking by calling third party libs.
    For example, C `strcmp` has a non intuitive return value. Add to it a bunch of
    calls in a long if chain and you are doomed.

* TODO comments.

Why comments suck? Because you can't run them and rarely will they be kept updated.
Try to avoid them at all costs. In most cases, you can refactor the code, write
descriptive tests and expectations and rename variables and functions to achieve
better clarity.

As a final resource, watch [this video](https://www.youtube.com/watch?v=HZJxjlvBbVA).
TODO: verify that the video is good enough.

### Clean Coder

Here Uncle Bob deals mainly with TDD, ethical behavior for coders and some other things that
gave him more experience. It is an interesting book and a fun reading.

## Languages stuff

This section will probably be very small. It contains conventions that I find useful in
most languages.

* Abstract methods should raise `NotImplementedError`.

    * This one is already followed by virtually everyone. But what people don't
    usually do is to put a custom message on the exception clarifying the return
    type/exception and so on. Of course this kinda defeats polymorphism, but in
    some cases it can be helpful.
