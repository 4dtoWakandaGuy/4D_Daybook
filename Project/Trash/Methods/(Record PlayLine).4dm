//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Record_PlayLine
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
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; vMT; VmTitle2; vMTitle3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_PlayLine")
//C_TEXT($0)  `see also Record_PagLine & Record_PlayLinS
If (Count parameters:C259>=1)
	If (Not:C34(Is nil pointer:C315($1)))
		First_FieldPtr(->vMT; Char:C90(13); $1)
		Str_StripComm($1->; $1)
		RemoveLeadTr($1->; $1)
		RemoveLeadTr($1->; ->VmTitle2)
		vMTitle3:=vMTitle2
		$_l_CharPosition:=Position:C15("("; vMTitle2)
		If ($_l_CharPosition=0)
			// $_l_CharPosition:=Position(" (";vMTitle2)
			//If ($_l_CharPosition=0)
			$1->:=vMTitle2
			// Else
			//$0:=Substring(vMTitle2;1;$_l_CharPosition-1)
			//End if
		Else 
			RemoveLeadTr(Substring:C12(vMTitle2; 1; $_l_CharPosition-1); $1)
		End if 
		If (vMTitle2="@Request@")
			$_l_CharPosition:=Position:C15("Request"; vMTitle2)
			If ($_l_CharPosition>3)
				If ((Substring:C12(vMTitle2; $_l_CharPosition-2; 2)=":=") | ((Substring:C12(vMTitle2; $_l_CharPosition-1; 1)="(") & (Substring:C12(vMTitle2; $_l_CharPosition+7; 1)="(")) | ((Substring:C12(vMTitle2; $_l_CharPosition-1; 1)="(") & (Substring:C12(vMTitle2; $_l_CharPosition+7; 2)=" (")))
					vMTitle2:=Replace string:C233(vMTitle2; "Request"; "Gen Request")
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
ERR_MethodTrackerReturn("Record_PlayLine"; $_t_oldMethodName)
