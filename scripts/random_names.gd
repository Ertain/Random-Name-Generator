# Code based upon random name generator by Trey Hunner, initally released under the
# MIT license.
# Ported by Jason Anderson
# License: MIT
# Version: 0.3

var FILES = {
  'first:male' : 'res://names/male.first.txt',
  'first:female' : 'res://names/female.first.txt',
  'last' : 'res://names/all.last.txt'
}

# Based upon the source code for the random choice function from Python 2.7.
func _choice(seq):
  return seq[ int(randf() * seq.size() ) ]

func _get_name(filename):
  var selected = randf() * 90
  var f = File.new()
  if not f.file_exists(filename):
    print("File not found: %s" % filename)
    get_tree().exit()
  f.open(filename, File.READ)
  while not f.eof_reached():
    var line = f.get_line()
    # This may split up too many characters from the file.
    var name_parts = line.split(" ", false)
    
    # The lines in the file look like this:
    #   MICHAEL        2.629 12.361      4
    # So the elements in "name_parts" hopefully look like this:
    #   name_parts = ['MICHAEL', 2.629, 12.361, 4]
    if float(name_parts[2]) > selected:
      return name_parts[0]
  return "" # If the file is empty, return an empty string

func get_first_name(gender=null):
  if gender == null:
    gender = _choice( ['male','female'] )
  if not gender in [ 'male','female' ]:
    print("Only 'male' and 'female' are supported as gender.")
    get_root().exit()
  return _get_name( FILES['first:%s' % gender] ).capitalize()

func get_last_name():
  return _get_name( FILES['last'] ).capitalize()

func get_full_name(gender=null):
    var full_name = "%s %s" % [ get_first_name(gender), get_last_name()] 
    return full_name
