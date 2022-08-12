//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_Summ
	//------------------ Method Notes ------------------
	// see SD2_DiaryCallSummaries
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 12:51
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vD; vNo; vNo2)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_Summ")
//Diary_Summ

Start_Process
If (Diary_File2)
	READ ONLY:C145([DIARY:12])
	While (vD=1)
		Diary_Sel
		If (vD=1)
			If (Records in selection:C76([DIARY:12])>0)
				vNo:=Records in selection:C76([DIARY:12])
				vNo2:=vNo
				//ORDER BY([DIARY];[DIARY]Person;>;[DIARY]Date Do From;>;[DIARY]Action_Code;>;[DIARY]Time Do From;>)
				//DB_t_CurrentFormUsage:="Print"
				//Open_Pro_Window ("Call_Summaries";0;1;->[DIARY];WIN_t_CurrentOutputform)  `NG may 2004 added form name
				//FS_SetFormSort (WIN_t_CurrentOutputform)
				//WIn_SetFormSize (1;->[DIARY];WIN_t_CurrentOutputform)
				//DISPLAY SELECTION([DIARY];*)  `NG may 2004 added form name
				DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[DIARY:12])))
				
				If (OK=1)
					If (Records in selection:C76([DIARY:12])#vNo2)
						ORDER BY:C49([DIARY:12]Person:8; >; [DIARY:12]Date_Do_From:4; >; [DIARY:12]Action_Code:9; >; [DIARY:12]Time_Do_From:6; >)
					End if 
					If (Not:C34(SR_ReportOK("DiarySumm")))
						BREAK LEVEL:C302(1; 1)
						ACCUMULATE:C303([DIARY:12]Value:16)
						FORM SET OUTPUT:C54([DIARY:12]; "Call_Summaries")
						PRINT SELECTION:C60([DIARY:12])
						
					End if 
				End if 
				//Close_ProWin
				vD:=0
			Else 
				Gen_None("Diary Items"; ->vD)
			End if 
		End if 
	End while 
End if 

Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Diary_Summ"; $_t_oldMethodName)