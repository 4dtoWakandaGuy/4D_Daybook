//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      TransB Audit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 13:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OK; MOD_l_CurrentModuleAccess; vNo; vTr)
	C_TEXT:C284($_t_oldMethodName; $_t_CurrentOutputform; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB Audit")
//TransB Audit
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
TransB_File
READ ONLY:C145([TRANSACTION_BATCHES:30])
While (vTr=1)
	Gen_Confirm("Print only Transactions not printed to date or select others?"; "Not Printed"; "Select")
	If (OK=1)
		QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Printed:11=False:C215; *)
		QUERY:C277([TRANSACTION_BATCHES:30];  & ; [TRANSACTION_BATCHES:30]State:15=2)
	Else 
		TransB_Sel
	End if 
	If (vTr=1)
		If (Records in selection:C76([TRANSACTION_BATCHES:30])>0)
			DB_t_CurrentFormUsage:="View2"
			vNo:=Records in selection:C76([TRANSACTION_BATCHES:30])
			
			ORDER BY:C49([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10; >)
			Open_Pro_Window("Audit Trail"; 0; 1; ->[TRANSACTION_BATCHES:30]; WIN_t_CurrentOutputform)
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			WIn_SetFormSize(1; ->[TRANSACTION_BATCHES:30]; WIN_t_CurrentOutputform)
			DISPLAY SELECTION:C59([TRANSACTION_BATCHES:30]; *)
			If (OK=1)
				If (Not:C34(SR_ReportOK("TransBAudit")))
					//Gen_Confirm ("Please choose Print Settings of 100% Landscape";"";"")
					$_l_OK:=PRINT_SetSIZE("A4"; "L"; "Transaction Batch Audit")
					If ($_l_OK>=0)  // see comments in Print_setsize about this
						FORM SET OUTPUT:C54([TRANSACTION_BATCHES:30]; "TransB List")
						PRINT SELECTION:C60([TRANSACTION_BATCHES:30])
						If ((OK=1) & (MOD_l_CurrentModuleAccess#3))
							Gen_Confirm("Were the Transactions printed correctly?"; "Yes"; "No")
							If (OK=1)
								READ WRITE:C146([TRANSACTION_BATCHES:30])
								DB_lockFile(->[TRANSACTION_BATCHES:30])
								APPLY TO SELECTION:C70([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Printed:11:=True:C214)
								
								AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTION_BATCHES:30]))
							End if 
							PRT_SetPrinterPaperOptions("Transaction Batch Audit")  //NG June 2005
						End if 
					End if 
				End if 
			End if 
			Close_ProWin
			vTr:=0
		Else 
			Gen_None("Transaction Batches"; ->vTr)
		End if 
	End if 
End while 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("TransB Audit"; $_t_oldMethodName)