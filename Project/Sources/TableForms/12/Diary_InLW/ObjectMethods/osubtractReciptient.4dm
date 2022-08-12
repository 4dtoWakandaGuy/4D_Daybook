If (False:C215)
	//object Name: [DIARY]Diary_inLW.osubtractReciptient
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/10/2012 13:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	C_LONGINT:C283($_l_SelectedEmailRow; WS_l_SelectedEmailName)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_inLW.osubtractReciptient"; Form event code:C388)

If (SD2_at_EmailName>0)
	If (SD2_at_ContactIDs{SD2_at_EmailName}#"")
		If (SD2_at_ContactIDs{SD2_at_EmailName}=[DIARY:12]Contact_Code:2)
			//     ALERT("Sorry you cannot remove the contact from this email!")
			Gen_Alert("Sorry, you cannot remove the contact from this email!")
		Else 
			$_l_SelectedEmailRow:=SD2_at_EmailName
			DELETE FROM ARRAY:C228(SD2_at_EmailType; $_l_SelectedEmailRow; 1)
			DELETE FROM ARRAY:C228(SD2_at_EmailAddresses; $_l_SelectedEmailRow; 1)
			DELETE FROM ARRAY:C228(SD2_at_EmailName; $_l_SelectedEmailRow; 1)
			DELETE FROM ARRAY:C228(SD2_at_ContactIDs; $_l_SelectedEmailRow; 1)
			WS_l_SelectedEmailName:=0
			
		End if 
		
	End if 
End if 
SETEMAILFORMOBJECTS
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_inLW.osubtractReciptient"; $_t_oldMethodName)
