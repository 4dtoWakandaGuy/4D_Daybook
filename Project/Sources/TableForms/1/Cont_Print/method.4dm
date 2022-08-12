If (False:C215)
	//Table Form Method Name: [CONTACTS]Cont_Print
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
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


$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS].Cont_Print"; Form event code:C388)
Contact_Details
ERR_MethodTrackerReturn("FM [CONTACTS].Cont_Print"; $_t_oldMethodName)
