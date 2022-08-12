//%attributes = {}
If (False:C215)
	//Project Method Name:      UPD_Ords
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

$_t_oldMethodName:=ERR_MethodTracker("UPD_Ords")
QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]x_ID:58=0)
DB_lockFile(->[ORDER_ITEMS:25])
APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]x_ID:58:=AA_GetNextIDinMethod(->[ORDER_ITEMS:25]x_ID:58))

AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=0)
DB_lockFile(->[ORDERS:24])
APPLY TO SELECTION:C70([ORDERS:24]; [ORDERS:24]x_ID:58:=AA_GetNextIDinMethod(->[ORDERS:24]x_ID:58))

AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDERS:24]))
QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]X_ID:43=0)
DB_lockFile(->[PRODUCTS:9])
APPLY TO SELECTION:C70([PRODUCTS:9]; [PRODUCTS:9]X_ID:43:=AA_GetNextIDinMethod(->[PRODUCTS:9]X_ID:43))

AA_CheckFileUnlockedByTableNUM(Table:C252(->[PRODUCTS:9]))
ERR_MethodTrackerReturn("UPD_Ords"; $_t_oldMethodName)