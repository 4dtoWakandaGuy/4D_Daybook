//%attributes = {}

If (False:C215)
	//Database Method Name:      LB_StyleSettingsByObjectName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  29/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(INT_bo_SkinsPrefsLoaded)
	C_LONGINT:C283(<>SYS_l_DefaultBoldFontSize; <>SYS_l_DefaultPlainFontSize; $_l_BackGroundColorOption; $_l_Blue; $_l_ColorOption; $_l_FontSIze; $_l_Green; $_l_Red; $_l_RgbColor; $_l_SkinsID; $3)
	C_LONGINT:C283($6; $8; LB_l_ForeColor)
	C_POINTER:C301($_ptr_Table; $5)
	C_REAL:C285($_r_Division)
	C_TEXT:C284(<>SYS_t_DefaultFontBold; <>SYS_t_DefaultFontPlain; $_t_AreaName; $_t_ColorName; $_t_ObjectNamePrefix; $_t_OldMethodName; $1; $2; $4; $7; LB_t_ColorName)
	C_TEXT:C284(WIN_t_CurrentInputForm)
End if 

//Code Starts Here
$_t_OldMethodName:=ERR_MethodTracker("LB_StyleSettingsByObjectName")
//LB_StyleSettingsByObjectName
// 29/06/06 pb
// Sets the font, colours, etc. for Listbox areas

// parameters: $1 = pointer to the Listbox area
//                    $2 = colour name for?
//                    $3 = the font size to use
//                    $4 = the object prefix
//                    $5 = pointer to the table

// example: LB_StyleSettingsByObjectName ($_t_AreaName;$_ptr_ArrayReferences->{2};$_ptr_ArrayofColumnFonts->{1};ObjectPrefix;->[table])
If (Undefined:C82(WIN_t_CurrentInputForm))
	WIN_t_CurrentInputForm:=""
End if 

//◊FontBold:="Charcoal"
//◊FontPlain:="Charcoal CY"

LB_l_ForeColor:=0
LB_t_ColorName:=""
$_t_AreaName:=$1
$_l_FontSIze:=$3
$_t_ObjectNamePrefix:=$4
$_ptr_Table:=$5
$_t_ColorName:=$2

$_l_SkinsID:=INT_SkinsPrefs


$_r_Division:=Int:C8(65536/256)
If (Count parameters:C259>=6)
	LB_l_ForeColor:=$6
	If (Count parameters:C259>=7)
		LB_t_ColorName:=$7
	End if 
End if 

If (Count parameters:C259>=8)
	$_l_BackGroundColorOption:=$8
End if 
If (WIN_t_CurrentInputForm="Diary_View@")
	//$_l_BackGroundColorOption:=AA_CheckModified (Table(->[COMPANIES]);WIN_t_CurrentInputForm;->LB_l_ForeColor;->LB_t_ColorName)
Else 
	$_l_BackGroundColorOption:=LB_GetFormcolour(Table:C252($_ptr_Table); WIN_t_CurrentInputForm; ->LB_l_ForeColor; ->LB_t_ColorName)
End if 
//here we will get the color from the table
If (LB_l_ForeColor=0)
	Case of 
		: ($_t_ColorName="Blue")
			$_t_ColorName:="Blue"
			$_l_ColorOption:=224
		: ($_t_ColorName="Green")
			$_t_ColorName:="Green"
			$_l_ColorOption:=192
		: ($_t_ColorName="Orange")
			$_t_ColorName:="Yellow"
			$_l_ColorOption:=3
		: ($_t_ColorName="Red")
			$_t_ColorName:="Red"
			$_l_ColorOption:=141
		: ($_t_ColorName="Cyan")
			$_t_ColorName:="Cyan"
			$_l_ColorOption:=208
		: ($_t_ColorName="Grey")
			$_t_ColorName:="Grey"
			$_l_ColorOption:=12
		: ($_t_ColorName="BrRed")
			$_t_ColorName:="Red"
			$_l_ColorOption:=4
		Else 
			//Gen_Alert ("Listbox style setting not set for this option needs to be taught "+$_ptr_ArrayReferences->{2})
			$_l_ColorOption:=16
			$_t_ColorName:="Black"
	End case 
End if 

LB_SetDividersByObjectName($_t_AreaName; -Light grey:K11:13; 32)  //Both black
LB_SetColorsByObjectName($_t_AreaName; Black:K11:16; Grey:K11:15; Light grey:K11:13)

If (LB_l_ForeColor#0)
	$_r_Division:=1
	//TRACE
	
	//LB_GetRGB (LB_l_ForeColor;->$_l_Red;->$_l_Green;->$_l_Blue)
	$_l_ColorOption:=LB_l_ForeColor/-256
	$_l_RgbColor:=(($_l_Red/$_r_Division) << 16)+(($_l_Green/$_r_Division) << 8)+($_l_Blue/$_r_Division)
	LB_SetDividersByObjectName($_t_AreaName; 0; 4)  //Both contextual
	LB_SetDividersByObjectName($_t_AreaName; -$_l_ColorOption; 8)  //horizontal contextual
	$_l_RgbColor:=(($_l_Red/$_r_Division) << 16)+(($_l_Green/$_r_Division) << 8)+($_l_Blue/$_r_Division)
	LB_SetDividersByObjectName($_t_AreaName; -$_l_ColorOption; 16)  //horizontal contextual
Else 
	//$_l_ColorOption:=LB_l_ForeColor/-256
	$_l_RgbColor:=(($_l_Red/$_r_Division) << 16)+(($_l_Green/$_r_Division) << 8)+($_l_Blue/$_r_Division)
	LB_SetDividersByObjectName($_t_AreaName; -$_l_ColorOption; 2)  //Both contextual
	LB_SetDividersByObjectName($_t_AreaName; -$_l_ColorOption; 8)  //Both contextual
End if 

Case of 
	: ($_l_BackGroundColorOption=1)  // plain white
		$_l_ColorOption:=1
		//LB_SetColorsByObjectName ($_t_AreaName;Black ;1;Black ;1)
		LB_SetColorsByObjectName($_t_AreaName; Black:K11:16; 0; (15*16)+1)
	: ($_l_BackGroundColorOption=0)  // `osx grey
		$_l_ColorOption:=15*16
		//LB_SetColorsByObjectName ($_t_AreaName;Black ;(15*16)+1;Black ;(15*16-1)+2)
		LB_SetColorsByObjectName($_t_AreaName; Black:K11:16; ((15*16)+1); ((15*16-1)+2))
		
	: ($_l_BackGroundColorOption=3)  // `gray sheen
		LB_SetColorsByObjectName($_t_AreaName; Black:K11:16; ((15*16)+1); ((15*16-1)+2))
	: ($_l_BackGroundColorOption=2)  // `Plain grey
		LB_SetColorsByObjectName($_t_AreaName; Black:K11:16; (15*16)+1; (15*16)+1)
	Else   // `contextual sheen
		Case of 
			: (LB_t_ColorName="Blue")
				LB_SetColorsByObjectName($_t_AreaName; Black:K11:16; (13*16); (15*16)+1)
				
			: (LB_t_ColorName="Green")
				LB_SetColorsByObjectName($_t_AreaName; Black:K11:16; (11*16); (15*16)+1)
				
				
			: (LB_t_ColorName="Brown")
				LB_SetColorsByObjectName($_t_AreaName; Black:K11:16; (9*16); (15*16)+1)
				
				
			: (LB_t_ColorName="Steel")
				LB_SetColorsByObjectName($_t_AreaName; Black:K11:16; (15*16); (15*16)+1)
				
			: (LB_t_ColorName="Turquoise")
				LB_SetColorsByObjectName($_t_AreaName; Black:K11:16; 192; 193)
				
				
			: (LB_t_ColorName="Purple")
				LB_SetColorsByObjectName($_t_AreaName; Black:K11:16; (14*16); (15*16)+1)
				
				
			: (LB_t_ColorName="Wine")
				LB_SetColorsByObjectName($_t_AreaName; Black:K11:16; (8*16); (15*16)+1)
				
			: (LB_t_ColorName="Orange")
				LB_SetColorsByObjectName($_t_AreaName; Black:K11:16; (9*16); (15*16)+1)
				
		End case 
End case 
DB_SetDefaultFonts
LB_SetFontByObjectName($_t_AreaName; $_t_ObjectNamePrefix; 1; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize; 0)
LB_SetFontByObjectName($_t_AreaName; $_t_ObjectNamePrefix; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize; 0)
LISTBOX SET ROWS HEIGHT:C835(*; $_t_AreaName; 16)
ERR_MethodTrackerReturn("LB_StyleSettingsByObjectName"; $_t_OldMethodName)