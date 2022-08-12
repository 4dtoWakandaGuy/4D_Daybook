//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_AllocateDeposit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(INV_abo_Select;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY REAL(GEN_ar_Value;0)
	ARRAY TEXT:C222($_at_DepositNumbers; 0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305($_bo_AskUser; $_bo_StartNewTransaction; $3; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_CurrentSelectedRecord; $_l_Element; $_l_Index; $_l_RecordsinSelection; $_l_TransID; $_l_WindowReferenceRow; $1; GEN_l_NameSelected; INV_l_AllocationPage; vIn; WIN_l_CurrentWinRef)
	C_REAL:C285($_r_Amount; V31)
	C_TEXT:C284($_t_CompanyCode; $_t_InvoiceNumber; $_t_oldMethodName; $2; vTitle; vTitle2)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("INV_AllocateDeposit")
//Inv_Accept (False)  `this is the LPA
$_bo_StartNewTransaction:=False:C215
//If (In transaction)
//Transact_End
//$_bo_StartNewTransaction:=True
//End if
$_l_CurrentSelectedRecord:=Selected record number:C246([INVOICES:39])
COPY NAMED SELECTION:C331([INVOICES:39]; "CurrentSelection")
$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
$_r_Amount:=[INVOICES:39]Total_Due:7
ONE RECORD SELECT:C189([INVOICES:39])
CREATE SET:C116([INVOICES:39]; "Invoice")

$_t_CompanyCode:=[INVOICES:39]Company_Code:2
V31:=[INVOICES:39]Total_Due:7
QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=$_t_CompanyCode; *)
QUERY:C277([INVOICES:39];  & ; [INVOICES:39]State:10=-2; *)
QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7<0)
If (Count parameters:C259>=1)
	If ($1>0)
		QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]X_DepositRelatedRecordID:45=$1; *)
		QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]X_DepositRelatedRecordID:45=0)
	Else 
		//passed a deposit number in $2
		If (Count parameters:C259>=2)
			QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$2)
		End if 
	End if 
End if 
If (Count parameters:C259>=3)
	$_bo_AskUser:=$3
Else 
	$_bo_AskUser:=True:C214
End if 
//Here user needs to select the deposit
$_l_RecordsinSelection:=Records in selection:C76([INVOICES:39])
ARRAY TEXT:C222(GEN_at_Name; $_l_RecordsinSelection)
ARRAY TEXT:C222(GEN_at_RecordCode; $_l_RecordsinSelection)
ARRAY REAL:C219(GEN_ar_Value; $_l_RecordsinSelection)
ARRAY TEXT:C222($_at_DepositNumbers; Records in selection:C76([INVOICES:39]))
If (Records in selection:C76([INVOICES:39])>0)
	If (Records in selection:C76([INVOICES:39])>1) | ($_bo_AskUser)
		FIRST RECORD:C50([INVOICES:39])
		
		For ($_l_Index; 1; Records in selection:C76([INVOICES:39]))
			GEN_at_Name{$_l_Index}:=[INVOICES:39]Invoice_Number:1
			//invert the amount due as this the amount due TO the client
			GEN_at_RecordCode{$_l_Index}:=String:C10(-[INVOICES:39]Total_Due:7; "|Accounts")
			GEN_ar_Value{$_l_Index}:=Num2(GEN_at_RecordCode{$_l_Index})
			NEXT RECORD:C51([INVOICES:39])
		End for 
		
		Open_Any_Window(257; 457; -1984)
		INV_l_AllocationPage:=3
		vTitle:="Deposit ALLOCATION"
		vTitle2:="To be"+Char:C90(13)+"Allocated"
		DIALOG:C40([INVOICES:39]; "dAllocation")
		INV_l_AllocationPage:=0
		CLOSE WINDOW:C154
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		CREATE EMPTY SET:C140([INVOICES:39]; "Deposits")
		$_l_Element:=0
		GEN_l_NameSelected:=0
		For ($_l_Index; 1; Size of array:C274(INV_abo_Select))
			If (INV_abo_Select{$_l_Index})
				$_l_Element:=$_l_Element+1
				$_at_DepositNumbers{$_l_Element}:=GEN_at_Name{$_l_Index}
				GEN_l_NameSelected:=1
			End if 
		End for 
		ARRAY TEXT:C222($_at_DepositNumbers; $_l_Element)
		
		If (GEN_l_NameSelected=1)
			ARRAY TEXT:C222($_at_DepositNumbers; Size of array:C274(INV_abo_Select))
			$_l_Element:=0
			For ($_l_Index; 1; Size of array:C274(INV_abo_Select))
				If (INV_abo_Select{$_l_Index})
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=GEN_at_Name{$_l_Index})
					ADD TO SET:C119([INVOICES:39]; "Deposits")
				End if 
			End for 
		End if 
		UNION:C120("Deposits"; "Invoice"; "Invoice")
		USE SET:C118("invoice")
		CLEAR SET:C117("Invoice")
		CLEAR SET:C117("Deposits")
	Else 
		CREATE SET:C116([INVOICES:39]; "Deposits")
		UNION:C120("Deposits"; "Invoice"; "Invoice")
		USE SET:C118("invoice")
		//there is only one deposit and we don't want the user to confirm it
	End if 
	If (Records in selection:C76([INVOICES:39])>=1)
		Invoices_Pay2(False:C215; 0; 0; False:C215; True:C214)
		If (OK=1)
			For ($_l_Index; 1; Size of array:C274($_at_DepositNumbers))
				
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_DepositNumbers{$_l_Index})
				READ WRITE:C146([CC_OrderAuths:133])
				QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]xDepositCode:8=$_at_DepositNumbers{$_l_Index})
				If (Records in selection:C76([CC_OrderAuths:133])>0)
					//this deposit was by CC
					[CC_OrderAuths:133]xinvoiceCode:9:=$_t_InvoiceNumber
					$_l_TransID:=[CC_OrderAuths:133]TransactionID:10
					DB_SaveRecord(->[CC_OrderAuths:133])
					UNLOAD RECORD:C212([CC_OrderAuths:133])
					READ WRITE:C146([CCM_PSPTransaction:136])
					READ ONLY:C145([CC_OrderAuths:133])
					QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_TransID)
					[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_InvoiceNumber
					DB_SaveRecord(->[CCM_PSPTransaction:136])
					UNLOAD RECORD:C212([CCM_PSPTransaction:136])
					READ ONLY:C145([CCM_PSPTransaction:136])
				End if 
				
			End for 
			
		End if 
	Else 
		Gen_Alert("Allocation cancelled")
		CLEAR SET:C117("Invoice")
	End if 
	
	//Else
	//Gen_Alert ("Allocation cancelled-no deposits selected")
	//CLEAR SET("Invoice")
	//End if
	
Else 
	Gen_Alert("There are no outstanding deposits from this company"; "OK")
	CLEAR SET:C117("Invoice")
End if 

QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
If ($_bo_StartNewTransaction)
	START TRANSACTION:C239
	
End if 
//USE NAMED SELECTION("CurrentSelection")
//GOTO SELECTED RECORD([INVOICES];$_l_CurrentSelectedRecord)
Invoices_InLPBB
Invoices_InLPß("B")
vIn:=0
ERR_MethodTrackerReturn("INV_AllocateDeposit"; $_t_oldMethodName)