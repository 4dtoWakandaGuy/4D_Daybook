//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZOrders_InQ
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
	//Array Text(<>SYS_at_RecStateNames;0)
	//Array Text(<>SYS_at_RecStateCodes;0)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZOrders_InQ")
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
	ZProc("Orders_InQ"; DB_ProcessMemoryinit(3); "Enter "+<>SYS_at_RecStateNames{24}{2})
Else 
	ZProc("Orders_InQ"; DB_ProcessMemoryinit(3); Term_OrdWT("Enter Quotations"))
End if 
ERR_MethodTrackerReturn("ZOrders_InQ"; $_t_oldMethodName)