extends Node
class_name CardHandler

enum types {Fool,Magician,Priestess,Empress,Emperor}

var cardBase = preload("res://Cards/baseCard.tscn")

@export var cardData: Array[Resource]

func getData(card: types):
	return cardData[card]
