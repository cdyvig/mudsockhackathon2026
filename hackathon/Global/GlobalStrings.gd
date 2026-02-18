extends Node
var BString: Path2D
var EString: Path2D
var AString: Path2D
var DString: Path2D
var GString: Path2D
var active_notes: Array = []

func createBnote():
	var path = PathFollow2D.new()
	var area = Area2D.new()
	var hitbox = CollisionShape2D.new()
	
	BString.add_child(path)
	path.add_child(area)
	area.add_child(hitbox)
	
	path.progress = 86
	hitbox.shape = RectangleShape2D.new()
	hitbox.scale = Vector2(3,3)
	active_notes.append(path)
	path.loop = false

func createEnote():
	var path = PathFollow2D.new()
	var area = Area2D.new()
	var hitbox = CollisionShape2D.new()
	
	EString.add_child(path)
	path.add_child(area)
	area.add_child(hitbox)
	
	path.progress = 45
	hitbox.shape = RectangleShape2D.new()
	hitbox.scale = Vector2(3,3)
	active_notes.append(path)
	path.loop = false

func createAnote():
	var path = PathFollow2D.new()
	var area = Area2D.new()
	var hitbox = CollisionShape2D.new()
	
	AString.add_child(path)
	path.add_child(area)
	area.add_child(hitbox)
	
	path.progress = 0
	hitbox.shape = RectangleShape2D.new()
	hitbox.scale = Vector2(3,3)
	active_notes.append(path)
	path.loop = false

func createDnote():
	var path = PathFollow2D.new()
	var area = Area2D.new()
	var hitbox = CollisionShape2D.new()
	
	DString.add_child(path)
	path.add_child(area)
	area.add_child(hitbox)
	
	path.progress = 21
	hitbox.shape = RectangleShape2D.new()
	hitbox.scale = Vector2(3,3)
	active_notes.append(path)
	path.loop = false

func createGnote():
	var path = PathFollow2D.new()
	var area = Area2D.new()
	var hitbox = CollisionShape2D.new()
	
	GString.add_child(path)
	path.add_child(area)
	area.add_child(hitbox)
	
	path.progress = 160
	hitbox.shape = RectangleShape2D.new()
	hitbox.scale = Vector2(3,3)
	active_notes.append(path)
	path.loop = false
