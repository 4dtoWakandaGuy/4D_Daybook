//%attributes = {}
If (False:C215)
	//Project Method Name:      LBI_saveLayoutName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/09/2012 06:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_LayoutIdents; 0)
	ARRAY TEXT:C222($_at_LayoutNames; 0)
	C_LONGINT:C283($_l_LayoutIdentRow; $_l_LayoutNamesID; $_l_offset)
	C_TEXT:C284($_t_LayoutIdent; $_t_LayoutName; $_t_oldMethodName; $_t_TaxCode; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBI_saveLayoutName")

If (Count parameters:C259>=1)
	$_t_LayoutIdent:=$1
	$_t_LayoutName:=""
	If (Count parameters:C259<2)
		
		Case of 
			: ($_t_LayoutIdent="00103")
				$_t_LayoutName:="Contacts_Incl"
			: ($_t_LayoutIdent="00104")
				$_t_LayoutName:="QA Contacts_Incl"
			: ($_t_LayoutIdent="00105")
				$_t_LayoutName:="List Contacts"
			: ($_t_LayoutIdent="14405")
				$_t_LayoutName:="List Companies"
			: ($_t_LayoutIdent="00201")
				$_t_LayoutName:="View Companies"
			: ($_t_LayoutIdent="00202")
				$_t_LayoutName:="QA View Companies"
			: ($_t_LayoutIdent="00203")
				$_t_LayoutName:="List Companies"
			: ($_t_LayoutIdent="14601")
				$_t_LayoutName:="Companies Furthers"
			: ($_t_LayoutIdent="00204")
				$_t_LayoutName:="Creditor Companies"
			: ($_t_LayoutIdent="14601")
				$_t_LayoutName:="Companies Furthers"
			: ($_t_LayoutIdent="14803")
				$_t_LayoutName:="Product Suppliers"
			: ($_t_LayoutIdent="00301")
				$_t_LayoutName:="Areas Table View"
			: ($_t_LayoutIdent="00401")
				$_t_LayoutName:="Status View"
			: ($_t_LayoutIdent="00601")
				$_t_LayoutName:="Sources Table View"
			: ($_t_LayoutIdent="00701")
				$_t_LayoutName:="View Document Templates Table"
			: ($_t_LayoutIdent="00801")
				$_t_LayoutName:="View Brands Table"
			: ($_t_LayoutIdent="00904")
				$_t_LayoutName:="View Products"
			: ($_t_LayoutIdent="00905")
				$_t_LayoutName:="Products Table View"
			: ($_t_LayoutIdent="01001")
				$_t_LayoutName:="Product Groups View"
			: ($_t_LayoutIdent="01101")
				$_t_LayoutName:="View Personnel Table"
			: ($_t_LayoutIdent="01203")
				$_t_LayoutName:="Enquirers Incl"
			: ($_t_LayoutIdent="01208")
				$_t_LayoutName:="View Diary"
			: ($_t_LayoutIdent="01209")
				$_t_LayoutName:="View Documents"
			: ($_t_LayoutIdent="01210")
				$_t_LayoutName:="View Jobs"
			: ($_t_LayoutIdent="01211")
				$_t_LayoutName:="View Diary"
			: ($_t_LayoutIdent="01213")
				$_t_LayoutName:="View Workflow"
			: ($_t_LayoutIdent="01214")
				$_t_LayoutName:="View Letters Table"
			: ($_t_LayoutIdent="01215")
				$_t_LayoutName:="View Workflow"
			: ($_t_LayoutIdent="01301")
				$_t_LayoutName:="View Actions Table"
			: ($_t_LayoutIdent="01401")
				$_t_LayoutName:="View Results Table"
			: ($_t_LayoutIdent="01702")
				$_t_LayoutName:="View Contracts"
			: ($_t_LayoutIdent="01703")
				$_t_LayoutName:="View Contracts Table"
			: ($_t_LayoutIdent="01801")
				$_t_LayoutName:="View Price Groups"
			: ($_t_LayoutIdent="01901")
				$_t_LayoutName:="View Contract Type Table"
			: ($_t_LayoutIdent="02002")
				$_t_LayoutName:="View Service Calls"
			: ($_t_LayoutIdent="02003")
				$_t_LayoutName:="Service Calls View"
			: ($_t_LayoutIdent="02301")
				$_t_LayoutName:="Solutions View"
			: ($_t_LayoutIdent="02403")
				$_t_LayoutName:="Enquirers Incl"
			: ($_t_LayoutIdent="02408")
				$_t_LayoutName:="View Enquiries"
			: ($_t_LayoutIdent="02409")
				$_t_LayoutName:="View Orders"
			: ($_t_LayoutIdent="02410")
				$_t_LayoutName:="View Orders Table"
			: ($_t_LayoutIdent="02411")
				$_t_LayoutName:="View Enquiries Table"
			: ($_t_LayoutIdent="02412")
				$_t_LayoutName:="View Quotations Table"
			: ($_t_LayoutIdent="02503")
				$_t_LayoutName:="Order Items Incl"
			: ($_t_LayoutIdent="02504")
				$_t_LayoutName:="QA Order Items Incl"
			: ($_t_LayoutIdent="02505")
				$_t_LayoutName:="Enquiry Items Incl"
			: ($_t_LayoutIdent="02506")
				$_t_LayoutName:="QA Enq Items Incl"
			: ($_t_LayoutIdent="02507")
				$_t_LayoutName:="Enquirers Incl"
			: ($_t_LayoutIdent="02508")
				$_t_LayoutName:="Order items"
			: ($_t_LayoutIdent="02509")
				$_t_LayoutName:="Order items"
			: ($_t_LayoutIdent="02510")
				$_t_LayoutName:="Order items"
			: ($_t_LayoutIdent="02511")
				$_t_LayoutName:="Order items"
			: ($_t_LayoutIdent="02512")
				$_t_LayoutName:="Order items"
			: ($_t_LayoutIdent="02520")
				$_t_LayoutName:="Order items, Jobs"
			: ($_t_LayoutIdent="02521")
				$_t_LayoutName:="VIew Orders Items"
			: ($_t_LayoutIdent="02522")
				$_t_LayoutName:="Publication Bookings"
			: ($_t_LayoutIdent="02523")
				$_t_LayoutName:="Publication Subscriptions"
			: ($_t_LayoutIdent="02602")
				$_t_LayoutName:="VIew Jobs"
			: ($_t_LayoutIdent="02603")
				$_t_LayoutName:="View Jobs"
			: ($_t_LayoutIdent="02604")
				$_t_LayoutName:="View Jobs Table"
			: ($_t_LayoutIdent="02701")
				$_t_LayoutName:="Stock Items"
			: ($_t_LayoutIdent="02702")
				$_t_LayoutName:="Stock Ordered"
			: ($_t_LayoutIdent="02714")
				$_t_LayoutName:="Stock Items"
			: ($_t_LayoutIdent="02703")
				$_t_LayoutName:="Stock Receipt"
				$_t_LayoutName:="Stock Receipt"
			: ($_t_LayoutIdent="02704")
				$_t_LayoutName:="Stock Allocation"
			: ($_t_LayoutIdent="02705")
				$_t_LayoutName:="Stock Deliveries"
			: ($_t_LayoutIdent="02706")
				$_t_LayoutName:="Analysis Change"
			: ($_t_LayoutIdent="02707")
				$_t_LayoutName:="Layer Change"
			: ($_t_LayoutIdent="02708")
				$_t_LayoutName:="Layer Change"
			: ($_t_LayoutIdent="02709")
				$_t_LayoutName:="Currency Change"
			: ($_t_LayoutIdent="02710")
				$_t_LayoutName:="Stock Adjustment Items"
				$_t_LayoutName:="Currency Change"
			: ($_t_LayoutIdent="02711")
				$_t_LayoutName:="Purchase Cancellation"
			: ($_t_LayoutIdent="02714")
				$_t_LayoutName:="Stock items view"
			: ($_t_LayoutIdent="14301")
				$_t_LayoutName:="Product Stock Count"
			: ($_t_LayoutIdent="02201")
				$_t_LayoutName:="View Problems Table"
			: ($_t_LayoutIdent="02807")
				$_t_LayoutName:="View Price Table"
			: ($_t_LayoutIdent="02809")
				$_t_LayoutName:="View Price Table"
			: ($_t_LayoutIdent="02901")
				$_t_LayoutName:="View Transactions Table"
			: ($_t_LayoutIdent="02902")
				$_t_LayoutName:="View Unreconcilled Transactions "
			: ($_t_LayoutIdent="03003")
				$_t_LayoutName:="Trans Journal Items"
			: ($_t_LayoutIdent="03004")
				$_t_LayoutName:="View Transaction Batches"
			: ($_t_LayoutIdent="03101")
				$_t_LayoutName:="View Transaction Types"
			: ($_t_LayoutIdent="03301")
				$_t_LayoutName:="View Accounting Periods"
			: ($_t_LayoutIdent="03401")
				$_t_LayoutName:="View account Balances"
				
				
				
				
			: ($_t_LayoutIdent="03501")
				$_t_LayoutName:="View Tax Codes"
			: ($_t_LayoutIdent="03601")
				$_t_LayoutName:="View Analysis Codes"
			: ($_t_LayoutIdent="03703")
				$_t_LayoutName:="List Purchase Invoice Items"
			: ($_t_LayoutIdent="03704")
				$_t_LayoutName:="QA PL Items Incl"
			: ($_t_LayoutIdent="03706")
				$_t_LayoutName:="Purchase Invoice Items"
			: ($_t_LayoutIdent="03707")
				$_t_LayoutName:="Purchase Invoice Items"
			: ($_t_LayoutIdent="03708")
				$_t_LayoutName:="View Purchase Invoice Table"
			: ($_t_LayoutIdent="03801")
				$_t_LayoutName:="View Recurring Jounals table"
			: ($_t_LayoutIdent="04001")
				$_t_LayoutName:="View Stock Movements_List"
			: ($_t_LayoutIdent="04501")
				$_t_LayoutName:="Job Stage View"
			: ($_t_LayoutIdent="15803")
				$_t_LayoutName:="purchase`invoice Items"
			: ($_t_LayoutIdent="15804")
				$_t_LayoutName:="Purchase`Invoice View"
			: ($_t_LayoutIdent="03704")
				$_t_LayoutName:="QA PL Items Incl"
			: ($_t_LayoutIdent="16103")
				$_t_LayoutName:="Invoice Items"
			: ($_t_LayoutIdent="16104")
				$_t_LayoutName:="Invoice Items VIew"
			: ($_t_LayoutIdent="03906")
				$_t_LayoutName:="Invoice Items"
			: ($_t_LayoutIdent="03907")
				$_t_LayoutName:="Invoice  Items"
			: ($_t_LayoutIdent="03908")
				$_t_LayoutName:="Invoices Table View"
			: ($_t_LayoutIdent="03909")
				$_t_LayoutName:="Credits Table View"
			: ($_t_LayoutIdent="03910")
				$_t_LayoutName:="Deposits Table View"
			: ($_t_LayoutIdent="03911")
				$_t_LayoutName:="Receipts Table View"
			: ($_t_LayoutIdent="03912")
				$_t_LayoutName:="Proformas Table View"
			: ($_t_LayoutIdent="03999")
			: ($_t_LayoutIdent="04601")
			: ($_t_LayoutIdent="04704")
				$_t_LayoutName:="Job Stages"
				
			: ($_t_LayoutIdent="04705")
				$_t_LayoutName:="Job Stages"
			: ($_t_LayoutIdent="04706")
				$_t_LayoutName:="Job Stages View"
			: ($_t_LayoutIdent="04801")
				$_t_LayoutName:="Job Personnel"
		End case 
		Case of 
			: ($_t_LayoutIdent="04802")
				$_t_LayoutName:="Job Personnel Table"
		End case 
		Case of 
			: ($_t_LayoutIdent="05001")
				$_t_LayoutName:="Post Codes Table"
			: ($_t_LayoutIdent="05101")
				$_t_LayoutName:="View workflow"
			: ($_t_LayoutIdent="05201")
				$_t_LayoutName:="Publications Table"
			: ($_t_LayoutIdent="05303")
				$_t_LayoutName:="Furhter Analysis Table"
			: ($_t_LayoutIdent="05401")
				$_t_LayoutName:="View Credit Stages Table"
			: ($_t_LayoutIdent="05502")
				$_t_LayoutName:="Companies_Incl"
			: ($_t_LayoutIdent="05503")
				$_t_LayoutName:="Applic Incl"
			: ($_t_LayoutIdent="05703")
				$_t_LayoutName:="PO Items Incl"
			: ($_t_LayoutIdent="16903")
			: ($_t_LayoutIdent="16904")
				$_t_LayoutName:="Purchase Items Table"
			: ($_t_LayoutIdent="05705")
				$_t_LayoutName:="PO Items Incl"
			: ($_t_LayoutIdent="05706")
			: ($_t_LayoutIdent="05707")
				$_t_LayoutName:="View Purchase Orders Table"
			: ($_t_LayoutIdent="05801")
				$_t_LayoutName:="View Stock Levels Table"
			: ($_t_LayoutIdent="05901")
				$_t_LayoutName:="View Stock Types Table"
			: ($_t_LayoutIdent="06001")
				$_t_LayoutName:="View Movement Types Table"
			: ($_t_LayoutIdent="06101")
				$_t_LayoutName:="View Locations Table"
			: ($_t_LayoutIdent="06201")
				$_t_LayoutName:="View Current Stock Table"
			: ($_t_LayoutIdent="06202")
				$_t_LayoutName:="Current Stcok"
		End case 
		Case of 
			: ($_t_LayoutIdent="06501")
				$_t_LayoutName:="View JobTypes Table"
			: ($_t_LayoutIdent="07101")
				$_t_LayoutName:="Currencies Table"
			: ($_t_LayoutIdent="07301")
				$_t_LayoutName:="View Countries Table"
				$_t_TaxCode:=Term_VATWT($_t_TaxCode)
			: ($_t_LayoutIdent="07401")
				$_t_LayoutName:="View Address Format Table"
			: ($_t_LayoutIdent="07501")
				$_t_LayoutName:="View terminology Table"
			: ($_t_LayoutIdent="07601")
				$_t_LayoutName:="View Layers Table"
			: ($_t_LayoutIdent="08001")
				$_t_LayoutName:="View Macros Table"
			: ($_t_LayoutIdent="08501")
				$_t_LayoutName:="View Pictures Table"
			: ($_t_LayoutIdent="08401")
				$_t_LayoutName:="View Headings Table"
			: ($_t_LayoutIdent="08701")
				$_t_LayoutName:="View Roles Table"
			: ($_t_LayoutIdent="08901")
				$_t_LayoutName:="View Projects Table"
			: ($_t_LayoutIdent="09201")
				$_t_LayoutName:="View Groups Table"
			: ($_t_LayoutIdent="09301")
			: ($_t_LayoutIdent="09801")
				$_t_LayoutName:="View Further Fields Table"
			: ($_t_LayoutIdent="09903")
			: ($_t_LayoutIdent="09904")
				$_t_LayoutName:="View Field Definitions Table"
			: ($_t_LayoutIdent="00501")
				$_t_LayoutName:="View Types Table"
				
		End case 
	Else 
		$_t_LayoutName:=$2
		
	End if 
	If ($_t_LayoutName#"") & ($_t_LayoutIdent#"")
		While (Semaphore:C143("SaveLayoutName"))
			DelayTicks(2)
		End while 
		$_l_LayoutNamesID:=PREF_GetPreferenceID("Definitions Names"; True:C214; -1)
		ARRAY TEXT:C222($_at_LayoutNames; 0)
		ARRAY TEXT:C222($_at_LayoutIdents; 0)
		READ WRITE:C146([PREFERENCES:116])
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_LayoutNamesID)
		If (Records in selection:C76([PREFERENCES:116])=0)
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_LayoutNamesID
			[PREFERENCES:116]Preference_DataID:7:=-1
			AA_CheckUUID(Table:C252(->[PREFERENCES:116]))
			
			SAVE RECORD:C53([PREFERENCES:116])
			//LBI_initLayoutNames
		End if 
		$_l_offset:=0
		If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_LayoutIdents; $_l_offset)
			If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_LayoutNames; $_l_offset)
			End if 
		End if 
		
		$_l_LayoutIdentRow:=Find in array:C230($_at_LayoutIdents; $_t_LayoutIdent)
		If ($_l_LayoutIdentRow<0)
			APPEND TO ARRAY:C911($_at_LayoutIdents; $_t_LayoutIdent)
			APPEND TO ARRAY:C911($_at_LayoutNames; $_t_LayoutName)
		Else 
			$_at_LayoutNames{$_l_LayoutIdentRow}:=$_t_LayoutName
		End if 
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		VARIABLE TO BLOB:C532($_at_LayoutIdents; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_at_LayoutNames; [PREFERENCES:116]DataBlob:2; *)
		AA_CheckUUID(Table:C252(->[PREFERENCES:116]))
		
		SAVE RECORD:C53([PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		CLEAR SEMAPHORE:C144("SaveLayoutName")
	End if 
	
Else 
	
End if 
ERR_MethodTrackerReturn("LBI_saveLayoutName"; $_t_oldMethodName)