extends Node3D
class_name Ghost

func set_color(co :Color) -> Ghost:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self
