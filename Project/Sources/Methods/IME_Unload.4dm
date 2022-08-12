//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_Unload
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

$_t_oldMethodName:=ERR_MethodTracker("IME_Unload")
UNLOAD RECORD:C212([PRODUCTS:9])
UNLOAD RECORD:C212([CONTACTS:1])
UNLOAD RECORD:C212([COMPANIES:2])
UNLOAD RECORD:C212([ORDERS:24])
UNLOAD RECORD:C212([ORDER_ITEMS:25])
UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
ERR_MethodTrackerReturn("IME_Unload"; $_t_oldMethodName)