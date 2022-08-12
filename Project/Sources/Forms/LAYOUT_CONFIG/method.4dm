If (False:C215)
	//Project Form Method Name:      LAYOUT_CONFIG
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/02/2013 15:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(LAY_lb_Columns;0)
	//ARRAY BOOLEAN(LAY_lb_ColumnSettings;0)
	//ARRAY LONGINT(LAY_al_ColumnNumber;0)
	//ARRAY LONGINT(LAY_al_RecordNumbers;0)
	//ARRAY LONGINT(LL_al_FieldNums;0)
	//ARRAY LONGINT(LL_al_FIeldNums2;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	//ARRAY POINTER(DB_aptr_Setup;0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY TEXT:C222($_at_LayoutReferences; 0)
	//ARRAY TEXT(LAY_at_ColumnTitle;0)
	//ARRAY TEXT(LAY_at_FontNames;0)
	//ARRAY TEXT(LL_at_FieldName;0)
	//ARRAY TEXT(LL_at_FieldName2;0)
	//ARRAY TEXT(LL_at_TableNames;0)
	//ARRAY TEXT(LL_at_TableNames2;0)
	//ARRAY TEXT(SVS_at_PreviewDateString;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	//ARRAY TEXT(SVS_at_PreviewNote;0)
	C_BOOLEAN:C305($_bo_LoadSetup; $_bo_newLevel; $_bo_ShowMaxFormWidth; DB_bo_NoLoad; LAB_cb_BoldFont; LAB_cb_ItalicFont; LAB_cb_PlainFont; LAB_cb_UnerlineFont; LAY_bo_AddRecord; LAY_bo_OverrideDefaults; LAY_bo_RecordEdited)
	C_BOOLEAN:C305(Lay_bo_SetupEdited)
	C_LONGINT:C283($_l_ArraySize; $_l_ColumnIndex2; $_l_ColumnNumber; $_l_ColumnWIdth; $_l_event; $_l_LastNumber; $_l_LayoutRefIndex; $_l_MaxWindowWidthPreference; $_l_offset; $_l_PreviewRow; $_l_RecordNumber)
	C_LONGINT:C283($_l_RecordNumberRow; $_l_ReuseLevel; $_l_TotalWidth; $_l_UndescorePosition; $Button; DB_l_ButtonClickedFunction; iCancel; iOK; LAY_l_BUT1; LAY_l_But2; LAY_l_BUT3)
	C_LONGINT:C283(LAY_l_BUT4; LAY_l_BUT5; LAY_l_BUT6; LAY_l_BUT7; LAY_l_BUT8; LAY_l_BUT9; LAY_l_ConfigCancel; LAY_l_ConfigSave; LAY_l_CurrentColumnsWidth; LAY_l_CurrentDefsFormID; LAY_l_CurrentDefsTable)
	C_LONGINT:C283(LAY_l_LoadedRecord)
	C_POINTER:C301($_Ptr_KeyField; $_ptr_Table)
	C_TEXT:C284($_t_ColumnTitle; $_t_LayoutsReference; $_t_oldMethodName; $_t_OutputFormTable; AL_T_Formula; DB_t_CallOnCloseorSave; DB_t_CurrentDefinitions; DB_t_WindowFormPreference; LAY_t_COL1; LAY_t_COL2; LAY_t_COL3)
	C_TEXT:C284(LAY_t_COL4; LAY_t_COL5; LAY_t_COL6; LAY_t_COL7; LAY_t_COL8; LAY_t_COL9; LAY_t_CurrentDefsName; LAY_t_CurrentUserDefs; LAY_t_HED1; LAY_t_HED2; LAY_t_HED3)
	C_TEXT:C284(LAY_t_HED4; LAY_t_HED5; LAY_t_HED6; LAY_t_HED7; LAY_t_HED8; LAY_t_HED9; LAY_T_LoadUserPrefs; LAY_t_MaxFormWidthText; LL_t_FieldName; LL_t_FieldName2; LL_t_TableName)
	C_TEXT:C284(LL_t_TableName2)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/LAYOUT_CONFIG/{formMethod}"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		LAB_cb_PlainFont:=False:C215
		LAB_cb_BoldFont:=False:C215
		LAB_cb_ItalicFont:=False:C215
		LAB_cb_UnerlineFont:=False:C215
		
		StartTransaction
		READ WRITE:C146([LIST_LAYOUTS:96])
		ARRAY TEXT:C222(SVS_at_PreviewDateString; 6)
		FONT LIST:C460(LAY_at_FontNames; *)
		SVS_at_PreviewDateString{1}:="None"
		SVS_at_PreviewDateString{2}:="Count"
		SVS_at_PreviewDateString{3}:="Sum"
		SVS_at_PreviewDateString{4}:="Average"
		SVS_at_PreviewDateString{5}:="Highest"
		SVS_at_PreviewDateString{6}:="Lowest"
		SVS_at_PreviewDateString:=1
		Load_Fields
		//"Output_"+String(DB_l_CurrentDisplayedForm)+"_"+DB_t_CurrentContext
		$_bo_ShowMaxFormWidth:=False:C215
		If (DB_t_WindowFormPreference#"")
			$_t_OutputFormTable:=Replace string:C233(DB_t_WindowFormPreference; "Output_"; "")
			$_l_UndescorePosition:=Position:C15("_"; DB_t_WindowFormPreference)
			If ($_l_UndescorePosition>0)
				$_t_OutputFormTable:=Substring:C12($_t_OutputFormTable; 1; $_l_UndescorePosition-1)
			End if 
			$_bo_ShowMaxFormWidth:=False:C215
			$_t_LayoutsReference:=Substring:C12(LAY_t_CurrentDefsName; 1; 3)
			If (Num:C11($_t_LayoutsReference)=Num:C11($_t_OutputFormTable))
				//we are editing the output form list layout...
				$_bo_ShowMaxFormWidth:=True:C214
				$_l_MaxWindowWidthPreference:=DB_GetUserWidthPreference(False:C215; DB_t_WindowFormPreference)
				If ($_l_MaxWindowWidthPreference=0)
					
				End if 
			End if 
		End if 
		LAY_bo_RecordEdited:=False:C215
		Lay_bo_SetupEdited:=False:C215
		LAY_bo_AddRecord:=False:C215
		LAY_l_LoadedRecord:=0
		ARRAY TEXT:C222(SVS_at_PreviewEvent; 0)
		If (LAY_t_CurrentDefsName#"")
			QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=LAY_t_CurrentDefsName+"@")
			DISTINCT VALUES:C339([LIST_LAYOUTS:96]Layout_Reference:1; $_at_LayoutReferences)
			For ($_l_LayoutRefIndex; 1; Size of array:C274($_at_LayoutReferences))
				APPEND TO ARRAY:C911(SVS_at_PreviewEvent; Replace string:C233($_at_LayoutReferences{$_l_LayoutRefIndex}; LAY_t_CurrentDefsName; ""))
				$_l_ArraySize:=Size of array:C274(SVS_at_PreviewEvent)
				If (SVS_at_PreviewEvent{$_l_ArraySize}="")
					SVS_at_PreviewEvent{$_l_ArraySize}:="Default"
				End if 
			End for 
		End if 
		$_l_PreviewRow:=Find in array:C230(SVS_at_PreviewEvent; LAY_t_CurrentUserDefs)
		If ($_l_PreviewRow>0)
			SVS_at_PreviewEvent:=$_l_PreviewRow
		Else 
			SVS_at_PreviewEvent:=Find in array:C230(SVS_at_PreviewEvent; "Default")
		End if 
		LL_LoadFieldNamePrefs(LAY_l_CurrentDefsTable)
		UNLOAD RECORD:C212([LIST_LAYOUTS:96])
		
		
		LBi_ListFindDup(LAY_t_CurrentDefsName; LAY_t_CurrentUserDefs)
		DB_t_CurrentDefinitions:=[LIST_LAYOUTS:96]Layout_Reference:1
		ARRAY TEXT:C222(SVS_at_PreviewNote; 2)
		SVS_at_PreviewNote{1}:="9"
		SVS_at_PreviewNote{2}:="10"
		If ([LIST_LAYOUTS:96]Font_Size:11=9)
			SVS_at_PreviewNote:=1
		Else 
			SVS_at_PreviewNote:=2
		End if 
		SELECTION TO ARRAY:C260([LIST_LAYOUTS:96]Order:7; LAY_al_ColumnNumber; [LIST_LAYOUTS:96]Title:4; LAY_at_ColumnTitle; [LIST_LAYOUTS:96]; LAY_al_RecordNumbers)
		
		SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
		$_l_ColumnNumber:=0
		For ($_l_LayoutRefIndex; 1; Size of array:C274(LAY_al_ColumnNumber))
			$_l_ColumnNumber:=$_l_LayoutRefIndex
			If (LAY_al_ColumnNumber{$_l_LayoutRefIndex}#$_l_ColumnNumber)
				GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_LayoutRefIndex})
				LAY_al_ColumnNumber{$_l_LayoutRefIndex}:=$_l_ColumnNumber
				[LIST_LAYOUTS:96]Order:7:=$_l_ColumnNumber
				DB_SaveRecord(->[LIST_LAYOUTS:96])
				
			End if 
		End for 
		
		LB_SetupListbox(->LAY_lb_ColumnSettings; "LAY_t"; "LAY_L"; 1; ->LAY_al_ColumnNumber; ->LAY_at_ColumnTitle; ->LAY_al_RecordNumbers)
		LB_SetColumnHeaders(->LAY_lb_ColumnSettings; "LAY_L"; 1; "Sort Order"; "Title"; "RecordNumber")
		LB_SetColumnWidths(->LAY_lb_ColumnSettings; "LAY_t"; 1; 40; 120; 0)
		LB_SetEnterable(->LAY_lb_ColumnSettings; False:C215; 0)
		LB_SetScroll(->LAY_lb_ColumnSettings; -2; -2)
		LB_StyleSettings(->LAY_lb_ColumnSettings; "Black"; 9; "LAY_t"; ->[ACCOUNTS:32])
		LB_SetFormat(->LAY_lb_ColumnSettings; 2; ""; 4; 4; 2)
		LAY_t_MaxFormWidthText:=""
		If ($_bo_ShowMaxFormWidth)
			If ($_l_MaxWindowWidthPreference#0)
				LAY_t_MaxFormWidthText:=String:C10($_l_MaxWindowWidthPreference)
			Else 
				LAY_t_MaxFormWidthText:="Not Set"
			End if 
			OBJECT SET VISIBLE:C603(*; "oMaxWidth@"; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(*; "oMaxWidth@"; False:C215)
		End if 
		
		
		WS_AutoscreenSize(2; 640; 800)
		
		INT_SetDialog
		$_ptr_Table:=Table:C252(LAY_l_CurrentDefsTable)
		COPY NAMED SELECTION:C331($_ptr_Table->; "Whenwecamein")
		REDUCE SELECTION:C351($_ptr_Table->; 10)
		//load the current config
		ARRAY POINTER:C280(DB_aptr_Setup; 0)
		$_bo_newLevel:=True:C214
		$_l_ReuseLevel:=0
		$_bo_LoadSetup:=True:C214
		$_Ptr_KeyField:=LAY_SetKeyField(LAY_l_CurrentDefsTable)
		
		If ($_bo_newLevel)
			LAY_bo_OverrideDefaults:=True:C214
			LAY_T_LoadUserPrefs:=LAY_t_CurrentUserDefs
			
			LBi_ArrDefFill(->DB_aptr_Setup; ->LAY_lb_Columns; $_Ptr_KeyField; $_Ptr_KeyField; "411111000"; "nul"; LAY_l_CurrentDefsFormID; "nul"; "nul"; ""; $_bo_newLevel; $_l_ReuseLevel)
			If (Size of array:C274(DB_aptr_Setup)>=20)
			Else 
				Gen_Alert("ERROR")
			End if 
			
			LAY_bo_OverrideDefaults:=False:C215
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
		LL_t_TableName2:=""
		LL_t_FieldName2:=""
		LL_t_TableName:=""
		LL_t_FieldName:=""
		AL_T_Formula:=""
		SVS_at_PreviewDateString:=0
		ARRAY LONGINT:C221(LL_al_FieldNums; 0)
		ARRAY LONGINT:C221(LL_al_FIeldNums2; 0)
		ARRAY TEXT:C222(LL_at_FieldName; 0)
		ARRAY TEXT:C222(LL_at_FieldName2; 0)
		ARRAY TEXT:C222(LL_at_TableNames2; 0)
		UNLOAD RECORD:C212([LIST_LAYOUTS:96])
		LISTBOX SORT COLUMNS:C916(LAY_lb_ColumnSettings; 1)
		If (User in group:C338(Current user:C182; "Designer")) | (User in group:C338(Current user:C182; "Administrator"))
			OBJECT SET VISIBLE:C603(*; "oLayDefintions@"; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(*; "oLayDefintions@"; False:C215)
		End if 
		ARRAY TEXT:C222($_at_ColumnNames; 0)
		ARRAY TEXT:C222($_at_HeaderNames; 0)
		ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
		ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
		ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
		ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
		
		LISTBOX GET ARRAYS:C832(LAY_lb_Columns; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		$_l_TotalWidth:=20
		$_l_ColumnWIdth:=0
		//ALERT("SIZE3")
		For ($_l_ColumnNumber; 1; Size of array:C274($_aptr_ColumnVariables))
			If ($_abo_ColumnsVisible{$_l_ColumnNumber}=True:C214)
				LB_GetWidths(->LAY_lb_Columns; $_l_ColumnNumber; ->$_l_ColumnWIdth)
				$_l_TotalWidth:=$_l_TotalWidth+$_l_ColumnWIdth
			End if 
		End for 
		LAY_l_CurrentColumnsWidth:=$_l_TotalWidth
		
	: ($_l_event=On Clicked:K2:4)
		
		
		
	: ($_l_event=On Outside Call:K2:11)
		
		$BUtton:=DB_l_ButtonClickedFunction
		DB_l_ButtonClickedFunction:=0
		Case of 
			: (iCancel=1) | ($BUtton=DB_GetButtonFunction("Cancel"))
				
				CANCEL:C270
				OK:=0
				Transact_End(False:C215)
				OK:=1
			: (iOK=1) | ($BUtton=DB_GetButtonFunction("OK"))
				If (DB_t_CallOnCloseorSave="Close")
					If (LAY_bo_RecordEdited=True:C214)
						//do we want to save the current loaded first
						If (OK=1)
							Lay_bo_SetupEdited:=True:C214
							DB_SaveRecord(->[LIST_LAYOUTS:96])
						End if 
						LAY_bo_RecordEdited:=False:C215
						$_t_ColumnTitle:=[LIST_LAYOUTS:96]Title:4
						$_l_ColumnNumber:=[LIST_LAYOUTS:96]Order:7
						$_l_RecordNumber:=Record number:C243([LIST_LAYOUTS:96])
						$_l_RecordNumberRow:=Find in array:C230(LAY_al_RecordNumbers; $_l_RecordNumber)
						If ($_l_RecordNumberRow<0)
							$_l_RecordNumberRow:=Find in array:C230(LAY_al_RecordNumbers; 0)
						End if 
						LAY_al_ColumnNumber{$_l_RecordNumberRow}:=$_l_ColumnNumber
						LAY_at_ColumnTitle{$_l_RecordNumberRow}:=$_t_ColumnTitle
						LAY_al_RecordNumbers{$_l_RecordNumberRow}:=$_l_RecordNumber
						SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
						$_l_LastNumber:=0
						For ($_l_LayoutRefIndex; 1; Size of array:C274(LAY_al_ColumnNumber))
							If (LAY_al_RecordNumbers{$_l_LayoutRefIndex}=0)
								LAY_al_RecordNumbers{$_l_LayoutRefIndex}:=1
							End if 
							If (LAY_al_ColumnNumber{$_l_LayoutRefIndex}=$_l_LastNumber)
								//its a clash
								If ($_l_RecordNumber#LAY_al_RecordNumbers{$_l_LayoutRefIndex})
									LAY_al_ColumnNumber{$_l_LayoutRefIndex}:=LAY_al_ColumnNumber{$_l_LayoutRefIndex}+1
									GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_LayoutRefIndex})
									[LIST_LAYOUTS:96]Order:7:=LAY_al_RecordNumbers{$_l_LayoutRefIndex}
									DB_SaveRecord(->[LIST_LAYOUTS:96])
								Else 
									$_l_offset:=0
									For ($_l_ColumnIndex2; $_l_LayoutRefIndex; 1; -1)
										If (LAY_al_ColumnNumber{$_l_ColumnIndex2}=LAY_al_ColumnNumber{$_l_LayoutRefIndex})
											LAY_al_ColumnNumber{$_l_ColumnIndex2}:=LAY_al_ColumnNumber{$_l_LayoutRefIndex}+$_l_offset
											GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_LayoutRefIndex})
											[LIST_LAYOUTS:96]Order:7:=LAY_al_RecordNumbers{$_l_LayoutRefIndex}
											DB_SaveRecord(->[LIST_LAYOUTS:96])
										End if 
										$_l_offset:=$_l_offset+1
									End for 
								End if 
							End if 
							$_l_LastNumber:=LAY_al_ColumnNumber{$_l_LayoutRefIndex}
						End for 
						SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
						$_l_ColumnNumber:=0
						For ($_l_LayoutRefIndex; 1; Size of array:C274(LAY_al_ColumnNumber))
							$_l_ColumnNumber:=$_l_LayoutRefIndex
							If (LAY_al_ColumnNumber{$_l_LayoutRefIndex}#$_l_ColumnNumber)
								GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_LayoutRefIndex})
								LAY_al_ColumnNumber{$_l_LayoutRefIndex}:=$_l_ColumnNumber
								[LIST_LAYOUTS:96]Order:7:=$_l_ColumnNumber
								DB_SaveRecord(->[LIST_LAYOUTS:96])
								
							End if 
						End for 
						LAY_bo_RecordEdited:=False:C215
						OBJECT SET VISIBLE:C603(LAY_l_ConfigSave; False:C215)
						OBJECT SET VISIBLE:C603(LAY_l_ConfigCancel; False:C215)
						//``````
					End if 
				End if 
				ACCEPT:C269
				Transact_End
				USE NAMED SELECTION:C332("Whenwecamein")
		End case 
		iCancel:=0
		iOK:=0
		
	: ($_l_event=On Resize:K2:27)
		
		LBI_Scrollonresize(->LAY_lb_Columns)
		LBI_Scrollonresize(->LAY_lb_ColumnSettings)
		
		
		
End case 
ERR_MethodTrackerReturn("FM LAYOUT_CONFIG"; $_t_oldMethodName)
