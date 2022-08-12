//%attributes = {}
If (False:C215)
	//Project Method Name:      Doc_userPreferencesMapGet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($_ptr_Table; $2)
	C_TEXT:C284($_t_Form; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Doc_userPreferencesMapGet")

$_ptr_Table:=$2

$0:=""

If (Records in selection:C76([DOCUMENTS:7])=1)
	
	Case of 
		: ([DOCUMENTS:7]Document_Code:1="@SR Statement@")  //super report must be loaded
			$0:="Statements"
			
		: ([DOCUMENTS:7]Table_Number:11>0)  //super report must be loaded
			$_ptr_Table:=Table:C252([DOCUMENTS:7]Table_Number:11)
			If (Not:C34(Is nil pointer:C315($_ptr_Table)))
				$_t_Form:=""
			End if 
			
		Else 
	End case 
End if 

Case of 
	: ($0#"")  //already got report name from above
		
	: ($_t_Form="invoice@")
		$0:="invoices"
		
	: (($_t_Form="order@") | ($_t_Form="Qtn"))
		$0:="orders"
		
	: ($_t_Form="purchase order@")
		$0:="purchase orders"
		
	: (Is nil pointer:C315($_ptr_Table))
		
	: (Table:C252($_ptr_Table)=Table:C252(->[ORDERS:24]))
		$0:="sales orders"
		
		
	: (Table:C252($_ptr_Table)=Table:C252(->[INVOICES:39]))
		$0:="stataments"
		
		
	: (Table:C252($_ptr_Table)=Table:C252(->[PURCHASE_ORDERS:57]))
		$0:="purchase orders"
		
	Else 
		$0:=""
End case 
ERR_MethodTrackerReturn("Doc_userPreferencesMapGet"; $_t_oldMethodName)