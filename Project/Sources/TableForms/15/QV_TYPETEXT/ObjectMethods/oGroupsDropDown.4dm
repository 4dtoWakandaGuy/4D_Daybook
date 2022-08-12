If (False:C215)
	//object Name: [USER]QV_TYPETEXT.Variable9
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
	//ARRAY BOOLEAN(QV_LB_Items;0)
	C_BOOLEAN:C305(QV_bo_AddAllowed; QV_bo_AlPopulated)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].QV_TYPETEXT.Variable9"; Form event code:C388)



If (QV_bo_AddAllowed)
	FORM GOTO PAGE:C247(2)
	
	QV_palletePowerviewSetup
	
	
End if 
QV_GroupPopUpScript


//AL_SetScroll (QV_l_Powerview;-2;-3)
LB_SetScroll(->QV_LB_Items; -2; -3)
ERR_MethodTrackerReturn("OBJ [USER].QV_TYPETEXT.Variable9"; $_t_oldMethodName)
