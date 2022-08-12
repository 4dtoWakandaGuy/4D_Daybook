//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      First_Tab2
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
	C_LONGINT:C283($_l_CharPosition; $_l_CharPositions)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("First_Tab2")
$_l_CharPosition:=Position:C15(Char:C90(9); $1)
If ($_l_CharPosition=0)
	$0:=$1
Else 
	$0:=Substring:C12($1; 1; $_l_CharPositions-1)
End if 
ERR_MethodTrackerReturn("First_Tab2"; $_t_oldMethodName)