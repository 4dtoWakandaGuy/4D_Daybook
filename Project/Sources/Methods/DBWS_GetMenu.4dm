//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_GetMenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2011 02:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName; $0; DB_t_MenusFormat)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_GetMenu")

$0:=""

If (Count parameters:C259=0)
	DB_t_MenusFormat:="JSON"
	Module_First
	
Else 
	
End if 

//
ERR_MethodTrackerReturn("DBWS_GetMenu"; $_t_oldMethodName)