//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices List
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
	C_LONGINT:C283($_l_OK; vIn; vNo)
	C_REAL:C285(v0; v31)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices List")
//Invoices List
Start_Process
If (Invoices_File)
	READ ONLY:C145([INVOICES:39])
	While (vIn=1)
		Invoices_Sel
		If (vIn=1)
			If (Records in selection:C76([INVOICES:39])>0)
				vNo:=Records in selection:C76([INVOICES:39])
				DB_t_CurrentFormUsage:="Print"
				ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2; >)
				Open_Pro_Window(Term_SLPLWT("List Sales Ledger"))
				DISPLAY SELECTION:C59([INVOICES:39]; *)  //NG May 2004 added table
				If (OK=1)
					If (Not:C34(SR_ReportOK("SLList")))
						$_l_OK:=PRINT_SetSIZE("A4"; "P"; "ListSalesLedger")
						If ($_l_OK>=0)
							vTitle:=Uppercase:C13(Term_SLPLWT("Sales Ledger List"))
							FORM SET OUTPUT:C54([INVOICES:39]; "INVOICES_LIST_85")
							BREAK LEVEL:C302(1)
							ACCUMULATE:C303([INVOICES:39]Total_Invoiced:5; [INVOICES:39]Total_Due:7; v0; v31)
							PRINT SELECTION:C60([INVOICES:39])
							PRT_SetPrinterPaperOptions("ListSalesLedger")  //NG June 2005
						End if 
					End if 
				End if 
				Close_ProWin
				vIn:=0
			Else 
				Gen_None(Term_SLPLWT("Sales Ledger Items"); ->vIn)
			End if 
		End if 
	End while 
End if 
Process_End
ERR_MethodTrackerReturn("Invoices List"; $_t_oldMethodName)