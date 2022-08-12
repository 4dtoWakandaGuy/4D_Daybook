//%attributes = {}
If (False:C215)
	//Project Method Name:      Cont_Dedup2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 21:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont_Dedup2")
DBI_MenuDisplayRecords("ContactsDedup")
ERR_MethodTrackerReturn("Cont_Dedup2"; $_t_oldMethodName)