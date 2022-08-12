If (False:C215)
	//object Name: [USER]SET_VERSION.oVer_Licence Version
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; bNoChangesMade)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SET_VERSION.oVer_Licence Version"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		OBJECT SET TITLE:C194(bNoChangesMade; "Save Changes")
End case 
ERR_MethodTrackerReturn("OBJ [USER].SET_VERSION.oVer_Licence Version"; $_t_oldMethodName)
