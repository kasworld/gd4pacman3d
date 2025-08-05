extends StaticBody3D
class_name PowerPellet

func set_color(co :Color) -> PowerPellet:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self

var auto_rotate :bool = true
func _process(delta: float) -> void:
	if auto_rotate:
		rotate_z(delta)
