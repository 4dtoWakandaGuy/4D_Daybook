//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_Print
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 15:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(ch0)
	//C_UNKNOWN(k12003)
	//C_UNKNOWN(rDiary)
	//C_UNKNOWN(vDate)
	//C_UNKNOWN(vFrom)
	//C_UNKNOWN(vLayCode)
	//C_UNKNOWN(vLetterCode)
	//C_UNKNOWN(vNo)
	//C_UNKNOWN(Write_2)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_DATE:C307(vDate; <>DB_d_CurrentDate)
	C_LONGINT:C283($_l_RecordNumber; $_l_SelectedRecordNumber; ch0; rDiary; vNo; WRITE_2; <>NoStart; $_l_RecordNumber; $_l_SelectedRecordNumber)
	C_PICTURE:C286($pict)
	C_TEXT:C284($_t_CloseSave; $_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vFrom; vLayCode; vLetterCode; <>SYS_t_4DWriteType)
	C_TEXT:C284($_t_CloseSave; $_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_Print")
//Diary_Print
If ((DB_GetModuleSettingByNUM(Module_WPManager))>1)
	If ([DIARY:12]Document_Code:15#"")
		$_t_CloseSave:=DB_t_CallOnCloseorSave
		$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
		DB_SaveRecord(->[DIARY:12])
		AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
		DB_t_CurrentFormUsage:="Button"
		vLetterCode:=[DIARY:12]Document_Code:15
		Start_ProcMail
		RELATE ONE:C42([DIARY:12]Person:8)
		vFrom:=[PERSONNEL:11]Name:2
		If ((DB_GetModuleSettingByNUM(1))=5)  //Restricted access for Silver - no other mailing options
			rDiary:=1
			RELATE ONE:C42([DIARY:12]Document_Code:15)
			If ([DIARY:12]Date_Done_From:5=!00-00-00!)
				vDate:=<>DB_d_CurrentDate
			Else 
				vDate:=[DIARY:12]Date_Done_From:5
			End if 
			vLayCode:=""
			ch0:=1
			Letter_Date
			Letters_SWDets
			Case of 
					//      : (◊Write="SW")  ` SuperWrite OUT 24/04/02 pb
					//      $_l_SelectedRecordNumber:=SW New Area
					//      If ($_l_SelectedRecordNumber>0)
					//         $_l_RecordNumber:=SW Set Area ($_l_SelectedRecordNumber;[DOCUMENTS]Write_)
					//         If ($_l_RecordNumber=0)
					//            $_l_RecordNumber:=SW Merge Values ($_l_SelectedRecordNumber;3)
					//           If ($_l_RecordNumber=0)
					//            $_l_RecordNumber:=SW Get Area ($_l_SelectedRecordNumber;$pict)
					//            If ($_l_RecordNumber=0)
					//               $_l_RecordNumber:=SW Print ($pict;3)
					//            End if
					//          End if
					//        End if
					//         $_l_RecordNumber:=SW Delete Area ($_l_SelectedRecordNumber)
					//      End if
				: (<>SYS_t_4DWriteType="WS")  // 4DWrite "Silver"
					Write_2:=WR New offscreen area:P12000:47  //wr new offscreen area
					//Write:=WR O Picture to offscreen are ([DOCUMENTS]Write_)
					WR PICTURE TO AREA:P12000:141(Write_2; [DOCUMENTS:7]Write_:5)
					WR SET DOC PROPERTY:P12000:109(Write_2; wr view references:K12003:17; 0)
					// WR O DO COMMAND (Write;111)
					//NG April 2000 update to 4D write 655-replaced above command
					
					WR EXECUTE COMMAND:P12000:113(Write_2; 401)
					WR DELETE OFFSCREEN AREA:P12000:38(Write_2)
			End case 
		Else 
			$_l_RecordNumber:=Record number:C243([DIARY:12])
			$_l_SelectedRecordNumber:=Selected record number:C246([DIARY:12])
			CUT NAMED SELECTION:C334([DIARY:12]; "Diary_Print")
			GOTO RECORD:C242([DIARY:12]; $_l_RecordNumber)
			vNo:=1
			<>NoStart:=1
			DBI_MenuDisplayRecords("DiaryMailing")
			
			USE NAMED SELECTION:C332("Diary_Print")
			//  POP RECORD([DIARY])
			GOTO SELECTED RECORD:C245([DIARY:12]; $_l_SelectedRecordNumber)
			vNo:=Records in selection:C76([DIARY:12])
		End if 
		DB_t_CallOnCloseorSave:=$_t_CloseSave
		DB_bo_RecordModified:=True:C214
		DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
	Else 
		Gen_Alert("Please enter a Document Code first"; "")
	End if 
Else 
	Gen_Alert("You do not have access to the WP Module"; "Cancel")
End if 
ERR_MethodTrackerReturn("Diary_Print"; $_t_oldMethodName)
