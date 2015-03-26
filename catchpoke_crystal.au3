$emuwintitle = ' VisualBoyAdvance-M (SVN1229)'
#include <GDIPlus.au3>

#include <ScreenCapture.au3>


$oDictionary = ObjCreate("Scripting.Dictionary")
$oDictionary.Add ("letters\A.bmp",    "A"  )
$oDictionary.Add ("letters\B.bmp",    "B"  )
$oDictionary.Add ("letters\C.bmp",    "C"  )
$oDictionary.Add ("letters\D.bmp",    "D"  )
$oDictionary.Add ("letters\E.bmp",    "E"  )
$oDictionary.Add ("letters\F.bmp",    "F"  )
$oDictionary.Add ("letters\G.bmp",    "G"  )
$oDictionary.Add ("letters\H.bmp",    "H"  )
$oDictionary.Add ("letters\I.bmp",    "I"  )
$oDictionary.Add ("letters\J.bmp",    "J"  )
$oDictionary.Add ("letters\K.bmp",    "K"  )
$oDictionary.Add ("letters\L.bmp",    "L"  )
$oDictionary.Add ("letters\M.bmp",    "M"  )
$oDictionary.Add ("letters\N.bmp",    "N"  )
$oDictionary.Add ("letters\O.bmp",    "O"  )
$oDictionary.Add ("letters\P.bmp",    "P"  )
$oDictionary.Add ("letters\Q.bmp",    "Q"  )
$oDictionary.Add ("letters\R.bmp",    "R"  )
$oDictionary.Add ("letters\S.bmp",    "S"  )
$oDictionary.Add ("letters\T.bmp",    "T"  )
$oDictionary.Add ("letters\U.bmp",    "U"  )
$oDictionary.Add ("letters\V.bmp",    "V"  )
$oDictionary.Add ("letters\W.bmp",    "W"  )
$oDictionary.Add ("letters\X.bmp",    "X"  )
$oDictionary.Add ("letters\Y.bmp",    "Y"  )
$oDictionary.Add ("letters\Z.bmp",    "Z"  )

$oDictionary.Add ("letters\a_.bmp",    "a"  )
$oDictionary.Add ("letters\b_.bmp",    "b"  )
$oDictionary.Add ("letters\c_.bmp",    "c"  )
$oDictionary.Add ("letters\d_.bmp",    "d"  )
$oDictionary.Add ("letters\e_.bmp",    "e"  )
$oDictionary.Add ("letters\f_.bmp",    "f"  )
$oDictionary.Add ("letters\g_.bmp",    "g"  )
$oDictionary.Add ("letters\h_.bmp",    "h"  )
$oDictionary.Add ("letters\i_.bmp",    "i"  )
$oDictionary.Add ("letters\j_.bmp",    "j"  )
$oDictionary.Add ("letters\k_.bmp",    "k"  )
$oDictionary.Add ("letters\l_.bmp",    "l"  )
$oDictionary.Add ("letters\m_.bmp",    "m"  )
$oDictionary.Add ("letters\n_.bmp",    "n"  )
$oDictionary.Add ("letters\o_.bmp",    "o"  )
$oDictionary.Add ("letters\p_.bmp",    "p"  )
$oDictionary.Add ("letters\q_.bmp",    "q"  )
$oDictionary.Add ("letters\r_.bmp",    "r"  )
$oDictionary.Add ("letters\s_.bmp",    "s"  )
$oDictionary.Add ("letters\t_.bmp",    "t"  )
$oDictionary.Add ("letters\u_.bmp",    "u"  )
$oDictionary.Add ("letters\v_.bmp",    "v"  )
$oDictionary.Add ("letters\w_.bmp",    "w"  )
$oDictionary.Add ("letters\x_.bmp",    "x"  )
$oDictionary.Add ("letters\y_.bmp",    "y"  )
$oDictionary.Add ("letters\z_.bmp",    "z"  )

$oDictionary.Add ("letters\e__.bmp",    "[e]"  )

$oDictionary.Add ("letters\0.bmp",    "0"  )
$oDictionary.Add ("letters\1.bmp",    "1"  )
$oDictionary.Add ("letters\2.bmp",    "2"  )
$oDictionary.Add ("letters\3.bmp",    "3"  )
$oDictionary.Add ("letters\4.bmp",    "4"  )
$oDictionary.Add ("letters\5.bmp",    "5"  )
$oDictionary.Add ("letters\6.bmp",    "6"  )
$oDictionary.Add ("letters\7.bmp",    "7"  )
$oDictionary.Add ("letters\8.bmp",    "8"  )
$oDictionary.Add ("letters\9.bmp",    "9"  )


$oDictionary.Add ("letters\space.bmp",    " "  )
$oDictionary.Add ("letters\dash.bmp",    "-"  )
$oDictionary.Add ("letters\question.bmp",    "?"  )
$oDictionary.Add ("letters\exclamation.bmp",    "!"  )
$oDictionary.Add ("letters\comma.bmp",    ","  )
$oDictionary.Add ("letters\mul.bmp",    "*"  )
$oDictionary.Add ("letters\open1.bmp",    "("  )
$oDictionary.Add ("letters\close1.bmp",    ")"  )
$oDictionary.Add ("letters\open2.bmp",    "["  )
$oDictionary.Add ("letters\close2.bmp",    "]"  )
$oDictionary.Add ("letters\slash.bmp",    "/"  )
$oDictionary.Add ("letters\colon.bmp",    ":"  )
$oDictionary.Add ("letters\semicolon.bmp",    ";" )
$oDictionary.Add ("letters\dot.bmp",    "."  )
$oDictionary.Add ("letters\pk.bmp",    "[PK]"  )
$oDictionary.Add ("letters\mn.bmp",    "[MN]"  )
$oDictionary.Add ("letters\level.bmp",    "[LEVEL]"  )
$oDictionary.Add ("letters\male.bmp",    "[MALE]"  )
$oDictionary.Add ("letters\female.bmp",    "[FEMALE]"  )
$oDictionary.Add ("letters\left.bmp",    "[LEFT]"  )
$oDictionary.Add ("letters\right.bmp",    "[RIGHT]"  )
$oDictionary.Add ("letters\down.bmp",    "[DOWN]"  )
$oDictionary.Add ("letters\number.bmp",    "[NO]"  )
$oDictionary.Add ("letters\id.bmp",    "[ID]"  )

$oDictionary.Add ("letters\balls0.bmp",    "[BALLS0]"  )
$oDictionary.Add ("letters\balls1.bmp",    "[BALLS1]"  )
$oDictionary.Add ("letters\balls2.bmp",    "[BALLS2]"  )
$oDictionary.Add ("letters\balls3.bmp",    "[BALLS3]"  )
;$oDictionary.Add ("letters\balls4.bmp",    "[BALLS4]"  )

Func DumpBitmap($bm1)
    
    $Bm1W = _GDIPlus_ImageGetWidth($bm1)
    $Bm1H = _GDIPlus_ImageGetHeight($bm1)
    $BitmapData1 = _GDIPlus_BitmapLockBits($bm1, 0, 0, $Bm1W, $Bm1H, $GDIP_ILMREAD, $GDIP_PXF01INDEXED)
    $Stride = DllStructGetData($BitmapData1, "Stride")
    $Scan0 = DllStructGetData($BitmapData1, "Scan0")
    
    $ptr1 = $Scan0
    $size1 = $Bm1H * $Stride
	
	
	$tmps = DllStructCreate("byte[" & $size1 & "]", $ptr1)
	$s = DllStructGetData($tmps, 1)
   $tmps = 0


    _GDIPlus_BitmapUnlockBits($bm1, $BitmapData1)
    
    Return String($s )
    
    
EndFunc 
_GDIPlus_Startup()

$iDictionary = ObjCreate("Scripting.Dictionary")
For $vKey In $oDictionary
   
   $bm1 = _GDIPlus_ImageLoadFromFile($vKey)
 If @error Then
        _GDIPlus_Shutdown()
        MsgBox(BitOR($MB_SYSTEMMODAL, $MB_ICONHAND), "", "An error has occured - unable to load image!", 30)
        Return False
    EndIf
   $bitmap_binary = DumpBitmap($bm1)
   ; ConsoleWrite($bitmap_binary & @CRLF )
   If $iDictionary.Exists($bitmap_binary) Then
	  ConsoleWrite("exist " & $vKey & " to be " & $iDictionary.Item($bitmap_binary) & " data " & $bitmap_binary & @CRLF )
   EndIf
   ;if $vKey == "letters\U.bmp" Then
	;  ConsoleWrite("U is " & $vKey & " data " & $bitmap_binary & @CRLF )
	 ; endif 
	$iDictionary.Add($bitmap_binary, $oDictionary.Item($vKey))
	
	_GDIPlus_ImageDispose($bm1)
 Next
	
; Z, H, N got thesame hash. so lame function
Func match_hash_digit($hash)
   If not $iDictionary.Exists($hash) Then
	  Return -1
   EndIf
   return $iDictionary.Item($hash)
	
EndFunc
	
Func get_screen($x, $y, $width, $height, $hWnd)
	$hBMP = _ScreenCapture_CaptureWnd ("", $hWnd, $x, $y, $x + $width, $y + $height, False)
	$hImage =  _GDIPlus_BitmapCreateFromHBITMAP($hBMP)
   
   $iX = _GDIPlus_ImageGetWidth($hImage)
   $iY = _GDIPlus_ImageGetHeight($hImage)
   $bm2 = _GDIPlus_BitmapCloneArea($hImage, 0, 0, $iX, $iY, $GDIP_PXF01INDEXED)
   $res = DumpBitmap($bm2)
   ; _GDIPlus_ImageSaveToFile($bm2, "D:\catchpoke\poketas\ss\aaa" & $x & "_" & $y & ".bmp")
   _GDIPlus_ImageDispose($bm2)
   _GDIPlus_ImageDispose($hImage)
   
   _WinApi_DeleteObject($hImage)
   _WinAPI_DeleteObject($hBMP)
   Return $res
EndFunc	

Func get_one_digit($x, $y, $hWnd)
   $scr_data = get_screen(8 + 32 * $x, 50 + 32 * $y, 31, 31, $hWnd)
   
	$res = match_hash_digit($scr_data)
	; ConsoleWrite("found " & $res & "with data " & $scr_data & @CRLF)
	return $res
EndFunc

Func get_string($x, $y, $hWnd, $max_length = -1, $terminate = -1, $start = 0)
	Local $final_str = ""
	If $max_length < 0 Then
		$max_length = 0x7FFFFFFF ; max int (singed 32 bit)
	EndIF
	For $index = $start To $max_length Step 1
		
		$digit = get_one_digit($x + $index, $y, $hWnd)
		
		If $digit == $terminate or $digit == -1 Then
			ExitLoop
		EndIF
		;MsgBox(0, "aaa", $final_digits & " " & $digit & " " & get_hash($x + 8 * $index, $y, $hWnd) & " " & ($x + 8 * $index) & " " & $y)
		$final_str &= $digit
	Next
	Return StringStripWS($final_str, 2) ; 2 = trailing spaces only
EndFunc

Func get_message_string($hWnd)
    Return get_string(1, 14, $hWnd, 18) & " " & get_string(1, 16, $hWnd, 18)
EndFunc

Func get_right_string($x, $y, $hWnd, $max_length = -1, $terminate = -1, $start = 0)
	Local $final_str = ""
	If $max_length < 0 Then
		$max_length = 0x7FFFFFFF ; max int (singed 32 bit)
	EndIF
	For $index = $start To $max_length Step 1
		
		$digit = get_one_digit($x + $index, $y, $hWnd)
		If $digit == $terminate or $digit == -1 Then
			ExitLoop
		EndIF
		;MsgBox(0, "aaa", $final_digits & " " & $digit & " " & get_hash($x + 8 * $index, $y, $hWnd) & " " & ($x + 8 * $index) & " " & $y)
		$final_str = $final_str & $digit
	Next
	Return StringStripWS($final_str, 1) ; 1 = heading spaces only
EndFunc

Func get_number($x, $y, $hWnd)
	Return Int(get_string($x, $y, $hWnd))
EndFunc

Func get_right_number($x, $y, $hWnd)
	$string_result = get_right_string($x, $y, $hWnd)
	return Int($string_result )
	For $i = StringLen($string_result) To 0 Step -1
		If Not StringIsDigit(StringMid($string_result, $i, 1)) Then
			ExitLoop
		EndIf
	Next

	Return Int(StringTrimLeft($string_result, $i))
 EndFunc
 
 Func get_fight_level($hWnd)
   Return get_number(7,1, $hWnd)
EndFunc

Func get_level($hWnd)
	Return get_number(7, 1, $hWnd)
EndFunc	

Func get_next_level($hWnd)
	Return get_number(18, 14, $hWnd)
EndFunc	

Func get_hp($hWnd)
	Return get_right_number(5, 10, $hWnd)
EndFunc	

Func get_current_hp($hWnd)
	Return get_right_number(1, 10, $hWnd)
EndFunc	

Func get_attack($hWnd)
	Return get_right_number(17, 9, $hWnd)
EndFunc	

Func get_defense($hWnd)
	Return get_right_number(17, 11, $hWnd)
EndFunc	

Func get_speed($hWnd)
	Return get_right_number(17, 17, $hWnd)
EndFunc	

Func get_special_attack($hWnd)
	Return get_right_number(17, 13, $hWnd)
EndFunc	

Func get_special_defense($hWnd)
	Return get_right_number(17, 15, $hWnd)
EndFunc	

Func get_status($hWnd)
   return -1
	;Return get_string(176, 88, $hWnd)
EndFunc	

Func get_pokedex_number($hWnd)
	Return get_number(10, 0, $hWnd)
EndFunc	

Func get_type1($hWnd)
	Return get_string(1, 15, $hWnd)
EndFunc	

Func get_type2($hWnd)
	Return get_string(1, 16, $hWnd)
EndFunc	

Func get_trainer_id($hWnd)
	Return get_number(2, 10, $hWnd)
EndFunc	

Func get_trainer_name($hWnd)
	Return get_string(2, 13, $hWnd)
EndFunc	

Func get_name($hWnd)
	Return get_string(1, 0, $hWnd)
EndFunc	

Func get_exp($hWnd)
	Return get_number(14, 10, $hWnd)
EndFunc	

Func get_exp_left($hWnd)
	Return get_number(16, 13, $hWnd)
EndFunc	

Func get_item($hWnd)
	Return get_string(8, 8, $hWnd)
EndFunc	

Func get_move_name($move_index, $hWnd)
	Return get_string(8, 10 + 2 * $move_index, $hWnd)
EndFunc

Func get_move_pp($move_index, $hWnd)
	Return get_number(15, 11 + 2 * $move_index, $hWnd)
EndFunc

Func get_move_pp_left($move_index, $hWnd)
	Return get_number(18, 11 + 2 * $move_index, $hWnd)
EndFunc

Func get_pokemon_name($pokemon_index, $hWnd)
	Return get_string(3, 1 + 2 * $pokemon_index, $hWnd)
EndFunc

Func get_pokemon_level($pokemon_index, $hWnd)
	Return get_number(9, 2 + 2 * $pokemon_index, $hWnd)
EndFunc

Func get_pokemon_hp($pokemon_index, $hWnd)
	Return get_right_number(17, 1 + 2 * $pokemon_index, $hWnd)
EndFunc

Func get_pokemon_hp_left($pokemon_index, $hWnd)
	Return get_right_number(13, 1 + 2 * $pokemon_index, $hWnd)
EndFunc

Func is_pokemon_hp_full($pokemon_index, $hWnd)
	return get_pokemon_hp($pokemon_index, $hWnd) == get_pokemon_hp_left($pokemon_index, $hWnd)
EndFunc

Func get_pokemon_status($pokemon_index, $hWnd)
	If get_pokemon_level($pokemon_index, $hWnd) == 0 Then
		Return "" ; this is not a pokemon, or wrong screen. we do this so we wong get false "OK" status.
	EndIf
	$status = get_string(8, 2 + 2 * $pokemon_index, $hWnd)
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
		If get_one_digit(0, 1 + 2 * $index, $hWnd) == "[RIGHT]" Then
			Return $index
		EndIf
	Next
 EndFunc
 
 Func fight_started($hWnd)
	if get_string(1, 14, $hWnd, 4) == "Wild" Then
	   return True
	Else
	   return False
	   EndIf
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
	Return get_hp($hWnd) + get_attack($hWnd) + get_defense($hWnd) + get_speed($hWnd) + get_special($hWnd)
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
	
	Local $hWnd = WinGetHandle($emuwintitle)
	
	msgbox(0, "stat", "name = " & get_name($hWnd) & "\nhp = " & get_hp($hWnd) & "\nattack = " & get_attack($hWnd) & "\ndefence = " & get_defense($hWnd) & "\nspeed = " & get_speed($hWnd) & "\nspecial = " & get_special($hWnd))
EndFunc


Func get_pokemon_amount($hWnd)
   For $index = 5 To 0 Step -1
		If get_pokemon_name($index, $hWnd) <> "" Then
			Return $index
		EndIf
	 Next
	 return 0
EndFunc


$needed_pokemon = "LARVITAR"
$needed_level = 15
Func good_stats($hWnd)
   Send("{ENTER}")
   while get_one_digit(11, 4, $hWnd) <> "[RIGHT]"  and $is_running
	  Send("{DOWN}")
	  Sleep(50)
   wend

   Send("{X}")
   Sleep(50)
   
   $pokemon_amount = get_pokemon_amount($hWnd)
   ; if get_pokemon_name($pokemon_amount, $hWnd) 
   while get_selected_pokemon($hWnd) <> $pokemon_amount - 1 and $is_running
	  ;ConsoleWrite("cur poke=" & get_selected_pokemon($hWnd))
	  Send("{UP}")
	  Sleep(50)
   Wend
   $lvl = get_pokemon_level($pokemon_amount - 1, $hWnd)
   
   Send("{X}")
   Sleep(50)
   Send("{X}")
   Sleep(50)
    
   $hp = get_hp($hWnd)
   Send("{RIGHT}")
   Sleep(50)
   Send("{RIGHT}")
   Sleep(50)
   
   	$attack = get_attack($hWnd)
	$defense = get_defense($hWnd)
	$speed = get_speed($hWnd)
	$special_attack = get_special_attack($hWnd)
	$special_defense = get_special_defense($hWnd)
   
   Send("{Z}")
   Sleep(50)
   Send("{Z}")
   Sleep(50)
   Send("{Z}")
   Sleep(50)
   
   ; ConsoleWrite("state is lvl=" & $lvl & ",hp=" & $hp & ", attack=" & $attack & ", defense=" & $defense & ", speed=" & $speed & ", special_attack=" & $special_attack & ", special_defense=" & $special_defense & @CRLF)
   
   if $lvl <> $needed_level or $hp <> 44 or $attack <> 28 or $defense <> 24 or $speed <> 21 or $special_attack <> 23 or $special_defense <> 24 Then
	  Return False
   EndIf
   Return True
EndFunc

Func goto_ball_bag($hWnd)
Sleep(50)
   
   Send("{TAB up}")
   Send("{TAB}")
   AutoItSetOption("SendKeyDelay", 50)
   AutoItSetOption("SendKeyDownDelay", 50)
   Sleep(50)
   while get_string(0, 8, $hWnd, 4) <> "[BALLS0][BALLS1][BALLS2][BALLS3][BALLS0]" and $is_running
	  ConsoleWrite("go other bag pocket" & @CRLF)
	  Send("{RIGHT}")
	  Sleep(300)
   WEnd
   Sleep(200) ; flush right clicks?
   Send("{TAB down}")
   AutoItSetOption("SendKeyDelay", 10)
   AutoItSetOption("SendKeyDownDelay", 10)
   ;Send("{RIGHT up}")
Sleep(50)
EndFunc

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
 
 Func try_catch_loop($hWnd)
   
   Sleep(50)
   Send("+{F2}")
   Sleep(100)
   
   Send("{X}")
   Sleep(150)
   ;ConsoleWrite("Catching " & get_message_string($hWnd))
   
   ; get_message_string($hWnd) == "Oh no! The POK{e}MON broke free!"
   While get_string(1, 14, $hWnd, 7) <> "Gotcha!" and $is_running
	  ConsoleWrite("try catch again!" & @CRLF)
	  Send("{F2}")
	  Sleep(100)
	  ;Send("{RIGHT up}")
	  ;Sleep(100)
	  AutoItSetOption("SendKeyDelay", 50)
	  AutoItSetOption("SendKeyDownDelay", 50)
	  Send("{X}")
	  Sleep(200)
	  AutoItSetOption("SendKeyDelay", 10)
	  AutoItSetOption("SendKeyDownDelay", 10)
	  
   Wend
   
   Send("{X}")
   Sleep(50)
   if get_string(1, 14, $hWnd, 4) <> "Give" Then

	  Send("{X}")
	  Sleep(50)
	  Send("{X}")
	  Sleep(50)
	  Send("{X}")
	  Sleep(50)
	  Send("{X}")
	  Sleep(50)
   EndIF
   
   Send("{DOWN}")
   Sleep(50)
   Send("{X}")
	  Sleep(50)
EndFunc
Func goto_bag($hWnd)
   ;ConsoleWrite(get_one_digit(9, 16, $hWnd))
   while get_one_digit(9, 16, $hWnd) <> "[RIGHT]" 
	  Send("{DOWN}")

	  Sleep(50)
	  

   wend

   
   Sleep(50)
   Send("{X}")
EndFunc

Func see_wild($hWnd)
   Send("{RIGHT down}")
	while not fight_started($hWnd) and $is_running
		 Send("{LEFT down}")
		 
		 Sleep(50)
		 if fight_started($hWnd) or not $is_running Then
			   ExitLoop
			endif
		 Send("{LEFT up}")
		 Sleep(50)
	  WEnd
	  Send("{RIGHT up}")
	  Sleep(50)
	  Send("{RIGHT}")
   EndFunc
   
Func should_fight($hWnd)
   If get_name($hWnd) <> $needed_pokemon or get_fight_level($hWnd) <> $needed_level Then
	 Send("{F1}")
	 Sleep(50)
	 Return False
;	 while get_one_digit(15, 16, $hWnd) <> "[RIGHT]" 
;		Send("{RIGHT}")
;		 
;		 Sleep(50)
;		Send("{DOWN}")
;		Sleep(50)
;		;ConsoleWrite(get_one_digit(15, 16, $hWnd))
;	  wend
;	  ;ConsoleWrite("on right")
;	 Send("{X}")
;	  
;	  Sleep(50)
;	  Send("{X}")
;	  Sleep(50)
;	  return False
   EndIf
   Return True
EndFunc

Func catch_loop()
	$is_running = True
	
	unset_keys()

   ; Send("+{F1}")
	Local $hWnd = WinGetHandle($emuwintitle)
	Sleep(100)
	;load_state($hWnd)
	Sleep(100)
	Send("{TAB down}")
	Do
	   ConsoleWrite("looking for a prey" & @CRLF)
		 see_wild($hWnd)
		 ConsoleWrite("found wild" & @CRLF)
		 if not  $is_running Then
			ExitLoop
		 endif
		 Send("{X}")
		Sleep(50)
		 ;ConsoleWrite("got " & get_name($hWnd) & @CRLF)
		if not should_fight($hWnd) Then
		   ContinueLoop
		 EndIf
		 ConsoleWrite("fighting!" & @CRLF)
		 goto_bag($hWnd)
		 if not  $is_running Then
			ExitLoop
		 endif
		 ;ConsoleWrite("in bag" & @CRLF)
		 ;goto_ball_bag($hWnd)
		 ;if not  $is_running Then
		;	ExitLoop
		 ;endif
		 
		 Send("{X}")
		 Sleep(50)
		 ConsoleWrite("catching" & @CRLF)
		 try_catch_loop($hWnd)
		 if not  $is_running Then
			ExitLoop
		 endif
		 
		 ConsoleWrite("checking stats" & @CRLF)
		 If good_stats($hWnd) Then
			WriteConsole("Caught good pkmn!" & @CRLF)
			Send("+{F3}")
			Sleep(50)
		 Else
			;WriteConsole("Caught bad pkmn!" & @CRLF)
		 EndIf
		 if not  $is_running Then
			ExitLoop
		 endif
		 Send("{F1}")
		 Sleep(50)
		;save_stat($hWnd)
	Until Not $is_running ;  is_max_stat(10, $hWnd) Or
	
	set_keys()
EndFunc

Opt("PixelCoordMode", 2) ; client area (no menu, caption bar)
AutoItSetOption("SendKeyDelay", 10)
AutoItSetOption("SendKeyDownDelay", 10)
SendKeepActive($emuwintitle)

Local $hWnd = WinGetHandle($emuwintitle)
;ConsoleWrite(get_string(1, 14, $hWnd, 7))
;ConsoleWrite(get_string(7, 1, $hWnd))
;ConsoleWrite(get_number(7,1, $hWnd))

;ConsoleWrite(get_fight_level($hWnd))
;ConsoleWrite(get_right_string(17, 9, $hWnd))
;ConsoleWrite(get_right_number(17, 9, $hWnd))
;ConsoleWrite(get_one_digit(15, 16, $hWnd))
;ConsoleWrite(get_one_digit(9, 16, $hWnd))
;ConsoleWrite(get_right_string(5, 10, $hWnd))
;ConsoleWrite(get_right_number(5, 10, $hWnd))
;ConsoleWrite(get_hp($hWnd))
;ConsoleWrite(good_stats($hWnd))
;Send("{TAB down}")
;goto_bag($hWnd)
;goto_ball_bag($hWnd)
;Send("{TAB up}")
;try_catch_loop($hWnd)
;ConsoleWrite(get_string(1, 14, $hWnd, 7))
;EXIT
;ConsoleWrite(get_name($hWnd) & @CRLF)
;notice when button pressed
set_keys()
While 1
	Sleep(1)
WEnd

_GDIPlus_Shutdown()