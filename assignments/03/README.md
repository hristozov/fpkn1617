Безкраен поток
==============
([задание в Moodle](https://learn.fmi.uni-sofia.bg/mod/assign/view.php?id=78254))
([решение](assignment.rkt))

Да се напише процедура `(construct-stream x)`, която по зададено число `x` конструира безкрайния поток:
```
   x  x^2  x^3  x^4
1, -, ---, ---, ---, ...
   1   2!   3!   4!
```

Примери
-------
`(stream-ref (construct-stream 3) 3) -> 9/2`
