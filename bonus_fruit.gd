extends StaticBody3D
class_name BonusFruit

func set_color(co :Color) -> BonusFruit:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self

var auto_rotate :bool = true
func _process(delta: float) -> void:
	if auto_rotate:
		$MeshInstance3D.rotate_z(delta)
