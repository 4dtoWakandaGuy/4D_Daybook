//%attributes = {}
If (False:C215)
	//Project Method Name:      Num2
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
	C_REAL:C285($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Num2")
//Num2 - does a num and makes it negative if in ()
$0:=Num:C11($1)
If (Substring:C12($1; 1; 1)="(")
	$0:=Gen_Round((0-$0); 2; 2)
End if 
ERR_MethodTrackerReturn("Num2"; $_t_oldMethodName)