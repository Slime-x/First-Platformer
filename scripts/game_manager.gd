extends Node

var key_label


var coin = 0
var key = true
var level = 1

func add_coin():
	coin += 1
	print(coin)

func _process(_delta):
	if level == 1:
		if not key:
			key_label.text = "Need key!"
		if key:
			key_label.text = "You have Key. Next Level?"
		
