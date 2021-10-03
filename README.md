# T1A3 - Terminal App - Chord Helper
### Matheus Carvalho

## R4 - GitHub Repository
- https://github.com/Mat-Carv/ChordHelper

## R5 - Developement Plan

The core objective of Chord Helper is to present the user with graphically displayed guitar chords, organized by progressions, that can be adapted based on the Root Note or Key Signature of the User’s preference.

As a very simplified explanation of the music theory which will be used, when two or more notes are played at the same time on harmonic instruments (e.g. Pianos and Guitars), they create what is called a Chord. Musical Keys are in a sense a list of standard notes that can be played in a piece. Having two types, Major and Minor, keys specify chord based on Key type and a Root Note (the "main" note of the key). Valid Chords in a specific Key can only be made of valid Notes in said Key, and their names depend on the Intervals between Notes. Intervals determine the quality of each note in a key, taking the root as reference, going from one to seven and being represented in roman numerals. When the numeral is in uppercase the interval or chord is called Major, when in lowercase it is called Minor. Chords in a key are represented, in the simples form, as major or minor. 

The chord intervals that each Key Type forms are:
- Major - (I - ii - iii - IV - V - vi - vii)
- Minor - (i - ii - III - iv - v - VI - VII)

Finally, Chord progressions are simply the order in which chords of a key are played in a piece, and are represented using the Interval notation of chords (roman numerals) based on the key being used.

In the main functionality, the user will be able to Choose which key signature they want to use, first selecting Type and then Root Note. Based on this, the user may choose, from a valid list, which progression (e.g. “I -V - vii – IV" or “ i - VI - III – VII") they wish to display, after which they will be presented with diagrams of the chords in the corresponding key and progression. 

As a brief and simplified example, the user chooses a Major key and the root note of "C". Then, from the list of valid progressions they choose “I - V - vii – IV", which would return the chords “Cmaj - Gmaj - Amin - Fmaj" and give the user the graphical representation of each chord on the guitar neck (ASCII graphics). Combinations can then be changed, saved for later use or discarded.

With the large number of simultaneous variables involved in forming keys and progressions, added to the rather complex layout of a guitar, it is quite difficult for beginners to navigate through different valid chords of different keys. With this in mind, Chord Helper seeks to help beginner guitar players get familiarized with how Keys, Notes and Chords work together to create Music, letting them mix and match these concepts to explore the Guitar through the fundamentals of Music Theory.

More thorough information about Music Theory can be found at https://www.musikalessons.com/blog/2017/01/basic-music-theory/ .


## R6 - Features

This application will follow a CRUD format, permitting the user to: 
- Create New instances of Chord Progressions.
- Read/Load saved Chord Progressions.
- Update/Edit Saved or new Chord Progressions.
- Discard/Destroy Saved or new Chord Progressions.

#### Create New
When initiating this feature the user will be prompted to choose a Key Type between Major and Minor. The Key type will determine the quality of each chord interval(Major or Minor, following the representation of each respective set of roman numerals), specifying which list of chord progressions is valid. 

The list of valid Chord progressions is the displayed, and the user must choose one of the option.

The user is then prompted to choose a Root Note (A, A#, B, C, C#, D, D#, E, F, F#, G, G#), after which the code identifies all the valid notes of the kay based on the Key Type.

A table with the data inputted will then be displayed to the user.

The app then combines this data to determine which chords to display, based on the Intervals of the chosen progression and the available Notes of the Key, forming identifier names that will be used to fetch the correspondent chord diagrams in the Diagram Storage and the displaying them to the user in the order of the progression.

Before returning to the main menu, the user will be prompted if they wish to save their progression, responding with "y"(yes) or "n"(no)

#### Read / Load
When initiating this feature the app will display a list of the existing progressions with their respective ID numbers. The user then inputs the ID of the Chord Progression which they wish to display. This will display the instance in the same table + Chords format as the Create New feature. A save prompt is also displayed before returning to the main menu.

#### Update / Edit
While displaying a New or Loaded Progression, the user will be given the option of editing their displayed progression.
If the user chooses to edit, they will be given the option of changing the Root note, which will change all the available notes, or the Chord Progression, without changing Key Type, which will change the displayed chords.

These changes may the be save or discarded in the save prompt before returning to main menu.

#### Discard / Destroy
Similar to the Read/Load feature, a list of the existing instances with respective ID will be displayed. The user then chooses which instance the wish to destroy, after which it is removed from the YAML database.


## R7 - UI Outline
This application is typed input based, each action will require the user to type in the character or string that it corresponds to.

Each menu in the application will display to the user the available commands and the valid inputs that can be typed in order to access them.

When ever the user types in an invalid character of string, the app will notify the user of the invalid input and refresh the menu they where accessing, letting them try again.

When an unexpected error occurs, the app will notify the user and reload the main menu.

## R8 - Control Flow
![App Structure Flow Chart](./docs/app_flowchart.png)
![Diagram Fetcher Flow Chart](./docs/diagram_fetcher_flowchart.png)

## R9 - Implementation Plan
Before any further planning, determine how to translate the music theory into code by creating a small scale, one file, mock up version of the application, using limited options. Scale the functionality to CRUD format.

Create the base Router and Controller code and implement functionality of the mock up to into the CRUD format in the following order:
1. Implement "Create New" feature. Functionality Objectives are:
    - Successfully create a new instance of a Chord Progression
    - Display Correct list of Progressions based on Key Type chosen
    - Correctly identify and display valid Chords
    - Correctly modify displayed progression when edited
    - Correctly save instance, creating a new unique ID

1. Implement a "Listing" or "Index" feature, which will be used for selecting progressions to be loaded or deleted. Functionality Objectives are:
    - Successfully display all instances currently saved in the database
    - Display each instance's corresponding ID
    - Display Instances in a Table format
    - Avoid errors if there are no instances saved in the database

1. Implement "Show" or "Load" feature. Functionality Objectives are:
    - Display the index of existing instances, so that the user can reference the ID numbers
    - Successfully find and display the selected Instance
    - Allow user to make changes, with the option of saving or discarding changes
    - Correctly update changes the user has saved
    - Avoid errors when user selects an invalid instance
    - Avoid errors if there are no instances saved in the database

1. Implement "Delete" or "Destroy" feature. Functionality Objectives are:
    - Display the index of existing instances, so that the user can reference the ID numbers
    - Allow user to abort the deletion process
    - Successfully find and Delete the selected instance
    - Avoid errors when user selects an invalid instance
    - Avoid errors if there are no instances saved in the database

Once the core of the app is finished, work on improvements to the UI using TTY-tables and TTY-font.
    

## R10 - Instructions
[Instructions File](./docs/instructions.md)