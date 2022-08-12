If (False:C215)
	//object Name: [CONTACTS]Contact_In.Field17
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Contact_In.Field17"; Form event code:C388)
If ([CONTACTS:1]Email_Address:35#"") & (Position:C15(Char:C90(64); [CONTACTS:1]Email_Address:35; *)<1)
	ALERT:C41("Email addresses must contain an @ sign!")
	GOTO OBJECT:C206([CONTACTS:1]Email_Address:35)
End if 
ERR_MethodTrackerReturn("OBJ [CONTACTS].Contact_In.Field17"; $_t_oldMethodName)
