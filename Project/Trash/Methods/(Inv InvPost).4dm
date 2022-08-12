//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Inv InvPost
	//------------------ Method Notes ------------------
	//TRACE
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 09:37
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_OrderItemNumbers; 0)
	//ARRAY REAL(INV_ar_ItemAmounts;0)
	//ARRAY REAL(INV_ar_ItemCostAmounts;0)
	//ARRAY REAL(INV_ar_ItemTax;0)
	//ARRAY REAL(INV_ar_ItemTotals;0)
	//ARRAY TEXT(INV_at_AnalCodes;0)
	//ARRAY TEXT(INV_at_ItemProductCodes;0)
	//ARRAY TEXT(INV_at_ItemProductNames;0)
	//ARRAY TEXT(INV_at_itemsSalesAcc;0)
	//ARRAY TEXT(INV_at_ItemsTaxCode;0)
	C_BOOLEAN:C305($_bo_Unlocked; TRANS_bo_ArraysReady; TRANS_bo_FunctionReady; TRANS_bo_WaitToend)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_Index; $_l_ServerPostingProcess; $_l_Timeout; TRANS_l_Posted; vAdd)
	C_REAL:C285(vSubtotal; vTotal; vVAT)
	C_TEXT:C284($_t_oldMethodName; $_t_TransactionType; ACC_t_CurrencyCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Inv InvPost")
//Project Method Inv InvPost 26/3/2(ID 8913-3372)
//Invoices_InvPost

$_bo_Unlocked:=Check_Locked(->[INVOICES:39]; 0)
If (Not:C34($_bo_Unlocked))
	
	Gen_Confirm("Invoice No"+""+[INVOICES:39]Invoice_Number:1+"cannot be posted-it is in use."; "Wait"; "Stop")
	If (OK=0)
		$_bo_Unlocked:=False:C215
	Else 
		Repeat 
			$_l_Timeout:=0
			Repeat 
				$_bo_Unlocked:=Check_Locked(->[INVOICES:39]; 1)
				If (Not:C34($_bo_Unlocked))
					$_l_Timeout:=$_l_Timeout+1
				End if 
				DelayTicks(60)
			Until ($_bo_Unlocked=True:C214) | ($_l_Timeout>100)
			If (Not:C34($_bo_Unlocked))
				Gen_Confirm("Invoice No"+""+[INVOICES:39]Invoice_Number:1+"is STILL locked by another user"; "Wait"; "Stop")
			End if 
		Until ($_bo_Unlocked=True:C214) | (OK=0)
	End if 
End if 

If (Not:C34($_bo_Unlocked))
	Gen_Alert("Invoice No "+[INVOICES:39]Invoice_Number:1+" cannot be posted - it is in use."; "Cancel")
Else 
	If ((vAdd=0) & (DB_t_CurrentFormUsage#"NC") & (DB_t_CurrentFormUsage2#"NR"))
		//  START TRANSACTION
		StartTransaction  // 13/05/02 pb
		
	End if 
	LOAD RECORD:C52([INVOICES:39])
	If ((DB_GetModuleSettingByNUM(Module_NominalLedger))>0)
		QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
		ARRAY REAL:C219(INV_ar_ItemAmounts; 0)
		ARRAY REAL:C219(INV_ar_ItemTax; 0)
		ARRAY REAL:C219(INV_ar_ItemTotals; 0)
		ARRAY TEXT:C222(INV_at_ItemsTaxCode; 0)
		ARRAY TEXT:C222(INV_at_itemsSalesAcc; 0)
		ARRAY TEXT:C222(INV_at_AnalCodes; 0)
		ARRAY REAL:C219(INV_ar_ItemCostAmounts; 0)
		ARRAY TEXT:C222(INV_at_ItemProductCodes; 0)
		ARRAY TEXT:C222(INV_at_ItemProductNames; 0)
		SELECTION TO ARRAY:C260([INVOICES_ITEMS:161]Amount:5; INV_ar_ItemAmounts; [INVOICES_ITEMS:161]Tax_Amount:7; INV_ar_ItemTax; [INVOICES_ITEMS:161]Total_Amount:8; INV_ar_ItemTotals; [INVOICES_ITEMS:161]Tax_Code:6; INV_at_ItemsTaxCode; [INVOICES_ITEMS:161]Sales_Account:9; INV_at_itemsSalesAcc; [INVOICES_ITEMS:161]Analysis_Code:10; INV_at_AnalCodes; [INVOICES_ITEMS:161]Cost_Amount:15; INV_ar_ItemCostAmounts; [INVOICES_ITEMS:161]Product_Code:1; INV_at_ItemProductCodes; [INVOICES_ITEMS:161]Product_Name:2; INV_at_ItemProductNames)
		
		If (Application type:C494=4D Remote mode:K5:5)
			TRANS_bo_FunctionReady:=False:C215
			TRANS_bo_ArraysReady:=False:C215
			TRANS_l_Posted:=0
			//Note that  because the process is going to be run on the server it canot set values on the client
			$_t_TransactionType:=DB_GetLedgerTRANSINVpost
			$_l_ServerPostingProcess:=Execute on server:C373("TRNS_CreateBatch"; 256000; "Post Invoice"+[INVOICES:39]Invoice_Number:1; 0; vInvDate; <>DB_d_CurrentDate; "Posting of Invoice"+[INVOICES:39]Invoice_Number:1; [INVOICES:39]Invoice_Number:1; $_t_TransactionType; [INVOICES:39]Currency_Code:27; [INVOICES:39]Total_Invoiced_Excluding_Tax:26; [INVOICES:39]Total_Tax:35; [INVOICES:39]Total_Invoiced:5; [INVOICES:39]Booking_Code:24; [INVOICES:39]Period_Code:13; [INVOICES:39]UK_EC:21; [INVOICES:39]Layer_Code:38; [INVOICES:39]Debtors_Account:15; [INVOICES:39]Company_Code:2)
			
			
			
			Repeat 
				GET PROCESS VARIABLE:C371($_l_ServerPostingProcess; TRANS_bo_FunctionReady; TRANS_bo_FunctionReady)
				If (Not:C34(TRANS_bo_FunctionReady))
					DelayTicks(2)
				End if 
			Until (TRANS_bo_FunctionReady)
			VARIABLE TO VARIABLE:C635($_l_ServerPostingProcess; INV_ar_ItemAmounts; INV_ar_ItemAmounts)
			VARIABLE TO VARIABLE:C635($_l_ServerPostingProcess; INV_ar_ItemTax; INV_ar_ItemTax)
			VARIABLE TO VARIABLE:C635($_l_ServerPostingProcess; INV_ar_ItemTotals; INV_ar_ItemTotals)
			VARIABLE TO VARIABLE:C635($_l_ServerPostingProcess; INV_at_ItemsTaxCode; INV_at_ItemsTaxCode)
			VARIABLE TO VARIABLE:C635($_l_ServerPostingProcess; INV_at_itemsSalesAcc; INV_at_itemsSalesAcc)
			VARIABLE TO VARIABLE:C635($_l_ServerPostingProcess; INV_at_AnalCodes; INV_at_AnalCodes)
			VARIABLE TO VARIABLE:C635($_l_ServerPostingProcess; INV_ar_ItemCostAmounts; INV_ar_ItemCostAmounts)
			VARIABLE TO VARIABLE:C635($_l_ServerPostingProcess; INV_at_ItemProductCodes; INV_at_ItemProductCodes)
			VARIABLE TO VARIABLE:C635($_l_ServerPostingProcess; INV_at_ItemProductNames; INV_at_ItemProductNames)
			TRANS_bo_ArraysReady:=True:C214
			SET PROCESS VARIABLE:C370($_l_ServerPostingProcess; TRANS_bo_ArraysReady; TRANS_bo_ArraysReady)
			
			Repeat 
				GET PROCESS VARIABLE:C371($_l_ServerPostingProcess; TRANS_l_Posted; TRANS_l_Posted)
				DelayTicks(2)
			Until (TRANS_l_Posted#0)
			TRANS_bo_WaitToend:=False:C215
			SET PROCESS VARIABLE:C370($_l_ServerPostingProcess; TRANS_bo_WaitToend; TRANS_bo_WaitToend)
			
		Else 
			
			TRNS_CreateBatch(Current process:C322; vInvDate; <>DB_d_CurrentDate; "Posting of Invoice "+[INVOICES:39]Invoice_Number:1; [INVOICES:39]Invoice_Number:1; DB_GetLedgerTRANSINVpost; [INVOICES:39]Currency_Code:27; [INVOICES:39]Total_Invoiced_Excluding_Tax:26; [INVOICES:39]Total_Tax:35; [INVOICES:39]Total_Invoiced:5; [INVOICES:39]Booking_Code:24; [INVOICES:39]Period_Code:13; [INVOICES:39]UK_EC:21; [INVOICES:39]Layer_Code:38; [INVOICES:39]Debtors_Account:15; [INVOICES:39]Company_Code:2)
			
		End if 
		
	End if 
	
	If (TRANS_l_Posted=1)
		[INVOICES:39]State:10:=2
		[INVOICES:39]Total_Invoiced_Excluding_Tax:26:=vSubtotal
		[INVOICES:39]Total_Tax:35:=vVAT
		[INVOICES:39]Total_Invoiced:5:=vTotal
		[INVOICES:39]Total_Due:7:=Gen_Round(([INVOICES:39]Total_Invoiced:5-[INVOICES:39]Total_Paid:6); 2; 2)
		[INVOICES:39]Posted_Date:8:=<>DB_d_CurrentDate
		If ((DB_GetLedgerCashvatACC#"") & (DB_GetLedgerisCashVAT))
			[INVOICES:39]Cash_TAX:41:=True:C214
			[INVOICES:39]Cash_TAX_Due:40:=[INVOICES:39]Total_Tax:35
		End if 
		QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
		If ([INVOICES:39]Analysis_Code:17="")
			[INVOICES:39]Analysis_Code:17:=[INVOICES_ITEMS:161]Analysis_Code:10
		End if 
		DB_SaveRecord(->[INVOICES:39])
		QUERY SELECTION:C341([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Item_Number:12#"")
		
		FIRST RECORD:C50([INVOICES_ITEMS:161])
		SELECTION TO ARRAY:C260([INVOICES_ITEMS:161]Item_Number:12; $_al_OrderItemNumbers)
		QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_OrderItemNumbers)
		APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17:=[INVOICES:39]Invoice_Number:1)
		APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Date:25:=[INVOICES:39]Invoice_Date:4)
		If (False:C215)
			While (Not:C34(End selection:C36([INVOICES_ITEMS:161])))
				If ([INVOICES_ITEMS:161]Item_Number:12>0)
					RELATE ONE:C42([INVOICES_ITEMS:161]Item_Number:12)
					If (([ORDER_ITEMS:25]Invoice_Number:17#[INVOICES:39]Invoice_Number:1) & ([ORDER_ITEMS:25]Invoice_Number:17#"SUBS"))
						[ORDER_ITEMS:25]Invoice_Number:17:=[INVOICES:39]Invoice_Number:1
						DB_SaveRecord(->[ORDER_ITEMS:25])
						AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
						
					End if 
				End if 
				NEXT RECORD:C51([INVOICES_ITEMS:161])
			End while 
		End if 
		QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
	End if 
	If ((OK=1) & ([INVOICES:39]Invoice_Number:1#""))
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=[INVOICES:39]Invoice_Number:1)
		If (Not:C34(In transaction:C397))
			DB_lockFile(->[ORDER_ITEMS:25])
			APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Date:25:=[INVOICES:39]Invoice_Date:4)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
		Else 
			FIRST RECORD:C50([ORDER_ITEMS:25])
			For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
				[ORDER_ITEMS:25]Invoice_Date:25:=[INVOICES:39]Invoice_Date:4
				DB_SaveRecord(->[ORDER_ITEMS:25])
				AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
				NEXT RECORD:C51([ORDER_ITEMS:25])
			End for 
		End if 
		
		
		If ((DB_GetLedgerShowReceipt) & (DB_t_CurrentFormUsage2#"NC") & (DB_t_CurrentFormUsage2#"NR"))  //Post an immediate payment
			ONE RECORD SELECT:C189([INVOICES:39])
			ACC_t_CurrencyCode:=[INVOICES:39]Currency_Code:27
			CREATE SET:C116([INVOICES:39]; "Master")
			Inv_PaySel2
			OK:=1
		End if 
		
	End if 
	
	If ((vAdd=0) & (DB_t_CurrentFormUsage2#"NC") & (DB_t_CurrentFormUsage2#"NR"))
		Transact_End
	End if 
End if 
ERR_MethodTrackerReturn("Inv InvPost"; $_t_oldMethodName)