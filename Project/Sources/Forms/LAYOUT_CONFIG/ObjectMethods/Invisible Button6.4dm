If (False:C215)
	//object Name: Object Name:      LAYOUT_CONFIG.Invisible Button6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/02/2013 15:07
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(LAY_lb_Columns;0)
	//ARRAY LONGINT(LAY_al_ColumnNumber;0)
	//ARRAY LONGINT(LAY_al_RecordNumbers;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	//ARRAY POINTER(DB_aptr_Setup;0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(LAY_at_ColumnTitle;0)
	//ARRAY TEXT(LL_at_FieldName;0)
	//ARRAY TEXT(LL_at_TableNames;0)
	//ARRAY TEXT(SVS_at_PreviewDateString;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	//ARRAY TEXT(SVS_at_PreviewNote;0)
	C_BOOLEAN:C305($_bo_LoadSetup; $_bo_newLevel; $_bo_Reload; DB_bo_RecordModified; LAY_bo_AddRecord; LAY_bo_OverrideDefaults; LAY_bo_RecordEdited)
	C_LONGINT:C283($_l_ColumnIndex; $_l_ColumnWidth; $_l_Index; $_l_ReuseLevel; $_l_TotalWidth; LAY_l_ConfigCancel; LAY_l_ConfigSave; LAY_l_CurrentColumnsWidth; LAY_l_CurrentDefsFormID; LAY_l_CurrentDefsTable; LAY_l_LoadedRecord)
	C_LONGINT:C283(vNo)
	C_POINTER:C301($_Ptr_KeyField)
	C_TEXT:C284($_t_oldMethodName; $_t_PreviewEvent; AL_T_Formula; DB_t_CurrentDefinitions; DB_t_CurrentFormUsage3; LAY_t_CurrentDefsName; LAY_t_CurrentUserDefs; LAY_T_LoadUserPrefs; LL_t_FieldName; LL_t_TableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ LAYOUT_CONFIG.Invisible Button6"; Form event code:C388)


If ([LIST_LAYOUTS:96]Order:7>0)
	DB_bo_RecordModified:=True:C214
	$_bo_Reload:=False:C215
	If (Record number:C243([LIST_LAYOUTS:96])>0)
		Gen_Confirm("Are You sure you want to delete this column"; "No"; "Yes")
		If (OK=0)
			$_bo_Reload:=True:C214
		End if 
		OK:=1
		
		DELETE RECORD:C58([LIST_LAYOUTS:96])
	Else 
		$_bo_Reload:=True:C214
	End if 
	If ($_bo_Reload)
		$_t_PreviewEvent:=SVS_at_PreviewEvent{SVS_at_PreviewEvent}
		If ($_t_PreviewEvent="Default")
			DB_t_CurrentFormUsage3:=""
			$_t_PreviewEvent:=LAY_t_CurrentDefsName
		Else 
			DB_t_CurrentFormUsage3:=$_t_PreviewEvent
			$_t_PreviewEvent:=LAY_t_CurrentDefsName+$_t_PreviewEvent
		End if 
		MESSAGES OFF:C175
		QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_PreviewEvent)
		DB_t_CurrentDefinitions:=[LIST_LAYOUTS:96]Layout_Reference:1
		If ([LIST_LAYOUTS:96]Font_Size:11=9)
			SVS_at_PreviewNote:=1
		Else 
			SVS_at_PreviewNote:=2
		End if 
		SELECTION TO ARRAY:C260([LIST_LAYOUTS:96]Order:7; LAY_al_ColumnNumber; [LIST_LAYOUTS:96]Title:4; LAY_at_ColumnTitle; [LIST_LAYOUTS:96]; LAY_al_RecordNumbers)
		
		vNo:=Records in selection:C76([LIST_LAYOUTS:96])
		SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
		$_l_ColumnIndex:=0
		For ($_l_Index; 1; Size of array:C274(LAY_al_ColumnNumber))
			$_l_ColumnIndex:=$_l_Index
			If (LAY_al_ColumnNumber{$_l_Index}#$_l_ColumnIndex)
				GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_Index})
				LAY_al_ColumnNumber{$_l_Index}:=$_l_ColumnIndex
				[LIST_LAYOUTS:96]Order:7:=$_l_ColumnIndex
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
		DB_t_CurrentDefinitions:=[LIST_LAYOUTS:96]Layout_Reference:1
		If ([LIST_LAYOUTS:96]Font_Size:11=9)
			SVS_at_PreviewNote:=1
		Else 
			SVS_at_PreviewNote:=2
		End if 
		
		LBI_Scrollonresize(->LAY_lb_Columns)
		ARRAY TEXT:C222($_at_ColumnNames; 0)
		ARRAY TEXT:C222($_at_HeaderNames; 0)
		ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
		ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
		ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
		ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
		
		LISTBOX GET ARRAYS:C832(LAY_lb_Columns; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		$_l_TotalWidth:=20
		$_l_ColumnWidth:=0
		//ALERT("SIZE3")
		For ($_l_ColumnIndex; 1; Size of array:C274($_aptr_ColumnVariables))
			If ($_abo_ColumnsVisible{$_l_ColumnIndex}=True:C214)
				LB_GetWidths(->LAY_lb_Columns; $_l_ColumnIndex; ->$_l_ColumnWidth)
				$_l_TotalWidth:=$_l_TotalWidth+$_l_ColumnWidth
			End if 
		End for 
		LAY_l_CurrentColumnsWidth:=$_l_TotalWidth
		
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ LAYOUT_CONFIG.Invisible Button6"; $_t_oldMethodName)
