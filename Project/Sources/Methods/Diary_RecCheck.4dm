//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_RecCheck
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2009 09:32`Method: Diary_RecCheck
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY TEXT(<>SCPT_at_ScriptCode;0)
	//ARRAY TEXT(<>SCPT_at_ScriptText;0)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_ScriptsInited; <>PER_bo_CurrentScriptonSave; <>SYS_bo_ScriptonSave; <>SYS_bo_StopMacros)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>AutoProc; <>SCPT_l_currentScriptProcess; <>SCPT_l_PlayerActive; <>SD3_l_DiaryMessageProcess; <>SYS_l_CancelProcess; $_l_Index; $_l_RecordsInSelection; $_l_ScriptPosition; SCPT_l_Cancel)
	C_TEXT:C284(<>CallCode; <>CompCode; <>ContCode; <>JobCode; <>OrderCode; <>PER_t_CurrentUserInitials; <>ProdCode; <>RECTEXT; <>SYS_t_MessageAction; $_t_oldMethodName; $_t_ScriptText)
	C_TEXT:C284($_t_Search; $RT; vProdName)
	C_TIME:C306(<>CTime; $_ti_Time)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_RecCheck")
If (<>SD3_l_DiaryMessageProcess>0)
	DelayTicks(1200)
End if 
Start_Process  //Count("")
Start_ProcMail
DB_SetMenuBar(""; 9)
READ ONLY:C145(*)
While (<>SD3_l_DiaryMessageProcess#0)
	IDLE:C311  // 03/04/03 pb
	<>DB_d_CurrentDate:=Current date:C33
	<>CTime:=Current time:C178
	
	If (<>SYS_t_MessageAction#"")
		$_t_Search:=<>PER_t_CurrentUserInitials+(" "*(5-(Length:C16(<>PER_t_CurrentUserInitials))))+"@"
		QUERY:C277([DIARY:12]; [DIARY:12]Personal_Priority:31=$_t_Search; *)
		//   SEARCH([DIARY];[DIARY]Person=◊User;*)
		//    SEARCH([DIARY]; & ;[DIARY]Done=False;*)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=<>DB_d_CurrentDate; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9=<>SYS_t_MessageAction; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Result_Code:11#"*INF")
		If (Records in selection:C76([DIARY:12])>0)
			QUERY SELECTION BY FORMULA:C207([DIARY:12]; Diary_CheckSrch)
			$_l_RecordsInSelection:=Records in selection:C76([DIARY:12])
			If ($_l_RecordsInSelection>0)
				If ($_l_RecordsInSelection>1)
					Gen_Confirm(String:C10($_l_RecordsInSelection)+" Messages have been received.  Do you wish to see them?"; "Yes"; "No")
				Else 
					If (Length:C16([DIARY:12]Action_Details:10)>40)
						vProdName:=Substring:C12([DIARY:12]Action_Details:10; 1; 40)+" …"
					Else 
						vProdName:=[DIARY:12]Action_Details:10
					End if 
					Gen_Confirm("A Message has been received from "+[DIARY:12]Originator:23+":"+Char:C90(13)+vProdName+Char:C90(13)+"Do you wish to see it in full?"; "Yes"; "No")
				End if 
				READ WRITE:C146([DIARY:12])
				$_l_RecordsInSelection:=OK
				If (Not:C34(In transaction:C397))
					DB_lockFile(->[DIARY:12])
					APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Result_Code:11:="*INF")
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
				Else 
					
					FIRST RECORD:C50([DIARY:12])
					For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
						[DIARY:12]Result_Code:11:="*INF"
						DB_SaveRecord(->[DIARY:12])
						AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
						NEXT RECORD:C51([DIARY:12])
					End for 
				End if 
				
				If ($_l_RecordsInSelection=1)
					<>AutoProc:=987654321
					<>AutoFind:=True:C214
					CUT NAMED SELECTION:C334([DIARY:12]; "◊IA")
					ZDiary_Mod
				End if 
				UNLOAD RECORD:C212([DIARY:12])
				READ ONLY:C145([DIARY:12])
			End if 
		End if 
	End if 
	
	If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
		$_l_RecordsInSelection:=Size of array:C274(<>PRC_al_ProcessNum)
		If ($_l_RecordsInSelection<=0)
			$_t_Search:=<>PER_t_CurrentUserInitials+(" "*(5-(Length:C16(<>PER_t_CurrentUserInitials))))+"@"
			QUERY:C277([DIARY:12]; [DIARY:12]Personal_Priority:31=$_t_Search; *)
			//   SEARCH([DIARY];[DIARY]Person=◊User;*)
			//   SEARCH([DIARY]; & ;[DIARY]Done=False;*)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=<>DB_d_CurrentDate; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Script_Code:29#"")
			
			If (Records in selection:C76([DIARY:12])>0)
				ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >; [DIARY:12]Time_Do_From:6; >)
				READ WRITE:C146([DIARY:12])
				FIRST RECORD:C50([DIARY:12])
				If ([DIARY:12]Date_Do_From:4=<>DB_d_CurrentDate)
					$_ti_Time:=Current time:C178
					QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Time_Do_From:6<=$_ti_Time)
					ORDER BY:C49([DIARY:12]Date_Do_From:4; >; [DIARY:12]Time_Do_From:6; >)
					FIRST RECORD:C50([DIARY:12])
				End if 
				If (Records in selection:C76([DIARY:12])>0)
					LOAD RECORD:C52([DIARY:12])
					RELATE ONE:C42([DIARY:12]Script_Code:29)
					If (Records in selection:C76([SCRIPTS:80])>0)
						
						<>CompCode:=[DIARY:12]Company_Code:1
						<>ContCode:=[DIARY:12]Contact_Code:2
						<>CallCode:=[DIARY:12]Call_Code:25
						<>OrderCode:=[DIARY:12]Order_Code:26
						<>JobCode:=[DIARY:12]Job_Code:19
						<>ProdCode:=[DIARY:12]Product_Code:13
						
						Macro([DIARY:12]Script_Code:29)
						
						[DIARY:12]Done:14:=True:C214
						[DIARY:12]Result_Code:11:="OK"
						[DIARY:12]Date_Done_From:5:=<>DB_d_CurrentDate
						[DIARY:12]Time_Done_From:7:=<>CTime
						[DIARY:12]Date_Done_To:34:=<>DB_d_CurrentDate
						[DIARY:12]Time_Done_To:36:=<>CTime
						Diary_PersPrior
						DB_SaveRecord(->[DIARY:12])
						AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
						Diary_InLPASeq("Result")
						
					End if 
				End if 
			End if 
			UNLOAD RECORD:C212([DIARY:12])
			READ ONLY:C145([DIARY:12])
		End if 
	End if 
	
	//see also Macro_AccType
	While (Semaphore:C143("$InitingMacros"))
		DelayTicks
	End while 
	If (Not:C34(<>DB_bo_ScriptsInited))  //NG in the macro trigger (and aLPA method) set this to false and it will reload automaticallly
		ARRAY TEXT:C222(<>SCPT_at_ScriptCode; 0)
		ARRAY TEXT:C222(<>SCPT_at_ScriptText; 0)
		<>DB_bo_ScriptsInited:=True:C214
	End if 
	CLEAR SEMAPHORE:C144("$InitingMacros")
	If (Not:C34(<>SYS_bo_ScriptonSave))
		If (DB_GetModuleSettingByNUM(Module_Macros)>0)
			<>SYS_bo_ScriptonSave:=<>PER_bo_CurrentScriptonSave
		End if 
	End if 
	If (<>SYS_bo_ScriptonSave)
		$_l_ScriptPosition:=Find in array:C230(<>SCPT_at_ScriptCode; "Background")
		If ($_l_ScriptPosition>0)
			<>SYS_l_CancelProcess:=0
			SCPT_l_Cancel:=0
			<>SYS_bo_StopMacros:=False:C215
			$_t_ScriptText:=Replace string:C233(<>SCPT_at_ScriptText{$_l_ScriptPosition}; "$"; "SCPT_")
			
			Record_Play(1; $_t_ScriptText; False:C215; "Background")
			
			
		Else 
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="Background")
			If (Records in selection:C76([SCRIPTS:80])>0)
				
				<>SYS_l_CancelProcess:=0
				SCPT_l_Cancel:=0
				<>SYS_bo_StopMacros:=False:C215
				While (Semaphore:C143("$InsertingMacroArray"))
					DelayTicks
				End while 
				APPEND TO ARRAY:C911(<>SCPT_at_ScriptCode; "Background")
				APPEND TO ARRAY:C911(<>SCPT_at_ScriptText; <>RecText)
				CLEAR SEMAPHORE:C144("$InsertingMacroArray")
				//<>vMacroCode:="Background"
				Record_Play(1; [SCRIPTS:80]Recording_Text:4; False:C215; "Background")
				UNLOAD RECORD:C212([SCRIPTS:80])
				
				
			End if 
		End if 
	End if 
	
	
	DelayTicks(4800)  //18000
End while 
ERR_MethodTrackerReturn("Diary_RecCheck"; $_t_oldMethodName)