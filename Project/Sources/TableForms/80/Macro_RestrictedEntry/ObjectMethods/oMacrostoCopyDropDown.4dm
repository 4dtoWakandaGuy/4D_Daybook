If (False:C215)
	//object Name: [SCRIPTS]Macro_RestrictedEntry.oMacrostoCopy
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2011 13:22
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(MAC_at_aMacroNames;0)
	//ARRAY TEXT(MAC_at_Script;0)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Count; $_l_Difference; $_l_event; $_l_Length; BFind)
	C_REAL:C285(Mac_l_MaxLines)
	C_TEXT:C284($_t_NewText; $_t_oldMethodName; $_t_Text)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SCRIPTS].Macro_RestrictedEntry.oMacrostoCopy"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (MAC_at_aMacroNames>0)
			$_t_Text:=MAC_at_Script{MAC_at_aMacroNames}
			$_l_Length:=Length:C16($_t_Text)
			$_t_Text:=Replace string:C233($_t_Text; Char:C90(13); "")
			$_l_Difference:=$_l_Length-Length:C16($_t_Text)
			If ($_l_Difference>Mac_l_MaxLines)
				Gen_Confirm("This script exceeds the maximum length for this type of script, do you want to copy the first "+String:C10(Mac_l_MaxLines)+" Lines"; "Yes"; "No")
				If (OK=1)
					$_l_Count:=0
					$_t_NewText:=""
					$_t_Text:=MAC_at_Script{MAC_at_aMacroNames}
					Repeat 
						$_l_CharacterPosition:=Position:C15(Char:C90(13); $_t_Text)
						If ($_l_CharacterPosition>0)
							$_t_NewText:=$_t_NewText+Substring:C12($_t_Text; 1; $_l_CharacterPosition)
							$_t_Text:=Substring:C12($_t_Text; $_l_CharacterPosition+1)
							$_l_Count:=$_l_Count+1
						Else 
							$_l_Count:=Mac_l_MaxLines
						End if 
					Until ($_l_Count=Mac_l_MaxLines)
					[SCRIPTS:80]Recording_Text:4:=$_t_NewText
					OBJECT SET VISIBLE:C603(MAC_at_aMacroNames; False:C215)
					
					OBJECT SET VISIBLE:C603(BFind; True:C214)
					
				End if 
			Else 
				[SCRIPTS:80]Recording_Text:4:=MAC_at_Script{MAC_at_aMacroNames}
				OBJECT SET VISIBLE:C603(MAC_at_aMacroNames; False:C215)
				OBJECT SET VISIBLE:C603(BFind; True:C214)
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [SCRIPTS].Macro_RestrictedEntry.oMacrostoCopy"; $_t_oldMethodName)
