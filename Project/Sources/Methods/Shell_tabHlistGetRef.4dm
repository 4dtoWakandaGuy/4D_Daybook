//%attributes = {}
If (False:C215)
	//Project Method Name:      Shell_tabHlistGetRef
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
	C_LONGINT:C283($_l_SelectedItemsCount; $_l_TableNumber; $0; $1)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Shell_tabHlistGetRef")

$_l_TableNumber:=$1

If (Is a list:C621($_l_TableNumber))
	$_l_SelectedItemsCount:=Selected list items:C379($_l_TableNumber)
	GET LIST ITEM:C378($_l_TableNumber; $_l_SelectedItemsCount; $_l_SelectedItemsCount; $_t_ItemText)
End if 

$0:=$_l_SelectedItemsCount
ERR_MethodTrackerReturn("Shell_tabHlistGetRef"; $_t_oldMethodName)
