If (False:C215)
	//Table Form Method Name: [USER]SD2_SimpleEntry
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/03/2010 09:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_DiaryRelations;0)
	//ARRAY BOOLEAN(SD2_lb_DiaryThread;0)
	//ARRAY TEXT(SD_at_TRActionName;0)
	//ARRAY TEXT(SD2_at_ResultNames;0)
	//ARRAY TEXT(SD2_at_TRActionCode;0)
	//ARRAY TEXT(SD2_at_TRCode;0)
	//ARRAY TEXT(SD2_at_TRDateTime;0)
	//ARRAY TEXT(SD2_at_TRStatus;0)
	//ARRAY TEXT(SD2_at_TRTitle;0)
	//ARRAY TEXT(SD2_at_WorkflowTable;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_DATE:C307(SD2_d_WorflowDate)
	C_LONGINT:C283($_l_event; $_l_Index; $_l_ThreadID; SD2_l_CBcompletedAction)
	C_TEXT:C284($_t_DiaryRecordCode; $_t_oldMethodName; SD2_t_ActionPlan; SD2_t_ResultCode; SD2_t_SELResultName; SD2_t_WorflowGroup; SD2_t_WorflowTitle; SD2_t_WorkflowPerson; SD2_t_WorkflowRecord; SD2_t_WorkflowRecordCode; SD2_t_WorkflowTable)
	C_TIME:C306(SD2_ti_WorkflowTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SD2_SimpleEntry"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		ARRAY TEXT:C222(SD2_at_WorkflowTable; 0)
		ARRAY BOOLEAN:C223(SD2_lb_DiaryRelations; 0)
		ARRAY BOOLEAN:C223(SD2_lb_DiaryThread; 0)
		ARRAY TEXT:C222(SD2_at_ResultNames; 0)
		ARRAY TEXT:C222(SD2_at_TRCode; 0)
		ARRAY TEXT:C222(SD2_at_TRActionCode; 0)
		ARRAY TEXT:C222(SD_at_TRActionName; 0)
		ARRAY TEXT:C222(SD2_at_TRStatus; 0)
		ARRAY TEXT:C222(SD2_at_TRDateTime; 0)
		ARRAY TEXT:C222(SD2_at_TRTitle; 0)
		
		If ([DIARY:12]Diary_Code:3#"")
			$_t_DiaryRecordCode:=[DIARY:12]Diary_Code:3
			$_l_ThreadID:=[DIARY:12]x_ID:50
			QUERY:C277([DIARY:12]; [DIARY:12]ThreadID:64=$_l_ThreadID; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]x_ID:50#$_l_ThreadID)
			//all other records in the thread
			If (Records in selection:C76([DIARY:12])>0)
				For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
					APPEND TO ARRAY:C911(SD2_at_TRCode; [DIARY:12]Diary_Code:3)
					APPEND TO ARRAY:C911(SD2_at_TRActionCode; [DIARY:12]Action_Code:9)
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
					APPEND TO ARRAY:C911(SD_at_TRActionName; [ACTIONS:13]Action_Name:2)
					APPEND TO ARRAY:C911(SD2_at_TRTitle; [DIARY:12]Subject:63)
					
					If ([DIARY:12]Result_Code:11="")
						APPEND TO ARRAY:C911(SD2_at_TRStatus; "Awaiting completion")
						If (SD2_at_TRTitle{Size of array:C274(SD2_at_TRTitle)}="")
							//action title(subject) was blank so get something from the plan
							SD2_at_TRTitle{Size of array:C274(SD2_at_TRTitle)}:=[DIARY:12]Action_Details:10
						End if 
					Else 
						QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Code:1=[DIARY:12]Result_Code:11)
						If (Records in selection:C76([RESULTS:14])>0)
							APPEND TO ARRAY:C911(SD2_at_TRStatus; [RESULTS:14]Result_Name:2)
						Else 
							
							APPEND TO ARRAY:C911(SD2_at_TRStatus; [DIARY:12]Result_Code:11)
						End if 
						If (SD2_at_TRTitle{Size of array:C274(SD2_at_TRTitle)}="")
							//action title(subject) was blank so get something from the plan
							SD2_at_TRTitle{Size of array:C274(SD2_at_TRTitle)}:=[DIARY:12]Result_Description:12
						End if 
					End if 
					APPEND TO ARRAY:C911(SD2_at_TRDateTime; "")
					SD2_at_TRDateTime{Size of array:C274(SD2_at_TRDateTime)}:=String:C10([DIARY:12]Date_Done_From:5; Blank if null date:K1:9+Internal date short:K1:7)+" "+String:C10([DIARY:12]Time_Done_From:7; HH MM:K7:2+Blank if null time:K7:12)
					If (SD2_at_TRDateTime{Size of array:C274(SD2_at_TRDateTime)}="")
						SD2_at_TRDateTime{Size of array:C274(SD2_at_TRDateTime)}:="Unknown date and time"
					End if 
					
					NEXT RECORD:C51([DIARY:12])
					
				End for 
				
			End if 
			QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_DiaryRecordCode)
		End if 
		SD2_LoadDiary("SD2_SimpleEntry")  // ([DIARY]Action Code)  `This same method is called from all diary loading forms.
	: ($_l_event=On Outside Call:K2:11)
		
End case 
ERR_MethodTrackerReturn("FM:SD2_SimpleEntry"; $_t_oldMethodName)
