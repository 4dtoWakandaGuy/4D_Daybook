//%attributes = {}
If (False:C215)
	//Project Method Name:      WT_CalenderConfig
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(CW_d_SelectDate)
	C_LONGINT:C283(<>cwSelectColor; <>cwSelectStyle; <>cwStartWeekOn; $_l_SelectStyle; STYLE0; STYLE1; STYLE16; STYLE2; STYLE4; STYLE8)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WT_CalenderConfig")
CW_d_SelectDate:=Current date:C33
CW_SetCalendar(CW_d_SelectDate)

aStartDay:=<>cwStartWeekOn
//aStartDay{0}:=aStartDay{aStartDay}

//aColorSelect:=<>cwSelectColor+1
//aColorSelect{0}:=aColorSelect{aColorSelect}

Style0:=0
Style1:=0
Style2:=0
Style4:=0
Style8:=0
Style16:=0

If (<>cwSelectStyle=0)
	Style0:=1
Else 
	$_l_SelectStyle:=<>cwSelectStyle
	If ($_l_SelectStyle>=16)
		$_l_SelectStyle:=$_l_SelectStyle-16
		Style16:=1
	End if 
	If ($_l_SelectStyle>=8)
		$_l_SelectStyle:=$_l_SelectStyle-8
		Style8:=1
	End if 
	If ($_l_SelectStyle>=4)
		$_l_SelectStyle:=$_l_SelectStyle-4
		Style4:=1
	End if 
	If ($_l_SelectStyle>=2)
		$_l_SelectStyle:=$_l_SelectStyle-2
		Style2:=1
	End if 
	If ($_l_SelectStyle>=1)
		Style1:=1
	End if 
End if 
ERR_MethodTrackerReturn("WT_CalenderConfig"; $_t_oldMethodName)
