//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_CalculatedColumnLONG
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/11/2014 17:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OutputLong; $0)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_CalculatedColumnLONG")

$_l_OutputLong:=0
LB_CalculatedColumnANY($1; $2; $3; $4; Is longint:K8:6; ->$_l_OutputLong)



$0:=$_l_OutputLong
ERR_MethodTrackerReturn("LB_CalculatedColumnLONG"; $_t_oldMethodName)