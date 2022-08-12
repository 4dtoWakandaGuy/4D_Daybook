//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_InPr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:43
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_RecordNumber; vAdd; vIn)
	C_TEXT:C284($_t_InvoiceTypeName; $_t_oldMethodName; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_InPr")
//Invoices_InPr

$_t_InvoiceTypeName:="Enter Adhoc Proforma"
Start_Process
If (Invoices_File)
	If (vIn=1)
		QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
		$_l_RecordNumber:=Record number:C243([TRANSACTION_TYPES:31])
		If ((DB_GetLedgerTRANSINVpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
			If (In_Allowed($_t_InvoiceTypeName; ->[INVOICES:39]))
				CREATE SET:C116([INVOICES:39]; "IMaster")
				vAdd:=1
				OK:=1
				Open_Pro_Window($_t_InvoiceTypeName; 0; 2; ->[INVOICES:39]; WIN_t_CurrentInputForm)  //NG may 2004 added form references
				While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
					GOTO RECORD:C242([TRANSACTION_TYPES:31]; $_l_RecordNumber)
					//  START TRANSACTION
					StartTransaction  // 13/05/02 pb
					
					DB_t_CurrentFormUsage2:="Proforma"
					ADD RECORD:C56([INVOICES:39]; *)  //NG may 2004 added table
					If (OK=1)
						//         VALIDATE TRANSACTION
						//        FLUSH BUFFERS
						Transact_End  // 13/05/02 pb
						ADD TO SET:C119([INVOICES:39]; "IMaster")
					Else 
						//          CANCEL TRANSACTION
						Transact_End  // 13/05/02 pb
					End if 
					Gen_InOne
				End while 
				Close_ProWin(Table name:C256(->[INVOICES:39])+"_"+WIN_t_CurrentInputForm)
				vAdd:=0
				DB_t_CurrentFormUsage2:=""
			End if 
		Else 
			Gen_Alert("Required Setups have not been completed"; "")
		End if 
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("Invoices_InPr"; $_t_oldMethodName)