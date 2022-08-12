//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_StyleSettings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 14:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(INT_bo_SkinsPrefsLoaded)
	C_LONGINT:C283(<>SYS_l_DefaultBoldFontSize; <>SYS_l_DefaultPlainFontSize; $_l_BackColourOptions; $_l_Blue; $_l_Colour; $_l_Dividers; $_l_FontSIze; $_l_Green; $_l_Red; $_l_RGBColour; $3)
	C_LONGINT:C283($6; $8; LB_l_ForeColor)
	C_POINTER:C301($_ptr_ArrayReferences; $_Ptr_ListBox; $_ptr_Table; $1; $5)
	C_TEXT:C284(<>SYS_t_DefaultFontBold; <>SYS_t_DefaultFontPlain; $_t_ColourName; $_t_ObjectPrefix; $_t_oldMethodName; $2; $4; $7; LB_t_ColorName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_StyleSettings")
//LB_StyleSettings
// 29/06/06 pb
// Sets the font, colours, etc. for Listbox areas

// parameters: $1 = pointer to the Listbox area
//                    $2 = colour name for?
//                    $3 = the font size to use
//                    $4 = the object prefix
//                    $5 = pointer to the table

// example: LB_StyleSettings ($_Ptr_ListBox;$_ptr_ArrayReferences->{2};$_ptr_ArrayofColumnFonts->{1};ObjectPrefix;->[table])
If (Undefined:C82(WIN_t_CurrentInputForm))
	WIN_t_CurrentInputForm:=""
End if 

//◊FontBold:="Charcoal"
//◊FontPlain:="Charcoal CY"

LB_l_ForeColor:=0
LB_t_ColorName:=""
$_Ptr_ListBox:=$1
$_l_FontSIze:=$3
$_t_ObjectPrefix:=$4
$_ptr_Table:=$5

If (INT_bo_SkinsPrefsLoaded=False:C215)
	INT_SkinsPrefs
End if 

$_l_Dividers:=Int:C8(65536/256)
If (Count parameters:C259>=6)
	LB_l_ForeColor:=$6
	If (Count parameters:C259>=7)
		LB_t_ColorName:=$7
	End if 
End if 
If (WIN_t_CurrentInputForm="Diary_View@")
	$_l_BackColourOptions:=LB_GetFormcolour(Table:C252(->[COMPANIES:2]); WIN_t_CurrentInputForm; ->LB_l_ForeColor; ->LB_t_ColorName)
Else 
	$_l_BackColourOptions:=LB_GetFormcolour(Table:C252($_ptr_Table); WIN_t_CurrentInputForm; ->LB_l_ForeColor; ->LB_t_ColorName)
End if 
If (Count parameters:C259>=8)
	$_l_BackColourOptions:=$8
End if 
//here we will get the color from the table
If (LB_l_ForeColor=0)
	Case of 
		: ($2="Blue")
			$_t_ColourName:="Blue"
			$_l_Colour:=224
		: ($2="Green")
			$_t_ColourName:="Green"
			$_l_Colour:=192
		: ($2="Orange")
			$_t_ColourName:="Yellow"
			$_l_Colour:=3
		: ($2="Red")
			$_t_ColourName:="Red"
			$_l_Colour:=141
		: ($2="Cyan")
			$_t_ColourName:="Cyan"
			$_l_Colour:=208
		: ($2="Grey")
			$_t_ColourName:="Grey"
			$_l_Colour:=12
		: ($2="BrRed")
			$_t_ColourName:="Red"
			$_l_Colour:=4
		Else 
			Gen_Alert("Listbox style setting not set for this option needs to be taught "+$_ptr_ArrayReferences->{2})
			$_l_Colour:=16
			$_t_ColourName:="Black"
	End case 
End if 

LB_Setdividers($_Ptr_ListBox; -Light grey:K11:13; 32)  //Both black
LB_SetColours($_Ptr_ListBox; Black:K11:16; 240; 241)
If (True:C214)
	If (LB_l_ForeColor#0)
		$_l_Dividers:=1
		//TRACE
		
		//LB_GetRGB (LB_l_ForeColor;->$_l_Red;->$_l_Green;->$_l_Blue)
		$_l_Colour:=LB_l_ForeColor/-256
		$_l_RGBColour:=(($_l_Red/$_l_Dividers) << 16)+(($_l_Green/$_l_Dividers) << 8)+($_l_Blue/$_l_Dividers)
		LB_Setdividers($_Ptr_ListBox; 0; 4)  //Both contextual
		LB_Setdividers($_Ptr_ListBox; -$_l_Colour; 8)  //horizontal contextual
		$_l_RGBColour:=(($_l_Red/$_l_Dividers) << 16)+(($_l_Green/$_l_Dividers) << 8)+($_l_Blue/$_l_Dividers)
		LB_Setdividers($_Ptr_ListBox; -$_l_Colour; 16)  //horizontal contextual
	Else 
		//$_l_Colour:=LB_l_ForeColor/-256
		$_l_RGBColour:=(($_l_Red/$_l_Dividers) << 16)+(($_l_Green/$_l_Dividers) << 8)+($_l_Blue/$_l_Dividers)
		LB_Setdividers($_Ptr_ListBox; -$_l_Colour; 2)  //Both contextual
		LB_Setdividers($_Ptr_ListBox; -$_l_Colour; 8)  //Both contextual
	End if 
	
	Case of 
		: ($_l_BackColourOptions=1) & (False:C215)  // plain white
			$_l_Colour:=1
			//LB_SetColours ($_Ptr_ListBox;Black ;1;Black ;1)
			LB_SetColours($_Ptr_ListBox; Black:K11:16; 0; (15*16)+1)
		: ($_l_BackColourOptions=0) & (False:C215)  // `osx grey
			$_l_Colour:=15*16
			//LB_SetColours ($_Ptr_ListBox;Black ;(15*16)+1;Black ;(15*16-1)+2)
			LB_SetColours($_Ptr_ListBox; Black:K11:16; ((15*16)+1); ((15*16-1)+2))
			
		: ($_l_BackColourOptions=3) & (False:C215)  // `gray sheen
			LB_SetColours($_Ptr_ListBox; Black:K11:16; ((15*16)+1); ((15*16-1)+2))
		: ($_l_BackColourOptions=2) & (False:C215)  // `Plain grey
			LB_SetColours($_Ptr_ListBox; Black:K11:16; (15*16)+1; (15*16)+1)
		Else   // `contextual sheen
			Case of 
				: (LB_t_ColorName="Blue")
					LB_SetColours($_Ptr_ListBox; Black:K11:16; (13*16); (15*16)+1)
					
				: (LB_t_ColorName="Green")
					LB_SetColours($_Ptr_ListBox; Black:K11:16; (11*16); (15*16)+1)
					
					
				: (LB_t_ColorName="Brown")
					LB_SetColours($_Ptr_ListBox; Black:K11:16; (9*16); (15*16)+1)
					
					
				: (LB_t_ColorName="Steel")
					LB_SetColours($_Ptr_ListBox; Black:K11:16; (15*16); (15*16)+1)
					
				: (LB_t_ColorName="Turquoise")
					LB_SetColours($_Ptr_ListBox; Black:K11:16; 192; 193)
					
					
				: (LB_t_ColorName="Purple")
					LB_SetColours($_Ptr_ListBox; Black:K11:16; (14*16); (15*16)+1)
					
					
				: (LB_t_ColorName="Wine")
					LB_SetColours($_Ptr_ListBox; Black:K11:16; (8*16); (15*16)+1)
					
				: (LB_t_ColorName="Orange")
					LB_SetColours($_Ptr_ListBox; Black:K11:16; (9*16); (15*16)+1)
					
			End case 
	End case 
End if 
DB_SetDefaultFonts
LB_SETFONT($_Ptr_ListBox; $_t_ObjectPrefix; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize; 0)
LB_SETFONT($_Ptr_ListBox; $_t_ObjectPrefix; 1; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize; 0)

LISTBOX SET ROWS HEIGHT:C835($_Ptr_ListBox->; 16)
ERR_MethodTrackerReturn("LB_StyleSettings"; $_t_oldMethodName)
