extends StaticBody3D
class_name Dot

func set_color(co :Color) -> Dot:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self
