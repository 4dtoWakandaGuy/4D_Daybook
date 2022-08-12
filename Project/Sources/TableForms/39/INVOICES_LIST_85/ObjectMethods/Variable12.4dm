If (False:C215)
	//object Name: [INVOICES]INVOICES_LIST_85.Variable12
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/04/2011 10:12
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].INVOICES_LIST_85.Variable12"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [INVOICES].INVOICES_LIST_85.Variable12"; $_t_oldMethodName)