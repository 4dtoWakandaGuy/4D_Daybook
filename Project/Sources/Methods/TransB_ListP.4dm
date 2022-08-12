//%attributes = {}
If (False:C215)
	//Project Method Name:      TransB_ListP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 13:02
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(vTr)
	C_LONGINT:C283(vTr; vNo)
	C_TEXT:C284($_t_CurrentOutputform; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform; $_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB_ListP")

$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
TransB_File
READ ONLY:C145([TRANSACTION_BATCHES:30])

While (vTr=1)
	TransB_Sel
	If (vTr=1)
		If (Records in selection:C76([TRANSACTION_BATCHES:30])>0)
			DB_t_CurrentFormUsage:="View2"
			vNo:=Records in selection:C76([TRANSACTION_BATCHES:30])
			ORDER BY:C49([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10; >)
			Open_Pro_Window("Print Trans Batches"; 0; 1; ->[TRANSACTION_BATCHES:30]; WIN_t_CurrentOutputform)
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			WIn_SetFormSize(1; ->[TRANSACTION_BATCHES:30]; WIN_t_CurrentOutputform)
			DISPLAY SELECTION:C59([TRANSACTION_BATCHES:30]; *)
			If (OK=1)
				If (Not:C34(SR_ReportOK("TransBPrint")))
					FORM SET OUTPUT:C54([TRANSACTION_BATCHES:30]; "TransB_Print")
					PRINT SELECTION:C60([TRANSACTION_BATCHES:30])
					
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
ERR_MethodTrackerReturn("TransB_ListP"; $_t_oldMethodName)
