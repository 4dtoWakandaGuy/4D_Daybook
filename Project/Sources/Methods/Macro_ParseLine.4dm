//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_ParseLine
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
	C_LONGINT:C283($_l_CharacterPosition; $_l_CharPosition; $_l_CharPositionos2)
	C_POINTER:C301($1; $2; $3; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Macro_ParseLine")
//C_TEXT($0)  `see also Record_PagLine & Record_PlayLinS
If (Count parameters:C259>=1)
	If (Not:C34(Is nil pointer:C315($1)))
		First_FieldPtr($2; Char:C90(13); $1)
		Str_StripComm($1->; $1)
		RemoveLeadTr($1->; $1)
		RemoveLeadTr($1->; $3)
		$4->:=$3->
		$_l_CharPosition:=Position:C15("("; $3->)
		If ($_l_CharPosition=0)
			// $
			$1->:=$3->
			
		Else 
			RemoveLeadTr(Substring:C12($3->; 1; $_l_CharPosition-1); $1)
		End if 
		If ($3->="@Request@")
			$_l_CharPosition:=Position:C15("Request"; $3->)
			If ($_l_CharPosition>3)
				If ((Substring:C12($3->; $_l_CharPosition-2; 2)=":=") | ((Substring:C12($3->; $_l_CharPosition-1; 1)="(") & (Substring:C12($3->; $_l_CharPosition+7; 1)="(")) | ((Substring:C12($3->; $_l_CharPosition-1; 1)="(") & (Substring:C12($3->; $_l_CharPosition+7; 2)=" (")))
					$3->:=Replace string:C233($3->; "Request"; "Gen_Request")
				End if 
			End if 
		End if 
		$_l_CharacterPosition:=Position:C15("NEW PROCESS"; $1->)
		If ($_l_CharacterPosition>0)
			$_l_CharPositionos2:=Position:C15(":=NEW PROCESS"; $1->)
			If ($_l_CharPositionos2>0)
				$1->:=Substring:C12($1->; $_l_CharacterPosition; Length:C16($1->))
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Macro_ParseLine"; $_t_oldMethodName)
