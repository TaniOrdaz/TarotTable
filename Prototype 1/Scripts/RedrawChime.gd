extends Node

@export var energyChimes: Energy

@export var drawChime: DrawChime
@export var discardPile: CardPile

@export var hand: CardHand

func redrawCards():
	var amount = hand.pileSize
	
	for i in amount:
		discardPile.addCard(0, hand.takeCard(0))
	
	drawChime.drawCards(amount)

func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if (event is InputEventMouseButton):
		if (event.button_index == MOUSE_BUTTON_LEFT && event.pressed == true):
			if (energyChimes.energy > 0):
				redrawCards()
				energyChimes.useEnergy(1)
