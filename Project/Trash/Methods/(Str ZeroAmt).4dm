//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      
	Str_ZeroAmt
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
	C_LONGINT:C283($2)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str ZeroAmt")
If (Count parameters:C259>=2)
	$0:=Str LeadZeros(String:C10(Round:C94(($1*100); 0)); $2)
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Str ZeroAmt"; $_t_oldMethodName)