//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_GetTableWebCall
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/11/2012 07:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("DBWS_GetTableWebCall")
If ($1#"")
	
	
End if 
ERR_MethodTrackerReturn("DBWS_GetTableWebCall"; $_t_oldMethodName)