//%attributes = {}
If (False:C215)
	//Project Method Name:      Bar_PatternToPict
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2012 15:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Chart; $_l_Count; $_l_Distance; $_l_FontSize; $_l_FontSize2; $_l_Middlex; $_l_Object; $_l_Offset2; $_l_PatternCharacter; $_l_SupplementalOffset; $4)
	C_LONGINT:C283(BARC_l_Add; BARC_l_FontOffset; BARC_l_FontSize; BARC_l_Height; BARC_l_Width)
	C_PICTURE:C286($_pic_BarCode; $0)
	C_TEXT:C284($_t_BarcodeType; $_t_EAN; $_t_Line; $_t_oldMethodName; $_t_Pattern; $_t_ShowText; $_t_Text; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BAR_PatternToPict")

// Barcode
// Thomas Maul, 4D Germany, July 2004

// draw the pattern. $1 = pattern, $2 displayed text, may be empty; $3 = Barcodetype, needed if $2#""
//  $4 optional: longint with chart area
// this allows to reuse the same chart area several time. Always clear it (CT NEW Document).
// this speeds up to create many barcodes
// example (2400 MHZ AMD, compiled, 1000 x EAN13, 3225 ticks to 1232 ticks)

$_t_Pattern:=$1
$_t_ShowText:=$2
$_t_BarcodeType:=$3


If (Count parameters:C259=4)
	$_l_Chart:=$4
Else 
	$_l_Chart:=0
End if 
If ($_l_Chart=0)
	//$_l_Chart:=DB_CreateSVGgraph
End if 
// $_l_Chart:=Open external window(50;50;500;500;0;"test";"_4D Chart")  ` for debugging

$_l_Distance:=BARC_l_Width*2  // used to move the text beyond the code

If ($_t_BarcodeType="Supplemental@")
	$_l_SupplementalOffset:=BARC_l_FontSize+BARC_l_FontOffset
Else 
	$_l_SupplementalOffset:=1
End if 
If (($_t_BarcodeType="EAN13") | ($_t_BarcodeType="UPC@"))
	$_l_FontSize:=BARC_l_FontSize
Else 
	$_l_FontSize:=1
End if 
$_l_PatternCharacter:=1
$_l_Middlex:=0

$_t_Pattern:=$_t_Pattern+"X"  // end of code, to make looping easier
While ($_l_PatternCharacter<Length:C16($_t_Pattern))
	$_l_Count:=0
	$_t_Line:=$_t_Pattern[[$_l_PatternCharacter]]
	// check if similar are following
	While ($_t_Line=$_t_Pattern[[$_l_PatternCharacter+1]])  // we cannot go longer than the string, thanks to "X"
		$_l_Count:=$_l_Count+1
		$_l_PatternCharacter:=$_l_PatternCharacter+1
	End while 
	
	Case of 
		: (($_t_Line="1") | ($_t_Line="2"))
			If ($_t_Line="2")
				If (($_l_FontSize>(BARC_l_FontSize+10)) & ($_l_Middlex=0))
					$_l_Middlex:=$_l_FontSize
				End if 
				$_l_Offset2:=$_l_SupplementalOffset+BARC_l_Height+BARC_l_Add
			Else 
				$_l_Offset2:=$_l_SupplementalOffset+BARC_l_Height
			End if 
			
			If (($_l_Count=0) & (BARC_l_Width=1))
				$_l_FontSize2:=$_l_FontSize
				//$_l_Object:=DB_CreateSVGgraph ($_l_Chart;$_l_FontSize;$_l_SupplementalOffset;$_l_FontSize2;$_l_Offset2;0)
				//DB_CreateSVGgraph ($_l_Chart;$_l_Object;3;‘14500;80‘ (16);1)
			Else 
				$_l_FontSize2:=$_l_FontSize+($_l_Count*BARC_l_Width)+BARC_l_Width-1
				//$_l_Object:=DB_CreateSVGgraph($_l_Chart;$_l_FontSize;$_l_SupplementalOffset;$_l_FontSize2;$_l_Offset2;0)
				//DB_CreateSVGgraph ($_l_Chart;$_l_Object;3;‘14500;80‘ (16))
				// CT Draw rectangle (Bereich;Links;Oben;Rechts;Unten;Abgerundet)Lange Ganzzahl
			End if 
			
		: ($_t_Line="0")  // White, don't draw
			$_l_FontSize2:=$_l_FontSize+($_l_Count*BARC_l_Width)+BARC_l_Width-1
			
	End case 
	$_l_FontSize:=$_l_FontSize2+1
	
	$_l_PatternCharacter:=$_l_PatternCharacter+1
End while 

If ($_t_ShowText#"")
	Case of 
		: (($_t_BarcodeType="EAN@") | ($_t_BarcodeType="UPC@"))
			$_l_SupplementalOffset:=$_l_SupplementalOffset+BARC_l_Height
		: ($_t_BarcodeType="Supplemental@")
			$_l_SupplementalOffset:=1
		Else 
			$_l_SupplementalOffset:=$_l_SupplementalOffset+BARC_l_Height+BARC_l_Add
	End case 
	$_l_Offset2:=$_l_SupplementalOffset+BARC_l_FontSize+BARC_l_FontOffset
	$_l_FontSize:=1
	Case of 
		: ($_t_BarcodeType="UPC-E")
			//$_t_Text:=Substring($_t_ShowText;1;1)
			//`$_l_Object:=  //DB_CreateSVGgraph ($_l_Chart;$_l_FontSize;$_l_SupplementalOffset;$_l_FontSize2;$_l_Offset2;$_t_Text)
			//DB_CreateSVGgraph ($_l_Chart;$_l_Object;‘14500;85‘ (BARC_t_FontName);BARC_l_FontSize;0;‘14500;80‘ (16);0)
			$_t_Text:=Substring:C12($_t_ShowText; 2; 6)
			//`$_l_Object:=  //DB_CreateSVGgraph ($_l_Chart;$_l_FontSize+BARC_l_FontSize+($_l_Distance+$_l_Distance);$_l_SupplementalOffset;$_l_FontSize2;$_l_Offset2;$_t_Text)
			//DB_CreateSVGgraph ($_l_Chart;$_l_Object;‘14500;85‘ (BARC_t_FontName);BARC_l_FontSize;0;‘14500;80‘ (16);0)
			$_t_Text:=Substring:C12($_t_ShowText; 8; 1)
			//`$_l_Object:=  //DB_CreateSVGgraph ($_l_Chart;$_l_FontSize2+2;$_l_SupplementalOffset;$_l_FontSize2+(BARC_l_FontSize*2);$_l_Offset2;$_t_Text)
			//DB_CreateSVGgraph ($_l_Chart;$_l_Object;‘14500;85‘ (BARC_t_FontName);BARC_l_FontSize;0;‘14500;80‘ (16);0)
			
		: ($_t_BarcodeType="UPC-A")
			$_t_Text:=Substring:C12($_t_ShowText; 1; 1)
			//`$_l_Object:=  //DB_CreateSVGgraph ($_l_Chart;$_l_FontSize;$_l_SupplementalOffset;$_l_FontSize2;$_l_Offset2;$_t_Text)
			//DB_CreateSVGgraph ($_l_Chart;$_l_Object;‘14500;85‘ (BARC_t_FontName);BARC_l_FontSize;0;‘14500;80‘ (16);0)
			$_t_Text:=Substring:C12($_t_ShowText; 2; 5)
			//$_l_Object:=  //DB_CreateSVGgraph ($_l_Chart;$_l_FontSize+BARC_l_FontSize+($_l_Distance+$_l_Distance);$_l_SupplementalOffset;$_l_FontSize2;$_l_Offset2;$_t_Text)
			//DB_CreateSVGgraph ($_l_Chart;$_l_Object;‘14500;85‘ (BARC_t_FontName);BARC_l_FontSize;0;‘14500;80‘ (16);0)
			$_t_Text:=Substring:C12($_t_ShowText; 7; 5)
			//$_l_Object:=  //DB_CreateSVGgraph ($_l_Chart;$_l_Middlex+($_l_Distance+$_l_Distance);$_l_SupplementalOffset;$_l_FontSize2;$_l_Offset2;$_t_Text)
			//DB_CreateSVGgraph ($_l_Chart;$_l_Object;‘14500;85‘ (BARC_t_FontName);BARC_l_FontSize;0;‘14500;80‘ (16);0)
			$_t_Text:=Substring:C12($_t_ShowText; 12; 1)
			//$_l_Object:=  //DB_CreateSVGgraph ($_l_Chart;$_l_FontSize2+2;$_l_SupplementalOffset;$_l_FontSize2+(BARC_l_FontSize*2);$_l_Offset2;$_t_Text)
			//DB_CreateSVGgraph ($_l_Chart;$_l_Object;‘14500;85‘ (BARC_t_FontName);BARC_l_FontSize;0;‘14500;80‘ (16);0)
			
		: ($_t_BarcodeType="EAN8")
			$_t_Text:=Substring:C12($_t_ShowText; 1; 4)
			//$_l_Object:=  //DB_CreateSVGgraph ($_l_Chart;$_l_FontSize+$_l_Distance;$_l_SupplementalOffset;$_l_FontSize2;$_l_Offset2;$_t_Text)
			//DB_CreateSVGgraph ($_l_Chart;$_l_Object;‘14500;85‘ (BARC_t_FontName);BARC_l_FontSize;0;‘14500;80‘ (16);0)
			$_t_Text:=Substring:C12($_t_ShowText; 5; 4)
			//$_l_Object:=  //DB_CreateSVGgraph ($_l_Chart;$_l_Middlex+($_l_Distance*2);$_l_SupplementalOffset;$_l_FontSize2;$_l_Offset2;$_t_Text)
			//DB_CreateSVGgraph ($_l_Chart;$_l_Object;‘14500;85‘ (BARC_t_FontName);BARC_l_FontSize;0;‘14500;80‘ (16);0)
			
		: ($_t_BarcodeType="EAN13")
			$_t_Text:=Substring:C12($_t_ShowText; 1; 1)
			//$_l_Object:=  //DB_CreateSVGgraph ($_l_Chart;$_l_FontSize;$_l_SupplementalOffset;$_l_FontSize2;$_l_Offset2;$_t_Text)
			//DB_CreateSVGgraph ($_l_Chart;$_l_Object;‘14500;85‘ (BARC_t_FontName);BARC_l_FontSize;0;‘14500;80‘ (16);0)
			$_t_Text:=Substring:C12($_t_ShowText; 2; 6)
			//$_l_Object:=  //DB_CreateSVGgraph ($_l_Chart;$_l_FontSize+BARC_l_FontSize+($_l_Distance+$_l_Distance);$_l_SupplementalOffset;$_l_FontSize2;$_l_Offset2;$_t_Text)
			//DB_CreateSVGgraph ($_l_Chart;$_l_Object;‘14500;85‘ (BARC_t_FontName);BARC_l_FontSize;0;‘14500;80‘ (16);0)
			$_t_Text:=Substring:C12($_t_ShowText; 8; 6)
			//$_l_Object:=  //DB_CreateSVGgraph ($_l_Chart;$_l_Middlex+($_l_Distance+$_l_Distance);$_l_SupplementalOffset;$_l_FontSize2;$_l_Offset2;$_t_Text)
			//DB_CreateSVGgraph ($_l_Chart;$_l_Object;‘14500;85‘ (BARC_t_FontName);BARC_l_FontSize;0;‘14500;80‘ (16);0)
		Else 
			//$_l_Object:=  //DB_CreateSVGgraph ($_l_Chart;$_l_FontSize;$_l_SupplementalOffset;$_l_FontSize2;$_l_Offset2;$_t_ShowText)
			//DB_CreateSVGgraph ($_l_Chart;$_l_Object;‘14500;85‘ (BARC_t_FontName);BARC_l_FontSize;0;‘14500;80‘ (16);1)
	End case 
End if 

//DB_CreateSVGgraph ($_l_Chart;-1;1)
//$_pic_BarCode:=DB_CreateSVGgraph ($_l_Chart;0)  // should work?
// CT DO COMMAND ($_l_Chart;2004)

If (Count parameters:C259<4)
	//DB_CreateSVGgraph ($_l_Chart)
End if 
// Get_Picture FROM CLIPBOARD($_pic_BarCode)
ERR_MethodTrackerReturn("BAR_PatternToPict"; $_t_oldMethodName)
$0:=$_pic_BarCode
ERR_MethodTrackerReturn("Bar_PatternToPict"; $_t_oldMethodName)