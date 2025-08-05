extends Node3D
class_name Stage

var field :PlacedThings
func init() -> Stage:
	field = PlacedThings.new(Settings.FieldSize)
	place_things()
	return self
	
func place_things() -> void:
	place_scene(ScriptDraw2D.exec(Settings.BounderyWalls), preload("res://wall.tscn"))
	place_scene(ScriptDraw2D.exec(Settings.StageWalls[0]), preload("res://dot.tscn"))

	var pt 
	pt = preload("res://pacman.tscn").instantiate().set_color(Color.YELLOW)
	pt.position = Vector3(1,4,0.5)
	add_child(pt)
	
	for co in [Color.PINK, Color.BLUE, Color.RED, Color.GREEN]:
		pt = preload("res://ghost.tscn").instantiate().set_color(co)
		pt.position = Settings.WorldSize/2
		add_child(pt)
	
	pt = preload("res://power_pellet.tscn").instantiate().set_color(Color.GOLD)
	pt.position = Vector3(5,7,0.5)
	add_child(pt)
	pt = preload("res://bonus_fruit.tscn").instantiate().set_color(Color.RED)
	pt.position = Vector3(20,5,0.5)
	add_child(pt)

func place_scene(wall_list :Array, scene :Resource) -> void:
	var co = Settings.LightColorList.pick_random()[0]
	for pos in wall_list:
		var pt = scene.instantiate().set_color(co)
		field.set_at(pos, pt)
		var pos3d = Settings.vector2i_to_vector3(pos)
		pt.position = pos3d
		add_child(pt)
