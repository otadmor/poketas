Local $hWnd = WinGetHandle(' VisualBoyAdvance-M (SVN1229)')
Opt("PixelCoordMode", 2) ; client area (no menu, caption bar)
; Z, H, N got thesame hash. so lame function


#include <GDIPlus.au3>




Func CompareBitmaps($bm1, $bm2)

    $Bm1W = _GDIPlus_ImageGetWidth($bm1)
    $Bm1H = _GDIPlus_ImageGetHeight($bm1)
    $BitmapData1 = _GDIPlus_BitmapLockBits($bm1, 0, 0, $Bm1W, $Bm1H, $GDIP_ILMREAD, $GDIP_PXF01INDEXED)
    $Stride1 = DllStructGetData($BitmapData1, "Stride")
    $Scan0 = DllStructGetData($BitmapData1, "Scan0")

    $ptr1 = $Scan0
    $size1 = $Bm1H * $Stride1


    $Bm2W = _GDIPlus_ImageGetWidth($bm2)
    $Bm2H = _GDIPlus_ImageGetHeight($bm2)
    $BitmapData2 = _GDIPlus_BitmapLockBits($bm2, 0, 0, $Bm2W, $Bm2H, $GDIP_ILMREAD, $GDIP_PXF01INDEXED)
    $Stride2 = DllStructGetData($BitmapData2, "Stride")
    $Scan0 = DllStructGetData($BitmapData2, "Scan0")

    $ptr2 = $Scan0
    $size2 = $Bm2H * $Stride2

    $smallest = $size1
    If $size2 < $smallest Then $smallest = $size2

    $call = DllCall("msvcrt.dll", "int:cdecl", "memcmp", "ptr", $ptr1, "ptr", $ptr2, "int", $smallest)



    _GDIPlus_BitmapUnlockBits($bm1, $BitmapData1)
    _GDIPlus_BitmapUnlockBits($bm2, $BitmapData2)

    Return ($call[0]=0)


 EndFunc  ;==>CompareBitmaps


Func DumpBitmap($bm1)

    $Bm1W = _GDIPlus_ImageGetWidth($bm1)
    $Bm1H = _GDIPlus_ImageGetHeight($bm1)
    $BitmapData1 = _GDIPlus_BitmapLockBits($bm1, 0, 0, $Bm1W, $Bm1H, $GDIP_ILMREAD, $GDIP_PXF01INDEXED)
    $Stride = DllStructGetData($BitmapData1, "Stride")
    $Scan0 = DllStructGetData($BitmapData1, "Scan0")

    $ptr1 = $Scan0
    $size1 = $Bm1H * $Stride


   $s = DllStructCreate("byte[" & $size1 & "]")

    $call = DllCall("msvcrt.dll", "int:cdecl", "memcpy", "ptr", $s, "ptr", $ptr1, "int", $size1)
   If($call[0]=0) then
	  ConsoleWriteError("invalid memcpy" & @CRLF)
   EndIf



	; $s = DllStructGetData(DllStructCreate("byte[" & $size1 & "]", ptr1), 1)


    _GDIPlus_BitmapUnlockBits($bm1, $BitmapData1)

    Return $s


EndFunc  ;==>CompareBitmaps


 Local $arr1[15] = ["2", "3", "0", "2", "3", "5", "1", "9", "0", "1", "9", "6", "2", "0", "1"] ;

 #include <ScreenCapture.au3>
 ;#include <OCR.au3>

 ;Local $aPos = WinGetPos(" VisualBoyAdvance-M (SVN1229)")

 _GDIPlus_Startup()

 SendKeepActive(' VisualBoyAdvance-M (SVN1229)')
 _ScreenCapture_CaptureWnd ("ss\full.jpg", $hWnd, False)
   For $y = 0 To 17
For $x = 0 To 19
   SendKeepActive(' VisualBoyAdvance-M (SVN1229)')
   $cs = PixelChecksum(8 + 32 * $x, 50 + 32 * $y, 8 + 32 * $x + 31, 50 + 32 * $y + 31, 1 , $hWnd)
   ;_ScreenCapture_Capture  ("D:\catchpoke\poketas\ss\" &  (3 * $y + $x) & "_letter2_" & $x & "_" & $y & "_" & $cs & ".jpg", $aPos[0] + 551 + 32 * $x, $aPos[1] + 341 + 64 * $y, $aPos[0] + 551 + 32 * $x + 30, $aPos[1] + 341 + 64 * $y + 26, False)
   ;ConsoleWrite("have " & _OCR($aPos[0] + 551 + 32 * $x, $aPos[1] + 341 + 64 * $y, $aPos[0] + 551 + 32 * $x + 30, $aPos[1] + 341 + 64 * $y + 26, 0xFFFFFF))
	ConsoleWrite("Case " & $cs & @CRLF)
	ConsoleWrite('    Return "letter_' & $x & "_" & $y & '"' & @CRLF)
	$fn =  (20 * $y + $x) & "_letter_" & $x & "_" & $y & "_" & $cs & ".bmp"
	$hBMP = _ScreenCapture_CaptureWnd ("ss\" & $fn, $hWnd, 8 + 32 * $x, 50 + 32 * $y, 8 + 32 * $x + 31, 50 + 32 * $y + 31, False)
	;$hBMP = _ScreenCapture_CaptureWnd ("", $hWnd, 8 + 32 * $x, 50 + 32 * $y, 8 + 32 * $x + 31, 50 + 32 * $y + 31, False)


	; 24bit
	$bm1 = _GDIPlus_ImageLoadFromFile("ss\" & $fn)
$hBMP = _ScreenCapture_CaptureWnd ("", $hWnd, 8 + 32 * $x, 50 + 32 * $y, 8 + 32 * $x + 31, 50 + 32 * $y + 31, False)

; 32 bit
   $hImage =  _GDIPlus_BitmapCreateFromHBITMAP($hBMP)

   $iX = _GDIPlus_ImageGetWidth($hImage)
    $iY = _GDIPlus_ImageGetHeight($hImage)
    $bm2 = _GDIPlus_BitmapCloneArea($hImage, 0, 0, $iX, $iY, $GDIP_PXF01INDEXED)

   ConsoleWrite($cs & " bm1==bm2:" & CompareBitmaps($bm1, $bm2) & @CRLF)
   _GDIPlus_ImageSaveToFile($bm1, "s1\" & $fn)
   _GDIPlus_ImageSaveToFile($bm2, "s2\" & $fn)
   ;_GDIPlus_ImageSaveToFile($bm2, $fn)
   _GDIPlus_ImageDispose($bm1)
   _GDIPlus_ImageDispose($bm2)
   _GDIPlus_ImageDispose($hImage)

   _WinApi_DeleteObject($hImage)
_WinAPI_DeleteObject($hBMP)


   Next
Next

_GDIPlus_Shutdown()