# Family House

![](http://images.mentalfloss.com/sites/default/files/styles/article_640x430/public/familymatters_0.jpg)

![](http://a.abcnews.com/images/Entertainment/GTY_FULL_HOUSE_150421_DG_4x3_992.jpg)

# TV Series Enum

Create a `TVSeries` enum with two cases, `familyMatters` and `fullHouse`. This enum should also have a read-only computed property called `description` of type `String` It should return back "Family Matters" if the case on `self` is `familyMatters` and "Full House" for the other case.

# Film Location

Create a struct called `FilmLocation` with the following stored properties:  
* `name` of type `String`--this should be a constant.
* `address` of type `String`--this should be a constant.
* `tvSeries` of type `TVSeries`--this should be a variable.

# Character

Create a struct called `Character` with the following stored properties:  
* `name` of type `String` as a constant.
* `realLifeName` of type `String` as a constant.
* `tvSeries` of type `TVSeries` as a constant.
* `currentLocation` of type `FilmLocation` as a variable.
* `image` of type `UIImage` as a constant.

This class should have the following two methods:


The first function should be called `canReportToSet(on:)` which takes on one argument called `location` of type `FilmLocation`. It should return back a `Bool`. In your implemenetation, you should return `true` or `false` if the `tvSeries`'s of both the `location` argument and the `tvSeries` on the stored property of `self` match-up.

The second function is a mutating function called `reportToSet(on:)` with takes in one argument called `location` of type `FilmLocation`. It should check to see that the individual should report to that location (hint: calling on the function you just made) and set the `currentLocation` stored property to then equal the `location` passed in based upon the return value of your call to the function you just made.

# Table View

Head over to the `Main.storyboard` file and setup a `UITableViewController` to look like this:

![](http://i.imgur.com/wk6mADz.png?1)

I have this embedded in a Navigation Controller. As well, there's a custom `UITableViewCell` created here which contains three labels.

You should set the Custom Class of this Table View Controller to your `FilmLocationTableViewController` class (which you need to make, make sure you're subclassing `UITableViewController`).

Before implementing the `FilmLocationTableViewController`, lets first create another new class.

Create a class which subclasses the `UITableViewCell` and call it `FilmLocationTableViewCell`. From the prototype cell you created in your Table View Controller scene, make sure to set the custom class of this cell to the `FilmLocationTableViewCell`. After doing that, create outlets for the three `UILabels` giving them appropriate names.

Now for the cool part. Create a stored property called `filmLocation` of type `FilmLocation!`. Add a `didSet` property observer to this stored property. Within the `didSet` implementation, you should provide the three `UILabel` outlets with the data you can extract from the `filmLocation` stored property. Hint: If one of my outlets was called `filmNameLabel`, I could write code like this in the `didSet`:  

```swift
filmNameLabel.text = filmLocation.name
```

Don't forget to provide some reuse identifier to your TableViewCell in the `Main.storyboard` file.

Head back to the implementation of your `FilmLocationTableViewController`. This class should have the following stored property:

```swift
var filmLocations: [FilmLocation]!
``` 



In your `viewDidLoad()` method, you should call on another function you're about to make (call it whatever makes sense to you) and generate some fake `FilmLocation`'s and then make sure to add them to the `filmLocations` array. After doing so, you should call on the following method to have your `tableView` then update and display all of this info:

```swift
tableView.reloadData()
```

Make sure to implement all of those methods (row, sections, cellForRow!)

Hint: Within the cellForRowAt function, you could something like this (remember why?):

```swift
let filmLocation = filmLocations[indexPath.row]
cell.filmLocation = filmLocation
```

Head on back over to the `Main.storyboard` file!

# Collection View

You should drag over a Collection View Controller and design it like this. Ignore the Done Button for now, but in order to have the Nav Controller be a part of this controller you need to setup a segue between the Prototype Cell in the Table View Controller to this Collection View Controller and select show.

![](http://i.imgur.com/4FDONEf.png?1)

You should notice that this is a custom Collection View Cell.

Similar to how you setup the custom Table View Cell, you want to do the same thing here. Instead, it should sublass `UICollectionViewCell` and you should call it `CharacterCollectionViewCell`. Drag over then the necessary outlets after you've setup the custom class of this Collection View Cell to your newly made `CharacterCollectionViewCell`. 

Major hint incoming, your code should look something like this:

```swift
class CharacterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    var character: Character! {
        didSet {
            characterNameLabel.text = character.name
            characterImageView.image = character.image
        }
    }
    
}
```

Lets now create a `CharacterCollectionViewController` (make sure to sublcass `UICollectionViewController` and then set the custom class of the Collection View Controller in storyboard to this new class. This new class should have the following stored properties:

```swift
    var characters: [Character]!
    var filmLocation: FilmLocation!
```

How does the `filmLocation` stored property get a value? Hmm... maybe from the prior view controller in that view controllers prepareForSegue method :)

The `characters` array should be populated in your `viewDidLoad` method. You should create all of the necessary characters from both shows and add them to this array. With no further hints and with this information, you should populate all of your cells with these characters.

Hint:

```swift
let character = characters[indexPath.row]
cell.character = character
```

Final instructions (which are vague on purpose).

Create the bar button item in the storyboard file on your Collection View Controller and then create an IBAction associated with it. What should happen is.. is when this done button is tapped, it should look through all of the SELECTED characters within the collectionView and make sure they're all able to report to the set. Meaning... are they part of the TV series that the location represents. If so, print something to console stating so, if not.. print something to console that states that they aren't allowed on set.

For funzies, you can look to update the UI to reflect that they are are aren't allowed on set.

Hint:

```swift
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
```

<a href='https://learn.co/lessons/FamilyHouse' data-visibility='hidden'>View this lesson on Learn.co</a>
