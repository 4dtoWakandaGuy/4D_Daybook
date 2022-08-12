//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OK; vJ; vNo)
	C_TEXT:C284($_t_oldMethodName; $_t_CurrentOutputform; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_List")
//Jobs_List
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
If (Jobs_File)
	READ ONLY:C145([JOBS:26])
	While (vJ=1)
		Jobs_Sel
		If (vJ=1)
			If (Records in selection:C76([JOBS:26])>0)
				vNo:=Records in selection:C76([JOBS:26])
				
				DB_t_CurrentFormUsage:="Print"
				Open_Pro_Window("Jobs_List"; 0; 1; ->[JOBS:26]; WIN_t_CurrentOutputform)
				FS_SetFormSort(WIN_t_CurrentOutputform)
				WIn_SetFormSize(1; ->[JOBS:26]; WIN_t_CurrentOutputform)
				DISPLAY SELECTION:C59([JOBS:26]; *)  //NG may 2004 added table
				If (OK=1)
					If (Not:C34(SR_ReportOK("JobList")))
						//  Gen_Confirm ("Please choose Print Settings of 83% Landscape to include WIP fig
						$_l_OK:=PRINT_SetSIZE("A4"; "L"; "JobsLists")
						If ($_l_OK>=0)
							//OUTPUT FORM("Jobs_List")
							FORM SET OUTPUT:C54([JOBS:26]; "Jobs_List_83")
							ORDER BY:C49([JOBS:26]; [JOBS:26]Company_Code:3; >; [JOBS:26]Project_Code:27; >; [JOBS:26]Job_Code:1; >)
							BREAK LEVEL:C302(2)
							ACCUMULATE:C303([JOBS:26]AC_Actual_Cost_Amount:10; [JOBS:26]AS_Quoted_Amount:11; [JOBS:26]AS_Invoice_Excluding_Tax:12; [JOBS:26]AS_Invoice_Including_Tax:13; [JOBS:26]AT_Actual_Units:16; [JOBS:26]J_ Actual_Sales_Amount:17; [JOBS:26]JT_Budget_Units:20; [JOBS:26]JT_Bud_Sales_Amount:23; [JOBS:26]JT_Budget_Cost_Amount:30; [JOBS:26]JT_Actual_Cost_Amount:31; [JOBS:26]JC_Actual_Sales_Amount:32; [JOBS:26]JC_Budget_Sales_ Amount:33; [JOBS:26]JC_Budget_Cost_Amount:34; [JOBS:26]JS_Actual_Sales_Amount:35; [JOBS:26]JS_Actual_Cost_Amount:36; [JOBS:26]JS_Budget_Sales_Amount:37; [JOBS:26]JS_Budget_Cost_Amount:38; [JOBS:26]JS_Actual_Margin:39; [JOBS:26]JS_Budget_Margin:41; [JOBS:26]JT_WIP_Cost_Amount:43; [JOBS:26]JC_WIP_Cost_Amount:44; [JOBS:26]JS_WIP_Cost_Amount:45)
							
							PRINT SELECTION:C60([JOBS:26])
							PRT_SetPrinterPaperOptions("JobsList")  //NG June 2005
						End if 
					End if 
				End if 
				Close_ProWin
				vJ:=0
			Else 
				Gen_None("Jobs"; ->vJ)
			End if 
		End if 
	End while 
	Process_End
End if 
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Jobs_List"; $_t_oldMethodName)