//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_TableNametoNumber
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2012 10:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_TableNametoNumber")

If (Count parameters:C259>=3)
	
	Case of 
		: ($1="View Companies")
			$0:=Table:C252(->[COMPANIES:2])
		: ($1="View Contacts")
			$0:=Table:C252(->[CONTACTS:1])
		: ($1="View Products")
			$0:=Table:C252(->[PRODUCTS:9])
			
		: ($1="View Price Table")
		: ($1="View Calendar")
		: ($1="View Letters & Quotes")
		: ($1="View Orders")
			
			$0:=Table:C252(->[ORDERS:24])
			
			
			
		: ($1="View Order Items")
			$0:=Table:C252(->[ORDER_ITEMS:25])
			
	End case 
End if 
ERR_MethodTrackerReturn("DBWS_TableNametoNumber"; $_t_oldMethodName)