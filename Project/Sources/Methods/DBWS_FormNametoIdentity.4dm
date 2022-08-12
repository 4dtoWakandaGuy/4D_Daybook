//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_FormNametoIdentity
	//------------------ Method Notes ------------------
	//if the 'form name' is not empty then this is probably an included area
	//such as contacts WITHIN a Company_Details form.
	
	//------------------ Revision Control ----------------
	//Date Created: 19/10/2012 09:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DBWS_l_CurrentTable)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_FormNametoIdentity")
If (Count parameters:C259>=3)
	
	Case of 
		: ($1="View Companies")
			Case of 
				: ($2="")  //not context
					$0:="00203"
			End case 
			DBWS_l_CurrentTable:=Table:C252(->[COMPANIES:2])
			
		: ($1="View Contacts")
			Case of 
				: ($2="")  //not context
					$0:="00103"
			End case 
			DBWS_l_CurrentTable:=Table:C252(->[CONTACTS:1])
			
		: ($1="View Products")
			Case of 
				: ($2="")  //not context
					$0:="00905"
			End case 
			DBWS_l_CurrentTable:=Table:C252(->[PRODUCTS:9])
			
		: ($1="View Price Table")
		: ($1="View Calendar")
		: ($1="View Letters & Quotes")
		: ($1="View Orders")
			Case of 
				: ($2="")  //not context
					$0:="02410"
			End case 
			DBWS_l_CurrentTable:=Table:C252(->[ORDERS:24])
			
			
			
		: ($1="View Order Items")
			Case of 
				: ($2="")  //not context
					$0:="02521"
					
			End case 
			DBWS_l_CurrentTable:=Table:C252(->[ORDER_ITEMS:25])
			
	End case 
End if 
ERR_MethodTrackerReturn("DBWS_FormNametoIdentity"; $_t_oldMethodName)