If (False:C215)
	//object Name: [USER]User_In.Button10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	C_LONGINT:C283($_l_SelectedModel; $_l_SelectedRecordNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Button10"; Form event code:C388)

$_l_SelectedModel:=DM_at_BKModelNames
//If (DM_al_BKModelIDS{$_l_SelectedModel}=0)
If ($_l_SelectedModel<1)
	Gen_Alert("Please select a Field Map to delete.")
Else 
	//  $_l_SelectedRecordNumber:=Find index key([EW_ExportSteps]BKModelName  `
	//;DM_at_BKModelNames{DM_at_BKModelNames})
	$_l_SelectedRecordNumber:=FindIndexKey(->[EW_ExportSteps:118]BKModelName:8; ->DM_at_BKModelNames{DM_at_BKModelNames})
	If ($_l_SelectedRecordNumber>-1)
		ALERT:C41("Sorry! The selected field map cannot be deleted, "+"because it is being used by an Export Format.")
	Else 
		CONFIRM:C162("Are you sure you want to delete the field map "+Char:C90(34)+DM_at_BKModelNames{DM_at_BKModelNames}+Char:C90(34)+"?"; "No!"; "Yes")
		If (OK=0)
			QUERY:C277([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]x_MapSetID:7=DM_al_BKModelIDS{DM_at_BKModelNames})
			DELETE SELECTION:C66([EW_BK_FieldMap:121])
			DELETE FROM ARRAY:C228(DM_at_BKModelNames; $_l_SelectedModel)
			DELETE FROM ARRAY:C228(DM_al_BKModelIDS; $_l_SelectedModel)
			EW_FieldMapPrefsSave
			If (Size of array:C274(DM_al_BKModelIDS)>0)
				DM_at_BKModelNames:=1
				EW_BKAllArrays(DM_al_BKModelIDS{1})
			Else 
				EW_BKAllArrays(0)
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Button10"; $_t_oldMethodName)
