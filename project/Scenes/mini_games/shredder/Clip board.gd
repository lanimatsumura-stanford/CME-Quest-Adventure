extends Sprite2D

const maxShreds = 3
var shreds = []
var currentShred = 0
@export var winningCombo: Array [TextureButton]


func addShred(shred):
	if currentShred < maxShreds:
		currentShred += 1
		shreds.append(shred)
		shred.rotation_degrees = 0
		shred.scale = Vector2(1, .5)
		if currentShred == 1:
			shred.global_position = $Check1.global_position
		if currentShred == 2:
			shred.global_position = $Check2.global_position
		if currentShred == 3:
			shred.global_position = $Check3.global_position

func checkWin():
	if shreds.size() == 3:
		if shreds == winningCombo:
			return true
		else:
			resetShreds()
			return false

func resetShreds():
	shreds[0].resetShred()
	shreds[1].resetShred()
	shreds[2].resetShred()
	shreds.clear()
	currentShred = 0
	
