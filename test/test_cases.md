# Test Cases

## Tast Case 1
Create a new progression, edit and save. Open list to check if the new progression has been saved. Delete the progression. Check if deletion was successful.

With terminal open in the "src" directory
1. Launch application 
```
$ ./progressions
```
1. Create New Progressions. Type "n"

1. Select major. Type "a"

1. Select last option. Type 'h'

1. Select Root C. Type 'c'

Expected display
![App Structure Flow Chart](../../docs/test1_display1.png)

1. Edit Progression. Type 'e'

1. Change root. Type 'r'

1. Select root F#. type 'f#'

Expected display
![App Structure Flow Chart](../../docs/test1_display2.png)

1. Quit to menu. type 'q'

1. Save progression. type 'y'

1. From Main menu, list saved Progressions. type 'l'

1. Return to menu. type enter

1. Open delete feature. type 'd'

1. Select ID number 1. type '1'

1. From Main menu, list saved Progressions. type 'l'

Expected display
![App Structure Flow Chart](../../docs/test1_display3.png)

1. Return to menu. type enter

1. Quit Application. type 'q'



