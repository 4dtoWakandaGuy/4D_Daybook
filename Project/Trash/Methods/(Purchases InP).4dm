//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchases_InP
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
	C_LONGINT:C283($_l_AddMode; Vadd; vPu)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitle; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_InP")
//Purchases_InP (Prepayments)
$_t_WindowTitle:="Purchase Pre-Payment"
Start_Process
Purchases_File
If (vPu=1)
	QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSPURPrePay)
	If ((DB_GetLedgerTRANSPURPrePay#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
		If (In_Allowed("Enter Pre-Payments"; ->[PURCHASE_INVOICES:37]))
			FORM SET INPUT:C55([PURCHASE_INVOICES:37]; "Purchases_InP13")  //NG April 2004 Removed ◊Screen
			WIN_t_CurrentInputForm:="Purchases_InP13"
			CREATE SET:C116([PURCHASE_INVOICES:37]; "PuMaster")
			REDUCE SELECTION:C351([PURCHASE_INVOICES:37]; 0)
			$_l_AddMode:=Vadd
			vAdd:=1
			OK:=1
			Open_Pro_Window($_t_WindowTitle; 0; 2; ->[PURCHASE_INVOICES:37]; WIN_t_CurrentInputForm)
			//  START TRANSACTION
			StartTransaction  // 13/05/02 pb
			
			ADD RECORD:C56([PURCHASE_INVOICES:37]; *)
			If ((OK=1) & ([PURCHASE_INVOICES:37]Posted_Date:12=!00-00-00!) & ([PURCHASE_INVOICES:37]Invoice_Date:5>!00-00-00!) & ([PURCHASE_INVOICES:37]Period_Code:3#"") & ([PURCHASE_INVOICES:37]Total_Paid:8#0))
				Purch_PrePost
				Transact_End
			Else 
				//       CANCEL TRANSACTION
				OK:=0
				Transact_End  // 13/05/02 pb
			End if 
			Vadd:=$_l_AddMode
			Close_ProWin(Table name:C256(->[PURCHASE_INVOICES:37])+"_"+WIN_t_CurrentInputForm)
		End if 
	Else 
		Gen_Alert("Required Setups have not been completed"; "")
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("Purchases_InP"; $_t_oldMethodName)
