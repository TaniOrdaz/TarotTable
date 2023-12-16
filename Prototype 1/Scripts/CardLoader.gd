extends Node3D

var cardHandler: CardHandler

@export var cardBase: Node3D
@export var cardData: Resource

@export var cardArt: Sprite3D
@export var cardNameText: Label3D

@export var healthText: Label3D
@export var strengthText: Label3D
@export var patienceText: Label3D

@export var abilityNameText: Label3D
@export var abilityDescText: Label3D
@export var abilityCostIcons: Array[Sprite3D]

func setCardHandler(handler: CardHandler):
	cardHandler = handler

func setCardData(cardType: CardHandler.types):
	cardData = cardHandler.getData(cardType)

func loadData():
	cardArt.texture = cardData.art
	cardNameText.text = cardData.cardName
	
	healthText.text = str(cardData.health)
	strengthText.text = str(cardData.strength)
	patienceText.text = str(cardData.patience)
	
	abilityNameText.text = cardData.abilityName
	abilityDescText.text = cardData.abilityText
	
	for i in abilityCostIcons.size():
		abilityCostIcons[i].visible = i < cardData.abilityCost
