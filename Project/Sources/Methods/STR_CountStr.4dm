//%attributes = {}
If (False:C215)
	//Project Method Name:      STR_CountStr
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
	C_LONGINT:C283($_l_CharPosition; $_l_Count; $0)
	C_TEXT:C284($_t_oldMethodName; $_t_Text; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_CountStr")
//*******************************************************************
//
//Method: STR_CountStr
//
//Written by  Rollo on 10/21/98
//
//Purpose:
//
//$1 - type -purpose
//
//
//******************************************************************************

If (Count parameters:C259>=2)
	$_t_Text:=$1
	
	//this can probably be optimised
	$_l_Count:=0
	$_l_CharPosition:=Position:C15($2; $_t_Text)
	While ($_l_CharPosition>0)
		$_t_Text:=Substring:C12($_t_Text; $_l_CharPosition+1)
		$_l_CharPosition:=Position:C15($2; $_t_Text)
		$_l_Count:=$_l_Count+1
	End while 
End if 
$0:=$_l_Count
ERR_MethodTrackerReturn("STR_CountStr"; $_t_oldMethodName)
