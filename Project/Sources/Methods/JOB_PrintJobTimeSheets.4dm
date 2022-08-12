//%attributes = {}
If (False:C215)
	//Project Method Name:      JOB_PrintJobTimeSheets
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/11/2010 14:54
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_OK; $_l_WindowReferenceRow; ch1; ch2; DB_l_CurrentDisplayedForm; r0; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName; $_t_CurrentOutputform; DB_t_CurrentContext; vName; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JOB_PrintJobTimeSheets")
CREATE SET:C116([JOBS:26]; "$temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (OK=1) & (Records in selection:C76([JOBS:26])>0)
	
	If (Not:C34(SR_ReportOK("JobTImeSh")))
		Open_Sml_Window
		DIALOG:C40([JOBS:26]; "dAsk_TS")
		CLOSE WINDOW:C154
		$_l_OK:=OK
		OK:=1
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		If ($_l_OK=1)
			ALL RECORDS:C47([PERSONNEL:11])
			If (ch1=1)
				Gen_Confirm("Please select Personnel"; ""; "")
				$_t_CurrentOutputform:=WIN_t_CurrentOutputform  //NG added May 2004
				If (OK=1)
					//OUTPUT FORM([PERSONNEL];"Personnel_Out")
					//WIN_t_CurrentOutputform:="Personnel_Out"
					//DB_t_CurrentFormUsage:="Print"
					//FS_SetFormSort (WIN_t_CurrentOutputform)
					//WIn_SetFormSize (1;->[PERSONNEL];WIN_t_CurrentOutputform)
					//DISPLAY SELECTION([PERSONNEL];*)
					//I  `f (Records in set("Userset")>0)
					//USE SET("Userset")
					//End if
					
					DBI_MenuSelectRecords(Table name:C256(Table:C252(->[PERSONNEL:11])); True:C214)
				End if 
				WIN_t_CurrentOutputform:=$_t_CurrentOutputform
			End if 
			If (OK=1)
				$_l_OK:=PRINT_SetSIZE("A4"; "P"; "JobTimeSheet")
				If ($_l_OK>=0)
					If ($_l_OK=1)
						PRINT SETTINGS:C106
						$_l_OK:=OK
					Else 
						$_l_OK:=1
					End if 
					If ($_l_OK=1)
						$_t_CurrentOutputform:=WIN_t_CurrentOutputform
						ORDER BY:C49([PERSONNEL:11]; [PERSONNEL:11]Initials:1; >)
						FORM SET OUTPUT:C54([JOBS:26]; "Jobs_TS")  //NG added Table May 2004
						
						If (r0=1)
							ORDER BY:C49([JOBS:26]; [JOBS:26]Job_Code:1; >)
							PRINT SELECTION:C60([JOBS:26]; *)  //NG May 2004 added table
						Else 
							
							CREATE SET:C116([JOBS:26]; "JMaster")
							FIRST RECORD:C50([PERSONNEL:11])
							While (Not:C34(End selection:C36([PERSONNEL:11])))
								vName:=[PERSONNEL:11]Name:2
								QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Person:3=[PERSONNEL:11]Initials:1)
								CREATE EMPTY SET:C140([JOBS:26]; "Extra")
								FIRST RECORD:C50([JOB PERSONNEL:48])
								While (Not:C34(End selection:C36([JOB PERSONNEL:48])))
									RELATE ONE:C42([JOB PERSONNEL:48]Job_Code:1)
									If ((Is in set:C273("JMaster")) & ((ch2=0) | ([JOBS:26]Stage_Code:18=[JOB PERSONNEL:48]Stage_Code:2)))
										ADD TO SET:C119([JOBS:26]; "Extra")
									End if 
									NEXT RECORD:C51([JOB PERSONNEL:48])
								End while 
								USE SET:C118("Extra")
								If (Records in selection:C76>0)
									ORDER BY:C49([JOBS:26]Job_Code:1; >)
									PRINT SELECTION:C60([JOBS:26]; *)
								End if 
								
								NEXT RECORD:C51([PERSONNEL:11])
							End while 
							
						End if 
						PRT_SetPrinterPaperOptions("JobTimeSheet")  //NG June 2005
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("JOB_PrintJobTimeSheets"; $_t_oldMethodName)