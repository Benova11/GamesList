extends Control


func _ready():
	var gamesScrollingList = $MainContainer/ScrollContainer/GamesList

	var gamesList = get_from_json("GamesList.json")
#	var scene = preload("res://CenterContainer.tscn")
	for game in gamesList:
		var gameContainer = CenterContainer.new();
		var gameContentContainer = VBoxContainer.new()
		gameContentContainer.set("custom_constants/separation", 20)

		var gameNameLabel = Label.new()
		gameNameLabel.text = "Name: " + game.name
		gameNameLabel.align = Label.ALIGN_CENTER

		var gameCoverImg = TextureRect.new()
		gameCoverImg.texture = getImage(game.cover)

		gameContentContainer.add_child(gameNameLabel)
		gameContentContainer.add_child(gameCoverImg)

		gameContainer.add_child(gameContentContainer)

		gamesScrollingList.add_child(gameContainer)

#		var node = scene.instance()
#		gamesScrollingList.add_child(node)


#		print_tree()
#		print(game.name + " image:" + game.cover)


func get_from_json(filename):
	var file = File.new()
	file.open(filename, File.READ)
	var text = file.get_as_text()
	var data = parse_json(text);
	file.close()
	return data
	
func getImage(imagePath):
	var img = Image.new()
	var itex = ImageTexture.new()
	img.load("res://gfx/"+imagePath)
	img.resize(300,300);
	itex.create_from_image(img)
	return itex
