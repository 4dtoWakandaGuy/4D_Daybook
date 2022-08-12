//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_CalculatedColumnREAL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/11/2014 17:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(LB_FM_COLUMCalcsInited)
	C_LONGINT:C283($_l_Event)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_REAL:C285($_r_OutputReal; $0)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_CalculatedColumnREAL")

If (False:C215)
	
Else 
	
	$_r_OutputReal:=0
	LB_CalculatedColumnANY($1; $2; $3; $4; Is real:K8:4; ->$_r_OutputReal)
	
	
	
	$0:=$_r_OutputReal
End if 
ERR_MethodTrackerReturn("LB_CalculatedColumnREAL"; $_t_oldMethodName)