# Медиани
([задание в Moodle](https://learn.fmi.uni-sofia.bg/mod/assign/view.php?id=79792))
([решение](assignment.hs))

Нека `l` е (потенциално безкраен) непразен списък, съставен от „залепяне“ на монотонно растящи списъци. Например:

`[1, 1, 2, 3, 1, 2, 3, 4, 5, 5, 9, 15, 1]` - списъците са `[1], [1,2,3]`, `[1,2,3,4,5]`, `[5,9,15]` и `[1]`

Да се напише функция `solution :: Ord a => [a] -> [a]`, която получава такъв списък `l` и конструира нов списък от числа, като всяко от тези числа е медианата на съответния възходящ подсписък от `l`.

*За медиана на списък с четен брой елементи използвайте по-големия от двата средни елемента.*

## Примери
`solution [1,1,2,3,1,2,3,4,5,5,9,15,1] -> [1,2,3,9,1]`
* `1`- медиана на `[1]`
* `2` - медиана на `[1,2,3]`
* `3` - медиана на `[1,2,3,4,5]`
* `9` - медиана на `[5,9,15]`
* `1` - медиана на `[1]`

`solution [1,1,2,1,2,3,4,5,6] -> [1,2,4]`
* `1`- медиана на `[1]`
* `2` - медиана на `[1,2]`
* `4` - медиана на `[1,2,3,4,5,6]`

`solution [1,1,1,1,1,1] -> [1,1,1,1,1,1]`

`solution [5,6,5,6,5,6] -> [6,6,6]`

`solution [6,5,6,5,6,5] -> [6,6,6,5]`

`solution [1] -> [1]`
