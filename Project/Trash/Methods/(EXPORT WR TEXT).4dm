//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      EXPORT WR TEXT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CharPosition2; $_l_ScriptsIndex)
	C_TEXT:C284($_t_oldMethodName; $_t_Text; $_t_TextINPUT; $_t_TextOutput)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EXPORT WR TEXT")
$_ti_DocumentRef:=DB_CreateDocument(""; "TEXT")

ALL RECORDS:C47([SCRIPTS:80])
For ($_l_ScriptsIndex; 1; Records in selection:C76([SCRIPTS:80]))
	$_l_CharacterPosition:=0
	$_t_TextINPUT:=[SCRIPTS:80]Recording_Text:4
	
	$_t_TextOutput:=""
	If ($_t_TextOutput#$_t_TextINPUT)
		SEND PACKET:C103($_ti_DocumentRef; [SCRIPTS:80]Script_Name:2+" "+$_t_TextINPUT)
		SEND PACKET:C103($_ti_DocumentRef; $_t_TextOutput)
	End if 
	
	Repeat 
		$_l_CharacterPosition:=Position:C15("WR "; $_t_TextINPUT)
		If ($_l_CharacterPosition>0)
			$_t_TextINPUT:=Substring:C12($_t_TextINPUT; $_l_CharacterPosition-1; Length:C16($_t_TextINPUT))
			$_l_CharPosition2:=Position:C15(Char:C90(13); $_t_TextINPUT)
			If ($_l_CharPosition2>0)
				$_t_Text:=Substring:C12($_t_TextINPUT; 1; $_l_CharPosition2)
				$_t_TextINPUT:=Substring:C12($_t_TextINPUT; $_l_CharPosition2+1; Length:C16($_t_TextINPUT))
				
			Else 
				$_t_Text:=Substring:C12($_t_TextINPUT; 1; Length:C16($_t_TextINPUT))
				$_t_TextINPUT:=""
			End if 
			
			SEND PACKET:C103($_ti_DocumentRef; [SCRIPTS:80]Script_Name:2+" "+$_t_Text)
			SEND PACKET:C103($_ti_DocumentRef; $_t_TextOutput)
		End if 
	Until ($_l_CharacterPosition=0)
	NEXT RECORD:C51([SCRIPTS:80])
	
	
End for 
ERR_MethodTrackerReturn("EXPORT WR TEXT"; $_t_oldMethodName)