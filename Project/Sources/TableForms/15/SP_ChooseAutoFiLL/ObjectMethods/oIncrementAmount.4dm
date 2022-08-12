If (False:C215)
	//object Name: [USER]SP_ChooseAutoFiLL.Variable6
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
	C_REAL:C285(SP_R_AFTargetAmount2; SP_R_AFTargetAmount3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SP_ChooseAutoFiLL.Variable6"; Form event code:C388)
If (SP_R_AFTargetAmount2>0)
	OBJECT SET VISIBLE:C603(SP_R_AFTargetAmount3; False:C215)
	OBJECT SET VISIBLE:C603(*; "SP_T_LabelPercent"; False:C215)
Else 
	OBJECT SET VISIBLE:C603(SP_R_AFTargetAmount3; True:C214)
	OBJECT SET VISIBLE:C603(*; "SP_T_LabelPercent"; True:C214)
End if 
ERR_MethodTrackerReturn("OBJ [USER].SP_ChooseAutoFiLL.Variable6"; $_t_oldMethodName)
