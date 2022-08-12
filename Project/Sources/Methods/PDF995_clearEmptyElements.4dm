//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_clearEmptyElements
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 11:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_BlankRow)
	C_POINTER:C301($_ptr_TextArray; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_clearEmptyElements")

If (Count parameters:C259>0)
	$_ptr_TextArray:=$1
Else 
	$_ptr_TextArray:=$_ptr_TextArray
End if 

Case of 
	: (Is nil pointer:C315($_ptr_TextArray))
		
	Else 
		Repeat 
			IDLE:C311
			$_l_BlankRow:=Find in array:C230($_ptr_TextArray->; "")
			If ($_l_BlankRow>0)
				DELETE FROM ARRAY:C228($_ptr_TextArray->; $_l_BlankRow)
			End if 
		Until ($_l_BlankRow<0)
End case 

ERR_MethodTrackerReturn("PDF995_clearEmptyElements"; $_t_oldMethodName)
