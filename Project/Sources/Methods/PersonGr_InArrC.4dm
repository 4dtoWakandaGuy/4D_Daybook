//%attributes = {}
If (False:C215)
	//Project Method Name:      PersonGr_InArrC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CU_at_CodeUse;0)
	//Array INTEGER(CU_ai_CodeNo;0)
	//Array INTEGER(CU_ai_CodeUsed;0)
	//Array REAL(GEN_ar_Value;0)
	//Array TEXT(SVS_at_PreviewTypeN;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PersonGr_InArrC")
//PersonGr_InArrC - Array clear
CU_at_CodeUse:=0
SVS_at_PreviewTypeN:=0
CU_ai_CodeUsed:=0
CU_ai_CodeNo:=0
GEN_ar_Value:=0
ERR_MethodTrackerReturn("PersonGr_InArrC"; $_t_oldMethodName)