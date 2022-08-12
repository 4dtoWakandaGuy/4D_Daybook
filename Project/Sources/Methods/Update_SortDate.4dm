//%attributes = {}
If (False:C215)
	//Project Method Name:      Update_SortDate
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

$_t_oldMethodName:=ERR_MethodTracker("Update_SortDate")

READ WRITE:C146([ORDERS:24])
QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3="")
DELETE SELECTION:C66([ORDERS:24])
QUERY:C277([ORDERS:24]; [ORDERS:24]SORT_Date:57=!00-00-00!)

If (Records in selection:C76([ORDERS:24])>0)
	QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Date:4#!00-00-00!; *)
	QUERY SELECTION:C341([ORDERS:24];  | ; [ORDERS:24]Quotation_Date:26#!00-00-00!; *)
	QUERY SELECTION:C341([ORDERS:24];  | ; [ORDERS:24]Enquiry_Date:25#!00-00-00!)
	If (Records in selection:C76([ORDERS:24])>0)
		DB_lockFile(->[ORDERS:24])
		APPLY TO SELECTION:C70([ORDERS:24]; [ORDERS:24]SORT_Date:57:=!00-00-00!)
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDERS:24]))
	End if 
End if 
UNLOAD RECORD:C212([ORDERS:24])
READ ONLY:C145([ORDERS:24])
ERR_MethodTrackerReturn("Update_SortDate"; $_t_oldMethodName)