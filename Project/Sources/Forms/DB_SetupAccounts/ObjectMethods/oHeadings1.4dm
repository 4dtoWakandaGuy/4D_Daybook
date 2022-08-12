If (False:C215)
	//object Name: Object Name:      DB_SetupAccounts.oHeadings1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2013 15:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_lb_Headings;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_SetupAccounts.oHeadings1"; Form event code:C388)

LB_SetColumnWidths(->ACC_lb_Headings; "oACH"; 1; 20; 20; 60; 0; 140; 60)
//FORM GOTO PAGE(2)
ERR_MethodTrackerReturn("OBJ DB_SetupAccounts.oHeadings1"; $_t_oldMethodName)