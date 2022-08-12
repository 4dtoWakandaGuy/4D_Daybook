//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetFilterObject
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/01/2013 00:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_AllignLeft; $_l_BestHeight; $_l_BestWidth; $_l_FiltersBoxBottom; $_l_FiltersBoxLeft; $_l_FiltersBoxRight; $_l_FiltersBoxTop; $_l_Height; $_l_LastBottom; $_l_LastLeft; $_l_LastRight)
	C_LONGINT:C283($_l_LastTop; $_l_ListBoxWidth; $_l_Offset; $_l_ScrollBoxLeft; $0; $1; $2; $4)
	C_POINTER:C301($_Ptr_LabelWidth; $5; $6)
	C_TEXT:C284($_t_ObjectName; $_t_OldMethodName; $3)
End if 

//Code Starts Here


$_t_OldMethodName:=ERR_MethodTracker("DB_SetFilterObject")
If (Count parameters:C259>=5)
	$_l_Offset:=$1
	$_l_Height:=$2
	$_t_ObjectName:=$3
	$_l_ListBoxWidth:=$4
	$_Ptr_LabelWidth:=$5
	
	OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
	$_l_ScrollBoxLeft:=($_l_FiltersBoxRight-6)-$_l_ListBoxWidth  //$_l_FiltersBoxLeft+72
	$_l_AllignLeft:=$_l_FiltersBoxLeft+6
	
	OBJECT SET VISIBLE:C603(*; $_t_ObjectName+"@"; True:C214)
	OBJECT GET BEST SIZE:C717(*; $_t_ObjectName+"Label"; $_l_BestWidth; $_l_BestHeight)
	OBJECT MOVE:C664(*; $_t_ObjectName+"Label"; ($_l_ScrollBoxLeft-5)-$_l_BestWidth; $_l_FiltersBoxTop+$_l_Offset; $_l_ScrollBoxLeft-5; $_l_FiltersBoxTop+$_l_Offset+14; *)
	$_Ptr_LabelWidth->:=$_l_BestWidth
	
	OBJECT MOVE:C664(*; $_t_ObjectName; $_l_ScrollBoxLeft; $_l_FiltersBoxTop+$_l_Offset; $_l_FiltersBoxRight-5; $_l_FiltersBoxTop+$_l_Offset+$_l_Height; *)
	OBJECT GET COORDINATES:C663(*; $_t_ObjectName; $_l_LastLeft; $_l_LastTop; $_l_LastRight; $_l_LastBottom)
	$0:=$_l_LastBottom-$_l_FiltersBoxTop
End if 
ERR_MethodTrackerReturn("DB_SetFilterObject"; $_t_OldMethodName)