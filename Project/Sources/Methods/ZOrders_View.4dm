//%attributes = {}
If (False:C215)
	//Project Method Name:      ZOrders_View
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
	C_POINTER:C301($3)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZOrders_View")

If (Count parameters:C259>=3)
	$3->:=ZProc_withReply("Orders_View"; DB_ProcessMemoryinit(3); Term_OrdWT("View SalesBook"); $1; $2)
Else 
	
	ZProc("Orders_View"; DB_ProcessMemoryinit(3); Term_OrdWT("View SalesBook"))
End if 

//Copied to Functions Palette
ERR_MethodTrackerReturn("ZOrders_View"; $_t_oldMethodName)