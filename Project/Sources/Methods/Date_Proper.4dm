//%attributes = {}
If (False:C215)
	//Project Method Name:      Date_Proper
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($0)
	C_LONGINT:C283($_l_Year3; $1; $2; $3)
	C_REAL:C285($_l_Year2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Date_Proper")

$0:=Date_FromNums($1; $2; $3)
If ($1>28)
	If ($2=2)
		$3:=Year of:C25($0)
		$_l_Year2:=($3-1988)/4
		$_l_Year3:=Int:C8($_l_Year2)
		If ($_l_Year2=$_l_Year3)
			$0:=Date_FromNums(29; $2; $3)
		Else 
			$0:=Date_FromNums(28; $2; $3)
		End if 
	Else 
		If ($1>30)
			If (($2=4) | ($2=6) | ($2=9) | ($2=11))
				$0:=Date_FromNums(30; $2; $3)
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Date_Proper"; $_t_oldMethodName)