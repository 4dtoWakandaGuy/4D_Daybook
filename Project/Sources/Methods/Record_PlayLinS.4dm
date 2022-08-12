//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_PlayLinS
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
	C_LONGINT:C283($_l_CharPosition)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; vMT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_PlayLinS")
//Record_PlayLinS - simple version on Record_PlayLine
//C_TEXT($0)
If (Count parameters:C259>=1)
	If (Not:C34(Is nil pointer:C315($1)))
		
		First_FieldPtr(->vMT; Char:C90(13); $1)
		Str_StripComm($1->; $1)
		RemoveLeadTr($1->; $1)
		$_l_CharPosition:=Position:C15("("; $1->)
		If ($_l_CharPosition>0)
			RemoveLeadTr(Substring:C12($1->; 1; $_l_CharPosition-1); $1)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Record_PlayLinS"; $_t_oldMethodName)
