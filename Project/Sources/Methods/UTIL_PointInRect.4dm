//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      UTIL_PointInRect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 14:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_PositionLeft; $_l_PositionTop; $1; $2; $4; $5; $6)
	C_LONGINT:C283($7)
	C_POINTER:C301($_ptr_object; $3)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTIL_PointInRect")

$_l_PositionLeft:=$1
$_l_PositionTop:=$2

If (Count parameters:C259=3)
	$_ptr_object:=$3
	OBJECT GET COORDINATES:C663($_ptr_object->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	
Else 
	$_l_ObjectLeft:=$4
	$_l_ObjectTop:=$5
	$_l_ObjectRight:=$6
	$_l_ObjectBottom:=$7
	
End if 

//========================    Method Actions    ==================================

$0:=($_l_PositionLeft>=$_l_ObjectLeft) & ($_l_PositionLeft<=$_l_ObjectRight) & ($_l_PositionTop>=$_l_ObjectTop) & ($_l_PositionTop<=$_l_ObjectBottom)

//========================    Clean up and Exit    =================================
ERR_MethodTrackerReturn("UTIL_PointInRect"; $_t_oldMethodName)
