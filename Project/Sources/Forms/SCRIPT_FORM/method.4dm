If (False:C215)
	//Project Form Method Name: SCRIPT_FORM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/08/2012 13:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SCPT_abo_SameProcess;0)
	//ARRAY BOOLEAN(SCRPT_lb_Scripts;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY TEXT(SCPT_at_MacroCode;0)
	//ARRAY TEXT(SCPT_at_MacroName;0)
	//ARRAY TEXT(SCRPT_at_TableNames;0)
	C_BOOLEAN:C305(<>FindMy; DB_bo_NoLoad)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_FormWidth; $_l_MinObjectSize; $_l_ObjectSetSize; $_l_Row; $_l_ScriptIndex; $_l_TableNumber; $_l_TableRow; $_l_WindowBottom; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRight; $_l_windowTop; DB_l_CURRENTDISPLAYEDFORM; SCC_l_ParentOLD; SCPT_but_1; SCPT_but_2; SCPT_but_3; SCPT_but_4; SCPT_l_BUT1; SCPT_l_But2; SCPT_l_BUT3)
	C_LONGINT:C283(SCPT_l_BUT4; SCPT_l_BUT5; SCPT_l_BUT6; SCPT_l_BUT7; SCPT_l_BUT8; SCPT_l_BUT9; SCPT_l_ExecutionState; SCPT_l_ParentProcess; SCPT_l_ParentProcessOLD)
	C_POINTER:C301($_Ptr_Table)
	C_REAL:C285(SRCH_r_Timer; SRCH_r_TimerOLD)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_TableName; SCPT_t_COL1; SCPT_t_COL2; SCPT_t_COL3; SCPT_t_COL4; SCPT_t_COL5; SCPT_t_COL6; SCPT_t_COL7; SCPT_t_COL8)
	C_TEXT:C284(SCPT_t_COL9; SCPT_t_CurrentlyExecuting; SCPT_t_HED1; SCPT_t_HED2; SCPT_t_HED3; SCPT_t_HED4; SCPT_t_HED5; SCPT_t_HED6; SCPT_t_HED7; SCPT_t_HED8; SCPT_t_HED9)
	C_TEXT:C284(SRCH_t_SearchValue; SRCH_t_SearchValueOLD)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/SCRIPT_FORM/{formMethod}"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Designer"))
			OBJECT SET VISIBLE:C603(*; "oButtonAdd"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oButtonDelete"; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(*; "oButtonAdd"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oButtonDelete"; False:C215)
			
		End if 
		ARRAY TEXT:C222(SCRPT_at_TableNames; 0)
		Array_CopyFiles(->SCRPT_at_TableNames)
		INSERT IN ARRAY:C227(SCRPT_at_TableNames; 1; 1)
		SCRPT_at_TableNames{1}:="Unspecified"
		If (DB_l_CURRENTDISPLAYEDFORM>0)
			$_Ptr_Table:=Table:C252(DB_l_CURRENTDISPLAYEDFORM)
			$_t_TableName:=Table name:C256(DB_l_CURRENTDISPLAYEDFORM)
			$_l_TableRow:=Find in array:C230(SCRPT_at_TableNames; $_t_TableName)
			If ($_l_TableRow>0)
				SCRPT_at_TableNames:=$_l_TableRow
			Else 
				SCRPT_at_TableNames:=1
			End if 
		Else 
			SCRPT_at_TableNames:=1
		End if 
		
		READ ONLY:C145([SCRIPTS:80])
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=DB_l_CURRENTDISPLAYEDFORM; *)
		QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Script_Code:1#"©@")
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddToDataEntryFunctionsMenu:18=False:C215)
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoDataEntryReportsMenu:17=False:C215)
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoFunctionsMenu:16=False:C215)
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoReportsMenu:15=False:C215)
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"-@")
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Command @")
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Load @")
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Accept @")
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Modified @")
		If (<>FindMy)
			QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Person:5=<>PER_t_CurrentUserInitials)
		End if 
		SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Name:2; SCPT_at_MacroName; [SCRIPTS:80]Script_Code:1; SCPT_at_MacroCode; [SCRIPTS:80]Same_Process:6; SCPT_abo_SameProcess)
		For ($_l_ScriptIndex; 1; Size of array:C274(SCPT_at_MacroName))
			If (SCPT_at_MacroName{$_l_ScriptIndex}="")
				SCPT_at_MacroName{$_l_ScriptIndex}:=SCPT_at_MacroCode{$_l_ScriptIndex}
			End if 
		End for 
		
		LB_SetupListbox(->SCRPT_lb_Scripts; "SCPT_t"; "SCPT_L"; 1; ->SCPT_at_MacroName; ->SCPT_at_MacroCode; ->SCPT_abo_SameProcess)
		
		LB_SetColumnHeaders(->SCRPT_lb_Scripts; "SCPT_L"; 1; "Macro"; "Code"; "Same Process")
		LB_SetEnterable(->SCRPT_lb_Scripts; False:C215; 0)
		LB_SetColumnWidths(->SCRPT_lb_Scripts; "SCPT_t"; 1; 147; 47; 0)
		LB_SetScroll(->SCRPT_lb_Scripts; -2; -2)
		LB_StyleSettings(->SCRPT_lb_Scripts; "Black"; 9; "SCPT_t"; ->[ACCOUNTS:32])
		//OBJECT SET ENABLED(SCPT_but_1;False)
		//OBJECT SET ENABLED(SCPT_but_2;False)
		//OBJECT SET ENABLED(SCPT_but_3;False)
		//OBJECT SET ENABLED(SCPT_but_4;False)
		OBJECT SET ENABLED:C1123(SCPT_but_1; False:C215)
		OBJECT SET ENABLED:C1123(SCPT_but_2; False:C215)
		OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
		OBJECT SET ENABLED:C1123(SCPT_but_4; False:C215)
		
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		
		$_l_FormWidth:=$_l_WindowRight-$_l_WindowLeft
		$_l_MinObjectSize:=556-440+(16*10)
		
		$_l_ObjectSetSize:=(555-440)+(Size of array:C274(SCPT_at_MacroName)*16)
		If ($_l_ObjectSetSize<$_l_MinObjectSize)
			$_l_ObjectSetSize:=$_l_MinObjectSize
		End if 
		WS_AutoscreenSize(2; $_l_ObjectSetSize; $_l_FormWidth)
		SCPT_l_ParentProcessOLD:=SCPT_l_ParentProcess
	: ($_l_event=On Outside Call:K2:11)
		
		If (SCPT_l_ExecutionState>=0)
			If (SCPT_l_ParentProcessOLD#SCPT_l_ParentProcess)
				If (DB_l_CURRENTDISPLAYEDFORM>0)
					
					$_t_TableName:=Table name:C256(DB_l_CURRENTDISPLAYEDFORM)
					
					$_l_TableRow:=Find in array:C230(SCRPT_at_TableNames; $_t_TableName)
					If ($_l_TableRow>0)
						
						
						
						If (SCRPT_at_TableNames#$_l_TableRow)  //The table is changed
							
							READ ONLY:C145([SCRIPTS:80])
							QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=DB_l_CURRENTDISPLAYEDFORM; *)
							QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Script_Code:1#"©@")
							QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddToDataEntryFunctionsMenu:18=False:C215)
							QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoDataEntryReportsMenu:17=False:C215)
							QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoFunctionsMenu:16=False:C215)
							QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoReportsMenu:15=False:C215)
							QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"-@")
							QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Command @")
							QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Load @")
							QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Accept @")
							QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Modified @")
							If (<>FindMy)
								QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Person:5=<>PER_t_CurrentUserInitials)
							End if 
							SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Name:2; SCPT_at_MacroName; [SCRIPTS:80]Script_Code:1; SCPT_at_MacroCode; [SCRIPTS:80]Same_Process:6; SCPT_abo_SameProcess)
							For ($_l_ScriptIndex; 1; Size of array:C274(SCPT_at_MacroName))
								If (SCPT_at_MacroName{$_l_ScriptIndex}="")
									SCPT_at_MacroName{$_l_ScriptIndex}:=SCPT_at_MacroCode{$_l_ScriptIndex}
								End if 
							End for 
							//OBJECT SET ENABLED(SCPT_but_1;False)
							//OBJECT SET ENABLED(SCPT_but_2;False)
							//OBJECT SET ENABLED(SCPT_but_3;False)
							//OBJECT SET ENABLED(SCPT_but_4;False)
							OBJECT SET ENABLED:C1123(SCPT_but_1; False:C215)
							OBJECT SET ENABLED:C1123(SCPT_but_2; False:C215)
							OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
							OBJECT SET ENABLED:C1123(SCPT_but_4; False:C215)
							GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
							
							$_l_FormWidth:=$_l_WindowRight-$_l_WindowLeft
							$_l_MinObjectSize:=556-440+(16*10)
							
							$_l_ObjectSetSize:=(555-440)+(Size of array:C274(SCPT_at_MacroName)*16)
							If ($_l_ObjectSetSize<$_l_MinObjectSize)
								$_l_ObjectSetSize:=$_l_MinObjectSize
							End if 
							//GET WINDOW RECT($_l_WindowLeft;$_l_windowTop;$_l_WindowRight;$_l_WindowBottom)
							//SET WINDOW RECT($_l_WindowLeft;$_l_windowTop;$_l_WindowLeft+$_l_FormWidth;$_l_windowTop+$_l_ObjectSetSize)
							//WS_AutoscreenSize (5;$_l_ObjectSetSize;$_l_FormWidth)
						End if 
						SCRPT_at_TableNames:=$_l_TableRow
					Else 
						SCRPT_at_TableNames:=1
					End if 
				Else 
					
					
					If (SCRPT_at_TableNames#1)  //The table is changed-to unspecified
						
						READ ONLY:C145([SCRIPTS:80])
						QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=DB_l_CURRENTDISPLAYEDFORM; *)
						QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Script_Code:1#"©@")
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddToDataEntryFunctionsMenu:18=False:C215)
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoDataEntryReportsMenu:17=False:C215)
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoFunctionsMenu:16=False:C215)
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoReportsMenu:15=False:C215)
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"-@")
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Command @")
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Load @")
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Accept @")
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Modified @")
						If (<>FindMy)
							QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Person:5=<>PER_t_CurrentUserInitials)
						End if 
						SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Name:2; SCPT_at_MacroName; [SCRIPTS:80]Script_Code:1; SCPT_at_MacroCode; [SCRIPTS:80]Same_Process:6; SCPT_abo_SameProcess)
						For ($_l_ScriptIndex; 1; Size of array:C274(SCPT_at_MacroName))
							If (SCPT_at_MacroName{$_l_ScriptIndex}="")
								SCPT_at_MacroName{$_l_ScriptIndex}:=SCPT_at_MacroCode{$_l_ScriptIndex}
							End if 
						End for 
						OBJECT SET ENABLED:C1123(SCPT_but_1; False:C215)
						OBJECT SET ENABLED:C1123(SCPT_but_2; False:C215)
						OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
						OBJECT SET ENABLED:C1123(SCPT_but_4; False:C215)
						
						//OBJECT SET ENABLED(SCPT_but_1;False)
						//OBJECT SET ENABLED(SCPT_but_2;False)
						//OBJECT SET ENABLED(SCPT_but_3;False)
						//OBJECT SET ENABLED(SCPT_but_4;False)
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						
						$_l_FormWidth:=$_l_WindowRight-$_l_WindowLeft
						$_l_MinObjectSize:=556-440+(16*10)
						
						$_l_ObjectSetSize:=(555-440)+(Size of array:C274(SCPT_at_MacroName)*16)
						If ($_l_ObjectSetSize<$_l_MinObjectSize)
							$_l_ObjectSetSize:=$_l_MinObjectSize
						End if 
						//WS_AutoscreenSize (2;$_l_ObjectSetSize;$_l_FormWidth)
						//GET WINDOW RECT($_l_WindowLeft;$_l_windowTop;$_l_WindowRight;$_l_WindowBottom)
						//SET WINDOW RECT($_l_WindowLeft;$_l_windowTop;$_l_WindowLeft+$_l_FormWidth;$_l_windowTop+$_l_ObjectSetSize)
						
					End if 
					SCRPT_at_TableNames:=1
				End if 
			End if 
		End if 
		SCPT_l_ParentProcessOLD:=SCPT_l_ParentProcess
		Case of 
				
			: (SCPT_l_ExecutionState=0)
				LISTBOX GET CELL POSITION:C971(*; "oLBScripts"; $_l_Column; $_l_Row)
				If ($_l_Row>0)
					//OBJECT SET ENABLED(SCPT_but_1;TRUE)
					//OBJECT SET ENABLED(SCPT_but_2;TRUE)
					//OBJECT SET ENABLED(SCPT_but_3;False)
					//OBJECT SET ENABLED(SCPT_but_4;False)
					OBJECT SET ENABLED:C1123(SCPT_but_1; True:C214)
					OBJECT SET ENABLED:C1123(SCPT_but_2; True:C214)
					OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
					OBJECT SET ENABLED:C1123(SCPT_but_4; False:C215)
				Else 
					//OBJECT SET ENABLED(SCPT_but_1;False)
					//OBJECT SET ENABLED(SCPT_but_2;False)
					//OBJECT SET ENABLED(SCPT_but_3;False)
					//OBJECT SET ENABLED(SCPT_but_4;False)
					OBJECT SET ENABLED:C1123(SCPT_but_1; False:C215)
					OBJECT SET ENABLED:C1123(SCPT_but_2; False:C215)
					OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
					OBJECT SET ENABLED:C1123(SCPT_but_4; False:C215)
				End if 
			: (SCPT_l_ExecutionState=1)
				//...scrpt executing
				//OBJECT SET ENABLED(SCPT_but_1;False)
				//OBJECT SET ENABLED(SCPT_but_2;False)
				//OBJECT SET ENABLED(SCPT_but_3;TRUE)
				//OBJECT SET ENABLED(SCPT_but_4;TRUE)
				OBJECT SET ENABLED:C1123(SCPT_but_1; False:C215)
				OBJECT SET ENABLED:C1123(SCPT_but_2; False:C215)
				OBJECT SET ENABLED:C1123(SCPT_but_3; True:C214)
				OBJECT SET ENABLED:C1123(SCPT_but_4; True:C214)
			: (SCPT_l_ExecutionState=-3)
				SCPT_l_ExecutionState:=0
				LISTBOX GET CELL POSITION:C971(*; "oLBScripts"; $_l_Column; $_l_Row)
				If ($_l_Row>0)
					//OBJECT SET ENABLED(SCPT_but_1;TRUE)
					//OBJECT SET ENABLED(SCPT_but_2;TRUE)
					//OBJECT SET ENABLED(SCPT_but_3;False)
					//OBJECT SET ENABLED(SCPT_but_4;False)
					OBJECT SET ENABLED:C1123(SCPT_but_1; True:C214)
					OBJECT SET ENABLED:C1123(SCPT_but_2; True:C214)
					OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
					OBJECT SET ENABLED:C1123(SCPT_but_4; False:C215)
				Else 
					OBJECT SET ENABLED:C1123(SCPT_but_1; False:C215)
					OBJECT SET ENABLED:C1123(SCPT_but_2; False:C215)
					OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
					OBJECT SET ENABLED:C1123(SCPT_but_4; False:C215)
					//OBJECT SET ENABLED(SCPT_but_1;False)
					//OBJECT SET ENABLED(SCPT_but_2;False)
					//OBJECT SET ENABLED(SCPT_but_3;False)
					//OBJECT SET ENABLED(SCPT_but_4;False)
				End if 
			: (SCPT_l_ExecutionState=-4)  //Refresh the list we went to add...
				
				DB_l_CURRENTDISPLAYEDFORM:=SCC_l_ParentOLD
				READ ONLY:C145([SCRIPTS:80])
				If (SCRPT_at_TableNames>1)
					$_l_TableRow:=DB_GetTableNumFromNameString(SCRPT_at_TableNames{SCRPT_at_TableNames})
					If ($_l_TableRow>0)
						$_l_TableNumber:=<>DB_al_TableNums{$_l_TableRow}
						QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=$_l_TableNumber; *)
					Else 
						QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=0; *)
					End if 
				Else 
					QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=0; *)
				End if 
				QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Script_Code:1#"©@")
				QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddToDataEntryFunctionsMenu:18=False:C215)
				QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoDataEntryReportsMenu:17=False:C215)
				QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoFunctionsMenu:16=False:C215)
				QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoReportsMenu:15=False:C215)
				QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"-@")
				QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Command @")
				QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Load @")
				QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Accept @")
				QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Modified @")
				If (<>FindMy)
					QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Person:5=<>PER_t_CurrentUserInitials)
				End if 
				SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Name:2; SCPT_at_MacroName; [SCRIPTS:80]Script_Code:1; SCPT_at_MacroCode; [SCRIPTS:80]Same_Process:6; SCPT_abo_SameProcess)
				For ($_l_ScriptIndex; 1; Size of array:C274(SCPT_at_MacroName))
					If (SCPT_at_MacroName{$_l_ScriptIndex}="")
						SCPT_at_MacroName{$_l_ScriptIndex}:=SCPT_at_MacroCode{$_l_ScriptIndex}
					End if 
				End for 
				SCPT_l_ExecutionState:=0
				LISTBOX GET CELL POSITION:C971(*; "oLBScripts"; $_l_Column; $_l_Row)
				If ($_l_Row>0)
					//OBJECT SET ENABLED(SCPT_but_1;TRUE)
					//OBJECT SET ENABLED(SCPT_but_2;TRUE)
					//OBJECT SET ENABLED(SCPT_but_3;False)
					//OBJECT SET ENABLED(SCPT_but_4;False)
					OBJECT SET ENABLED:C1123(SCPT_but_1; True:C214)
					OBJECT SET ENABLED:C1123(SCPT_but_2; True:C214)
					OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
					OBJECT SET ENABLED:C1123(SCPT_but_4; False:C215)
				Else 
					OBJECT SET ENABLED:C1123(SCPT_but_1; False:C215)
					OBJECT SET ENABLED:C1123(SCPT_but_2; False:C215)
					OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
					OBJECT SET ENABLED:C1123(SCPT_but_4; False:C215)
					//OBJECT SET ENABLED(SCPT_but_1;False)
					//OBJECT SET ENABLED(SCPT_but_2;False)
					//OBJECT SET ENABLED(SCPT_but_3;False)
					//OBJECT SET ENABLED(SCPT_but_4;False)
				End if 
			: (SCPT_l_ExecutionState=-5)
				CANCEL:C270
				
		End case 
		
	: ($_l_event=On Timer:K2:25)
		
		SRCH_r_Timer:=Tickcount:C458
		//BEEP
		
		If (SRCH_r_TimerOLD>0)
			If (SRCH_r_Timer>(SRCH_r_TimerOLD+30)) & (SRCH_t_SearchValue=SRCH_t_SearchValueOLD)
				SET TIMER:C645(0)
				If (DB_l_CurrentDisplayedForm>0)
					$_Ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
				End if 
				If (SRCH_t_SearchValue#"")
					If (SRCH_t_SearchValue="*ALL")
						READ ONLY:C145([SCRIPTS:80])
						If (SCRPT_at_TableNames>1)
							$_l_TableNumber:=DB_GetTableNumFromNameString(SCRPT_at_TableNames{SCRPT_at_TableNames})
							If ($_l_TableNumber>0)
								$_l_TableNumber:=<>DB_al_TableNums{$_l_TableNumber}
								QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=$_l_TableNumber; *)
							Else 
								QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=0; *)
							End if 
						Else 
							QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=0; *)
						End if 
						QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Script_Code:1#"©@")
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddToDataEntryFunctionsMenu:18=False:C215)
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoDataEntryReportsMenu:17=False:C215)
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoFunctionsMenu:16=False:C215)
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoReportsMenu:15=False:C215)
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"-@")
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Command @")
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Load @")
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Accept @")
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Modified @")
						If (<>FindMy)
							QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Person:5=<>PER_t_CurrentUserInitials)
						End if 
						SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Name:2; SCPT_at_MacroName; [SCRIPTS:80]Script_Code:1; SCPT_at_MacroCode; [SCRIPTS:80]Same_Process:6; SCPT_abo_SameProcess)
						For ($_l_ScriptIndex; 1; Size of array:C274(SCPT_at_MacroName))
							If (SCPT_at_MacroName{$_l_ScriptIndex}="")
								SCPT_at_MacroName{$_l_ScriptIndex}:=SCPT_at_MacroCode{$_l_ScriptIndex}
							End if 
						End for 
						SRCH_t_SearchValue:=""
						
					Else 
						
						READ ONLY:C145([SCRIPTS:80])
						If (SCRPT_at_TableNames>1)
							$_l_TableNumber:=DB_GetTableNumFromNameString(SCRPT_at_TableNames{SCRPT_at_TableNames})
							If ($_l_TableNumber>0)
								$_l_TableNumber:=<>DB_al_TableNums{$_l_TableNumber}
								QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=$_l_TableNumber; *)
							Else 
								QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=0; *)
							End if 
						Else 
							QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=0; *)
						End if 
						QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Script_Code:1#"©@")
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddToDataEntryFunctionsMenu:18=False:C215)
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoDataEntryReportsMenu:17=False:C215)
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoFunctionsMenu:16=False:C215)
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoReportsMenu:15=False:C215)
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"-@")
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Command @")
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Load @")
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Accept @")
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"Modified @")
						QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=SRCH_t_SearchValue+"@"; *)
						QUERY SELECTION:C341([SCRIPTS:80];  | [SCRIPTS:80]Script_Name:2=SRCH_t_SearchValue+"@")
						If (<>FindMy)
							QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Person:5=<>PER_t_CurrentUserInitials)
						End if 
						SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Name:2; SCPT_at_MacroName; [SCRIPTS:80]Script_Code:1; SCPT_at_MacroCode; [SCRIPTS:80]Same_Process:6; SCPT_abo_SameProcess)
						For ($_l_ScriptIndex; 1; Size of array:C274(SCPT_at_MacroName))
							If (SCPT_at_MacroName{$_l_ScriptIndex}="")
								SCPT_at_MacroName{$_l_ScriptIndex}:=SCPT_at_MacroCode{$_l_ScriptIndex}
							End if 
						End for 
					End if 
					
					
				Else 
					//Load the current selection
					
				End if 
				
			Else 
				
				
				If (SRCH_t_SearchValueOLD#SRCH_t_SearchValue)
					
					SRCH_r_TimerOLD:=SRCH_r_Timer
				End if 
			End if 
			SRCH_t_SearchValueOLD:=SRCH_t_SearchValue
		Else 
			SRCH_r_TimerOLD:=SRCH_r_Timer
			SRCH_t_SearchValueOLD:=SRCH_t_SearchValue
		End if 
End case 
ERR_MethodTrackerReturn("FM SCRIPT_FORM"; $_t_oldMethodName)
