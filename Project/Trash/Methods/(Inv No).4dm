//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Inv No
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/02/2010 13:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_isCredit; $1)
	C_LONGINT:C283(INV_isUnique; WS_LastNoType; WS_LastNumber)
	C_TEXT:C284($_t_CreditProcessName; $_t_invoiceNumber; $_t_oldMethodName; $_t_ProcessName; PUR_t_PurchaseEntryType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Inv No")
//Project Method Inv No 26/3/2(ID 7027-2566)
If (Count parameters:C259>=1)
	
	$_bo_isCredit:=$1
Else 
	$_t_CreditProcessName:=Term_SLPLWT("Enter Adhoc Credit Notes")
	
	$_t_ProcessName:=Process_Name(Current process:C322)
	If ($_t_ProcessName=$_t_CreditProcessName)
		$_bo_isCredit:=True:C214  //actually not definetive
	Else 
		$_bo_isCredit:=False:C215  //actually not definetive
	End if 
	If (PUR_t_PurchaseEntryType="CreditNote") | (PUR_t_PurchaseEntryType="ViewCreditnotes") | (PUR_t_PurchaseEntryType="View Credit notes")
		$_bo_isCredit:=True:C214  //actually not definetive
	End if 
End if 
//Inv No
WS_LastNumber:=0
WS_LastNoType:=0
If ([INVOICES:39]Analysis_Code:17#[ANALYSES:36]Analysis_Code:1)
	RELATE ONE:C42([INVOICES:39]Analysis_Code:17)
End if 
If ([INVOICES:39]State:10=-1)
	If ([ANALYSES:36]Record_Number_Start:10>0)
		Repeat 
			$_t_invoiceNumber:=[ANALYSES:36]Analysis_Code:1+"/"+"P"+Gen_CodePref([ANALYSES:36]Record_Number_Start:10+19; ->[INVOICES:39]Invoice_Number:1; [ANALYSES:36]Analysis_Code:1+"/"+"P")
			
			SET QUERY DESTINATION:C396(3; INV_isUnique)
			QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_invoiceNumber)
			If (INV_isUnique=0)
				[INVOICES:39]Invoice_Number:1:=$_t_invoiceNumber
			End if 
			SET QUERY DESTINATION:C396(0)
		Until (INV_isUnique=0)
		WS_LastNoType:=[ANALYSES:36]Record_Number_Start:10+19
	Else 
		Repeat 
			$_t_invoiceNumber:="P"+Gen_CodePref(19; ->[INVOICES:39]Invoice_Number:1; "P")
			SET QUERY DESTINATION:C396(3; INV_isUnique)
			QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_invoiceNumber)
			If (INV_isUnique=0)
				[INVOICES:39]Invoice_Number:1:=$_t_invoiceNumber
			End if 
			SET QUERY DESTINATION:C396(0)
		Until (INV_isUnique=0)
		
		WS_LastNoType:=19
	End if 
	
Else 
	If ((DB_GetLedgerCreditNotSeqPref) & (([INVOICES:39]Total_Invoiced:5<0) | ($_bo_isCredit)))
		
		If ([ANALYSES:36]Record_Number_Start:10>0)
			
			Repeat 
				$_t_invoiceNumber:=[ANALYSES:36]Analysis_Code:1+"/"+"C"+Gen_CodePref([ANALYSES:36]Record_Number_Start:10+25; ->[INVOICES:39]Invoice_Number:1; [ANALYSES:36]Analysis_Code:1+"/"+"C")
				
				SET QUERY DESTINATION:C396(3; INV_isUnique)
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_invoiceNumber)
				If (INV_isUnique=0)
					[INVOICES:39]Invoice_Number:1:=$_t_invoiceNumber
				End if 
				SET QUERY DESTINATION:C396(0)
			Until (INV_isUnique=0)
			
			
			WS_LastNoType:=[ANALYSES:36]Record_Number_Start:10+25
		Else 
			
			Repeat 
				$_t_invoiceNumber:="C"+Gen_CodePref(25; ->[INVOICES:39]Invoice_Number:1; "C")
				SET QUERY DESTINATION:C396(3; INV_isUnique)
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_invoiceNumber)
				If (INV_isUnique=0)
					[INVOICES:39]Invoice_Number:1:=$_t_invoiceNumber
				End if 
				SET QUERY DESTINATION:C396(0)
			Until (INV_isUnique=0)
			
			WS_LastNoType:=25
		End if 
		
	Else 
		
		
		
		
		If ([ANALYSES:36]Record_Number_Start:10>0)
			
			Repeat 
				$_t_invoiceNumber:=[ANALYSES:36]Analysis_Code:1+"/"+Gen_CodePref([ANALYSES:36]Record_Number_Start:10+4; ->[INVOICES:39]Invoice_Number:1; [ANALYSES:36]Analysis_Code:1+"/")
				
				SET QUERY DESTINATION:C396(3; INV_isUnique)
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_invoiceNumber)
				If (INV_isUnique=0)
					[INVOICES:39]Invoice_Number:1:=$_t_invoiceNumber
				End if 
				SET QUERY DESTINATION:C396(0)
			Until (INV_isUnique=0)
			WS_LastNoType:=4
		Else 
			Repeat 
				$_t_invoiceNumber:=Gen_CodePref(4; ->[INVOICES:39]Invoice_Number:1)
				SET QUERY DESTINATION:C396(3; INV_isUnique)
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_invoiceNumber)
				If (INV_isUnique=0)
					[INVOICES:39]Invoice_Number:1:=$_t_invoiceNumber
				End if 
				SET QUERY DESTINATION:C396(0)
			Until (INV_isUnique=0)
			
			WS_LastNoType:=4
		End if 
		
	End if 
End if 
If ([INVOICES:39]Invoice_Number:1="0")
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("Inv No"; $_t_oldMethodName)