//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_InLPASeq
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/03/2010 07:00
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_NextActionCodes; 0)
	ARRAY TEXT:C222($_at_WorkflowCodes; 0)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut; $_bo_NewDialog; $2; SD_bo_RecordModified)
	C_LONGINT:C283(<>AutoProc; $_l_CurrentWinRefOLD; $_l_DiaryID; $_l_Index; $_l_Process; $_l_RecordNumber; vDY; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; XCANCEL; XNEXT)
	C_LONGINT:C283(XOK)
	C_TEXT:C284(<>AutoFile; <>OrderCode; $_t_DiaryCode; $_t_DiaryText; $_t_oldMethodName; $1; SD_t_AutoResultNA)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InLPASeq")

If ((DB_GetModuleSettingByNUM(Module_Sequences))>1)
	If (Count parameters:C259>=2)
		$_bo_NewDialog:=$2
	Else 
		$_bo_NewDialog:=False:C215
	End if 
	If ($_bo_NewDialog)
		QUERY:C277([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]Result_Code:2=[DIARY:12]Result_Code:11)
		If (Records in selection:C76([WORKFLOW_CONTROL:51])>0)
			QUERY SELECTION:C341([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]Action_Code:1=[DIARY:12]Action_Code:9)
			If (Records in selection:C76([WORKFLOW_CONTROL:51])=0)
				QUERY:C277([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]Action_Code:1="")
				If (Records in selection:C76([WORKFLOW_CONTROL:51])#0)
					QUERY SELECTION:C341([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]Result_Code:2=[DIARY:12]Result_Code:11)
				End if 
			End if 
			
			If (Records in selection:C76([WORKFLOW_CONTROL:51])>0)
				SELECTION TO ARRAY:C260([WORKFLOW_CONTROL:51]WFControl_Code:10; $_at_WorkflowCodes; [WORKFLOW_CONTROL:51]Next_Action:3; $_at_NextActionCodes)
				
				$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
				WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 4)
				$_t_DiaryCode:=[DIARY:12]Diary_Code:3
				For ($_l_Index; 1; Size of array:C274($_at_NextActionCodes))
					SD_t_AutoResultNA:=$_at_WorkflowCodes{$_l_Index}
					QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_DiaryCode)
					DIALOG:C40([USER:15]; "DiaryResultsDialog")
				End for 
				CLOSE WINDOW:C154
				WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
				SD_bo_RecordModified:=False:C215
			End if 
		End if 
		
		
	Else 
		vDY:=0
		QUERY:C277([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]Result_Code:2=[DIARY:12]Result_Code:11)
		If (Records in selection:C76([WORKFLOW_CONTROL:51])>0)
			QUERY SELECTION:C341([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]Action_Code:1=[DIARY:12]Action_Code:9)
			If (Records in selection:C76([WORKFLOW_CONTROL:51])=0)
				QUERY:C277([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]Action_Code:1="")
				If (Records in selection:C76([WORKFLOW_CONTROL:51])#0)
					QUERY SELECTION:C341([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]Result_Code:2=[DIARY:12]Result_Code:11)
				End if 
			End if 
			If (Records in selection:C76([WORKFLOW_CONTROL:51])>0)
				If ($1="LPA")
					DB_SaveRecord(->[DIARY:12])
					AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
				End if 
				$_l_RecordNumber:=Record number:C243([DIARY:12])
				CUT NAMED SELECTION:C334([DIARY:12]; "Diary")
				GOTO RECORD:C242([DIARY:12]; $_l_RecordNumber)
				
				If (([WORKFLOW_CONTROL:51]Script_Code:11#"") & (DB_GetModuleSettingByNUM(Module_Macros)>1))
					Macro([WORKFLOW_CONTROL:51]Script_Code:11)
				End if 
				
				ORDER BY:C49([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]Display:6; <)
				FIRST RECORD:C50([WORKFLOW_CONTROL:51])
				While (Not:C34(End selection:C36([WORKFLOW_CONTROL:51])))
					Case of 
						: (([WORKFLOW_CONTROL:51]Display:6=0) & ($1="LPA"))  // & (◊SinProc=False))
							Gen_Confirm3("Suggested Workflow Action:"+Char:C90(13)+Substring_Word([WORKFLOW_CONTROL:51]Next_Action:3+" :"+[WORKFLOW_CONTROL:51]Description:5; 1; 85)+Char:C90(13)+Char:C90(13)+"Add & See it, or just add it?"; "See"; "Cancel"; "Add")
							OK:=Num:C11((XOK=1) | (XNEXT=1))
							If (OK=1)
								
								Diary_SeqCreate
								<>OrderCode:=""
								<>AutoFind:=True:C214
								<>DB_bo_AutoOut:=False:C215
								<>AutoProc:=Record number:C243([DIARY:12])
								<>AutoFile:="Diary"
								$_l_DiaryID:=[DIARY:12]x_ID:50
								UNLOAD RECORD:C212([DIARY:12])
								If (XNEXT=1)
								End if 
								//ZDiary_Mod
								$_l_Process:=New process:C317("SDAG_EditInProcess"; 64000; "Edit Diary Record"+String:C10($_l_DiaryID); $_l_DiaryID; 0; $_l_DiaryID)
								
							End if 
							XNEXT:=0
							XOK:=0
							XCANCEL:=0
						: (([WORKFLOW_CONTROL:51]Display:6=1) | (([WORKFLOW_CONTROL:51]Display:6=0) & ($1="Result")))  //(($1="Result") | (◊SinProc))))
							If ($1="Result")
								$_t_DiaryText:="Company: "+[DIARY:12]Company_Code:1+"   Action: "+[DIARY:12]Action_Code:9+Char:C90(13)+Char:C90(13)
							Else 
								$_t_DiaryText:=""
							End if 
							Gen_Confirm($_t_DiaryText+"Suggested Workflow Action:"+Char:C90(13)+Substring_Word([WORKFLOW_CONTROL:51]Next_Action:3+": "+[WORKFLOW_CONTROL:51]Description:5; 1; 85)+Char:C90(13)+Char:C90(13)+"Add it?"; "Yes"; "No")
							If (OK=1)
								Diary_SeqCreate
							End if 
						: ([WORKFLOW_CONTROL:51]Display:6=2)
							Diary_SeqCreate
					End case 
					NEXT RECORD:C51([WORKFLOW_CONTROL:51])
					GOTO RECORD:C242([DIARY:12]; $_l_RecordNumber)
				End while 
				USE NAMED SELECTION:C332("Diary")
			End if 
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("Diary_InLPASeq"; $_t_oldMethodName)
