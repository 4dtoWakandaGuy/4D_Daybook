//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices Rec
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
	C_LONGINT:C283(vIn; vNo; vNo2)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vTitle; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices Rec")
//Invoices Rec
If (False:C215)
	
	$_t_CurrentOutputform:=WIN_t_CurrentOutputform
	Start_Process
	If (Invoices_File)
		READ ONLY:C145([INVOICES:39])
		READ ONLY:C145([COMPANIES:2])
		While (vIn=1)
			DB_t_CurrentFormUsage:="Rec"
			Invoices_SelP
			If (vIn=1)
				If (Records in selection:C76([INVOICES:39])>0)
					vNo:=Records in selection:C76([INVOICES:39])
					vNo2:=vNo
					DB_t_CurrentFormUsage:="Print"
					ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >)
					Open_Pro_Window("Remittance Receipts"; 0; 1; ->[INVOICES:39]; WIN_t_CurrentOutputform)
					// FS_SetFormSort (WIN_t_CurrentOutputform)
					WIn_SetFormSize(1; ->[INVOICES:39]; WIN_t_CurrentOutputform)
					DISPLAY SELECTION:C59([INVOICES:39]; *)  //NG may 2004 added table
					
					vTitle:=""
					If (OK=1)
						If (vNo2#vNo)
							ORDER BY:C49([INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >)
						End if 
						FORM SET OUTPUT:C54([INVOICES:39]; "Receipt Rem")
						PRINT SELECTION:C60([INVOICES:39])
						FORM SET OUTPUT:C54([INVOICES:39]; "Invoices Out")
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
	WIN_t_CurrentOutputform:=$_t_CurrentOutputform
Else 
	DBI_MenuDisplayRecords("InvoicesPrintRemittance")
End if 
ERR_MethodTrackerReturn("Invoices Rec"; $_t_oldMethodName)