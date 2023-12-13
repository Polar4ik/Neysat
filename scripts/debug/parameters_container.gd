extends PanelContainer

var debuger_text := ""
var node_name := ""

func _process(_delta: float) -> void:
	$ParametersMargin/VBoxContainer/ParametersLabel.text = debuger_text
	$ParametersMargin/VBoxContainer/NodeNameLabel.text = node_name
