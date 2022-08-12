If (False:C215)
	//object Name: [USER]SP_ChooseAutoFiLL.Variable3
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
	C_LONGINT:C283(SP_rb_Choice1; SP_rb_Choice2; SP_rb_Choice3; SP_l_FindByClassID; SP_l_FindByGroupID; SP_l_FindByPersonID)
	C_TEXT:C284($_t_oldMethodName; SP_t_AdHocOwner)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SP_ChooseAutoFiLL.Variable3"; Form event code:C388)
Case of 
	: (SP_rb_Choice1=1)
		FORM GOTO PAGE:C247(2)
	: (SP_rb_Choice2=1)
		FORM GOTO PAGE:C247(3)
	: (SP_rb_Choice3=1)
		SP_l_FindByPersonID:=[SALES_PROJECTION:113]PersonnelOwnerID:4
		SP_l_FindByGroupID:=[SALES_PROJECTION:113]PersonnelGroupID:5
		SP_t_AdHocOwner:=[SALES_PROJECTION:113]ProjectionAdHocOwner:26
		SP_GetPreviousYears(SP_l_FindByPersonID; SP_l_FindByGroupID; SP_t_AdHocOwner; SP_l_FindByClassID)
		
		WS_AutoscreenSize(3; 265; 500)
		FORM GOTO PAGE:C247(4)
	Else 
		Gen_Alert("You must  type of autofill you require")
End case 
ERR_MethodTrackerReturn("OBJ [USER].SP_ChooseAutoFiLL.Variable3"; $_t_oldMethodName)
