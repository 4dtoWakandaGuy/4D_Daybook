//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_EmailAddr
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
	C_LONGINT:C283($_l_CharIndex; $_l_CharPosition; $3)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; MOD_FieldValue)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_EmailAddr")

If ($3=1)
	$1->:=$1->+" "
	$_l_CharIndex:=Length:C16($1->)
	$_l_CharPosition:=Position:C15(Char:C90(64); $1->)
	If ($_l_CharPosition>0)
		Case of 
			: ($_l_CharPosition=1)
				$1->:=Substring:C12($1->; 2; $_l_CharIndex)
			: ($_l_CharPosition=$_l_CharIndex)
				$1->:=Substring:C12($1->; 1; $_l_CharIndex-1)
			Else 
				$2->:=Substring:C12($1->; $_l_CharPosition+1; $_l_CharIndex)
				$1->:=Substring:C12($1->; 1; $_l_CharPosition-1)
		End case 
	End if 
Else 
	$1->:=$1->+" "
	$_l_CharIndex:=Length:C16($2->)
	$_l_CharPosition:=Position:C15(Char:C90(64); $2->)
	If ($_l_CharPosition>0)
		Case of 
			: ($_l_CharPosition=1)
				$2->:=Substring:C12($2->; 2; $_l_CharIndex)
			: ($_l_CharPosition=$_l_CharIndex)
				$2->:=Substring:C12($2->; 1; $_l_CharIndex-1)
			Else 
				$1->:=Substring:C12($2->; 1; $_l_CharPosition-1)
				$2->:=Substring:C12($2->; $_l_CharPosition+1; $_l_CharIndex)
		End case 
	End if 
End if 
MOD_FieldValue:=""
RemoveLeadTr($1->; ->MOD_FieldValue)
$1->:=Replace string:C233(Str_SpaceDot(Str_StripDel(MOD_FieldValue)); ".."; ".")
MOD_FieldValue:=""
RemoveLeadTr($2->; ->MOD_FieldValue)
$2->:=Replace string:C233(Str_SpaceDot(Str_StripDel(MOD_FieldValue)); ".."; ".")
ERR_MethodTrackerReturn("Gen_EmailAddr"; $_t_oldMethodName)