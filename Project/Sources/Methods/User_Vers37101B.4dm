//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Vers37101B
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/08/2012 18:34
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

$_t_oldMethodName:=ERR_MethodTracker("User_Vers37101B")
//Create the Orders States
READ WRITE:C146([TABLE_RECORD_STATES:90])
READ WRITE:C146([CODE_USES:91])
READ WRITE:C146([ORDERS:24])
MESSAGE:C88(Char:C90(13)+"    Creating Order Record States")

MESSAGE:C88(Char:C90(13)+"      Enquiry")
States_Create("10"; "Enquiry"; 24; "02410"; "ENQUIRY"; "Enquiry")
QUERY:C277([ORDERS:24]; [ORDERS:24]State:15="-3")
Gen_AppToSel(->[ORDERS:24]; ->[ORDERS:24]State:15; "02410")
Gen_CUCreate("09002410"; 18)

MESSAGE:C88(Char:C90(13)+"      Quotation")
States_Create("20"; "Quotation"; 24; "02420"; "QUOTATION"; "Qtn")
QUERY:C277([ORDERS:24]; [ORDERS:24]State:15="-2")
Gen_AppToSel(->[ORDERS:24]; ->[ORDERS:24]State:15; "02420")
Gen_CUCreate("09002420"; 12)
Gen_CUCreate("09002420"; 18)

MESSAGE:C88(Char:C90(13)+"      New Order")
States_Create("30"; "New Order"; 24; "02430"; "NEW ORDER"; "Order")
QUERY:C277([ORDERS:24]; [ORDERS:24]State:15="-1")
Gen_AppToSel(->[ORDERS:24]; ->[ORDERS:24]State:15; "02430")
Gen_CUCreate("09002430"; 1)
Gen_CUCreate("09002430"; 7)
Gen_CUCreate("09002430"; 8)
Gen_CUCreate("09002430"; 12)
Gen_CUCreate("09002430"; 18)

MESSAGE:C88(Char:C90(13)+"      Confirmed")
States_Create("40"; "Confirmed"; 24; "02440"; "CONFIRMED ORDER"; "Conf")
QUERY:C277([ORDERS:24]; [ORDERS:24]State:15="0")
Gen_AppToSel(->[ORDERS:24]; ->[ORDERS:24]State:15; "02440")
Gen_CUCreate("09002440"; 1)
Gen_CUCreate("09002440"; 2)
Gen_CUCreate("09002440"; 4)
Gen_CUCreate("09002440"; 5)
Gen_CUCreate("09002440"; 6)
Gen_CUCreate("09002440"; 7)
Gen_CUCreate("09002440"; 8)
Gen_CUCreate("09002440"; 9)
Gen_CUCreate("09002440"; 10)
Gen_CUCreate("09002440"; 11)
Gen_CUCreate("09002440"; 12)

MESSAGE:C88(Char:C90(13)+"      Completed")
States_Create("50"; "Completed"; 24; "02450"; "COMPLETED ORDER"; "Comp")
Gen_CUCreate("09002450"; 9)
Gen_CUCreate("09002450"; 12)

MESSAGE:C88(Char:C90(13)+"      Cancelled")
States_Create("60"; "Cancelled"; 24; "02460"; "CANCELLED ORDER"; "Canc")
QUERY:C277([ORDERS:24]; [ORDERS:24]State:15="1")
Gen_AppToSel(->[ORDERS:24]; ->[ORDERS:24]State:15; "02460")
Gen_CUCreate("09002460"; 9)
Gen_CUCreate("09002460"; 12)

MESSAGE:C88(Char:C90(13)+"      Lost Order")
States_Create("70"; "Lost"; 24; "02470"; "LOST ORDER"; "Lost")
QUERY:C277([ORDERS:24]; [ORDERS:24]State:15="-4")
Gen_AppToSel(->[ORDERS:24]; ->[ORDERS:24]State:15; "02470")

READ ONLY:C145([TABLE_RECORD_STATES:90])
READ ONLY:C145([CODE_USES:91])
READ ONLY:C145([ORDERS:24])
UNLOAD RECORD:C212([TABLE_RECORD_STATES:90])
UNLOAD RECORD:C212([CODE_USES:91])
UNLOAD RECORD:C212([ORDERS:24])
ERR_MethodTrackerReturn("User_Vers37101B"; $_t_oldMethodName)