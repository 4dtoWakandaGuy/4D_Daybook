//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_CalculatedColumnDATE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/11/2014 17:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_OutputDate; $0)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_CalculatedColumnDATE")


$_d_OutputDate:=!00-00-00!
LB_CalculatedColumnANY($1; $2; $3; $4; Is date:K8:7; ->$_d_OutputDate)
$0:=$_d_OutputDate
ERR_MethodTrackerReturn("LB_CalculatedColumnDATE"; $_t_oldMethodName)