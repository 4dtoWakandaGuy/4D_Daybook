//%attributes = {}
If (False:C215)
	//Project Method Name:      User_DetSilvOff
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
	C_BOOLEAN:C305(<>SYS_bo_CapitaliseTown; <>SYS_bo_RestrictCompanies; <>SYS_bo_CopyPreviousDate; <>SYS_bo_DefaultsCallback; <>SYS_bo_DefaultEntry; <>SYS_bo_DefaultsFind; <>SYS_bo_DefaultSales; <>SYS_bo_DefaultSource; <>FindMy; <>OneEntry; <>DB_bo_FunctionOrder)
	C_BOOLEAN:C305(<>SalesOrder; <>StandMA; <>ViewLists)
	C_LONGINT:C283(<>SYS_l_AutoCapitalization; <>PalDelay; <>PER_l_ProcessWaiting; <>Repeat)
	C_TEXT:C284(<>SYS_t_AccessType; <>ClientStat; <>ContClStat; <>ContEnqStat; <>EnqStat; <>GenPrice; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_DetSilvOff")
<>Repeat:=15
<>PER_l_ProcessWaiting:=2
<>ViewLists:=False:C215
<>SYS_bo_CopyPreviousDate:=False:C215
<>PalDelay:=0
<>DB_bo_FunctionOrder:=False:C215
<>OneEntry:=True:C214
<>SYS_bo_DefaultEntry:=True:C214
<>SYS_bo_DefaultsFind:=True:C214
<>FindMy:=False:C215
<>SYS_t_AccessType:=""
<>SYS_bo_DefaultsCallback:=False:C215
<>SYS_l_AutoCapitalization:=0
<>SYS_bo_CapitaliseTown:=False:C215
<>SYS_bo_RestrictCompanies:=False:C215
<>SYS_bo_DefaultSales:=True:C214
<>SYS_bo_DefaultSource:=False:C215
<>SalesOrder:=False:C215
<>StandMA:=False:C215
<>EnqStat:=""
<>ContEnqStat:=""
<>ClientStat:=""
<>ContClStat:=""
<>GenPrice:=""
//<>ProdGrpBrd:=False
ERR_MethodTrackerReturn("User_DetSilvOff"; $_t_oldMethodName)