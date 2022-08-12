//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cont Dedup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/11/2010 12:54
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

$_t_oldMethodName:=ERR_MethodTracker("Cont Dedup")

DBI_MenuDisplayRecords("ContactsDedup")
ERR_MethodTrackerReturn("Cont Dedup"; $_t_oldMethodName)