extends Node
class_name DrawChime

@export var energyChimes: Energy

@export var drawPile: CardPile
@export var discardPile: CardPile

@export var hand: CardHand

func drawCards(amount: int):
	if amount + hand.pileSize > hand.handLimit:
		amount = hand.handLimit - hand.pileSize
	
	for i in amount:
		if drawPile.pileSize == 0:
			shuffleDiscardIntoDraw()
		
		hand.addCard(0, drawPile.takeCard(0))

func shuffleDiscardIntoDraw():
	for card in discardPile.pileSize:
		drawPile.addCard(0, discardPile.takeCard(0))
	
	drawPile.shufflePile()

func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if (event is InputEventMouseButton):
		if (event.button_index == MOUSE_BUTTON_LEFT && event.pressed == true):
			if (energyChimes.energy > 0 && hand.pileSize < hand.handLimit):
				drawCards(1)
				energyChimes.useEnergy(1)
