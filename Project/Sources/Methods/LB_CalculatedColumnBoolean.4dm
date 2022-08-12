//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_CalculatedColumnBoolean
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/11/2014 17:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OutputBoolean; $0; LB_FM_COLUMCalcsInited)
	C_LONGINT:C283($_l_Event)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_CalculatedColumnBoolean")

$_bo_OutputBoolean:=False:C215
LB_CalculatedColumnANY($1; $2; $3; $4; Is boolean:K8:9; ->$_bo_OutputBoolean)
$0:=$_bo_OutputBoolean
ERR_MethodTrackerReturn("LB_CalculatedColumnBoolean"; $_t_oldMethodName)