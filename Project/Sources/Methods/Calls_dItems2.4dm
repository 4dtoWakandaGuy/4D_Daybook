//%attributes = {}
If (False:C215)
	//Project Method Name:      Calls_dItems2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 09:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vJobCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_dItems2")
If (Records in selection:C76([CONTRACTS:17])>0)
	CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "Items")
	FIRST RECORD:C50([CONTRACTS:17])
	While (Not:C34(End selection:C36([CONTRACTS:17])))
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Contract_Code:29=[CONTRACTS:17]Contract_Code:3)
		CREATE SET:C116([ORDER_ITEMS:25]; "More")
		UNION:C120("Items"; "More"; "Items")
		NEXT RECORD:C51([CONTRACTS:17])
	End while 
	USE SET:C118("Items")
	FIRST RECORD:C50([CONTRACTS:17])
	If (Records in selection:C76([ORDER_ITEMS:25])>0)
		Open_Gnt_Window
		DIALOG:C40([SERVICE_CALLS:20]; "dService_Call")
		CLOSE WINDOW:C154
		WS_KeepFocus
		
		vJobCode:=[SERVICE_CALLS:20]Company_Code:1
		Array_LCx(0)
		
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[SERVICE_CALLS:20]Call_Code:4)
		REDRAW:C174([ORDER_ITEMS:25])
		Calls_InLPB2
	End if 
End if 
ERR_MethodTrackerReturn("Calls_dItems2"; $_t_oldMethodName)