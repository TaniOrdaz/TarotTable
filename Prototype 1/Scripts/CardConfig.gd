extends Resource
class_name CardConfig

@export var cardName: String

@export var health: int
@export var strength: int
@export var patience: int

@export var abilityName: String
@export var abilityCost: int
@export var abilityText: String

@export var art: Texture2D


func _init(
	dCardName = "[Card Name]", 
	dHealth = 0, 
	dStrength = 0, 
	dPatience = 0, 
	dAbilityName = "[Ability Name]", 
	dAbilityCost = 0, 
	dAbilitytext = ""):
	
	cardName = dCardName
	health = dHealth
	strength = dStrength
	patience = dPatience
	abilityName = dAbilityName
	abilityCost = dAbilityCost
	abilityText = dAbilitytext
