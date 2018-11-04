extends Node

var Names = preload("res://scripts/random_names.gd")

func _ready():
    randomize()
    var names = Names.new()
    var male_name = names.get_full_name('male')
    var random_male_name = names.get_first_name('male')
    var female_name = names.get_full_name('female')
    var random_name = names.get_full_name()
    print("Male name: ", male_name)
    print("Female name: ", female_name)
    print("Random male name: ", random_male_name)
    print("Random name: ", random_name)
    print("Random male name: ", random_male_name)