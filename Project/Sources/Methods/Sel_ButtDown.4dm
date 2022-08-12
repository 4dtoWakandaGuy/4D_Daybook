//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_ButtDown
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
	C_DATE:C307(<>DB_d_CurrentDate)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_ButtDown")
If ($1->=!00-00-00!)
	If (Count parameters:C259>=2)
		If ($2->=!00-00-00!)
			$1->:=<>DB_d_CurrentDate
		Else 
			$1->:=$2->-1
		End if 
	Else 
		$1->:=Current date:C33(*)
	End if 
Else 
	$1->:=$1->-1
End if 
If (Count parameters:C259>=2)
	If ($2->=!00-00-00!)
		$2->:=<>DB_d_CurrentDate
	End if 
End if 
ERR_MethodTrackerReturn("Sel_ButtDown"; $_t_oldMethodName)