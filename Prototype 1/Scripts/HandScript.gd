extends CardPile
class_name CardHand

@export var handLimit: int

@export var cardRotationDisplacement: Vector3

func updateCardPositions():
	print(pileSize)
	for card in pileSize:
		pile[card].position = cardPosition
		pile[card].rotation_degrees = cardRotation
		
		pile[card].position += cardDisplacement * (card - (.5 * (pileSize - 1)))
		pile[card].rotation_degrees += cardRotationDisplacement * (card - (.5 * (pileSize - 1)))

func _on_ready():
	addNewCard(0, cardHandler.types.Fool)
	addNewCard(1, cardHandler.types.Magician)
	addNewCard(2, cardHandler.types.Priestess)
