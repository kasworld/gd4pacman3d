extends RigidBody3D
class_name Ghost

func set_color(co :Color) -> Ghost:
	$MeshInstance3D.mesh.material.albedo_color = co
	return self

func _physics_process(delta: float) -> void:
	if randi_range(0,50) == 0:
		var vt = [Vector3(0,1,0), Vector3(1,0,0),Vector3(0,-1,0),Vector3(-1,0,0)]
		set_linear_velocity(vt.pick_random()*5)
