//%attributes = {}
If (False:C215)
	//Project Method Name:      Time_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 16:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vD; vNo; vNo2)
	C_TEXT:C284($_t_oldMethodName; $_t_CurrentOutputform; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
	C_TIME:C306(Vhours; vTHOurs3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Time_List")
//Time_List
//Modified NG Feb2001 to set form sort and size
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
If (Diary_File)  //NG modified June 2004
	FORM SET INPUT:C55([DIARY:12]; "Diary_inT")  //NG April 2004 Removed ◊Screen
	
	WIN_t_CurrentInputForm:="Diary_inT"
	FORM SET OUTPUT:C54([DIARY:12]; "Diary_OutT")
	WIN_t_CurrentOutputform:="Diary_OutT"
	READ ONLY:C145([DIARY:12])
	While (vD=1)
		DB_t_CurrentFormUsage:="Time"
		Diary_Sel
		If (vD=1)
			If (Records in selection:C76([DIARY:12])>0)
				If (Not:C34(SR_ReportOK("DiaryTime")))
					vNo:=Records in selection:C76([DIARY:12])
					vNo2:=vNo
					ORDER BY:C49([DIARY:12]; [DIARY:12]Job_Code:19; >; [DIARY:12]Stage_Code:21; >; [DIARY:12]Person:8; >; [DIARY:12]Date_Done_From:5; >)
					DB_t_CurrentFormUsage:="Print"
					Open_Pro_Window("Time_List"; 0; 1; ->[DIARY:12]; WIN_t_CurrentOutputform)
					//no form sort possible because of above
					WIn_SetFormSize(1; ->[DIARY:12]; WIN_t_CurrentOutputform)
					DISPLAY SELECTION:C59([DIARY:12]; *)
					If (OK=1)
						If (vNo2#Records in selection:C76([DIARY:12]))
							ORDER BY:C49([DIARY:12]; [DIARY:12]Job_Code:19; >; [DIARY:12]Stage_Code:21; >; [DIARY:12]Person:8; >; [DIARY:12]Date_Done_From:5; >)
							vNo:=Records in selection:C76([DIARY:12])
						End if 
						FORM SET OUTPUT:C54([DIARY:12]; "Diary_ListT")
						BREAK LEVEL:C302(3)
						ACCUMULATE:C303([DIARY:12]Units:20; vHours; [DIARY:12]Value:16)
						PRINT SELECTION:C60([DIARY:12])
					End if 
				End if 
				Close_ProWin
				vD:=0
			Else 
				Gen_None("Time Items"; ->vD)
			End if 
		End if 
	End while 
End if 

Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Time_List"; $_t_oldMethodName)