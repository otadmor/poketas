Func catch_charmander()
	Send("{F1}")
	Sleep(150)
	Send("X")
	Sleep(150)
	Send("ZZ")
	Sleep(250)
	Send("Z")
	Send("{Enter}X{Down}XX")
	
	Sleep(1000)
EndFunc
Func catch_mewtwo()
	Send("{F1}");X")
	Sleep(100)
	Send("X")
	Sleep(400)
	Send("X")
	Sleep(260)
	Send("{Down}XXXXXXXXXXXZZZZZZZZZ{Enter}{Down}X{Up}XX")

	Sleep(1000)	
	
Endfunc

Func catch_zapdos()
	Send("{F1}");X")
	Sleep(100)
	Send("X")
	Sleep(400)
	Send("X")
	Sleep(260)
	Send("X")
	Sleep(200)
	Send("{Down}XXXXXXXXXXXZZZZZZZZZ{Enter}{Down}X{Up}XX")

	Sleep(1000)	
	
Endfunc

Func catch_snorlax()
	Send("{F1}");X")
	Sleep(100)
	Send("X")
	Sleep(400)
	Send("X")
	Sleep(260)
	Send("{Down}XX")
	Sleep(100)
	Send("ZZ")
	Sleep(100)
	Send("ZZZ{Enter}{Down}X{Up}XX")
	Sleep(1000)	
	
Endfunc
; Z, H, N got thesame hash. so lame function
Func match_hash_digit($hash)

	Switch $hash
	Case 1726246465;2803254721
		Return "0"
	Case 4236277281
		Return "1"
	Case 3576323713
		Return "2"
	Case 1616079105
		Return "3"
	Case 2034656193
		Return "4"
	Case 2343199009
		Return "5"
	Case 1264279169
		Return "6"
	Case 1219719393
		Return "7"
	Case 1374313441
		Return "8"
	Case 471293569
		Return "9"
	Case 3156452033
		Return " "
	Case 3465640129
		Return "A"
	Case 2475450657
		Return "B"
	Case 3289480033
		Return "C"
	Case 603418177
		Return "D"
	Case 3752616897
		Return "E"
	Case 3752358785
		Return "F"
	Case 2584964673
		Return "G"
	Case 4192497889
		Return "H"
	Case 2166389601
		Return "I"
	Case 823228609
		Return "J"
	Case 4126505153
		Return "K"
	Case 1682079905
		Return "L"
	Case 3399774433
		Return "M"
	Case 4192497889
		Return "N"
	Case 2672916673
		Return "O"
	Case 3135795425
		Return "P"
	Case 4148327297
		Return "Q"
	Case 3201919233
		Return "R"
	Case 1924492865
		Return "S"
	Case 3069149345
		Return "T"
	Case 2122348065
		Return "U"
	Case 756973729
		Return "V"
	Case 2188863073
		Return "W"
	Case 3179443745
		Return "X"
	Case 3135015041
		Return "Y"
	Case 4192497889
		Return "Z"
	Case 3156452033;567982593
		Return " "
	Case 316312353
		Return "*"
	Case 3222833953
		Return "("
	Case 3619588897
		Return ")"
	Case 3377040833
		Return ":"
	Case 1549437057
		Return ";"
	Case 3090582305
		Return "["
	Case 3641804257
		Return "]"
	Case 3188734017
		Return "[PK]"
	Case 3267782913
		Return "[MN]"
	Case 1571263233
		Return "-"
	Case 3333777665
		Return "?"
	Case 2122477121
		Return "!"
	Case 2122608193
		Return "[MALE]"
	Case 4082332545
		Return "[FEMALE]"
	Case 3333001313
		Return "/"
	Case 95852609
		Return "."
	Case 2694484737
		Return ","
	Case 2409453889
		Return "END"
	Case 1439529825
		Return "a"
	Case 933393953
		Return "b"
	Case 2804777121
		Return "c"
	Case 1593603617
		Return "d"
	Case 2826990465
		Return "e"
	Case 1923972609
		Return "f"
	Case 3047190081
		Return "g"
	Case 2078310561
		Return "h"
	Case 1923585441
		Return "i"
	Case 3927478369
		Return "j"
	Case 691108033
		Return "k"
	Case 2408157281
		Return "l"
	Case 1726117409
		Return "m"
	Case 3685450561
		Return "n"
	Case 2320334337
		Return "o"
	Case 2408675521
		Return "p"
	Case 2078046401
		Return "q"
	Case 3333261441
		Return "r"
	Case 1109293921
		Return "s"
	Case 3575416289
		Return "t"
	Case 580682561
		Return "u"
	Case 52071201
		Return "v"
	Case 3641671169
		Return "w"
	Case 1593607649
		Return "x"
	Case 3553590113
		Return "y"
	Case 360609985
		Return "z"
	Case 933914209;2682215681
		Return "[CURSOR]"
	EndSwitch
	Return -1
EndFunc
	
Func get_hash($x, $y, $hWnd)
	
	Return PixelChecksum($x, $y, $x + 6, $y + 7, 1 , $hWnd)
EndFunc	

Func get_one_digit($x, $y, $hWnd)
	Return match_hash_digit(get_hash($x, $y, $hWnd))
EndFunc

Func get_string($x, $y, $hWnd, $max_length = -1, $terminate = -1, $start = 0)
	Local $final_str = ""
	If $max_length < 0 Then
		$max_length = 0x7FFFFFFF ; max int (singed 32 bit)
	EndIF
	For $index = $start To $max_length Step 1
		
		$digit = get_one_digit($x + 8 * $index, $y, $hWnd)
		If $digit == $terminate or $digit == -1 Then
			ExitLoop
		EndIF
		;MsgBox(0, "aaa", $final_digits & " " & $digit & " " & get_hash($x + 8 * $index, $y, $hWnd) & " " & ($x + 8 * $index) & " " & $y)
		$final_str &= $digit
	Next
	Return StringStripWS($final_str, 2) ; 2 = trailing spaces only
EndFunc

Func get_right_string($x, $y, $hWnd, $max_length = -1, $terminate = -1, $start = 0)
	Local $final_str = ""
	If $max_length < 0 Then
		$max_length = 0x7FFFFFFF ; max int (singed 32 bit)
	EndIF
	For $index = $start To $max_length Step 1
		
		$digit = get_one_digit($x - 6 - 8 * $index, $y, $hWnd)
		If $digit == $terminate or $digit == -1 Then
			ExitLoop
		EndIF
		;MsgBox(0, "aaa", $final_digits & " " & $digit & " " & get_hash($x + 8 * $index, $y, $hWnd) & " " & ($x + 8 * $index) & " " & $y)
		$final_str = $digit & $final_str
	Next
	Return StringStripWS($final_str, 1) ; 1 = heading spaces only
EndFunc

Func get_number($x, $y, $hWnd)
	Return Int(get_string($x, $y, $hWnd, -1, " "))
EndFunc

Func get_right_number($x, $y, $hWnd)
	$string_result = get_right_string($x, $y, $hWnd, -1, " ")
	For $i = StringLen($string_result) To 0 Step -1
		If Not StringIsDigit(StringMid($string_result, $i, 1)) Then
			ExitLoop
		EndIf
	Next

	Return Int(StringTrimLeft($string_result, $i))
EndFunc

Func get_level($hWnd)
	Return get_number(168, 56, $hWnd)
EndFunc	

Func get_next_level($hWnd)
	Return get_number(184, 88, $hWnd)
EndFunc	

Func get_hp($hWnd)
	Return get_right_number(198, 72, $hWnd)
EndFunc	

Func get_current_hp($hWnd)
	Return get_right_number(166, 72, $hWnd)
EndFunc	

Func get_attack($hWnd)
	Return get_right_number(118, 120, $hWnd)
EndFunc	

Func get_defence($hWnd)
	Return get_right_number(118, 136, $hWnd)
EndFunc	

Func get_speed($hWnd)
	Return get_right_number(118, 152, $hWnd)
EndFunc	

Func get_special($hWnd)
	Return get_right_number(118, 168, $hWnd)
EndFunc	

Func get_status($hWnd)
	Return get_string(176, 88, $hWnd)
EndFunc	

Func get_pokedex_number($hWnd)
	Return get_number(72, 96, $hWnd)
EndFunc	

Func get_type1($hWnd)
	Return get_string(136, 120, $hWnd)
EndFunc	

Func get_type2($hWnd)
	Return get_string(136, 136, $hWnd)
EndFunc	

Func get_trainer_id($hWnd)
	Return get_number(144, 152, $hWnd)
EndFunc	

Func get_trainer_name($hWnd)
	Return get_string(144, 168, $hWnd)
EndFunc	

Func get_name($hWnd)
	Return get_string(120, 48, $hWnd)
EndFunc	

Func get_exp($hWnd)
	Return get_number(152, 72, $hWnd)
EndFunc	

Func get_exp_left($hWnd)
	Return get_number(120, 88, $hWnd)
EndFunc	

Func get_move_name($move_index, $hWnd)
	Return get_string(64, 112 + 16 * $move_index, $hWnd)
EndFunc

Func get_move_pp($move_index, $hWnd)
	Return get_number(160, 120 + 16 * $move_index, $hWnd)
EndFunc

Func get_move_pp_left($move_index, $hWnd)
	Return get_number(184, 120 + 16 * $move_index, $hWnd)
EndFunc

Func get_pokemon_name($pokemon_index, $hWnd)
	Return get_string(72, 40 + 16 * $pokemon_index, $hWnd)
EndFunc

Func get_pokemon_level($pokemon_index, $hWnd)
	Return get_number(160, 40 + 16 * $pokemon_index, $hWnd)
EndFunc

Func get_pokemon_hp($pokemon_index, $hWnd)
	Return get_right_number(206, 48 + 16 * $pokemon_index, $hWnd)
EndFunc

Func get_pokemon_hp_left($pokemon_index, $hWnd)
	Return get_right_number(174, 48 + 16 * $pokemon_index, $hWnd)
EndFunc

Func is_pokemon_hp_full($pokemon_index, $hWnd)
	return get_pokemon_hp($pokemon_index, $hWnd) == get_pokemon_hp_left($pokemon_index, $hWnd)
EndFunc

Func get_pokemon_status($pokemon_index, $hWnd)
	If get_pokemon_level($pokemon_index, $hWnd) == 0 Then
		Return "" ; this is not a pokemon, or wrong screen. we do this so we wong get false "OK" status.
	EndIf
	$status = get_string(184, 40 + 16 * $pokemon_index, $hWnd)
	If $status == "" Then
		$status = "OK"
	EndIf
	Return $status
EndFunc

Func is_same_stat($level, $hp, $attack, $defence, $speed, $special, $hWnd)
	Return get_level($hWnd) == $level and get_hp($hWnd) == $hp and get_attack($hWnd) == $attack and get_defence($hWnd) == $defence and get_speed($hWnd) == $speed and get_special($hWnd) == $special
EndFunc

Func get_stat_hp($level, $base, $dv_attack, $dv_defence, $dv_speed, $dv_special, $ev)
	$dv = BitShift(BitAND($dv_attack, 1), -3) + BitShift(BitAND($dv_defence, 1), -2) + BitShift(BitAND($dv_speed, 1), -1) + BitAND($dv_special, 1)
	
	If $ev < 1 Then
		$ev = 1
	EndIf
	Return Floor($level * ($base + $dv + (Sqrt($ev - 1) + 1) / 8 + 50) / 50 + 10)
EndFunc

Func get_stat_value($level, $base, $dv, $ev)
	If $ev < 1 Then
		$ev = 1
	EndIf
	Return Floor($level * ($base + $dv + (Sqrt($ev - 1) + 1) / 8) / 50 + 5)
EndFunc

Func get_dv_value($level, $base, $ev, $stat)
	If $ev < 1 Then
		$ev = 1
	EndIf
	Return ($stat - 5) * 50 / $level - $base - (Sqrt($ev - 1) + 1) / 8 ; between ($stat - 4) * 50 / $level - $base - (Sqrt($ev - 1) + 1) / 8
EndFunc

Func get_max_hp($level, $base)
	Return get_stat_hp($level, $base, 0xf, 0xf, 0xf, 0xF, 0)
EndFunc

Func get_max_stat($level, $base)
	Return get_stat_value($level, $base, 0xF, 0)
EndFunc

Func get_selected_pokemon($hWnd)
	For $index = 0 To 5 Step 1
		If get_one_digit(48, 48 + 16 * $index, $hWnd) == "[CURSOR]" Then
			Return $index
		EndIf
	Next
EndFunc

Func is_max_stat($level, $hWnd)
;	$max_hp = get_max_hp($level, 106)
;	$max_attack = get_max_stat($level, 110)
;	$max_defence = get_max_stat($level, 90)
;	$max_speed = get_max_stat($level, 130)
;	$max_special = get_max_stat($level, 154)
	$max_hp = get_max_hp($level, 39)
	$max_attack = get_max_stat($level, 52)
	$max_defence = get_max_stat($level, 43)
	$max_speed = get_max_stat($level, 65)
	$max_special = get_max_stat($level, 50)
	
	Return is_same_stat($level, $max_hp, $max_attack, $max_defence, $max_speed, $max_special, $hWnd)
	
EndFunc

Global $max_stat = 0

Func get_sum_stat($hWnd)
	Return get_hp($hWnd) + get_attack($hWnd) + get_defence($hWnd) + get_speed($hWnd) + get_special($hWnd)
EndFunc

Func save_state()
	Send("+{F10}")
EndFunc

Func load_state($hWnd)
	Send("{F10}")
	$max_stat = get_sum_stat($hWnd)
EndFunc

Func save_stat($hWnd)
	
	$current_stat = get_sum_stat($hWnd)
	
	If $current_stat > $max_stat Then
		$max_stat = $current_stat
		save_state()
	EndIf
EndFunc


Func view_stat()
	
	Local $hWnd = WinGetHandle("VisualBoyAdvance")
	
	msgbox(0, "stat", "name = " & get_name($hWnd) & "\nhp = " & get_hp($hWnd) & "\nattack = " & get_attack($hWnd) & "\ndefence = " & get_defence($hWnd) & "\nspeed = " & get_speed($hWnd) & "\nspecial = " & get_special($hWnd))
EndFunc
;pressing enter to type text

Global $is_running = True
Func set_keys()
	
	HotKeySet("{F7}", "view_stat")
	HotKeySet("{F8}", "catch_once")
	HotKeySet("{F9}", "catch_loop")
EndFunc

Func unset_keys()
	HotKeySet("{F8}")
	HotKeySet("{F9}", "end_catch")
EndFunc

Func end_catch()
	$is_running = False
EndFunc

Func catch_loop()
	$is_running = True
	unset_keys()

	Local $hWnd = WinGetHandle("VisualBoyAdvance")
	Sleep(100)
	load_state($hWnd)
	Sleep(100)
	Do
		catch_charmander()
		;view_stat()
	
		If get_name($hWnd) <> "CHARMAHDER" Then;SHORLAX,HAPDOS,ARTICUHO, MOLTRES
			ContinueLoop
		EndIf
		save_stat($hWnd)
	Until is_max_stat(10, $hWnd) Or Not $is_running
	
	set_keys()
EndFunc

Opt("PixelCoordMode", 2) ; client area (no menu, caption bar)
AutoItSetOption("SendKeyDelay", 20)
AutoItSetOption("SendKeyDownDelay", 10)
SendKeepActive("VisualBoyAdvance")

;notice when button pressed
set_keys()
While 1
	Sleep(1)
WEnd