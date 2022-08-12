//%attributes = {}

If (False:C215)
	//Database Method Name:      LB_SetColorsByObjectName
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
	C_LONGINT:C283($_l_AltBackGround; $_l_BackGround; $_l_Color; $_l_Color2; $_l_FOreground; $2; $3; $4)
	C_TEXT:C284($_t_AltBackGround; $_t_BackGround; $_t_Foreground; $_t_ObjectName; $_t_OldMethodName; $1)
End if 

//Code Starts Here
$_t_OldMethodName:=ERR_MethodTracker("LB_SetColours")
//Color:=-(Foreground+(256 * Background))
// $1 = pointer to the object (e.g., listbox column (array)
// $2 = foreground colour
// $3 = background colour
// $4 (optional) - 2nd bg colour for stripey effect

// examples:
//LB_SetColours (->atOne;0;255;243)  ` stripey - white font black/grey stipes
//LB_SetColours (->atOne;0;255)  ` white font/ black bg
//LB_SetColours (->atOne;255;243;0)  ` black font/ grey+white stripey bg
//LB_SetColours (->atOne;White ;Black ;Light Grey )  ` stripey - white font black/grey stipes
//LB_SetColours (->SC_lb_PROD;Black ;Grey ;Light Grey )  ` stripey - black font light grey/grey stipes

If (Count parameters:C259>=3)
	$_t_ObjectName:=$1
	$_l_FOreground:=$2
	$_l_BackGround:=$3
	If (Count parameters:C259>=4)
		$_l_AltBackGround:=$4
	End if 
	Case of 
		: (Count parameters:C259=3)
			$_l_Color:=-($_l_FOreground+(256*$_l_BackGround))
			//_O_OBJECT SET COLOR(*;$_t_ObjectName;$_l_Color)
			$_t_Foreground:=UTIL_4DColorToRGB($_l_Foreground)
			$_t_BackGround:=UTIL_4DColorToRGB($_l_BackGround)
			
			OBJECT SET RGB COLORS:C628(*; $_t_ObjectName; $_t_Foreground; $_t_BackGround)
			
		: (Count parameters:C259=4)
			//$_l_Color:=-($_l_FOreground+(256*$_l_BackGround))
			//$_l_Color2:=-($4+(256*$5))
			//$_l_Color2:=-($_l_FOreground+(256*$_l_AltBackGround))
			//_O_OBJECT SET COLOR(*;$_t_ObjectName;$_l_Color;$_l_Color2)
			$_t_Foreground:=UTIL_4DColorToRGB($_l_Foreground)
			$_t_BackGround:=UTIL_4DColorToRGB($_l_BackGround)
			$_t_AltBackGround:=UTIL_4DColorToRGB($_l_AltBackGround)
			
			OBJECT SET RGB COLORS:C628(*; $_t_ObjectName; $_t_Foreground; $_t_BackGround; $_t_AltBackGround)
			
	End case 
	
End if 
ERR_MethodTrackerReturn("LB_SetColours"; $_t_OldMethodName)