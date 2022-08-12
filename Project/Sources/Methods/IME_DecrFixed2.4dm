//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_DecrFixed2
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
	C_TEXT:C284(<>iEncrypt; $_t_Input; $_t_oldMethodName; $_t_Output; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_DecrFixed2")
//Method:  IME_DecrFixed2
$_t_Input:=$1
$_t_Output:=""

If ($_t_Input="*@")
	$_t_Input:=Substring:C12($_t_Input; 2)
End if 
If ((<>iEncrypt="") | ($_t_Input=""))
	$_t_Output:=$_t_Input
Else 
	$_t_Output:=IME_DecrFixed3($_t_Input)
End if 

$0:=$_t_Output
ERR_MethodTrackerReturn("IME_DecrFixed2"; $_t_oldMethodName)