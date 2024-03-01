extends TextureRect

signal gathered_data(values)

var current_name
var current_texture
var current_item


func _ready() -> void:
	for child in get_parent().get_children():
		if child.name.contains("Item"):
			child.data_dropped.connect(_on_item_data_dropped)
	
	
func _drop_data(at_position, data):
	if is_position_in_designated_area(at_position):
		var current_order = {String(name) : current_name}
		emit_signal("gathered_data", current_order)
		current_item.get_node("Label").visible = false
		$Label.text = current_item.get_node("Label").text
		$Label.visible = true

func _can_drop_data(at_position, data):
	return data is ColorRect

func is_position_in_designated_area(position):
	var designated_area = Rect2(Vector2 (0, 0), Vector2(320, 320))
	return designated_area.has_point(position)


func _on_item_data_dropped(item_name, item):
	current_item = item
	current_name = String(item_name)
