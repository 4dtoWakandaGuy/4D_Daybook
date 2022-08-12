//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Progress2 Call
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
	C_LONGINT:C283($_l_Number; $1; $3; $4)
	C_TEXT:C284(<>Progress2; $_t_oldMethodName; $_t_String; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Progress2 Call")
//Progress2 Call

If ($1>0)
	If ($2="")
		<>Progress2:=""
		RESUME PROCESS:C320($1)
	Else 
		//$_l_Number:=Int((($3/$4)*10)+0.2)
		Case of 
			: ($4<1000)
				$_l_Number:=Int:C8(($3/$4*10)+0.2)
			: ($4<10000)
				$_l_Number:=Int:C8(($3/$4*100)+0.2)
			: ($4<100000)
				$_l_Number:=Int:C8(($3/$4*1000)+0.2)
		End case 
		
		$_t_String:=("0"*(Num:C11($_l_Number<10)))+String:C10($_l_Number)
		<>Progress2:=$_t_String+":"+$2
		If ($_l_Number=10)
			RESUME PROCESS:C320($1)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Progress2 Call"; $_t_oldMethodName)
