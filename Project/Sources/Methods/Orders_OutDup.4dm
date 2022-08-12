//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_OutDup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 21:54
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(<>SYS_bo_CopyPreviousDate; WIN_bo_TrackerInited)
	C_DATE:C307($_d_EnquiryDate; $_d_OrderDate; $_d_QuotationDate; vDate)
	C_LONGINT:C283($_l_AddMode; $_l_OK; $_l_RecordsinSelection; $_l_WindowReferenceRow; vAdd; vNo; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>OrderCode; $_t_oldMethodName; $_t_OrderCode; $_t_OrderPeriod; $_t_OrderState)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_OutDup")
//Orders_OutDup
Menu_Record("Orders_OutDup"; "Duplicate Order")

If (Records in set:C195("ListboxSet0")#0)
	Gen_Confirm("This function duplicates the details of the first highlighted Order, "+" creating a specified number of copies"; ""; "")
	If (OK=1)
		CREATE SET:C116([ORDERS:24]; "OrMaster")
		USE SET:C118("Userset")
		CREATE SET:C116([ORDERS:24]; "Extra2")
		$_t_OrderCode:=[ORDERS:24]Order_Code:3
		$_d_OrderDate:=[ORDERS:24]Order_Date:4
		$_t_OrderPeriod:=[ORDERS:24]Order_Period:42
		$_d_EnquiryDate:=[ORDERS:24]Enquiry_Date:25
		$_d_QuotationDate:=[ORDERS:24]Quotation_Date:26
		$_t_OrderState:=[ORDERS:24]State:15
		<>OrderCode:=""
		If ($_d_OrderDate#!00-00-00!)
			vDate:=$_d_OrderDate
		Else 
			If ($_d_QuotationDate#!00-00-00!)
				vDate:=$_d_QuotationDate
			Else 
				vDate:=$_d_EnquiryDate
			End if 
		End if 
		
		$_l_AddMode:=vAdd
		vAdd:=1
		Open_AnyTypeWindow(275; 417; 5; "Duplicate Order")
		FORM SET INPUT:C55([RECURRING_JOURNALS:38]; "dDup_Dates")
		ADD RECORD:C56([RECURRING_JOURNALS:38]; *)
		$_l_OK:=OK
		OK:=1
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		CLOSE WINDOW:C154
		If ($_l_OK=1)
			QUERY:C277([REC_JOURNALS_DATES:160]; [REC_JOURNALS_DATES:160]REC_JOURNALS_CODE:4=[RECURRING_JOURNALS:38]x_ID:15)
			
			QUERY SELECTION:C341([REC_JOURNALS_DATES:160]; [REC_JOURNALS_DATES:160]Posting_Date:1#!00-00-00!)
			If (Records in selection:C76([REC_JOURNALS_DATES:160])>0)
				$_l_RecordsinSelection:=Records in selection:C76([REC_JOURNALS_DATES:160])
				Gen_Confirm("Are you sure you want to create "+String:C10($_l_RecordsinSelection)+" Order"+("s"*(Num:C11($_l_RecordsinSelection>1)))+"?"; "Yes"; "No")
				If (OK=1)
					
					$_l_RecordsinSelection:=1
					FIRST RECORD:C50([REC_JOURNALS_DATES:160])
					While (Not:C34(End selection:C36([REC_JOURNALS_DATES:160])))
						If ([REC_JOURNALS_DATES:160]Posting_Date:1#!00-00-00!)
							USE SET:C118("Extra2")
							QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
							CREATE SET:C116([ORDER_ITEMS:25]; "Master")
							
							DUPLICATE RECORD:C225([ORDERS:24])
							[ORDERS:24]x_ID:58:=0
							Orders_Code
							[ORDERS:24]State:15:=$_t_OrderState
							If (<>SYS_bo_CopyPreviousDate=False:C215)
								[ORDERS:24]Order_Date:4:=$_d_OrderDate
								[ORDERS:24]Order_Period:42:=$_t_OrderPeriod
								[ORDERS:24]Enquiry_Date:25:=$_d_EnquiryDate
								[ORDERS:24]Quotation_Date:26:=$_d_QuotationDate
							End if 
							If ($_d_OrderDate#!00-00-00!)
								[ORDERS:24]Order_Date:4:=[REC_JOURNALS_DATES:160]Posting_Date:1
							Else 
								If ($_d_QuotationDate#!00-00-00!)
									[ORDERS:24]Quotation_Date:26:=[REC_JOURNALS_DATES:160]Posting_Date:1
								Else 
									[ORDERS:24]Enquiry_Date:25:=[REC_JOURNALS_DATES:160]Posting_Date:1
								End if 
							End if 
							[ORDERS:24]Export:24:=Export_Stamp3([ORDERS:24]Export:24)
							[ORDERS:24]Comments_2:40:=[ORDERS:24]Comments_2:40+(Char:C90(13)*(Num:C11([ORDERS:24]Comments_2:40#"")))+"Duplicate No "+String:C10($_l_RecordsinSelection)+" of Order Code "+$_t_OrderCode
							$_l_RecordsinSelection:=$_l_RecordsinSelection+1
							FIRST RECORD:C50([ORDER_ITEMS:25])
							While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
								ONE RECORD SELECT:C189([ORDER_ITEMS:25])
								CREATE SET:C116([ORDER_ITEMS:25]; "Extra")
								DIFFERENCE:C122("Master"; "Extra"; "Master")
								DUPLICATE RECORD:C225([ORDER_ITEMS:25])
								[ORDER_ITEMS:25]x_ID:58:=0
								
								[ORDER_ITEMS:25]Order_Code:1:=[ORDERS:24]Order_Code:3
								OrderI_No
								[ORDER_ITEMS:25]Delivery_Date:11:=!00-00-00!
								[ORDER_ITEMS:25]Item_Locked:16:=False:C215
								[ORDER_ITEMS:25]Invoice_Number:17:=""
								[ORDER_ITEMS:25]Purchase_Order_Number:18:=""
								[ORDER_ITEMS:25]Purchase_Order_Date:19:=!00-00-00!
								[ORDER_ITEMS:25]Received_Date:21:=!00-00-00!
								[ORDER_ITEMS:25]Supplier_Invoice_Number:22:=""
								[ORDER_ITEMS:25]Supplier_Delivery_Number:23:=""
								[ORDER_ITEMS:25]Serial_Number:24:=""
								[ORDER_ITEMS:25]Invoice_Date:25:=!00-00-00!
								[ORDER_ITEMS:25]Allocated:28:=0
								[ORDER_ITEMS:25]Contract_Code:29:=""
								[ORDER_ITEMS:25]Job_Code:34:=""
								[ORDER_ITEMS:25]Job_Stage:35:=""
								DB_SaveRecord(->[ORDER_ITEMS:25])
								AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
								
								USE SET:C118("Master")
							End while 
							QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
							Orders_InLPTot
							DB_SaveRecord(->[ORDERS:24])
							AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
							ADD TO SET:C119([ORDERS:24]; "OrMaster")
						End if 
						NEXT RECORD:C51([REC_JOURNALS_DATES:160])
					End while 
					
				End if 
			Else 
				Gen_Alert("You have not specified dates"; "Cancel")
			End if 
			DELETE RECORD:C58([RECURRING_JOURNALS:38])
		End if 
		
		vAdd:=$_l_AddMode
		USE SET:C118("OrMaster")
		CLEAR SET:C117("Extra2")
		<>OrderCode:=[ORDERS:24]Order_Code:3
		vNo:=Records in selection:C76([ORDERS:24])
	End if 
	
Else 
	Gen_Alert("Please highlight one Order first"; "Try again")
End if 
ERR_MethodTrackerReturn("Orders_OutDup"; $_t_oldMethodName)
