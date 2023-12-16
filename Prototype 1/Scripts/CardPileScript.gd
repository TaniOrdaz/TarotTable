extends Node
class_name CardPile

@export var cardHandler: CardHandler

@export var cardRotation: Vector3
@export var cardPosition: Vector3
@export var cardDisplacement: Vector3

var pile: Array[Node3D]
var pileSize = 0

func addNewCard(index: int, cardType: CardHandler.types):
	var card = cardHandler.cardBase.instantiate()
	card.setCardHandler(cardHandler)
	card.setCardData(cardType)
	card.loadData()
	
	addCard(index, card)

func addCard(index: int, cardNode: Node3D):
	pileSize += 1
	if pileSize > pile.size():
		pile.resize(pileSize)
	
	for card in pileSize:
		var cardIndex = pileSize - card - 1
		
		if cardIndex > index:
			pile[cardIndex] = pile[cardIndex - 1]
		if cardIndex == index:
			pile[cardIndex] = cardNode
	
	add_child(cardNode)
	updateCardPositions()

func takeCard(index: int):
	if pileSize > 0:
		var returnCard = pile[index]
		
		for card in pileSize:
			var cardIndex = pileSize - card - 1
			
			if cardIndex >= index && index > 0:
				pile[cardIndex] = pile[cardIndex - 1]
		
		pile[pileSize - 1] = null
		
		pileSize -= 1
		remove_child(returnCard)
		updateCardPositions()
		
		return returnCard
	else:
		return null

func shufflePile():
	pile.shuffle()
	
	updateCardPositions()

func updateCardPositions():
	for card in pileSize:
		pile[card].position = cardPosition
		pile[card].rotation_degrees = cardRotation
		
		pile[card].position += cardDisplacement * (pileSize - card)

func _on_ready():
	addNewCard(0, cardHandler.types.Fool)
	addNewCard(1, cardHandler.types.Magician)
	addNewCard(2, cardHandler.types.Priestess)
	addNewCard(3, cardHandler.types.Empress)
	addNewCard(4, cardHandler.types.Emperor)
