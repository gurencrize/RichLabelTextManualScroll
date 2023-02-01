extends Control
@onready var richtextlabel:RichTextLabel = $RichTextLabel
@onready var textedit:TextEdit = $TextEdit
var count:int = 0
var propetytween:PropertyTweener
var tween:Tween

# Called when the node enters the scene tree for the first time.
func _ready():
    tween = get_tree().create_tween()
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func submit(text:String):
    count += 1
    richtextlabel.add_text("{0}: {1}\n".format([count, text]))
    var bar:VScrollBar = richtextlabel.get_v_scroll_bar()
    print_debug("before: ",bar.max_value)
    # なぜかこの計算処理を入れるとTweenで下までスクロールできる?
    richtextlabel.get_line_count()
    print_debug("after: ",bar.max_value)
    tween.kill()
    tween = get_tree().create_tween()
    propetytween = tween.tween_property(bar, "value", bar.max_value, 0.3)
    pass

func _on_button_pressed():
    submit(textedit.text)
    pass # Replace with function body.
