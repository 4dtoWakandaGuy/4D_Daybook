//%attributes = {}
If (False:C215)
	//Project Method Name:      ZOrders_InE
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
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZOrders_InE")
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
	ZProc("Orders_InE"; DB_ProcessMemoryinit(3); "Enter "+<>SYS_at_RecStateNames{24}{1})
Else 
	ZProc("Orders_InE"; DB_ProcessMemoryinit(3); Term_OrdWT("Enter Enquiries"))
End if 
//Copied to Functions Palette
ERR_MethodTrackerReturn("ZOrders_InE"; $_t_oldMethodName)
