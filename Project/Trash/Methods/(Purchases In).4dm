//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchases In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 16:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_WindowOpen; vFromIn)
	C_LONGINT:C283($_l_RecordNumber; SD_l_ParentProcess; vAdd; vPu)
	C_TEXT:C284($_t_oldMethodName; $_t_PurchaseCode; $_t_PurchaseInvoiceTitle; $1; $2; $3; $4; DB_t_CallOnCloseorSave; SD_t_CallingCompanyCode; SD_t_CallingContactCode; SD_t_InputFormName)
	C_TEXT:C284(WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases In")
//Purchases In
$_t_PurchaseInvoiceTitle:=Term_SLPLWT("Enter Purchase Invoices")
Start_Process
If (Count parameters:C259>=1)
	SD_l_ParentProcess:=Num:C11($1)
End if 
If (Count parameters:C259>=2)
	SD_t_CallingCompanyCode:=$2
End if 
If (Count parameters:C259>=3)
	SD_t_CallingContactCode:=$3
End if 
If (Count parameters:C259>=4)
	SD_t_InputFormName:=$4
End if 

Purchases_File
If (SD_t_InputFormName#"")
	FORM SET INPUT:C55([PURCHASE_INVOICES:37]; SD_t_InputFormName)
	WIN_t_CurrentInputForm:=SD_t_InputFormName
End if 
If (vPu=1)
	QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSPURpost)
	$_l_RecordNumber:=Record number:C243([TRANSACTION_TYPES:31])
	If ((DB_GetLedgerTRANSPURpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
		If (In_Allowed($_t_PurchaseInvoiceTitle; ->[PURCHASE_INVOICES:37]))
			CREATE SET:C116([PURCHASE_INVOICES:37]; "Master")
			REDUCE SELECTION:C351([PURCHASE_INVOICES:37]; 0)
			OK:=1
			//Open_Pro_Window ($_t_PurchaseInvoiceTitle)
			$_bo_WindowOpen:=False:C215
			While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
				GOTO RECORD:C242([TRANSACTION_TYPES:31]; $_l_RecordNumber)
				
				Purchases_FileI
				//  START TRANSACTION
				If (Not:C34($_bo_WindowOpen))
					Open_Pro_Window($_t_PurchaseInvoiceTitle; 0; 2; ->[PURCHASE_INVOICES:37]; WIN_t_CurrentInputForm)
					$_bo_WindowOpen:=True:C214
				End if 
				
				StartTransaction  // 13/05/02 pb
				
				vAdd:=1
				vFromIn:=False:C215
				ADD RECORD:C56([PURCHASE_INVOICES:37]; *)
				If (OK=1)
					$_t_PurchaseCode:=[PURCHASE_INVOICES:37]Purchase_Code:1
					//          VALIDATE TRANSACTION
					//         FLUSH BUFFERS
					Transact_End  // 13/05/02 pb
					QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$_t_PurchaseCode)
					ADD TO SET:C119([PURCHASE_INVOICES:37]; "Master")
					//Post on to Jobs
					If ((DB_GetModuleSettingByNUM(Module_JobCosting)=2) | (DB_GetModuleSettingByNUM(Module_JobCosting)=4))
						Purch_InvJobs
					End if 
				Else 
					//        CANCEL TRANSACTION
					Transact_End  // 13/05/02 pb
				End if 
				Gen_InOne
			End while 
			Close_ProWin(Table name:C256(->[PURCHASE_INVOICES:37])+"_"+WIN_t_CurrentInputForm)
			vAdd:=0
		End if 
	Else 
		Gen_Alert("Required Setups have not been completed"; "")
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("Purchases In"; $_t_oldMethodName)
