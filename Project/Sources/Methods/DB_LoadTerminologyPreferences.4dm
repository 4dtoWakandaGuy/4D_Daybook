//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LoadTerminologyPreferences
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 16:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_TerminologyClass;0)
	//ARRAY LONGINT(DB_al_TerminologyTable;0)
	//ARRAY TEXT(DB_at_TerminologyName;0)
	//ARRAY TEXT(DB_at_TerminologyTranslate;0)
	C_BOOLEAN:C305($_bo_FromTransaction; $_bo_ReadOnlyState; $_bo_SavePreferences; $_bo_TermEst; $_bo_TermFLN; $_bo_TermGL; $_bo_TermInq; $_bo_TermInv; $_bo_TermRP; $_bo_TermST; $_bo_Unload)
	C_BOOLEAN:C305($1; $2)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; $_l_offset; $_l_Process; $_l_RecordNumber; $_l_TerminologyData; $3; DB_l_CurrentOwnerRequest)
	C_TEXT:C284($_t_ForeName; $_t_oldMethodName; $_t_PurchaseLedgerName; $_t_SalesLedgerName; $_t_Surname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LoadTerminologyPreferences"; Form event code:C388)
$_bo_FromTransaction:=False:C215

If (Count parameters:C259>=2)
	$_bo_FromTransaction:=$2
End if 
If (Not:C34($_bo_FromTransaction))
	While (Semaphore:C143("LockTerminologyPreferences"))
		DelayTicks(2)
	End while 
End if 
If (Count parameters:C259>=1)
	$_bo_SavePreferences:=$1
Else 
	$_bo_SavePreferences:=False:C215
End if 
If (Count parameters:C259>=3)
	DB_l_CurrentOwnerRequest:=$3
End if 

If (Not:C34($_bo_SavePreferences))
	If (Application type:C494=4D Server:K5:6)
		
		If (DB_l_CurrentOwnerRequest>0)
			$_l_TerminologyData:=PREF_GetPreferenceID("Terminology Settings"; True:C214; DB_l_CurrentOwnerRequest)
		Else 
			$_l_TerminologyData:=PREF_GetPreferenceID("Terminology Settings"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
		End if 
	Else 
		$_l_TerminologyData:=PREF_GetPreferenceID("Terminology Settings"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
	End if 
	
	
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_TerminologyData)
	If (Records in selection:C76([PREFERENCES:116])=0)
		If (In transaction:C397)
			If (Application type:C494=4D Server:K5:6)
				
				If (DB_l_CurrentOwnerRequest>0)
					$_l_Process:=New process:C317("DB_LoadTerminologyPreferences"; 128000; "Load Terminology Preferences"; False:C215; True:C214; DB_l_CurrentOwnerRequest)
				Else 
					$_l_Process:=New process:C317("DB_LoadTerminologyPreferences"; 128000; "Load Terminology Preferences"; False:C215; True:C214)
				End if 
			Else 
				$_l_Process:=New process:C317("DB_LoadTerminologyPreferences"; 128000; "Load Terminology Preferences"; False:C215; True:C214)
			End if 
			
			While (Process state:C330($_l_Process)>=0)
				DelayTicks(5)
			End while 
		Else 
			//TRACE
			
			If (Records in selection:C76([USER:15])>1)
				If (Application type:C494=4D Server:K5:6)
					
					If (DB_l_CurrentOwnerRequest>0)
						QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=DB_l_CurrentOwnerRequest)  //this should not ever happen actually
						
					Else 
						QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>PER_l_CurLoggedinDataOwnerID)
					End if 
				Else 
					
					QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>PER_l_CurLoggedinDataOwnerID)
				End if 
			Else 
				ALL RECORDS:C47([USER:15])
				
			End if 
			$_l_RecordNumber:=Record number:C243([TERMINOLOGY:75])
			$_bo_ReadOnlyState:=Read only state:C362([TERMINOLOGY:75])
			If ($_bo_ReadOnlyState=False:C215) & ([TERMINOLOGY:75]Terminology_Code:1#[USER:15]Term Code:129)
				READ ONLY:C145([TERMINOLOGY:75])
			End if 
			If ([TERMINOLOGY:75]Terminology_Code:1#[USER:15]Term Code:129)
				QUERY:C277([TERMINOLOGY:75]; [TERMINOLOGY:75]Terminology_Code:1=[USER:15]Term Code:129)
			End if 
			$_bo_Unload:=(Records in selection:C76([USER:15])=0)
			If (Records in table:C83([USER:15])>1)
				If (Application type:C494=4D Server:K5:6)
					
					If (DB_l_CurrentOwnerRequest>0)
						QUERY SELECTION:C341([TERMINOLOGY:75]; [TERMINOLOGY:75]x_DataOwnerID:10=DB_l_CurrentOwnerRequest)  //this should not ever happen actually
						
					Else 
						QUERY SELECTION:C341([TERMINOLOGY:75]; [TERMINOLOGY:75]x_DataOwnerID:10=<>PER_l_CurLoggedinDataOwnerID)
					End if 
				Else 
					QUERY SELECTION:C341([TERMINOLOGY:75]; [TERMINOLOGY:75]x_DataOwnerID:10=<>PER_l_CurLoggedinDataOwnerID)
				End if 
				
			Else 
				QUERY:C277([TERMINOLOGY:75])
			End if 
			If ($_bo_Unload)
				UNLOAD RECORD:C212([USER:15])
			End if 
			$_bo_TermFLN:=False:C215
			$_t_ForeName:="Forename"
			$_t_Surname:="Surname"
			$_bo_TermInq:=False:C215
			$_bo_TermEst:=False:C215
			$_bo_TermInv:=False:C215
			$_bo_TermST:=False:C215
			$_bo_TermGL:=False:C215
			$_bo_TermRP:=False:C215
			If (Records in selection:C76([TERMINOLOGY:75])=1)
				$_bo_TermFLN:=[TERMINOLOGY:75]First_Last_Name:3
				
				If ($_bo_TermFLN)
					$_t_ForeName:="First Name"
					$_t_Surname:="Last Name"
				Else 
					$_t_ForeName:="Forename"
					$_t_Surname:="Surname"
				End if 
				$_bo_TermInq:=[TERMINOLOGY:75]Inquiry:4
				$_bo_TermEst:=[TERMINOLOGY:75]Estimate:5
				$_bo_TermInv:=[TERMINOLOGY:75]Inventory:6
				$_bo_TermST:=[TERMINOLOGY:75]Sales_Tax:7
				$_bo_TermGL:=[TERMINOLOGY:75]General_Ledger:8
				$_bo_TermRP:=[TERMINOLOGY:75]Receivables_Payables:9
				
			End if 
			UNLOAD RECORD:C212([TERMINOLOGY:75])
			If ($_l_RecordNumber>=0)
				GOTO RECORD:C242([TERMINOLOGY:75]; $_l_RecordNumber)
			End if 
			ARRAY LONGINT:C221(DB_al_TerminologyClass; 0)
			ARRAY LONGINT:C221(DB_al_TerminologyTable; 0)
			ARRAY TEXT:C222(DB_at_TerminologyName; 0)
			ARRAY TEXT:C222(DB_at_TerminologyTranslate; 0)
			//DB_al_TerminologyClass class 1=field/Variable class 2=table single 3 table plural
			APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
			APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[CONTACTS:1]))
			
			APPEND TO ARRAY:C911(DB_at_TerminologyName; "Forename")
			
			APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; $_t_ForeName)
			//``
			APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
			APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[CONTACTS:1]))
			APPEND TO ARRAY:C911(DB_at_TerminologyName; "Surname")
			APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; $_t_Surname)
			If ($_bo_TermFLN)
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[CONTACTS:1]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Fore/Surname")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "First/Last N.")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[CONTACTS:1]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Postcode")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Zip")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[CONTACTS:1]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Fore")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "First")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[CONTACTS:1]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Sur")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Last")
				
				
				
				
			Else 
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[CONTACTS:1]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Fore/Surname")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Fore/Surname")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[CONTACTS:1]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Postcode")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Postcode")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[CONTACTS:1]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Fore")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Fore")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[CONTACTS:1]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Sur")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Sur")
			End if 
			If ($_bo_TermInq)
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Enquiries")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Inquiries")
				//```
				//``
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Enquirer")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Inquirer")
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Enquiry")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Inquiry")
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Enq")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Inq")
				
			Else 
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Enquiries")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Enquiries")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Enquirer")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Enquirer")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Enquiry")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Enquiry")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Enq")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Enq")
			End if 
			If ($_bo_TermEst)
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Quotation")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Estimate")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Quote")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Est")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Qtn")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Est")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; Get localized string:C991("MenuItem_EnterEnquiry"))
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; Get localized string:C991("MenuItem_EnterEstimates"))
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; Get localized string:C991("MeniItem_ViewEnquiries"))
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; Get localized string:C991("MenuItem_ViewEstimates"))
				
				
			Else 
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Quotation")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Quotation")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Quote")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Quote")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Qtn")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Qtn")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; Get localized string:C991("MenuItem_EnterEnquiry"))
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; Get localized string:C991("MenuItem_EnterEnquiry"))
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; Get localized string:C991("MeniItem_ViewEnquiries"))
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; Get localized string:C991("MeniItem_ViewEnquiries"))
				
			End if 
			If ($_bo_TermInv)
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Stock Types")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Inventory Types")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Stock Locations")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Inventory Locations")
				
				
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 4)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "STOCK CONTROL")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "INVENTORY")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Stock Control")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Inventory")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Allocate Stock")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Allocate Inventory")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "View Stock Levels")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "View Inventory Levels")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Stock Levels")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Inventory Levels")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Copy Current Stock")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Copy Current Inventory")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Current Stock")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Current Inventory")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Maintain Stock ")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Maintain Inventory")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Serial No Stock ")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Serial No Inventory")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Stock")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Inventory")
				
				
			Else 
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Stock Types")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Stock Types")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Stock Locations")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Stock Locations")
				
				
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 4)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "STOCK CONTROL")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "STOCK CONTROL")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Stock Control")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Stock Control")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Allocate Stock")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Allocate Stock")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "View Stock Levels")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "View Stock Levels")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Stock Levels")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Stock Levels")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Copy Current Stock")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Copy Current Stock")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Current Stock")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Current Stock")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Maintain Stock ")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Maintain Stock")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Serial No Stock ")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Serial No Stock")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Stock")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Stock")
			End if 
			If ($_bo_TermST)
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "VAT Codes")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Sales & Use Tax Codes")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "EC Vat Reg No")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Resale No")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Reg No")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Resale No")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "VAT")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Tax")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; Get localized string:C991("Input"))
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; Get localized string:C991("AccountStringSales"))
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; Get localized string:C991("Output"))
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; Get localized string:C991("Purchases"))
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Listing")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Listing")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "In")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Sales")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Out")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Purchase")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "I/O")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "S/P")
				
				
				
				
			Else 
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "VAT Codes")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "VAT Codes")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "EC Vat Reg No")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "EC Vat Reg No")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Reg No")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Reg No")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "VAT")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "VAT")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; Get localized string:C991("Input"))
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; Get localized string:C991("Input"))
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; Get localized string:C991("Output"))
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; Get localized string:C991("Output"))
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Listing")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Listing")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "In")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "In")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Out")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Out")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "I/O")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "I/O")
			End if 
			If ($_bo_TermGL)
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[TRANSACTION_BATCHES:30]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Profit & Loss")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Account Income")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[TRANSACTION_BATCHES:30]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Profit/Loss")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Account Income")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[TRANSACTION_BATCHES:30]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "P/L")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Income")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[TRANSACTION_BATCHES:30]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "P&L")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Income")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[TRANSACTION_BATCHES:30]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Nominal")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "General")
				
				
				
				
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[TRANSACTION_BATCHES:30]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Profit & Loss v Budgets")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Income v Budgets")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[TRANSACTION_BATCHES:30]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Profit & Loss 12 Periods")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Income 12 Period")
				
				
				
			Else 
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[TRANSACTION_BATCHES:30]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Profit & Loss")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Profit & Loss")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[TRANSACTION_BATCHES:30]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Profit/Loss")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Profit/Loss")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[TRANSACTION_BATCHES:30]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "P/L")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "P/L")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[TRANSACTION_BATCHES:30]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "P&L")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "P&L")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[TRANSACTION_BATCHES:30]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Nominal")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Nominal")
				
				
				
				
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[TRANSACTION_BATCHES:30]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Profit & Loss v Budgets")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Profit & Loss v Budgets")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[TRANSACTION_BATCHES:30]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Profit & Loss 12 Periods")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Profit & Loss 12 Periods")
			End if 
			If ($_bo_TermRP)
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 4)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "PURCHASE PRE-PAYMENT")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "PRE-PAYMENT")
				
				$_t_SalesLedgerName:=Get localized string:C991("MenuItem_SalesLedger")
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; $_t_SalesLedgerName)
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Accounts Receivable")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Credit Note")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Credit Memo")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "AdHoc CNs")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Adhoc CMs")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Debtor")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Receivable")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "SL")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "AR")
				
				$_t_PurchaseLedgerName:=Get localized string:C991("MenuItem_PurchaseLedger")
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; $_t_PurchaseLedgerName)
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Accounts Payable")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Purchase Inv")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Inv")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Purchase Credit")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Credit")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Purchase Pay")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Pay")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Purchase Pre")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Pre")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Purchase CNs")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Credit Memos")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Purchase CNs")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Credit Memos")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Purchases")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Payables")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Creditor")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Payable")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "PL")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "AP")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Cheque")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Check")
				
				
				
				
				
			Else 
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 4)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "PURCHASE PRE-PAYMENT")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "PURCHASE PRE-PAYMENT")
				
				$_t_SalesLedgerName:=Get localized string:C991("MenuItem_SalesLedger")
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; $_t_SalesLedgerName)
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; $_t_SalesLedgerName)
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Credit Note")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Credit Note")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "AdHoc CNs")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Adhoc CNs")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Debtor")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Debtor")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "SL")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "SL")
				
				$_t_PurchaseLedgerName:=Get localized string:C991("MenuItem_PurchaseLedger")
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; $_t_PurchaseLedgerName)
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; $_t_PurchaseLedgerName)
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Purchase Inv")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Purchase Inv")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Purchase Credit")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Purchase Credit")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Purchase Pay")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Purchase Pay")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Purchase Pre")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Purchase Pre")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Purchase CNs")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Credit Memos")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Purchase CNs")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Purchase Memos")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Purchases")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Purchases")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Creditor")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "Creditor")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "PL")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "PL")
				
				APPEND TO ARRAY:C911(DB_al_TerminologyClass; 1)
				APPEND TO ARRAY:C911(DB_al_TerminologyTable; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(DB_at_TerminologyName; "Cheque")
				APPEND TO ARRAY:C911(DB_at_TerminologyTranslate; "CHeque")
			End if 
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_TerminologyData
			[PREFERENCES:116]Preference_DataID:7:=<>PER_l_CurLoggedinDataOwnerID
			VARIABLE TO BLOB:C532(DB_al_TerminologyClass; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DB_al_TerminologyTable; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DB_at_TerminologyName; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DB_at_TerminologyTranslate; [PREFERENCES:116]DataBlob:2; *)
			DB_SaveRecord(->[PREFERENCES:116])
		End if 
	Else 
		$_l_offset:=0
		ARRAY LONGINT:C221(DB_al_TerminologyClass; 0)
		ARRAY LONGINT:C221(DB_al_TerminologyTable; 0)
		ARRAY TEXT:C222(DB_at_TerminologyName; 0)
		ARRAY TEXT:C222(DB_at_TerminologyTranslate; 0)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_al_TerminologyClass; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_al_TerminologyTable; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_at_TerminologyName; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_at_TerminologyTranslate; $_l_offset)
		
	End if 
Else 
	If (In transaction:C397)
		If (Application type:C494=4D Server:K5:6)
			
			If (DB_l_CurrentOwnerRequest>0)
				$_l_Process:=New process:C317("DB_LoadTerminologyPreferences"; 128000; "Save Terminology Preferences"; True:C214; True:C214; DB_l_CurrentOwnerRequest)
			Else 
				$_l_Process:=New process:C317("DB_LoadTerminologyPreferences"; 128000; "Save Terminology Preferences"; True:C214; True:C214)
			End if 
		Else 
			$_l_Process:=New process:C317("DB_LoadTerminologyPreferences"; 128000; "Save Terminology Preferences"; True:C214; True:C214)
		End if 
		
		While (Process state:C330($_l_Process)>=0)
			DelayTicks(5)
		End while 
	Else 
		If (Application type:C494=4D Server:K5:6)
			
			If (DB_l_CurrentOwnerRequest>0)
				$_l_TerminologyData:=PREF_GetPreferenceID("Terminology Settings"; True:C214; DB_l_CurrentOwnerRequest)
			Else 
				$_l_TerminologyData:=PREF_GetPreferenceID("Terminology Settings"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
			End if 
		Else 
			$_l_TerminologyData:=PREF_GetPreferenceID("Terminology Settings"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
		End if 
		
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_TerminologyData)
		If (Records in selection:C76([PREFERENCES:116])=0)
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_TerminologyData
			If (Application type:C494=4D Server:K5:6)
				
				If (DB_l_CurrentOwnerRequest>0)
					[PREFERENCES:116]Preference_DataID:7:=DB_l_CurrentOwnerRequest
				Else 
					[PREFERENCES:116]Preference_DataID:7:=<>PER_l_CurLoggedinDataOwnerID
				End if 
			Else 
				
				[PREFERENCES:116]Preference_DataID:7:=<>PER_l_CurLoggedinDataOwnerID
			End if 
		End if 
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		VARIABLE TO BLOB:C532(DB_al_TerminologyClass; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DB_al_TerminologyTable; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DB_at_TerminologyName; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DB_at_TerminologyTranslate; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
	End if 
End if 


If (Not:C34($_bo_FromTransaction))
	
	CLEAR SEMAPHORE:C144("LockTerminologyPreferences")
End if 
ERR_MethodTrackerReturn("DB_LoadTerminologyPreferences"; $_t_oldMethodName)