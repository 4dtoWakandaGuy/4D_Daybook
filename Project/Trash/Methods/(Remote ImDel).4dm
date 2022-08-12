//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote ImDel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess)
	C_TEXT:C284($_t_ModifiedStamp; $_t_oldMethodName; $_t_RecordIdent; $_t_Remainder; $_t_TableIdent; vFld; vRec)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote ImDel")
$_t_TableIdent:="Start"
While (($_t_TableIdent#"*END*") & (<>SYS_l_CancelProcess#<>Process))
	$_t_TableIdent:=Remote_Packet(vFld)
	If ($_t_TableIdent#"*END*")
		$_t_RecordIdent:=Remote_Packet(vFld)
		$_t_ModifiedStamp:=Remote_Packet(vRec)
		Case of 
			: ($_t_TableIdent="Companies")
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_RecordIdent)
				If (([COMPANIES:2]Export:33<$_t_ModifiedStamp) | ([COMPANIES:2]Export:33>":"))
					DELETE RECORD:C58([COMPANIES:2])
				End if 
			: ($_t_TableIdent="Contacts")
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_RecordIdent)
				If (([CONTACTS:1]Export:18<$_t_ModifiedStamp) | ([CONTACTS:1]Export:18>":"))
					DELETE RECORD:C58([CONTACTS:1])
				End if 
			: ($_t_TableIdent="Diary")
				QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_RecordIdent)
				If (([DIARY:12]Export:24<$_t_ModifiedStamp) | ([DIARY:12]Export:24>":"))
					DELETE RECORD:C58([DIARY:12])
				End if 
			: ($_t_TableIdent="Orders")
				QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_t_RecordIdent)
				If (Records in selection:C76([ORDERS:24])=1)
					If (([ORDERS:24]Export:24<$_t_ModifiedStamp) | ([ORDERS:24]Export:24>":"))
						RELATE MANY:C262([ORDERS:24]Order_Code:3)
						If (Records in selection:C76([ORDER_ITEMS:25])>0)
							DELETE SELECTION:C66([ORDER_ITEMS:25])
						End if 
						DELETE RECORD:C58([ORDERS:24])
					End if 
				End if 
			: ($_t_TableIdent="Products")
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_RecordIdent)
				If (([PRODUCTS:9]Export:22<$_t_ModifiedStamp) | ([PRODUCTS:9]Export:22>":"))
					DELETE RECORD:C58([PRODUCTS:9])
				End if 
			: ($_t_TableIdent="Areas")
				QUERY:C277([AREAS:3]; [AREAS:3]Area_Code:1=$_t_RecordIdent)
				If (([AREAS:3]Export:3<$_t_ModifiedStamp) | ([AREAS:3]Export:3>":"))
					DELETE RECORD:C58([AREAS:3])
				End if 
			: ($_t_TableIdent="Postcodes")
				QUERY:C277([POSTAL_CODES:50]; [POSTAL_CODES:50]Postal_Code_From:1=$_t_RecordIdent)
				If (([POSTAL_CODES:50]Export:3<$_t_ModifiedStamp) | ([POSTAL_CODES:50]Export:3>":"))
					DELETE RECORD:C58([POSTAL_CODES:50])
				End if 
			: ($_t_TableIdent="Status")
				QUERY:C277([STATUS:4]; [STATUS:4]Status_Code:1=$_t_RecordIdent)
				If (([STATUS:4]Export:3<$_t_ModifiedStamp) | ([STATUS:4]Export:3>":"))
					DELETE RECORD:C58([STATUS:4])
				End if 
			: ($_t_TableIdent="Types")
				QUERY:C277([TYPES:5]; [TYPES:5]Type_Code:1=$_t_RecordIdent)
				If (([TYPES:5]Export:3<$_t_ModifiedStamp) | ([TYPES:5]Export:3>":"))
					DELETE RECORD:C58([TYPES:5])
				End if 
			: ($_t_TableIdent="Sources")
				QUERY:C277([SOURCES:6]; [SOURCES:6]Source_Code:1=$_t_RecordIdent)
				If (([SOURCES:6]Export:13<$_t_ModifiedStamp) | ([SOURCES:6]Export:13>":"))
					DELETE RECORD:C58([SOURCES:6])
				End if 
			: ($_t_TableIdent="Further Analyses")
				QUERY:C277([ADDITIONAL_RECORD_ANALYSIS:53]; [ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1=$_t_RecordIdent)
				If (([ADDITIONAL_RECORD_ANALYSIS:53]Export:3<$_t_ModifiedStamp) | ([ADDITIONAL_RECORD_ANALYSIS:53]Export:3>":"))
					DELETE RECORD:C58([ADDITIONAL_RECORD_ANALYSIS:53])
				End if 
			: ($_t_TableIdent="Actions")
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$_t_RecordIdent)
				If (([ACTIONS:13]Export:3<$_t_ModifiedStamp) | ([ACTIONS:13]Export:3>":"))
					DELETE RECORD:C58([ACTIONS:13])
				End if 
			: ($_t_TableIdent="Results")
				QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Code:1=$_t_RecordIdent)
				If (([RESULTS:14]Export:4<$_t_ModifiedStamp) | ([RESULTS:14]Export:4>":"))
					DELETE RECORD:C58([RESULTS:14])
				End if 
			: ($_t_TableIdent="Sequences")
				QUERY:C277([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]WFControl_Code:10=$_t_RecordIdent)
				If (([WORKFLOW_CONTROL:51]Export:9<$_t_ModifiedStamp) | ([WORKFLOW_CONTROL:51]Export:9>":"))
					DELETE RECORD:C58([WORKFLOW_CONTROL:51])
				End if 
			: ($_t_TableIdent="Groups")
				QUERY:C277([PRODUCT_GROUPS:10]; [PRODUCT_GROUPS:10]Group_Code:1=$_t_RecordIdent)
				If (([PRODUCT_GROUPS:10]Export:7<$_t_ModifiedStamp) | ([PRODUCT_GROUPS:10]Export:7>":"))
					DELETE RECORD:C58([PRODUCT_GROUPS:10])
				End if 
			: ($_t_TableIdent="Brands")
				QUERY:C277([PRODUCT_BRANDS:8]; [PRODUCT_BRANDS:8]Brand_Code:1=$_t_RecordIdent)
				If (([PRODUCT_BRANDS:8]Export:3<$_t_ModifiedStamp) | ([PRODUCT_BRANDS:8]Export:3>":"))
					DELETE RECORD:C58([PRODUCT_BRANDS:8])
				End if 
			: ($_t_TableIdent="Price Groups")
				QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=$_t_RecordIdent)
				If (([PRICE_GROUPS:18]Export:7<$_t_ModifiedStamp) | ([PRICE_GROUPS:18]Export:7>":"))
					DELETE RECORD:C58([PRICE_GROUPS:18])
				End if 
			: ($_t_TableIdent="Price Table")
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Table_Code:12=$_t_RecordIdent)
				If (([PRICE_TABLE:28]Export:11<$_t_ModifiedStamp) | ([PRICE_TABLE:28]Export:11>":"))
					DELETE RECORD:C58([PRICE_TABLE:28])
				End if 
			: ($_t_TableIdent="Documents")
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_RecordIdent)
				If (([DOCUMENTS:7]Export:6<$_t_ModifiedStamp) | ([DOCUMENTS:7]Export:6>":"))
					DELETE RECORD:C58([DOCUMENTS:7])
				End if 
		End case 
	Else 
		$_t_Remainder:=Remote_Packet(vRec)
	End if 
	If ($_t_Remainder="*END*@")
		$_t_TableIdent:="*END*"
	End if 
End while 
ERR_MethodTrackerReturn("Remote ImDel"; $_t_oldMethodName)
