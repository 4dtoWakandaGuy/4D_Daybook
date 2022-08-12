//%attributes = {}

If (False:C215)
	//Database Method Name:      LB_SetdividersByObjectNameByObjectName
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
	C_LONGINT:C283($_l_Color; $_l_ObjectColor; $_l_Option; $2; $3)
	C_TEXT:C284($_t_OBjectName; $_t_oldMethodName; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LB_SetdividersByObjectName")
//The method will mimic (Sort of) AL_Set dividers
//AL_SetDividers (AreaName;ColDividerPattern;ColDividerColor1;ColDividerColor2;RowDividerPattern;RowDividerColor1;RowDividerColor2)

If (Count parameters:C259>=3)
	$_t_OBjectName:=$1
	$_l_ObjectColor:=$2
	$_l_Option:=$3
	
	Case of 
		: ($_l_Option=0)  // Grid off
			LISTBOX SET GRID:C841(*; $_t_OBjectName; False:C215; False:C215)
		: ($_l_Option=1)  // Vertical on horizontal off
			LISTBOX SET GRID:C841(*; $_t_OBjectName; True:C214; False:C215)
		: ($_l_Option=2)  // Vertical on horizontal off
			LISTBOX SET GRID:C841(*; $_t_OBjectName; False:C215; True:C214)
		: ($_l_Option=4)  // both on
			LISTBOX SET GRID:C841(*; $_t_OBjectName; True:C214; True:C214)
			
		: ($_l_Option=8)  // Vertical only
			
			LISTBOX SET GRID COLOR:C842(*; $_t_OBjectName; $_l_Color; False:C215; True:C214)
		: ($_l_Option=16)  // Horizontal  only
			LISTBOX SET GRID COLOR:C842(*; $_t_OBjectName; $_l_Color; True:C214; False:C215)
		: ($_l_Option=32)  // Horizontal and vertical
			LISTBOX SET GRID COLOR:C842(*; $_t_OBjectName; $_l_Color; True:C214; True:C214)
	End case 
	
End if 
ERR_MethodTrackerReturn("LB_SetdividersByObjectName"; $_t_oldMethodName)