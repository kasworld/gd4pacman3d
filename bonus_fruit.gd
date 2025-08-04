extends Node3D
class_name BonusFruit

func set_color(co :Color) -> BonusFruit:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self
