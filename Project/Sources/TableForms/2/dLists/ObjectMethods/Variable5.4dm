If (False:C215)
	//object Name: [COMPANIES]dLists.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(GEN_al_NameID;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305(<>PER_bo_SystemSettingAccess)
	C_LONGINT:C283($s)
	C_TEXT:C284($_t_oldMethodName; vText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dLists.Variable5"; Form event code:C388)
If (<>PER_bo_SystemSettingAccess)
	If ((GEN_at_Name>0) & (GEN_at_Name<=Size of array:C274(GEN_at_Name)))
		If (GEN_at_RecordCode{GEN_at_Name}="")
			$s:=GEN_at_Name
			DELETE FROM ARRAY:C228(GEN_at_Name; $s; 1)
			DELETE FROM ARRAY:C228(GEN_at_RecordCode; $s; 1)
			DELETE FROM ARRAY:C228(GEN_at_Identity; $s; 1)
			DELETE FROM ARRAY:C228(GEN_al_NameID; $s; 1)
			If (GEN_at_Name>Size of array:C274(GEN_at_Name))
				GEN_at_Name:=1
				GEN_at_RecordCode:=GEN_at_Name
				GEN_at_Identity:=GEN_at_Name
			End if 
			vText:=GEN_at_Name{GEN_at_Name}
		Else 
			Gen_Alert("You may only delete Entries just added.  Other deletions should be made in the "+"Data Manager."; "Cancel")
		End if 
	Else 
		Gen_Alert("Please first highlight an Entry"; "Cancel")
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dLists.Variable5"; $_t_oldMethodName)
