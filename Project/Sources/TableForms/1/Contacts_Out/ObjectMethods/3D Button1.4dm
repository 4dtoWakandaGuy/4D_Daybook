If (False:C215)
	//object Name: [CONTACTS]Contacts_Out.3D Button1
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Contacts_Out.3D Button1"; Form event code:C388)
WT_SORT_TABLE_3(->[CONTACTS:1]; "Text7"; ->[CONTACTS:1]Surname:5)
ERR_MethodTrackerReturn("OBJ [CONTACTS].Contacts_Out.3D Button1"; $_t_oldMethodName)
