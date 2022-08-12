//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_RecordItem
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
	C_LONGINT:C283($2)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_RecordItem")
Menu_Record($1; "Menu Item "+("0"*(Num:C11($2<9)))+String:C10($2))
ERR_MethodTrackerReturn("Menu_RecordItem"; $_t_oldMethodName)