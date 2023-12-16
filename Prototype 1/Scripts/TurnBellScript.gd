extends Node3D

@export var energyBells: Energy

func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if (event is InputEventMouseButton):
		if (event.button_index == MOUSE_BUTTON_LEFT && event.pressed == true):
			energyBells.setEnergy(3)
