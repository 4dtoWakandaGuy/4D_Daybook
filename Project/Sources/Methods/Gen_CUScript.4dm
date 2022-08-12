//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_CUScript
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/09/2012 23:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ST_abo_CodeUsed;0)
	//ARRAY INTEGER(CU_ai_CodeNo;0)
	//ARRAY INTEGER(CU_ai_CodeUsed;0)
	//ARRAY TEXT(CU_at_CodeUse;0)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_CUScript")
If (Count parameters:C259=0)
	
	CU_ai_CodeUsed{CU_ai_CodeUsed}:=Num:C11(CU_ai_CodeUsed{CU_ai_CodeUsed}=0)  //*(1-(2*(Num(◊Option)))))
Else 
	CU_ai_CodeUsed{$1}:=Num:C11(ST_abo_CodeUsed{$1})
	
End if 
CU_ai_CodeUsed:=0
CU_at_CodeUse:=0
CU_ai_CodeNo:=0
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("Gen_CUScript"; $_t_oldMethodName)