//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchases_InCr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 16:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_WindowOpen; vFromIn)
	C_LONGINT:C283($_l_AddMode; $_l_RecordNumber; Vadd; vPu)
	C_TEXT:C284($_t_oldMethodName; $_t_PurchaseCreditCode; $_t_PurchaseCreditTitle; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_InCr")
//Purchases_In
$_t_PurchaseCreditTitle:=Term_SLPLWT("Enter Purchase CNs")
Start_Process
Purchases_File
If (vPu=1)
	QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSPURpost)
	$_l_RecordNumber:=Record number:C243([TRANSACTION_TYPES:31])
	If ((DB_GetLedgerTRANSPURpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
		If (In_Allowed($_t_PurchaseCreditTitle; ->[PURCHASE_INVOICES:37]))
			CREATE SET:C116([PURCHASE_INVOICES:37]; "Master")
			REDUCE SELECTION:C351([PURCHASE_INVOICES:37]; 0)
			OK:=1
			
			$_bo_WindowOpen:=False:C215
			While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
				GOTO RECORD:C242([TRANSACTION_TYPES:31]; $_l_RecordNumber)
				
				Purchases_FileI
				
				If (Not:C34($_bo_WindowOpen))
					Open_Pro_Window($_t_PurchaseCreditTitle; 0; 2; ->[PURCHASE_INVOICES:37]; WIN_t_CurrentInputForm)
					$_bo_WindowOpen:=True:C214
				End if 
				
				StartTransaction  // 13/05/02 pb
				$_l_AddMode:=Vadd
				vAdd:=1
				vFromIn:=False:C215
				DB_t_CurrentFormUsage:="CN"
				ADD RECORD:C56([PURCHASE_INVOICES:37]; *)
				If (OK=1)
					$_t_PurchaseCreditCode:=[PURCHASE_INVOICES:37]Purchase_Code:1
					//          VALIDATE TRANSACTION
					//         FLUSH BUFFERS
					Transact_End  // 13/05/02 pb
					QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$_t_PurchaseCreditCode)
					ADD TO SET:C119([PURCHASE_INVOICES:37]; "Master")
					//Post on to Jobs
					If ((DB_GetModuleSettingByNUM(Module_JobCosting)=2) | (DB_GetModuleSettingByNUM(Module_JobCosting)=4))
						Purch_InvJobs
					End if 
				Else 
					//         CANCEL TRANSACTION
					Transact_End  // 13/05/02 pb
				End if 
				Vadd:=$_l_AddMode
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
ERR_MethodTrackerReturn("Purchases_InCr"; $_t_oldMethodName)
