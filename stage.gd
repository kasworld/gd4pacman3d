extends Node3D
class_name Stage

var field :PlacedThings
func init() -> Stage:
	field = PlacedThings.new(Settings.FieldSize)
	place_things()
	return self
	
func place_things() -> void:
	place_walls(ScriptDraw2D.exec(Settings.BounderyWalls))
	place_dots(ScriptDraw2D.exec(Settings.StageWalls[0]))

	var pt 
	pt = preload("res://pacman.tscn").instantiate()
	pt.position = Vector3(1,4,0.5)
	add_child(pt)
	pt = preload("res://ghost.tscn").instantiate()
	pt.position = Vector3(2,5,0.5)
	add_child(pt)
	pt = preload("res://power_pellet.tscn").instantiate()
	pt.position = Vector3(5,7,0.5)
	add_child(pt)
	pt = preload("res://bonus_fruit.tscn").instantiate()
	pt.position = Vector3(20,5,0.5)
	add_child(pt)

func place_walls(wall_list :Array) -> void:
	var co = Settings.LightColorList.pick_random()[0]
	for pos in wall_list:
		var pt = preload("res://wall.tscn").instantiate().set_color(co)
		field.set_at(pos, pt)
		var pos3d = Settings.vector2i_to_vector3(pos)
		pt.position = pos3d
		add_child(pt)

func place_dots(wall_list :Array) -> void:
	var co = Settings.LightColorList.pick_random()[0]
	for pos in wall_list:
		var pt = preload("res://dot.tscn").instantiate().set_color(co)
		field.set_at(pos, pt)
		var pos3d = Settings.vector2i_to_vector3(pos)
		pt.position = pos3d
		add_child(pt)
