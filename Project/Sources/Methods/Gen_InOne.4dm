//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_InOne
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>OneEntry)
	C_TEXT:C284($_t_oldMethodName; DB_t_CallOnCloseorSave)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_InOne")
If (<>OneEntry)
	DB_t_CallOnCloseorSave:="Close"
Else 
	If (DB_t_CallOnCloseorSave="AS")  //for Access Switch
		OK:=1  //Necessary cos it wrongly returns 0
	End if 
End if 
ERR_MethodTrackerReturn("Gen_InOne"; $_t_oldMethodName)