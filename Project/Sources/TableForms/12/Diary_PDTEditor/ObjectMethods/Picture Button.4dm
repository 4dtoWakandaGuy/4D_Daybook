If (False:C215)
	//object Name: [DIARY]Diary_PDTEditor.Picture Button
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_FeaturesList;0)
	//ARRAY LONGINT(SD2_al_RelatedTableNum;0)
	//ARRAY TEXT(SD2_at_RelatedRecordCode;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_PDTEditor.Picture Button"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		//
		//$SelectedContextname:=Gen_RequestWithList ("What would you like to link to?";"";"Continue";"Stop";0;0;"Link to"";0;"";"")
		If (Size of array:C274(SD2_at_RelatedRecordCode)>0)
			If (SD2_at_RelatedRecordCode{1}#"")
				LISTBOX INSERT ROWS:C913(SD2_lb_FeaturesList; 1)
			End if 
		Else 
			LISTBOX INSERT ROWS:C913(SD2_lb_FeaturesList; 1)
		End if 
		SD2_al_RelatedTableNum{1}:=9
		LB_SetEnterable(->SD2_lb_FeaturesList; True:C214; 3; "")
		//GET LISTBOX ARRAYS(SD2_lb_FeaturesList;$_at_ColumnNames;$_at_HeaderNames;$_aptr_ColumnVariables;$_aptr_HeaderVariables;$_abo_ColumnsVisible;$_aptr_ColumnStyles)
		
		GOTO OBJECT:C206(SD2_lb_FeaturesList)
		EDIT ITEM:C870(SD2_at_RelatedRecordCode{1})
		
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_PDTEditor.Picture Button"; $_t_oldMethodName)
