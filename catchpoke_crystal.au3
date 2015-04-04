$emuwintitle = ' VisualBoyAdvance-M (SVN1229)'
#include <GDIPlus.au3>
#include <Misc.au3>
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

$oDictionary.Add ("letters\MA1.bmp",    "[MA]"  )
$oDictionary.Add ("letters\RT1.bmp",    "[RT]"  )
$oDictionary.Add ("letters\PO1.bmp",    "[PO]"  )
$oDictionary.Add ("letters\KE1.bmp",    "[KE]"  )

$oDictionary.Add ("letters\MA2.bmp",    "[MA]"  )
$oDictionary.Add ("letters\RT2.bmp",    "[RT]"  )
$oDictionary.Add ("letters\PO2.bmp",    "[PO]"  )
$oDictionary.Add ("letters\KE2.bmp",    "[KE]"  )

$oDictionary.Add ("letters\stairs.bmp",    "[STAIRS]"  )


$oDictionary.Add ("letters\sign_left_top1.bmp",    "[SLT]"  )
$oDictionary.Add ("letters\sign_right_top1.bmp",    "[SRT]"  )
$oDictionary.Add ("letters\sign_left_bottom1.bmp",    "[SLB]"  )
$oDictionary.Add ("letters\sign_right_bottom1.bmp",    "[SRB]"  )

$oDictionary.Add ("letters\sign_left_top2.bmp",    "[SLT]"  )
$oDictionary.Add ("letters\sign_right_top2.bmp",    "[SRT]"  )
$oDictionary.Add ("letters\sign_left_bottom2.bmp",    "[SLB]"  )
$oDictionary.Add ("letters\sign_right_bottom2.bmp",    "[SRB]"  )

$oDictionary.Add ("letters\oldman_left1.bmp",    "[OML]"  )
$oDictionary.Add ("letters\oldman_right1.bmp",    "[OMR]"  )
$oDictionary.Add ("letters\oldman_left2.bmp",    "[OML]"  )
$oDictionary.Add ("letters\oldman_right2.bmp",    "[OMR]"  )
$oDictionary.Add ("letters\oldlady_left.bmp",    "[OLL]"  )
$oDictionary.Add ("letters\oldlady_right.bmp",    "[OLR]"  )

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
	Return get_string(3, 1 + 2 * $pokemon_index, $hWnd, -1, " ")
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

Func get_stat_hp($level, $base, $dv_attack, $dv_defense, $dv_speed, $dv_special, $ev)
	$dv = BitShift(BitAND($dv_attack, 1), -3) + BitShift(BitAND($dv_defense, 1), -2) + BitShift(BitAND($dv_speed, 1), -1) + BitAND($dv_special, 1)

	If $ev < 1 Then
		$ev = 1
	EndIf
	Return Floor($level * (($base + $dv + (Sqrt($ev - 1) + 1) / 8 + 50) / 50) + 10)
EndFunc

Func get_stat_value($level, $base, $dv, $ev)
	If $ev < 1 Then
		$ev = 1
	EndIf
	Return Floor($level * (($base + $dv + (Sqrt($ev - 1) + 1) / 8) / 50) + 5)
 EndFunc

 Func get_hp_dv_value($level, $base, $ev, $stat)
	If $ev < 1 Then
		$ev = 1
	EndIf
    Return ($stat - 10) * 50 / $level - $base - 50 - (Sqrt($ev - 1) + 1) / 8

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
	Return get_stat_value($level, $base, 0xf, 0)
EndFunc


Func get_mid_stat($level, $base)
	Return get_stat_value($level, $base, 7, 0)
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
Global $pokemon_amount = 0

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
   For $index = 6 To 1 Step -1
		 $pokemon_name = get_pokemon_name($index - 1, $hWnd)
		If $pokemon_name <> "" and $pokemon_name <> "NCEL"  Then
			Return $index
		EndIf
	 Next
	 return -1
EndFunc
Func get_pokemon_by_name($hWnd, $needed_pokemon_name)
   For $index = 5 To 0 Step -1
		 $pokemon_name = get_pokemon_name($index, $hWnd)
		If $pokemon_name == $needed_pokemon_name  Then
			Return $index
		EndIf
	 Next
	 return -1
EndFunc

Func is_sign_at($x, $y, $hWnd)
   return get_one_digit($x, $y, $hWnd) == "[SLT]" and get_one_digit($x + 1, $y, $hWnd) == "[SRT]" and get_one_digit($x, $y + 1, $hWnd) == "[SLB]" and get_one_digit($x + 1, $y + 1, $hWnd) == "[SRB]"
EndFunc



$needed_pokemon = "LARVITAR"
$needed_level = 15

Func goto_poke_screen($hWnd)
   AutoItSetOption("SendKeyDownDelay", 10)
   AutoItSetOption("SendKeyDelay", 10)
   while get_string(12, 2, $hWnd) <> "POK[e]DEX"  and $is_running
	  Send("{ENTER}")
   Wend

   while get_one_digit(11, 4, $hWnd) <> "[RIGHT]"  and $is_running
	  Send("{DOWN}")

   wend

   Send("{X}")
EndFunc

Func good_stats($hWnd, $pokemon_number, $is_catching)

   $lvl = get_pokemon_level($pokemon_number, $hWnd)

   $max_hp = get_max_hp($lvl, 50)
   $max_attack = get_max_stat($lvl, 64)
   $max_defense = get_max_stat($lvl, 50)
   $max_speed = get_max_stat($lvl, 41)
   $max_special_attack = get_max_stat($lvl, 45)
   $max_special_defense = get_max_stat($lvl, 50)
   $mid_special_attack = get_mid_stat($lvl, 45)
   $mid_special_defense = get_mid_stat($lvl, 50)

   ;ConsoleWrite($max_hp & " " & $max_attack & " " & $max_defense & " " & $max_speed & " " & $max_special_attack & " " & $max_special_defense & " " & @CRLF)


   ; i dont care of the hp gene because its created by the others
   $hp = get_pokemon_hp($pokemon_number, $hWnd)
   ;ConsoleWrite($pokemon_number  & " hp " &  $hp & "/" & $max_hp & @CRLF)
   if $hp <> $max_hp and not $is_catching Then
	  AutoItSetOption("SendKeyDownDelay", 50)
	  AutoItSetOption("SendKeyDelay", 50)
	  Send("{Z 2}")
	  Return False
   Endif
   $hp_dv = get_hp_dv_value($lvl, 50, 0, $hp)
   $dv_attack_lsb = BitAND(BitShift($hp_dv, 3), 1)
   $dv_defense_lsb = BitAND(BitShift($hp_dv, 2), 1)
   $dv_speed_lsb = BitAND(BitShift($hp_dv, 1), 1)
   $dv_special_lsb = BitAND($hp_dv, 1)

   ; the hp tells if we have good defense, so we can save some time here
   ; this is also good if the defense dv can be something like 14-15 and
   ; we want to make sure its 15. the defense value itself cant give us
   ; that information
   ;if $dv_attack_lsb <> 1 Then ; remove when catching
	;	 Return False
   ;Endif
   if $dv_defense_lsb <> 1 and $is_catching Then
	  Return False
   Endif
   ;if $dv_speed_lsb <> 1 Then ; remove when catching
		 ;Return False
   ;Endif
   ; because of rounding issues, we cant tell the same about the special
   ;if $dv_special_lsb <> 1 Then
	;	 Return False
   ;Endif

   AutoItSetOption("SendKeyDownDelay", 50)
   AutoItSetOption("SendKeyDelay", 50)
   ; if get_pokemon_name($pokemon_amount, $hWnd)

   while get_selected_pokemon($hWnd) <> $pokemon_number and $is_running
	  ;ConsoleWrite("cur poke=" & get_selected_pokemon($hWnd))
	  Send("{UP}")

   Wend

   Send("{X 2}{RIGHT 2}")


   	$attack = get_attack($hWnd)
	$defense = get_defense($hWnd)
	$speed = get_speed($hWnd)
	$special_attack = get_special_attack($hWnd)
	$special_defense = get_special_defense($hWnd)
   ;AutoItSetOption("SendKeyDelay", 0)
   ;AutoItSetOption("SendKeyDownDelay", 10)
   Send("{Z 3}")


   ; ConsoleWrite("state is lvl=" & $lvl & ",hp=" & $hp & ", attack=" & $attack & ", defense=" & $defense & ", speed=" & $speed & ", special_attack=" & $special_attack & ", special_defense=" & $special_defense & @CRLF)
   If $is_catching Then
	  if $pokemon_amount == 6 then
		 end_catch()
	  EndIf

	  if $defense == $max_defense and ($special_attack == $max_special_attack and $special_defense == $max_special_defense or $special_attack == $mid_special_attack and $special_defense == $mid_special_defense) Then
		 Return True
	  EndIf
   Else
	  if $attack == $max_attack and $defense == $max_defense and $speed == $max_speed and $special_attack == $max_special_attack and $special_defense == $max_special_defense Then
		 Return True
	  EndIf
   EndIf
   Return False
EndFunc

Func goto_ball_bag($hWnd)

   if get_string(0, 8, $hWnd, 4) == "[BALLS0][BALLS1][BALLS2][BALLS3][BALLS0]" Then
	  Return
   EndIf
   Send("{TAB up}")

   AutoItSetOption("SendKeyDelay", 50)
   AutoItSetOption("SendKeyDownDelay", 50)

   while get_string(0, 8, $hWnd, 4) <> "[BALLS0][BALLS1][BALLS2][BALLS3][BALLS0]" and $is_running
	  ;ConsoleWrite("go other bag pocket" & @CRLF)
	  Send("{RIGHT}")

   WEnd

   Send("{TAB down}")
   AutoItSetOption("SendKeyDelay", 0)
   AutoItSetOption("SendKeyDownDelay", 0)
   ;Send("{RIGHT up}")

EndFunc

Global $is_running = True
Func set_keys()

	HotKeySet("{F8}", "breed_loop")
	HotKeySet("{F9}", "catch_loop")
EndFunc

Func unset_keys()
	HotKeySet("{F8}", "end_catch")
	HotKeySet("{F9}", "end_catch")
EndFunc

Func end_catch()
	  Send("{TAB up}")
	$is_running = False
 EndFunc
Func end_poke_catched($hWnd)
   AutoItSetOption("SendKeyDownDelay", 10)
   AutoItSetOption("SendKeyDelay", 0)
   Send("{X}")

   if get_string(1, 14, $hWnd, 4) <> "Give" Then

	  Send("{X}{X}{X}{X}")

   EndIF
   ;AutoItSetOption("SendKeyDelay", 10)
   ;Send("{Y}")
   Send("{DOWN}{X}")
   Sleep(200)
   EndFunc
 Func try_catch_loop($hWnd)
   AutoItSetOption("SendKeyDelay", 10)
   AutoItSetOption("SendKeyDownDelay",10)

   Send("{X}")

   AutoItSetOption("SendKeyDelay", 100)
   Send("+{F2}")


   AutoItSetOption("SendKeyDelay", 200)
   Send("{X}")


   ;ConsoleWrite("Catching " & get_message_string($hWnd))

   ; get_message_string($hWnd) == "Oh no! The POK{e}MON broke free!"
   AutoItSetOption("SendKeyDownDelay", 50)
   While get_string(1, 14, $hWnd, 7) <> "Gotcha!" and $is_running
	  ;ConsoleWrite("try catch again!" & @CRLF)
	  AutoItSetOption("SendKeyDelay", 100)
	  Send("{F2}")

	  ;Send("{RIGHT up}")

	  AutoItSetOption("SendKeyDelay", 200)
	  Send("{X}")


   Wend
   end_poke_catched($hWnd)
EndFunc
Func goto_bag($hWnd)
   ;ConsoleWrite(get_one_digit(9, 16, $hWnd))
   ;AutoItSetOption("SendKeyDelay", 10)
   while get_one_digit(9, 16, $hWnd) <> "[RIGHT]" and $is_running

	  Send("{DOWN}")




   wend

   AutoItSetOption("SendKeyDownDelay", 50)
   AutoItSetOption("SendKeyDelay", 200)
   Send("{X}")

   ;AutoItSetOption("SendKeyDelay", 0)
EndFunc

Func see_wild($hWnd)

   AutoItSetOption("SendKeyDownDelay", 0)
   Send("{RIGHT down}")
		 AutoItSetOption("SendKeyDelay", 50)
		 AutoItSetOption("SendKeyDownDelay", 50)
	while not fight_started($hWnd) and $is_running
		 Send("{LEFT}")


		 ;if fight_started($hWnd) or not $is_running Then
			;   ExitLoop
			;endif

	  WEnd
   AutoItSetOption("SendKeyDelay", 0)
	  Send("{RIGHT up}")
	  AutoItSetOption("SendKeyDownDelay", 10)
	  Send("{X}")

   EndFunc

Func should_fight($hWnd)
   ;return True
   If get_name($hWnd) <> $needed_pokemon Then ; or get_fight_level($hWnd) <> $needed_level Then
	  AutoItSetOption("SendKeyDelay", 50)
	 Send("{F1}")
	 AutoItSetOption("SendKeyDelay", 0)
	 Return False
;	 while get_one_digit(15, 16, $hWnd) <> "[RIGHT]"
;		Send("{RIGHT}")
;

;		Send("{DOWN}")

;		;ConsoleWrite(get_one_digit(15, 16, $hWnd))
;	  wend
;	  ;ConsoleWrite("on right")
;	 Send("{X}")
;

;	  Send("{X}")

;	  return False
   EndIf
   Return True
EndFunc

Func catch_loop()
	$is_running = True


   Opt("PixelCoordMode", 	2) ; client area (no menu, caption bar)
   AutoItSetOption("SendKeyDelay", 0)
   AutoItSetOption("SendKeyDownDelay", 10)
   SendKeepActive($emuwintitle)

	unset_keys()

   ; Send("+{F1}")
	Local $hWnd = WinGetHandle($emuwintitle)

	;load_state($hWnd)

	Send("{TAB down}")
	Do

	   ;ConsoleWrite("looking for a prey" & @CRLF)
		 see_wild($hWnd)
		 ;ConsoleWrite("found wild" & @CRLF)
		 if not  $is_running Then
			ExitLoop
		 endif


		 ;ConsoleWrite("got " & get_name($hWnd) & @CRLF)
		if not should_fight($hWnd) Then
		   ContinueLoop
		 EndIf
		 ;ConsoleWrite("fighting!" & @CRLF)
		 goto_bag($hWnd)
		 if not  $is_running Then
			ExitLoop
		 endif
		 ;ConsoleWrite("in bag" & @CRLF)
		 goto_ball_bag($hWnd)
		 ;if not  $is_running Then
		;	ExitLoop
		 ;endif

		 ;Send("{X}")

		 ;ConsoleWrite("catching" & @CRLF)
		 try_catch_loop($hWnd)
		 if not  $is_running Then
			ExitLoop
		 endif

		 ;ConsoleWrite("checking stats" & @CRLF)

		 goto_poke_screen($hWnd)


		 $pokemon_amount = get_pokemon_amount($hWnd)
		 If good_stats($hWnd, $pokemon_amount - 1, True) Then
			ConsoleWrite("Caught good pkmn!" & @CRLF)
			Send("+{F1}")

		 Else
			;WriteConsole("Caught bad pkmn!" & @CRLF)
		 EndIf
		 if not  $is_running Then
			ExitLoop
		 endif
		 Send("{F1}")

		;save_stat($hWnd)
	Until Not $is_running ;  is_max_stat(10, $hWnd) Or
	end_catch()
	set_keys()
 EndFunc

 Func poke_born($hWnd)
   if get_string(1, 14, $hWnd, 4) == "Huh?" Then
	  return True
   Else
	  return False
   EndIf

EndFunc

Func wait_for_hatch($hWnd, $pokemon_amount)

   AutoItSetOption("SendKeyDownDelay", 0)
   Send("{DOWN down}")
   AutoItSetOption("SendKeyDelay", 100)
   AutoItSetOption("SendKeyDownDelay", 100)
   $i = 0
	while not poke_born($hWnd) and $is_running and ($pokemon_amount == 6 or $i < 20)
	  Send("{UP}")
	  $i = $i + 1
   WEnd
   AutoItSetOption("SendKeyDelay", 0)
   Send("{DOWN up}")
   if poke_born($hWnd) Then
	  AutoItSetOption("SendKeyDelay", 500)
	  AutoItSetOption("SendKeyDownDelay", 10)
	  Send("{X}")
	  Return True
   EndIF
   Return False
EndFunc

Func goto_pokemon_center($hWnd)
   AutoItSetOption("SendKeyDelay", 10)
   AutoItSetOption("SendKeyDownDelay", 20)
   Send("{DOWN down}")
   while not is_sign_at(10, 2, $hWnd) and $is_running
   Wend
   Send("{DOWN up}")

   AutoItSetOption("SendKeyDelay", 100)
   AutoItSetOption("SendKeyDownDelay", 10)
   Send("{LCTRL}")


   AutoItSetOption("SendKeyDelay", 10)
   AutoItSetOption("SendKeyDownDelay", 10)
   Send("{TAB up}")

   AutoItSetOption("SendKeyDelay", 150)
   AutoItSetOption("SendKeyDownDelay", 20)
   while get_string(18, 4, $hWnd) <> "[MA][RT]" and $is_running
	  Send("{UP}")
   Wend

   while get_string(10, 4, $hWnd) <> "[PO][KE]" and $is_running
	  Send("{LEFT}")
   Wend

   Send("{TAB down}")
   AutoItSetOption("SendKeyDelay", 10)
   AutoItSetOption("SendKeyDownDelay", 10)
   Send("{UP}")
EndFunc

Func goto_computer($hWnd)
   AutoItSetOption("SendKeyDownDelay", 50)
   Send("{UP}{RIGHT}{UP}")
   AutoItSetOption("SendKeyDownDelay", 10)
   Send("{X 5}{DOWN}{X}")



EndFunc

Func release_pokemon($hWnd, $needed_pokemon_number)
   AutoItSetOption("SendKeyDelay", 10)
   AutoItSetOption("SendKeyDownDelay", 10)
   Send("{TAB up}")
   AutoItSetOption("SendKeyDelay", 50)
   AutoItSetOption("SendKeyDownDelay", 50)
   Send("{DOWN " &  $needed_pokemon_number & "}")
   AutoItSetOption("SendKeyDelay", 150)
   AutoItSetOption("SendKeyDownDelay", 50)
   Send("{TAB down}")

   Send("{X}")
   AutoItSetOption("SendKeyDelay", 10)
   AutoItSetOption("SendKeyDownDelay", 50)
   Send("{TAB up}")

   AutoItSetOption("SendKeyDelay", 150)
   AutoItSetOption("SendKeyDownDelay", 50)
   Send("{DOWN 2}{TAB down}")
   AutoItSetOption("SendKeyDelay", 10)
   AutoItSetOption("SendKeyDownDelay", 10)
   Send("{X}")
   AutoItSetOption("SendKeyDelay", 200)
   Send("{X}")
   AutoItSetOption("SendKeyDelay", 10)
   AutoItSetOption("SendKeyDownDelay", 10)

EndFunc

Func deposit_pokemon($hWnd, $needed_pokemon_number)
   AutoItSetOption("SendKeyDelay", 10)
   AutoItSetOption("SendKeyDownDelay", 10)
   Send("{TAB up}")
   AutoItSetOption("SendKeyDelay", 50)
   AutoItSetOption("SendKeyDownDelay", 50)

   Send("{DOWN " & $needed_pokemon_number & "}")

   AutoItSetOption("SendKeyDelay", 150)
   AutoItSetOption("SendKeyDownDelay", 50)
   Send("{TAB down}")
   AutoItSetOption("SendKeyDelay", 10)
   AutoItSetOption("SendKeyDownDelay", 10)
   Send("{X 2}")
   AutoItSetOption("SendKeyDelay", 10)
   AutoItSetOption("SendKeyDownDelay", 10)
EndFunc

Func exit_computer($hWnd)
   AutoItSetOption("SendKeyDelay", 100)
   Send("{Z 3}")

EndFunc

Func exit_pokemon_center($hWnd)
   AutoItSetOption("SendKeyDelay", 10)
   AutoItSetOption("SendKeyDownDelay", 50)
   Send("{LEFT}{DOWN}{TAB up}")
   AutoItSetOption("SendKeyDelay", 150)
   AutoItSetOption("SendKeyDownDelay", 20)
   while get_one_digit(1, 9, $hWnd) <> "[STAIRS]" and $is_running
	  ;ConsoleWrite(get_one_digit(1, 9, $hWnd) & @CRLF)
	  Send("{LEFT}")
   Wend

   AutoItSetOption("SendKeyDelay", 20)
   AutoItSetOption("SendKeyDownDelay", 20)
   Send("{TAB down}")
   AutoItSetOption("SendKeyDelay", 10)
   AutoItSetOption("SendKeyDownDelay", 50)
   Send("{DOWN}{TAB up}")

   AutoItSetOption("SendKeyDelay", 150)
   AutoItSetOption("SendKeyDownDelay", 20)
   while get_string(18, 4, $hWnd) <> "[MA][RT]" and $is_running
	  Send("{RIGHT}")
   Wend
   AutoItSetOption("SendKeyDelay", 150)
   AutoItSetOption("SendKeyDownDelay", 50)
   Send("{TAB down}")
   AutoItSetOption("SendKeyDelay", 100)
   AutoItSetOption("SendKeyDownDelay", 10)
   Send("{LCTRL}")
EndFunc

Func goto_daycare($hWnd)
   AutoItSetOption("SendKeyDelay", 10)
   AutoItSetOption("SendKeyDownDelay", 20)
   Send("{DOWN down}")
   while not is_sign_at(10, 2, $hWnd) and $is_running
   Wend
   Send("{DOWN up}")

   AutoItSetOption("SendKeyDelay", 100)
   AutoItSetOption("SendKeyDownDelay", 10)
   Send("{LCTRL}")


   AutoItSetOption("SendKeyDelay", 10)
   AutoItSetOption("SendKeyDownDelay", 10)
   Send("{TAB up}")

   AutoItSetOption("SendKeyDelay", 160)
   AutoItSetOption("SendKeyDownDelay", 20)

   while not is_sign_at(16, 2, $hWnd) and not is_sign_at(12, 16, $hWnd) and $is_running
	  Send("{LEFT}")
   Wend

   while not is_sign_at(12, 0, $hWnd) and $is_running
	  Send("{DOWN}")
   Wend

   AutoItSetOption("SendKeyDelay", 150)
   AutoItSetOption("SendKeyDownDelay", 50)
   Send("{TAB down}")
   AutoItSetOption("SendKeyDelay", 	10)
   AutoItSetOption("SendKeyDownDelay", 50)
   Send("{RIGHT}")
   AutoItSetOption("SendKeyDelay", 10)
   AutoItSetOption("SendKeyDownDelay", 10)
   Send("{TAB up}")
   AutoItSetOption("SendKeyDelay", 160)
   AutoItSetOption("SendKeyDownDelay", 20)

   If get_one_digit(16, 6, $hWnd) == "[OML]" and get_one_digit(17, 6, $hWnd) == "[OMR]" Then
	  while not is_sign_at(8, 0, $hWnd) and $is_running
		 Send("{LEFT}")
	  Wend
	  while not is_sign_at(8, 4, $hWnd) and $is_running
		 Send("{UP}")
	  Wend

	  while not (get_one_digit(14, 2, $hWnd) == "[OLL]" and get_one_digit(15, 2, $hWnd) == "[OLR]") and $is_running
		 Send("{RIGHT}")
	  Wend

	  while not (get_one_digit(14, 0, $hWnd) == "[OLL]" and get_one_digit(15, 0, $hWnd) == "[OLR]") and $is_running
		 Send("{DOWN}")
	  Wend
	  AutoItSetOption("SendKeyDelay", 300)
	  AutoItSetOption("SendKeyDownDelay", 50)
	  Send("{DOWN}")
	  ;while not (get_one_digit(12, 8, $hWnd) == "[OML]" and get_one_digit(13, 8, $hWnd) == "[OMR]") and $is_running
		 ;Send("{DOWN}")
	  ;Wend

	  AutoItSetOption("SendKeyDelay", 150)
	  AutoItSetOption("SendKeyDownDelay", 50)
	  Send("{TAB down}")
	  AutoItSetOption("SendKeyDelay", 10)
	  AutoItSetOption("SendKeyDownDelay", 120)
	  Send("{RIGHT}")

	  AutoItSetOption("SendKeyDelay", 10)
	  AutoItSetOption("SendKeyDownDelay", 20)
	  Send("{X 8}")
	  AutoItSetOption("SendKeyDelay", 10)
	  AutoItSetOption("SendKeyDownDelay", 80)
	  Send("{LEFT}")

	  AutoItSetOption("SendKeyDelay", 10)
	  AutoItSetOption("SendKeyDownDelay", 20)
	  Send("{TAB up}")
	  AutoItSetOption("SendKeyDelay", 160)
	  AutoItSetOption("SendKeyDownDelay", 20)

	  while not (get_one_digit(14, 2, $hWnd) == "[OLL]" and get_one_digit(15, 2, $hWnd) == "[OLR]") and $is_running
		 Send("{UP}")
	  Wend

	  while not is_sign_at(12, 4, $hWnd) and $is_running
		 Send("{LEFT}")
	  Wend

	  $has_new_egg = True
   Else
	  $has_new_egg = False
	  while not is_sign_at(12, 0, $hWnd) and $is_running
		 Send("{LEFT}")
	  Wend
   EndIf

   while not is_sign_at(16, 8, $hWnd) and $is_running
	  Send("{UP}")
   Wend

   AutoItSetOption("SendKeyDelay", 150)
   AutoItSetOption("SendKeyDownDelay", 50)
   Send("{TAB down}")
   AutoItSetOption("SendKeyDelay", 100)
   AutoItSetOption("SendKeyDownDelay", 10)
   Send("{LCTRL}")
   AutoItSetOption("SendKeyDelay", 10)
   AutoItSetOption("SendKeyDownDelay", 50)
   Send("{RIGHT}")

   return $has_new_egg
EndFunc


Func breed_loop()
   	$is_running = True


   Opt("PixelCoordMode", 	2) ; client area (no menu, caption bar)
   AutoItSetOption("SendKeyDelay", 0)
   AutoItSetOption("SendKeyDownDelay", 10)
   SendKeepActive($emuwintitle)

	unset_keys()

   ; Send("+{F1}")
	Local $hWnd = WinGetHandle($emuwintitle)

	;load_state($hWnd)


	Send("{TAB down}")
	goto_poke_screen($hWnd)
	$pokemon_amount = get_pokemon_amount($hWnd)
   Send("{Z 2}")
	Do
		 ConsoleWrite("poke amount " & $pokemon_amount & @CRLF)
		 $hatched = wait_for_hatch($hWnd, $pokemon_amount)
		 if $hatched Then
			end_poke_catched($hWnd)

			goto_poke_screen($hWnd)
			$pokemon_amount = get_pokemon_amount($hWnd)
			$needed_pokemon_number = get_pokemon_by_name($hWnd, $needed_pokemon)
			ConsoleWrite("hatched at " & $needed_pokemon_number & @CRLF )
			if $needed_pokemon_number == -1 Then
			   ConsoleWrite("ERROR Finding PKMN!" & @CRLF)
			Else
			   If good_stats($hWnd, $needed_pokemon_number, False) Then
				  ConsoleWrite("a good pokemon has hatched!" & @CRLF)
				  $good_pokemon = True
			   Else
				  ;ConsoleWrite("a not good pokemon has hatched!")
				  $good_pokemon = False
			   EndIf

			   goto_pokemon_center($hWnd)

			   goto_computer($hWnd)

			   if $good_pokemon Then
				  deposit_pokemon($hWnd, $needed_pokemon_number)
			   Else
				  release_pokemon($hWnd, $needed_pokemon_number)
			   EndIf
			   $pokemon_amount = $pokemon_amount - 1

			   exit_computer($hWnd)
			   exit_pokemon_center($hWnd)
			EndIf
		 EndIf
		 if $pokemon_amount < 6 Then
			$has_new_egg = goto_daycare($hWnd)
			if $has_new_egg Then
			   $pokemon_amount = $pokemon_amount + 1
			EndIf
		 EndIf


	Until Not $is_running ;  is_max_stat(10, $hWnd) Or
	end_catch()
	set_keys()
EndFunc

;WinWaitActive ($emuwintitle)

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

;goto_bag($hWnd)
;goto_ball_bag($hWnd)
;Send("{TAB up}")
;try_catch_loop($hWnd)
;ConsoleWrite(get_string(1, 14, $hWnd, 7))


;Send("{TAB down}")
;AutoItSetOption("SendKeyDownDelay", 5000)
;ConsoleWrite("BEFORE " & _IsPressed (28) & @CRLF)
;Send("{RIGHT down}")
;ConsoleWrite("AFTER " & _IsPressed (28) & @CRLF)

;ConsoleWrite(get_string(12, 2, $hWnd))

   ;$pokemon_amount = get_pokemon_amount($hWnd)
   ;$lvl = get_pokemon_level($pokemon_amount - 1, $hWnd)
   ;$hp = get_pokemon_hp($pokemon_amount - 1, $hWnd)
   ;ConsoleWrite($lvl  & " " & $hp )



;ConsoleWrite(get_max_hp(20, 50) & @CRLF)
;ConsoleWrite(get_max_stat(20, 64) & @CRLF)
;ConsoleWrite(get_max_stat(20, 50) & @CRLF)
;ConsoleWrite(get_max_stat(20, 41) & @CRLF)
;ConsoleWrite(get_max_stat(20, 45) & @CRLF)
;ConsoleWrite(get_max_stat(20, 50) & @CRLF)


;ConsoleWrite(get_pokemon_name(6- 1, $hWnd))
;ConsoleWrite(get_pokemon_by_name($hWnd, $needed_pokemon))
;$pokemon_number = 4
;$lvl = get_pokemon_level($pokemon_number, $hWnd)
;$hp = get_pokemon_hp($pokemon_number, $hWnd)

;$hp_dv = get_hp_dv_value($lvl, 50, 0, $hp)
;$dv_attack_lsb = BitAND(BitShift($hp_dv, 3), 1)
;$dv_defense_lsb = BitAND(BitShift($hp_dv, 2), 1)
;$dv_speed_lsb = BitAND	(BitShift($hp_dv, 1), 1)
;$dv_special_lsb = BitAND($hp_dv, 1)
;ConsoleWrite($hp_dv & " " & $dv_attack_lsb & " " & $dv_attack_lsb &  " " & $dv_speed_lsb & " " & $dv_special_lsb)
;ConsoleWrite(get_pokemon_hp(1, $hWnd))


;ConsoleWrite(get_string(18, 4, $hWnd))
;goto_pokemon_center($hWnd)


;goto_computer($hWnd)

;if $good_pokemon Then
;deposit_pokemon($hWnd, 1)
;Else
   ;release_pokemon($hWnd, 1)
;EndIf

;exit_computer($hWnd)
;exit_pokemon_center($hWnd)
   ;Opt("PixelCoordMode", 	2) ; client area (no menu, caption bar)
   ;AutoItSetOption("SendKeyDelay", 0)
   ;AutoItSetOption("SendKeyDownDelay", 10)
   ;SendKeepActive($emuwintitle)
   ;$pokemon_amount = get_pokemon_amount($hWnd)
   ;ConsoleWrite($pokemon_amount)
;Send("{TAB down}")
;goto_daycare($hWnd)



;EXIT
;ConsoleWrite(get_name($hWnd) & @CRLF)
;notice when button pressed
set_keys()
While 1
	Sleep(1)
WEnd

_GDIPlus_Shutdown()