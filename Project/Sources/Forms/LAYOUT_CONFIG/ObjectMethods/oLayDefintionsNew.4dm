If (False:C215)
	//object Name: Object Name:      LAYOUT_CONFIG.oLayDefintionsNew
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/09/2012 03:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_Enterable; 0)
	ARRAY BOOLEAN:C223($_abo_LockedColumn; 0)
	//ARRAY BOOLEAN(LAY_lb_Columns;0)
	ARRAY INTEGER:C220($_ai_Size; 0)
	ARRAY INTEGER:C220($_ai_Width; 0)
	ARRAY INTEGER:C220($_ai_Footers; 0)
	ARRAY LONGINT:C221($_al_Field; 0)
	ARRAY LONGINT:C221($_al_FieldOrder; 0)
	ARRAY LONGINT:C221($_al_RelatedField; 0)
	ARRAY LONGINT:C221($_al_RelatedTable; 0)
	ARRAY LONGINT:C221($_al_Table; 0)
	//ARRAY LONGINT(LAY_al_ColumnNumber;0)
	//ARRAY LONGINT(LAY_al_RecordNumbers;0)
	//ARRAY POINTER(DB_aptr_Setup;0)
	ARRAY TEXT:C222($_at_arrayName; 0)
	ARRAY TEXT:C222($_at_ColumnColour; 0)
	ARRAY TEXT:C222($_at_Format; 0)
	ARRAY TEXT:C222($_at_Formulas; 0)
	ARRAY TEXT:C222($_at_Identity; 0)
	ARRAY TEXT:C222($_at_Label; 0)
	ARRAY TEXT:C222($_at_Settings; 0)
	//ARRAY TEXT(LAY_at_ColumnTitle;0)
	//ARRAY TEXT(LL_at_FieldName;0)
	//ARRAY TEXT(LL_at_TableNames;0)
	//ARRAY TEXT(SVS_at_PreviewDateString;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	//ARRAY TEXT(SVS_at_PreviewNote;0)
	C_BOOLEAN:C305($_bo_Create; $_bo_LoadSetup; $_bo_newLevel; LAY_bo_AddRecord; LAY_bo_OverrideDefaults; LAY_bo_RecordEdited; Lay_bo_SetupEdited)
	C_LONGINT:C283($_l_ArraySize; $_l_ColumnNumber; $_l_EventRow; $_l_Index; $_l_Index2; $_l_LastNumber; $_l_offset; $_l_RecordNumber; $_l_ReuseLevel; $_l_Row; LAY_l_ConfigCancel)
	C_LONGINT:C283(LAY_l_ConfigSave; LAY_l_CurrentDefsFormID; LAY_l_CurrentDefsTable; LAY_l_LoadedRecord; vNo)
	C_POINTER:C301($_Ptr_KeyField)
	C_TEXT:C284($_t_ColumnTitle; $_t_oldMethodName; $_t_PreviewType; $RefFull; AL_T_Formula; DB_t_CurrentDefinitions; DB_t_CurrentFormUsage3; LAY_t_CurrentDefsName; LAY_t_CurrentUserDefs; LAY_T_LoadUserPrefs; LL_t_FieldName)
	C_TEXT:C284(LL_t_TableName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/LAYOUT_CONFIG/oLayDefintionsNew"; Form event code:C388)

//Script of Create New Definitions button
//Note: ALListFindDup also duplicates the records
If (LAY_bo_RecordEdited=True:C214)
	//do we want to save the current loaded first
	Gen_Confirm("The current loaded column definition has been edited do you want to save it first?"; "Yes"; "No")
	If (OK=1)
		Lay_bo_SetupEdited:=True:C214
		
		DB_SaveRecord(->[LIST_LAYOUTS:96])
	End if 
	LAY_bo_RecordEdited:=False:C215
	$_t_ColumnTitle:=[LIST_LAYOUTS:96]Title:4
	$_l_ColumnNumber:=[LIST_LAYOUTS:96]Order:7
	$_l_RecordNumber:=Record number:C243([LIST_LAYOUTS:96])
	$_l_Row:=Find in array:C230(LAY_al_RecordNumbers; $_l_RecordNumber)
	If ($_l_Row<0)
		$_l_Row:=Find in array:C230(LAY_al_RecordNumbers; 0)
	End if 
	LAY_al_ColumnNumber{$_l_Row}:=$_l_ColumnNumber
	LAY_at_ColumnTitle{$_l_Row}:=$_t_ColumnTitle
	LAY_al_RecordNumbers{$_l_Row}:=$_l_RecordNumber
	SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
	$_l_LastNumber:=0
	For ($_l_Index; 1; Size of array:C274(LAY_al_ColumnNumber))
		If (LAY_al_RecordNumbers{$_l_Index}=0)
			LAY_al_RecordNumbers{$_l_Index}:=1
		End if 
		If (LAY_al_ColumnNumber{$_l_Index}=$_l_LastNumber)
			//its a clash
			If ($_l_RecordNumber#LAY_al_RecordNumbers{$_l_Index})
				LAY_al_ColumnNumber{$_l_Index}:=LAY_al_ColumnNumber{$_l_Index}+1
				GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_Index})
				[LIST_LAYOUTS:96]Order:7:=LAY_al_RecordNumbers{$_l_Index}
				DB_SaveRecord(->[LIST_LAYOUTS:96])
			Else 
				$_l_offset:=0
				For ($_l_Index2; $_l_Index; 1; -1)
					If (LAY_al_ColumnNumber{$_l_Index2}=LAY_al_ColumnNumber{$_l_Index})
						LAY_al_ColumnNumber{$_l_Index2}:=LAY_al_ColumnNumber{$_l_Index}+$_l_offset
						GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_Index})
						[LIST_LAYOUTS:96]Order:7:=LAY_al_RecordNumbers{$_l_Index}
						DB_SaveRecord(->[LIST_LAYOUTS:96])
					End if 
					$_l_offset:=$_l_offset+1
				End for 
			End if 
		End if 
		$_l_LastNumber:=LAY_al_ColumnNumber{$_l_Index}
	End for 
	SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
	
	//``````
End if 

Gen_Confirm("Are you sure you want to create a new set of columns based on the current view?"; "Yes"; "No")
If (OK=1)
	$_t_PreviewType:=RemoveLeadTr(Uppers2(Gen_Request("Enter User initials for definitions:")))
	If ((OK=1) & ($_t_PreviewType#""))
		If (Length:C16($_t_PreviewType)>7)
			Gen_Alert("NB: Only the first 7 characters specified will be used"; "OK")
			$_t_PreviewType:=Substring:C12($_t_PreviewType; 1; 7)
		End if 
		MESSAGES OFF:C175
		ORDER BY:C49([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Order:7; >)
		ARRAY TEXT:C222($_at_Identity; 0)
		ARRAY TEXT:C222($_at_Label; 0)
		
		ARRAY INTEGER:C220($_ai_Width; 0)
		ARRAY TEXT:C222($_at_Format; 0)
		ARRAY LONGINT:C221($_al_FieldOrder; 0)
		ARRAY BOOLEAN:C223($_abo_Enterable; 0)
		
		ARRAY BOOLEAN:C223($_abo_LockedColumn; 0)
		ARRAY TEXT:C222($_at_Formulas; 0)
		
		ARRAY INTEGER:C220($_ai_Size; 0)
		ARRAY TEXT:C222($_at_ColumnColour; 0)
		ARRAY TEXT:C222($_at_Settings; 0)
		ARRAY INTEGER:C220($_ai_Footers; 0)
		
		ARRAY LONGINT:C221($_al_Table; 0)
		ARRAY LONGINT:C221($_al_Field; 0)
		
		SELECTION TO ARRAY:C260([LIST_LAYOUTS:96]Layout_Reference:1; $_at_Identity; [LIST_LAYOUTS:96]Table_Number:2; $_al_Table; [LIST_LAYOUTS:96]Field_Number:3; $_al_Field; [LIST_LAYOUTS:96]Title:4; $_at_Label; [LIST_LAYOUTS:96]Width:5; $_ai_Width; [LIST_LAYOUTS:96]Format:6; $_at_Format; [LIST_LAYOUTS:96]Order:7; $_al_FieldOrder; [LIST_LAYOUTS:96]Enterable:8; $_abo_Enterable; [LIST_LAYOUTS:96]Locked:10; $_abo_LockedColumn; [LIST_LAYOUTS:96]Formula:9; $_at_Formulas; [LIST_LAYOUTS:96]Font_Size:11; $_ai_Size; [LIST_LAYOUTS:96]Colour:12; $_at_ColumnColour; [LIST_LAYOUTS:96]Settings:13; $_at_Settings; [LIST_LAYOUTS:96]Footer:14; $_ai_Footers; [LIST_LAYOUTS:96]X_Related_Field:16; $_al_RelatedField; [LIST_LAYOUTS:96]X_Related_Table:15; $_al_RelatedTable; [LIST_LAYOUTS:96]X_associatedArrayName:17; $_at_arrayName)
		MESSAGES ON:C181
		
		$RefFull:=LAY_t_CurrentDefsName+$_t_PreviewType
		QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$RefFull)
		If (Records in selection:C76([LIST_LAYOUTS:96])>0)
			$_bo_Create:=False:C215
			
			Gen_Confirm("There are arleady a set of columns for that person. Do you want to delete them and create new ones?"; "No"; "Yes")
			If (OK=0)
				DELETE SELECTION:C66([LIST_LAYOUTS:96])
				$_bo_Create:=True:C214
			End if 
			OK:=1
		Else 
			$_bo_Create:=True:C214
		End if 
		If ($_bo_Create)
			
			DB_t_CurrentFormUsage3:=$_t_PreviewType
			$_l_ArraySize:=Size of array:C274($_at_Identity)
			For ($_l_Index; 1; $_l_ArraySize)
				$_at_Identity{$_l_Index}:=$RefFull
				$_al_FieldOrder{$_l_Index}:=$_l_Index
			End for 
			ARRAY TO SELECTION:C261($_at_Identity; [LIST_LAYOUTS:96]Layout_Reference:1; $_al_Table; [LIST_LAYOUTS:96]Table_Number:2; $_al_Field; [LIST_LAYOUTS:96]Field_Number:3; $_at_Label; [LIST_LAYOUTS:96]Title:4; $_ai_Width; [LIST_LAYOUTS:96]Width:5; $_at_Format; [LIST_LAYOUTS:96]Format:6; $_al_FieldOrder; [LIST_LAYOUTS:96]Order:7; $_abo_Enterable; [LIST_LAYOUTS:96]Enterable:8; $_abo_LockedColumn; [LIST_LAYOUTS:96]Locked:10; $_at_Formulas; [LIST_LAYOUTS:96]Formula:9; $_ai_Size; [LIST_LAYOUTS:96]Font_Size:11; $_at_ColumnColour; [LIST_LAYOUTS:96]Colour:12; $_at_Settings; [LIST_LAYOUTS:96]Settings:13; $_ai_Footers; [LIST_LAYOUTS:96]Footer:14; $_al_RelatedField; [LIST_LAYOUTS:96]X_Related_Field:16; $_al_RelatedTable; [LIST_LAYOUTS:96]X_Related_Table:15; $_at_arrayName; [LIST_LAYOUTS:96]X_associatedArrayName:17)
			//Add to the popup
			$_l_ArraySize:=Size of array:C274(SVS_at_PreviewEvent)+1
			INSERT IN ARRAY:C227(SVS_at_PreviewEvent; $_l_ArraySize; 1)
			SVS_at_PreviewEvent{$_l_ArraySize}:=$_t_PreviewType
			SVS_at_PreviewEvent:=$_l_ArraySize
			vNo:=Records in selection:C76([LIST_LAYOUTS:96])
			//````````
			If (SVS_at_PreviewEvent>0)
				UNLOAD RECORD:C212([LIST_LAYOUTS:96])
				$_t_PreviewType:=SVS_at_PreviewEvent{SVS_at_PreviewEvent}
				If ($_t_PreviewType="Default")
					DB_t_CurrentFormUsage3:=""
					$_t_PreviewType:=LAY_t_CurrentDefsName
				Else 
					DB_t_CurrentFormUsage3:=$_t_PreviewType
					$_t_PreviewType:=LAY_t_CurrentDefsName+$_t_PreviewType
				End if 
				
				MESSAGES OFF:C175
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_PreviewType)
				DB_t_CurrentDefinitions:=[LIST_LAYOUTS:96]Layout_Reference:1
				If ([LIST_LAYOUTS:96]Font_Size:11=9)
					SVS_at_PreviewNote:=1
				Else 
					SVS_at_PreviewNote:=2
				End if 
				SELECTION TO ARRAY:C260([LIST_LAYOUTS:96]Order:7; LAY_al_ColumnNumber; [LIST_LAYOUTS:96]Title:4; LAY_at_ColumnTitle; [LIST_LAYOUTS:96]; LAY_al_RecordNumbers)
				
				vNo:=Records in selection:C76([LIST_LAYOUTS:96])
				SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
				$_l_ColumnNumber:=0
				For ($_l_Index; 1; Size of array:C274(LAY_al_ColumnNumber))
					$_l_ColumnNumber:=$_l_Index
					If (LAY_al_ColumnNumber{$_l_Index}#$_l_ColumnNumber)
						GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_Index})
						LAY_al_ColumnNumber{$_l_Index}:=$_l_ColumnNumber
						[LIST_LAYOUTS:96]Order:7:=$_l_ColumnNumber
						DB_SaveRecord(->[LIST_LAYOUTS:96])
					End if 
				End for 
				LAY_bo_RecordEdited:=False:C215
				LAY_bo_AddRecord:=False:C215
				LAY_l_LoadedRecord:=Record number:C243([LIST_LAYOUTS:96])
				ARRAY POINTER:C280(DB_aptr_Setup; 0)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
				$_bo_LoadSetup:=True:C214
				$_Ptr_KeyField:=LAY_SetKeyField(LAY_l_CurrentDefsTable)
				
				If ($_bo_newLevel)
					LAY_bo_OverrideDefaults:=True:C214
					LAY_T_LoadUserPrefs:=LAY_t_CurrentUserDefs
					If (SVS_at_PreviewEvent{SVS_at_PreviewEvent}="Default")
						LAY_T_LoadUserPrefs:=""
					Else 
						LAY_T_LoadUserPrefs:=SVS_at_PreviewEvent{SVS_at_PreviewEvent}
					End if 
					
					LBi_ArrDefFill(->DB_aptr_Setup; ->LAY_lb_Columns; $_Ptr_KeyField; $_Ptr_KeyField; "411111000"; "nul"; LAY_l_CurrentDefsFormID; "nul"; "nul"; ""; $_bo_newLevel; $_l_ReuseLevel)
				End if 
				LBi_LoadSetup(->DB_aptr_Setup)
				LB_SetScroll(->LAY_lb_Columns; -2; -2)
				
				OBJECT SET ENTERABLE:C238(LL_t_TableName; False:C215)
				OBJECT SET VISIBLE:C603(LL_at_TableNames; False:C215)
				OBJECT SET ENTERABLE:C238(LL_t_FieldName; False:C215)
				OBJECT SET VISIBLE:C603(LL_at_FieldName; False:C215)
				OBJECT SET ENTERABLE:C238([LIST_LAYOUTS:96]Enterable:8; False:C215)
				OBJECT SET ENTERABLE:C238([LIST_LAYOUTS:96]Title:4; False:C215)
				OBJECT SET ENTERABLE:C238([LIST_LAYOUTS:96]Format:6; False:C215)
				OBJECT SET VISIBLE:C603(SVS_at_PreviewDateString; False:C215)
				OBJECT SET ENTERABLE:C238(AL_T_Formula; False:C215)
				OBJECT SET VISIBLE:C603(LAY_l_ConfigSave; False:C215)
				OBJECT SET VISIBLE:C603(LAY_l_ConfigCancel; False:C215)
				OBJECT SET ENTERABLE:C238(LL_t_TableName; False:C215)
				OBJECT SET VISIBLE:C603(LL_at_TableNames; True:C214)
				OBJECT SET ENTERABLE:C238(LL_t_FieldName; False:C215)
				OBJECT SET VISIBLE:C603(LL_at_FieldName; True:C214)
				OBJECT SET ENTERABLE:C238([LIST_LAYOUTS:96]Enterable:8; True:C214)
				OBJECT SET ENTERABLE:C238([LIST_LAYOUTS:96]Title:4; True:C214)
				OBJECT SET ENTERABLE:C238([LIST_LAYOUTS:96]Format:6; True:C214)
				OBJECT SET VISIBLE:C603(SVS_at_PreviewDateString; True:C214)
				OBJECT SET ENTERABLE:C238(AL_T_Formula; True:C214)
				OBJECT SET VISIBLE:C603(LAY_l_ConfigSave; False:C215)
				OBJECT SET VISIBLE:C603(LAY_l_ConfigCancel; False:C215)
				
			Else 
				$_l_EventRow:=Find in array:C230(SVS_at_PreviewEvent; DB_t_CurrentFormUsage3)
				If ($_l_EventRow>0)
					SVS_at_PreviewEvent:=$_l_EventRow
				Else 
					SVS_at_PreviewEvent:=1
				End if 
			End if 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ LAYOUT_CONFIG.oLayDefintionsNew"; $_t_oldMethodName)
