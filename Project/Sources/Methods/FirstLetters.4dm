//%attributes = {}
If (False:C215)
	//Project Method Name:      FirstLetters
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FirstLetters")
//FirstLetters
$_l_Index:=1
$0:=""
While ($_l_Index<=Length:C16($1))
	IDLE:C311  // 03/04/03 pb
	If (Character code:C91(Substring:C12($1; $_l_Index; 1))<65)
		$_l_Index:=2000
	Else 
		$0:=$0+Substring:C12($1; $_l_Index; 1)
		$_l_Index:=$_l_Index+1
	End if 
End while 
ERR_MethodTrackerReturn("FirstLetters"; $_t_oldMethodName)