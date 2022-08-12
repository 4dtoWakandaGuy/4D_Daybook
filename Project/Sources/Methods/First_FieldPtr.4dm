//%attributes = {}
If (False:C215)
	//Project Method Name:      First_FieldPtr
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
	C_LONGINT:C283($_l_CharPosition; $_l_Length2; $_l_LengthInput; $_l_LengthReturn)
	C_POINTER:C301($1; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_Return; $_t_Text; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("First_FieldPtr")
//First_FieldPtr - pointer to the text variable instead of assuming vT
If (Not:C34(Is nil pointer:C315($1))) & (Not:C34(Is nil pointer:C315($3)))
	$_l_LengthInput:=Length:C16($1->)
	$_l_CharPosition:=Position:C15($2; $1->)
	If ($_l_CharPosition=0)
		$_t_Return:=Substring:C12($1->; 1; $_l_LengthInput)
	Else 
		$_t_Return:=Substring:C12($1->; 1; $_l_CharPosition-1)
	End if 
	$_l_LengthReturn:=Length:C16($_t_Return)
	$_l_Length2:=Length:C16($2)
	$3->:=$_t_Return
	$1->:=Substring:C12($1->; $_l_LengthReturn+$_l_Length2+1; $_l_LengthInput)
	
End if 
ERR_MethodTrackerReturn("First_FieldPtr"; $_t_oldMethodName)