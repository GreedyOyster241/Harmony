extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/Pages/ChatPage/HBoxContainer/ChatArea/ChatKeepingColor/Chats/Messages.visible = 0
	$HBoxContainer/Pages/ChatPage/HBoxContainer/FriendsArea/VBoxContainer/FriendsScroll.visible = 1
	$HBoxContainer/Pages/ChatPage/HBoxContainer/ChatArea/ChatKeepingColor/MessageInputA.visible = 1
	$HBoxContainer/Pages/CallPage.visible = 0
	pass # Replace with function body.

func _on_LogOut_button_down():
	get_tree().change_scene("res://src/scenes/Login.tscn")
	pass # Replace with function body.


func _on_LineEdit_text_entered(new_text): #When Enter is Pressed on Message input
	var lineedit = $HBoxContainer/Pages/ChatPage/HBoxContainer/ChatArea/ChatKeepingColor/MessageInputA/LineEdit
	var mess = $HBoxContainer/Pages/ChatPage/HBoxContainer/ChatArea/ChatKeepingColor/Chats/Messages
	#add RichTextLabel as a child to Messages with text entered
	if lineedit != null:
		var new_label = RichTextLabel.new()
		new_label.rect_min_size = Vector2(521,30)
		new_label.rect_position = Vector2(0, 0)
		new_label.text = "User: " + new_text
		mess.add_child(new_label)
		lineedit.text = ""  # Clear the text edit
	else:
		print("messages node is null")

func _on_Chat_Button_button_down(): #When Friend is pressed
	#make Messages vboxcontainer Visible
	var mess = $HBoxContainer/Pages/ChatPage/HBoxContainer/ChatArea/ChatKeepingColor/Chats/Messages
	mess.visible = 1

func _on_Home_button_down():
	$HBoxContainer/Pages/ChatPage/HBoxContainer/ChatArea/ChatKeepingColor/Chats/Messages.visible = 0
	$HBoxContainer/Pages/ChatPage/HBoxContainer/FriendsArea/VBoxContainer/FriendsScroll.visible = 1
	$HBoxContainer/Pages/ChatPage/HBoxContainer/ChatArea/ChatKeepingColor/MessageInputA.visible = 1
	$HBoxContainer/Pages/CallPage.visible = 0
	$HBoxContainer/Pages/Schedule.visible = 0
	#Make Call page & Schedule Page invisible
	#if Chat Keeping Color is visible, make it invisible
	pass # Replace with function body.

func _on_Call_button_down():
	$HBoxContainer/Pages/ChatPage/HBoxContainer/ChatArea/ChatKeepingColor/Chats/Messages.visible = 0 #removes messages
	$HBoxContainer/Pages/ChatPage/HBoxContainer/FriendsArea/VBoxContainer/FriendsScroll.visible = 0
	$HBoxContainer/Pages/CallPage.visible = 1 #makes visible call page/removes friends
	$HBoxContainer/Pages/ChatPage/HBoxContainer/ChatArea/ChatKeepingColor/MessageInputA.visible = 0 #removes message input
	$HBoxContainer/Pages/Schedule.visible = 0
	#Make visible the
	pass # Replace with function body.
	
func _on_Calendar_button_down():
	$HBoxContainer/Pages/ChatPage/HBoxContainer/ChatArea/ChatKeepingColor/Chats/Messages.visible = 0 #removes messages
	$HBoxContainer/Pages/ChatPage/HBoxContainer/FriendsArea/VBoxContainer/FriendsScroll.visible = 0
	$HBoxContainer/Pages/CallPage.visible = 0 #makes visible call page/removes friends
	$HBoxContainer/Pages/ChatPage/HBoxContainer/ChatArea/ChatKeepingColor/MessageInputA.visible = 0
	$HBoxContainer/Pages/Schedule.visible = 1
	pass # Replace with function body.

func _on_CallButton_button_down(): #When call button is pressed
	var num = $HBoxContainer/Pages/CallPage/HBoxContainer/CallArea/Number
	num.text = "7864148517"
	pass # Replace with function body.

func _on_1_button_down():
	#append 1 to Number
	var num = $HBoxContainer/Pages/CallPage/HBoxContainer/CallArea/Number
	num.text = num.text + "1"

func _on_2_button_down():
	var num = $HBoxContainer/Pages/CallPage/HBoxContainer/CallArea/Number
	num.text = num.text + "2"
	pass # Replace with function body.

func _on_3_button_down():
	var num = $HBoxContainer/Pages/CallPage/HBoxContainer/CallArea/Number
	num.text = num.text + "3"
	pass # Replace with function body.

func _on_4_button_down():
	var num = $HBoxContainer/Pages/CallPage/HBoxContainer/CallArea/Number
	num.text = num.text + "4"
	pass # Replace with function body.

func _on_5_button_down():
	var num = $HBoxContainer/Pages/CallPage/HBoxContainer/CallArea/Number
	num.text = num.text + "5"
	pass # Replace with function body.

func _on_6_button_down():
	var num = $HBoxContainer/Pages/CallPage/HBoxContainer/CallArea/Number
	num.text = num.text + "6"
	pass # Replace with function body.

func _on_7_button_down():
	var num = $HBoxContainer/Pages/CallPage/HBoxContainer/CallArea/Number
	num.text = num.text + "7"
	pass # Replace with function body.

func _on_8_button_down():
	var num = $HBoxContainer/Pages/CallPage/HBoxContainer/CallArea/Number
	num.text = num.text + "8"
	pass # Replace with function body.

func _on_star_button_down():
	var num = $HBoxContainer/Pages/CallPage/HBoxContainer/CallArea/Number
	num.text = num.text + "*"
	pass # Replace with function body.

func _on_9_button_down():
	var num = $HBoxContainer/Pages/CallPage/HBoxContainer/CallArea/Number
	num.text = num.text + "9"
	pass # Replace with function body.

func _on_0_button_down():
	var num = $HBoxContainer/Pages/CallPage/HBoxContainer/CallArea/Number
	num.text = num.text + "0"
	pass # Replace with function body.

func _on_hash_button_down():
	var num = $HBoxContainer/Pages/CallPage/HBoxContainer/CallArea/Number
	num.text = num.text + "#"
	pass # Replace with function body.

func _on_CallPhoneNum_button_down(): 
	var num = $HBoxContainer/Pages/CallPage/HBoxContainer/CallArea/Number
	if OS.get_name() == "Android" or OS.get_name() == "iOS":
		OS.shell_open("tel:" + num)
	else:
		$HBoxContainer/Pages/CallPage/HBoxContainer/CallArea/CallPhoneNum/AndroidOnly.visible = 1
		var timer = Timer.new()
		add_child(timer)
		timer.wait_time = 2.0
		timer.one_shot = 1
		timer.connect("timeout", self, "_on_Timer_timeout")
		timer.start()

func _on_Timer_timeout():
	$HBoxContainer/Pages/CallPage/HBoxContainer/CallArea/CallPhoneNum/AndroidOnly.visible = 0	

func _on_Clear_button_down():
	var num = $HBoxContainer/Pages/CallPage/HBoxContainer/CallArea/Number
	num.text = ""
	pass # Replace with function body.



