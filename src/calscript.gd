extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var date

# Called when the node enters the scene tree for the first time.
func _ready():
	var calendar_button_node = get_node("Control/HBoxContainer/Pages/Schedule/CalendarButton")
	var ask_for_event = get_node("AskForEvent")
	if ask_for_event:
		ask_for_event.visible = false  # Use 'false' to hide, 'true' to show
	else:
		print("Node not found: $HBoxContainer/Pages/Schedule/AskForEvent")
	pass



func _on_CalendarButton_date_selected(date_obj): 
	#Make Visible AskForEvent
	var ask_for_event = get_node("AskForEvent")
	if ask_for_event:
		ask_for_event.visible = true # Use 'false' to hide, 'true' to show
	else:
		print("Node not found: $HBoxContainer/Pages/Schedule/AskForEvent")
	date = date_obj
	pass # Replace with function body.


func _on_EventTxt_text_entered(new_text):
	#Make Rich text Label a child of CurrentEvents
	var rtl = RichTextLabel.new()
	rtl.text = str(date.month,"/", date.day,"/", date.year, ": ", new_text)
	var events = $HBoxContainer/FriendsArea/CurrentEvents/VBoxContainer
	if events:
		events.add_child(rtl)
		rtl.rect_min_size = Vector2(486, 18)
	else:
		print("Node not found")
	
	var ask_for_event = get_node("AskForEvent")
	ask_for_event.visible = false
	$AskForEvent/ColorRect/EventTxt.text = ""
	
	#Add text that shows the year, month, and time of date_obj and adds it to richtextlabel
	#Make position be below CurrEventsTxt
	pass # Replace with function body.
