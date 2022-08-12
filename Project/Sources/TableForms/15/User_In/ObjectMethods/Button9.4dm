If (False:C215)
	//object Name: [USER]User_In.Button9
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
	//ARRAY LONGINT(EW_al_DBFieldNumbers;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	//ARRAY TEXT(EW_at_BKFieldNames;0)
	C_BOOLEAN:C305($_bo_Accept; EW_bo_ModifiedSettings)
	C_LONGINT:C283($_l_TableNumber; DM_l_ModelSequence)
	C_TEXT:C284($_t_oldMethodName; $_t_StoreName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Button9"; Form event code:C388)


If (DM_al_BKModelIDS{DM_at_BKModelNames}=0)
	Gen_Alert("Please select a Field Map to duplicate.")
Else 
	$_t_StoreName:=""
	$_t_StoreName:=Request:C163("Name for new field map:")
	If (OK=1) & ($_t_StoreName#"")
		If (Find in array:C230(DM_at_BKModelNames; $_t_StoreName)>0)
			Gen_Alert("That store name is already in use.")
		Else 
			If (EW_bo_ModifiedSettings)
				$_bo_Accept:=EW_FieldMapSave(DM_al_BKModelIDS{DM_at_BKModelNames})
				READ WRITE:C146([PREFERENCES:116])
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[EW_BK_FieldMap:121]); *)
				QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=-3)
				//this will be ONE record
				SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
				VARIABLE TO BLOB:C532(DM_at_BKModelNames; [PREFERENCES:116]DataBlob:2; *)
				VARIABLE TO BLOB:C532(DM_al_BKModelIDS; [PREFERENCES:116]DataBlob:2; *)
				SAVE RECORD:C53([PREFERENCES:116])
				UNLOAD RECORD:C212([PREFERENCES:116])
				EW_bo_ModifiedSettings:=False:C215
			End if 
			$_l_TableNumber:=[EW_BK_FieldMap:121]DayBookTableNumber:1
			INSERT IN ARRAY:C227(DM_at_BKModelNames; 1)
			DM_at_BKModelNames{1}:=$_t_StoreName
			INSERT IN ARRAY:C227(DM_al_BKModelIDS; 1)
			DM_al_BKModelIDS{1}:=AA_GetNextID(->DM_l_ModelSequence)
			REDUCE SELECTION:C351([EW_BK_FieldMap:121]; 0)
			ARRAY TO SELECTION:C261(EW_al_DBFieldNumbers; [EW_BK_FieldMap:121]DayBookFieldNumber:2; EW_at_BKFieldNames; [EW_BK_FieldMap:121]BKFieldName:3)
			APPLY TO SELECTION:C70([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]DayBookTableNumber:1:=$_l_TableNumber)
			APPLY TO SELECTION:C70([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]x_MapSetID:7:=DM_al_BKModelIDS{1})
			SORT ARRAY:C229(DM_at_BKModelNames; DM_al_BKModelIDS)
			DM_at_BKModelNames:=Find in array:C230(DM_at_BKModelNames; $_t_StoreName)
			EW_BKFieldMapArrays(DM_al_BKModelIDS{DM_at_BKModelNames}; ""; "DB")
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Button9"; $_t_oldMethodName)
