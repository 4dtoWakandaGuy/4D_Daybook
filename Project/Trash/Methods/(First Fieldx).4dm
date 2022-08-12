//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      First_Fieldx
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2009 11:52:58If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterPosition)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $0; $2; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("First_Fieldx")
//First_Fieldx - called by First_Field
If (Count parameters:C259>=2)
	$_l_CharacterPosition:=Position:C15($2; $1->)
	If ($_l_CharacterPosition=0)
		$0:=Substring:C12($1->; 1; Length:C16($1->))
	Else 
		$0:=Substring:C12($1->; 1; $_l_CharacterPosition-1)
	End if 
	$1->:=Substring:C12($1->; Length:C16($0)+Length:C16($2)+1; 32000)
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("First_Fieldx"; $_t_oldMethodName)