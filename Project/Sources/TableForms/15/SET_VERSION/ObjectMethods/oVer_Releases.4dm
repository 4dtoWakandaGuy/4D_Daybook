If (False:C215)
	//object Name: [USER]SET_VERSION.oVer_Releases
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(bNoChangesMade)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SET_VERSION.oVer_Releases"; Form event code:C388)
Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	: (Form event code:C388=On Clicked:K2:4)
		
		
		
		OBJECT SET TITLE:C194(bNoChangesMade; "Save Changes")
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SET_VERSION.oVer_Releases"; $_t_oldMethodName)
