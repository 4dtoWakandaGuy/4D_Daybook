If (False:C215)
	//object Name: [USER]List_Manager.Check Box3
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
	C_LONGINT:C283(STK_but_AddSub; CB_LP4)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_Manager.Check Box3"; Form event code:C388)
OBJECT SET VISIBLE:C603(STK_but_AddSub; (CB_LP4=1))
If (CB_LP4=1)
	OBJECT SET ENABLED:C1123(STK_but_AddSub; True:C214)
	//_O_ENABLE BUTTON(STK_but_AddSub)
Else 
	OBJECT SET ENABLED:C1123(STK_but_AddSub; False:C215)
End if 
ERR_MethodTrackerReturn("OBJ [USER].List_Manager.Check Box3"; $_t_oldMethodName)
