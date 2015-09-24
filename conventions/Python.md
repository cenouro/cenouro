# PEP8

Python relies heavily on PEP8 conventions. Hardly the first code we write will 
be PEP8 compliant, but we should always take our time in order to make it so 
after it is working.

PEP8 usually is more readable and it is a common idiom. This is very useful 
since it can make asking questions and answering them easier. It also expresses
the idea of "this is the final version of code", since PEP8 is usually the 
minimal ammount of code we can write.

It should not be used always (read the Zen of Python). Still, getting used to 
it will always pay off.

## Personal conventions

I have also developed my personal conventions over the small time I have been 
working with Python. They are minor things but make sense for me.

#### Always use else

It is common to write `if`s without `else` clauses. I think this should be
avoided since it does not make clear weather the programmer forgot to deal with
a possible edge case or if the else is really not necessary. Having said that,
even if the `else` is not necessary, I prefer to implement it as a `pass`.

#### Use scope leaking

I don't like the idea of scope leaking, but since it is already implemented,
it can make the code a bit better. Watch out for its caveats and use when it
can be used.

#### Control flow else's

Python also implement `else` for `for` loops and `try` blocks. Use them.
* TODO: write gist about this.


#### Use assertions, specially for design by contract

Python test frameworks suck when compared to Ruby RSpec. Mock libs are even
worse. This is not a major problem since we can use assertions in the code.
By using assertions we are also taking advantage of Monte Carlo techniques.

#### Python duck typing sucks

Yes, thats right. Your code will probably be full of `isinstance`'s. Hopefully
you will need them only on assertions. Deal with it.

#### Format kinda sucks

String formating using `format` is somewhat limited. But you can find
documentation (good luck on that) about making it powerful. The idea is to
implement the magic method `__format__`.
* TODO: gist

#### Set is useless

Yes. Deal with it. This is true because you cannot iterate over them. So they
are only useful as a "flags container".
