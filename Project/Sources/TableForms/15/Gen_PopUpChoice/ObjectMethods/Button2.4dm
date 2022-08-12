If (False:C215)
	//object Name: [USER]Gen_PopUpChoice.Button2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(GEN_at_LongPopUp;0)
	C_BOOLEAN:C305(POP_bo_ShowLongString; Gen_bo_Create)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Gen_PopUpChoice.Button2"; Form event code:C388)
Gen_bo_Create:=True:C214

If (POP_bo_ShowLongString)
	GEN_at_DropDownMenu:=0
Else 
	GEN_at_LongPopUp:=0
End if 
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].Gen_PopUpChoice.Button2"; $_t_oldMethodName)