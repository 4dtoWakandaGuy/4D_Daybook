If (False:C215)
	//object Name: [USER]User_In.oCheckBoxallprods
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 13:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CAT_bo_MaintainAllProds)
	C_LONGINT:C283($_l_event; CB_l_AllProds)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oCheckBoxallprods"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		CAT_bo_MaintainAllProds:=(CB_l_AllProds=1)
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oCheckBoxallprods"; $_t_oldMethodName)
