# SuperWorld

An interactive database of superhuman characters from comis,movies and television.
Save your favorite characters to your team. Find their stats and make them fight.

### Installing

1. Fork and clone this repository
2. In your Terminal navigate to your file 
3. Execute:

```
bundle install 
```    
Installs required gems.

```
rake db:migrate
```
Creates the database and tables.
```
rake db:seed
```
Populates your database with data from the Superhero API.

### Running the program

In your terminal execute: 

```
ruby bin/run.rb
```

## Functions

After signing in with your full name you'll be shown a menu of options.

Characters:

- find :     Finds a character with the name you've provided in the database and displays their               information
- add :      Adds a character to your favorites list (your "team")
- delete :   Removes character from your "team"

Favorites:

- favorites : Displays all the characters on your team
- rate :      Add or change your rating for your character on your team
- publisher : Determines which publisher created the most characters on your team
- strongest : Displays the character on your team with the highest strength
- fastest :   Displays the character on your team with the highest speed
- smartest :  Displays the character on your team with the highest intelligence

Games:
   !!!!! Character names are case sensitive !!!!!
   
- battle :    Choose a character to fight a random opponent selected by the computer.
              The fighter with the highest "power rating" (sum of all their stats) wins.
- whodat :    Given a secret identity, can you guess which character does it belong to?
              Type ``` exit game ``` to return to the main menu.

Program functions: 

- menu :      Returns the options menu
- exit :      Quits the program


## Built with

* [VisualStudioCode](https://code.visualstudio.com/) - The text editor we used
* [Akabab](https://akabab.github.io/superhero-api/api/all.json) - The public API of superhero data
* [RubyGems](https://rubygems.org) 
* [TTY](https://ttytoolkit.org/)

## Contributing

1. Fork it ( https://github.com/slaloggia/module-one-final-project-guidelines-chicago-web-100719/fork)
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am ‘Add some feature’)
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
6. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct



## Authors

* **Sarah Laloggia** - (https://github.com/slaloggia)
* **Daniel Ionita** - (https://github.com/danielionita88)



## License

This project is licensed under the MIT License - see the [AppLICENSE.md] file for details

## Acknowledgments

*  Flatiron coaches and instructors
*  RIP Stan Lee


