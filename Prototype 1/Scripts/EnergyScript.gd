extends Node
class_name Energy

@export var energizedChime : Texture2D
@export var unenergizedChime : Texture2D
@export var chimeSprites : Array[Sprite3D]

var energy = 3

func useEnergy(amount: int):
	setEnergy(energy - amount)

func setEnergy(value: int):
	energy = value
	
	updateChimeSprites()

func updateChimeSprites():
	for chime in chimeSprites.size():
		if chime <= (energy - 1):
			chimeSprites[chime].texture = energizedChime
		else:
			chimeSprites[chime].texture = unenergizedChime
