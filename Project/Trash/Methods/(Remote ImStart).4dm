//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote ImStart
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote ImStart")
READ WRITE:C146([PERSONNEL:11])
READ WRITE:C146([COMPANIES:2])
READ WRITE:C146([CONTACTS:1])
READ WRITE:C146([DIARY:12])
READ WRITE:C146([PRODUCTS:9])
READ WRITE:C146([ORDERS:24])
READ WRITE:C146([ORDER_ITEMS:25])
READ WRITE:C146([DOCUMENTS:7])
READ WRITE:C146([PRICE_TABLE:28])
READ WRITE:C146([PRICE_GROUPS:18])
READ WRITE:C146([AREAS:3])
READ WRITE:C146([POSTAL_CODES:50])
READ WRITE:C146([STATUS:4])
READ WRITE:C146([TYPES:5])
READ WRITE:C146([SOURCES:6])
READ WRITE:C146([ADDITIONAL_RECORD_ANALYSIS:53])
READ WRITE:C146([ACTIONS:13])
READ WRITE:C146([RESULTS:14])
READ WRITE:C146([WORKFLOW_CONTROL:51])
READ WRITE:C146([PRODUCT_GROUPS:10])
READ WRITE:C146([PRODUCT_BRANDS:8])
ERR_MethodTrackerReturn("Remote ImStart"; $_t_oldMethodName)