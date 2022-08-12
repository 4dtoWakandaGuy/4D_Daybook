//%attributes = {}
If (False:C215)
	//Project Method Name:      Calc_Year
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calc_Year")
If ($1=0)
	$0:=$1
Else 
	If ($1<30)
		$0:=Year of:C25(<>DB_d_CurrentDate)-$1
	Else 
		If ($1<100)
			$0:=$1+1900
		Else 
			$0:=$1
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Calc_Year"; $_t_oldMethodName)