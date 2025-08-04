extends Node3D
class_name PowerPellet

func set_color(co :Color) -> PowerPellet:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self
