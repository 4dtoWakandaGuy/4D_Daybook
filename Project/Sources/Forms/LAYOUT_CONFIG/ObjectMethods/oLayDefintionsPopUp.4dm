If (False:C215)
	//object Name: Object Name:      LAYOUT_CONFIG.oLayDefintionsPopUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/08/2012 11:00
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(LAY_lb_Columns;0)
	//ARRAY LONGINT(LAY_al_ColumnNumber;0)
	//ARRAY LONGINT(LAY_al_RecordNumbers;0)
	//ARRAY POINTER(DB_aptr_Setup;0)
	//ARRAY TEXT(LAY_at_ColumnTitle;0)
	//ARRAY TEXT(LL_at_FieldName;0)
	//ARRAY TEXT(LL_at_TableNames;0)
	//ARRAY TEXT(SVS_at_PreviewDateString;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	//ARRAY TEXT(SVS_at_PreviewNote;0)
	C_BOOLEAN:C305($_bo_LoadSetup; $_bo_newLevel; LAY_bo_AddRecord; LAY_bo_OverrideDefaults; LAY_bo_RecordEdited; Lay_bo_SetupEdited)
	C_LONGINT:C283($_l_ColumnIndex; $_l_ColumnIndex2; $_l_ColumnNumber; $_l_LastNumber; $_l_offset; $_l_PreviewRow; $_l_RecordNumber; $_l_ReuseLevel; $_l_Row; LAY_l_ConfigCancel; LAY_l_ConfigSave)
	C_LONGINT:C283(LAY_l_CurrentDefsFormID; LAY_l_CurrentDefsTable; LAY_l_LoadedRecord; vNo)
	C_POINTER:C301($_Ptr_KeyField)
	C_TEXT:C284($_t_ColumnTitle; $_t_oldMethodName; $_t_PreviewEvent; AL_T_Formula; DB_t_CurrentDefinitions; DB_t_CurrentFormUsage3; LAY_t_CurrentDefsName; LAY_t_CurrentUserDefs; LAY_T_LoadUserPrefs; LL_t_FieldName; LL_t_TableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ LAYOUT_CONFIG.oLayDefintionsPopUp"; Form event code:C388)

If (SVS_at_PreviewEvent>0)
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
		For ($_l_ColumnIndex; 1; Size of array:C274(LAY_al_ColumnNumber))
			If (LAY_al_RecordNumbers{$_l_ColumnIndex}=0)
				LAY_al_RecordNumbers{$_l_ColumnIndex}:=1
			End if 
			If (LAY_al_ColumnNumber{$_l_ColumnIndex}=$_l_LastNumber)
				//its a clash
				If ($_l_RecordNumber#LAY_al_RecordNumbers{$_l_ColumnIndex})
					LAY_al_ColumnNumber{$_l_ColumnIndex}:=LAY_al_ColumnNumber{$_l_ColumnIndex}+1
					GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
					[LIST_LAYOUTS:96]Order:7:=LAY_al_RecordNumbers{$_l_ColumnIndex}
					DB_SaveRecord(->[LIST_LAYOUTS:96])
				Else 
					$_l_offset:=0
					For ($_l_ColumnIndex2; $_l_ColumnIndex; 1; -1)
						If (LAY_al_ColumnNumber{$_l_ColumnIndex2}=LAY_al_ColumnNumber{$_l_ColumnIndex})
							LAY_al_ColumnNumber{$_l_ColumnIndex2}:=LAY_al_ColumnNumber{$_l_ColumnIndex}+$_l_offset
							GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
							[LIST_LAYOUTS:96]Order:7:=LAY_al_RecordNumbers{$_l_ColumnIndex}
							DB_SaveRecord(->[LIST_LAYOUTS:96])
						End if 
						$_l_offset:=$_l_offset+1
					End for 
				End if 
			End if 
			$_l_LastNumber:=LAY_al_ColumnNumber{$_l_ColumnIndex}
		End for 
		SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
		
		//``````
	End if 
	UNLOAD RECORD:C212([LIST_LAYOUTS:96])
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
	$_l_ColumnNumber:=0
	For ($_l_ColumnIndex; 1; Size of array:C274(LAY_al_ColumnNumber))
		$_l_ColumnNumber:=$_l_ColumnIndex
		If (LAY_al_ColumnNumber{$_l_ColumnIndex}#$_l_ColumnNumber)
			GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
			LAY_al_ColumnNumber{$_l_ColumnIndex}:=$_l_ColumnNumber
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
	$_l_PreviewRow:=Find in array:C230(SVS_at_PreviewEvent; DB_t_CurrentFormUsage3)
	If ($_l_PreviewRow>0)
		SVS_at_PreviewEvent:=$_l_PreviewRow
	Else 
		SVS_at_PreviewEvent:=1
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:Layouts_Out,SVS_at_PreviewEvent"; $_t_oldMethodName)
