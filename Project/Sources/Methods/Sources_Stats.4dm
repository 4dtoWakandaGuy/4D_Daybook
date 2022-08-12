//%attributes = {}
If (False:C215)
	//Project Method Name:      Sources_Stats
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 16:21
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_DATE:C307(<>DB_d_CurrentDate; vDateF; vDateT)
	C_LONGINT:C283(vNo1; vNo2; vNo3; vNo4; vP)
	C_REAL:C285(vDue; vInvoiced; vPaid; vTotal)
	C_TEXT:C284($_t_CurrentOutputform; $_t_DateString; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sources_Stats")
//GP Sources_Stats
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
If (Sources_File)
	If (Not:C34(<>StatesLoaded))
		States_Load
	End if 
	If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
		While (vP=1)
			Sources_Sel
			If (vP=1)
				If (Records in selection:C76([SOURCES:6])>0)
					//vNo:=Records in selection([SOURCES])
					//CREATE SET([SOURCES];"Master")
					//DB_t_CurrentFormUsage:="Print"
					//Open_Pro_Window ("Sources Statistics";0;1;->[SOURCES];WIN_t_CurrentOutputform)
					//FS_SetFormSort (WIN_t_CurrentOutputform)
					//WIn_SetFormSize (1;->[SOURCES];WIN_t_CurrentOutputform)
					//D`ISPLAY SELECTION([SOURCES];*)
					DBI_MenuSelectRecords(Table name:C256(Table:C252(->[SOURCES:6])))
					If (OK=1)
						If (Not:C34(SR_ReportOK("SourcStat")))
							$_t_DateString:="1/"+String:C10(Month of:C24(<>DB_d_CurrentDate))+"/"+Substring:C12(String:C10(Year of:C25(<>DB_d_CurrentDate)); 3; 2)
							vDateF:=Date:C102(Gen_Request("Report on Dates from:"; $_t_DateString))
							If (OK=1)
								$_t_DateString:=String:C10((vDateF+40)-Day of:C23(vDateF+40))
								vDateT:=Date:C102(Gen_Request("To Date:"; $_t_DateString))
								If (OK=1)
									FORM SET OUTPUT:C54([SOURCES:6]; "Sources_Stats")
									ORDER BY:C49([SOURCES:6]; [SOURCES:6]Source_Date:3; >)
									BREAK LEVEL:C302(0)
									ACCUMULATE:C303([SOURCES:6]Target_Leads:11; [SOURCES:6]Cost:4; vNo1; vNo2; vNo3; vNo4; vInvoiced; vPaid; vDue; vTotal)
									PRINT SELECTION:C60([SOURCES:6])
									
								End if 
							End if 
						End if 
					End if 
					Close_ProWin
					vP:=0
				Else 
					Gen_None("Sources"; ->vP)
				End if 
			End if 
		End while 
	Else 
		Gen_Alert("Orders Record States are not correctly set up"; "Cancel")
	End if 
End if 

Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Sources_Stats"; $_t_oldMethodName)
