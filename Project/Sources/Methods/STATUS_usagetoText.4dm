//%attributes = {}
If (False:C215)
	//Project Method Name:      STATUS_usagetoText
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/05/2010 18:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CU_abo_CodeUsed;0)
	//ARRAY INTEGER(CU_ai_CodeUsed;0)
	//ARRAY TEXT(CU_at_CodeUse;0)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName; $_t_UsageString; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STATUS_usagetoText")

//this method will load the status usage for a given status and return in a string the usage applicable to the status
$_t_UsageString:=""
Status_InLPCU
For ($_l_Index; 1; Size of array:C274(CU_abo_CodeUsed))
	If (CU_abo_CodeUsed{$_l_Index})
		If ($_t_UsageString="")
			$_t_UsageString:=CU_at_CodeUse{$_l_Index}
		Else 
			$_t_UsageString:=$_t_UsageString+","+CU_at_CodeUse{$_l_Index}
		End if 
	End if 
End for 
$0:=$_t_UsageString
ERR_MethodTrackerReturn("STATUS_usagetoText"; $_t_oldMethodName)
