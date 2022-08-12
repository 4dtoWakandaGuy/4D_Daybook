//%attributes = {}
If (False:C215)
	//Project Method Name:      Remote_Decode
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
	C_LONGINT:C283($i; $_l_Number)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote_Decode")
$0:=""
For ($i; Length:C16($1); 2; -2)
	$_l_Number:=Num:C11(Substring:C12($1; $i; 1))
	$0:=$0+Char:C90((Character code:C91(Substring:C12($1; $i-1; 1))*2)+Num:C11($_l_Number>5))
End for 
ERR_MethodTrackerReturn("Remote_Decode"; $_t_oldMethodName)