//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      CLEAN UP ARRAY
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_BlankRow)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CLEAN UP ARRAY")
Repeat 
	$_l_BlankRow:=Find in array:C230($1->; "")
	If ($_l_BlankRow>0)
		DELETE FROM ARRAY:C228($1->; $_l_BlankRow)
	End if 
Until ($_l_BlankRow<0)
ERR_MethodTrackerReturn("CLEAN UP ARRAY"; $_t_oldMethodName)