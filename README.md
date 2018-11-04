## Random name Generator

This is a random name generator originally written by [Trey Hunner](https://treyhunner.com/2013/02/random-name-generator/), ported to the Godot Engine.

### How to use it in your Godot game:

Place the "names" directory in your main Godot repository, and put the script "random\_names.gd" with your scripts. Next, edit the `FILES` dictionary of "random\_names.gd" to point to your "names" directory. So it looks like this:

    FILES = {
      'first:male' : 'res://path/to/names/male.first.txt',
      'first:female' : 'res://path/to/names/female.first.txt',
      'last' : 'res://names/path/to/all.last.txt'
    }

Just substitute `path/to/` with the actual path to the "names" directory.

Next, add something like this to your Godot game:

    var Names = preload("res://path/to/random_names.gd")
    func _ready():
        randomize()
        var names = Names.new()
        var random_name = names.get_full_name()
        var male_name = names.get_full_name('male')
        var female_name = names.get_full_name('female')
        var male_first_name = names.get_first_name('male')
