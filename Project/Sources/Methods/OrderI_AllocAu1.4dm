//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_AllocAu1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2010 00:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>STK_bo_AllocationLog; $_bo_AllocCLog; $0)
	C_TEXT:C284(<>STK_T_AllocLog; $_t_oldMethodName; vStatus)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_AllocAu1")
//OrderI_AllocAu1
$_bo_AllocCLog:=(STK_bo_AllocCLog) | (<>STK_bo_AllocationLog)

$0:=False:C215
If ((DB_GetModuleSettingByNUM(Module_StockControl)=2) | (DB_GetModuleSettingByNUM(Module_StockControl)=4))
	If ($_bo_AllocCLog)
		<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Check_Module Access:="+String:C10(Current time:C178)
		
	End if 
	
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
	If ((Records in selection:C76([MOVEMENT_TYPES:60])>0) & ([MOVEMENT_TYPES:60]Stock_Plus:3#""))
		vStatus:=[MOVEMENT_TYPES:60]Stock_Plus:3
		QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Type_Code:1=vStatus)
		If ([STOCK_TYPES:59]Allocated:6)
			$0:=True:C214
		Else 
			Gen_Alert("Stock Type "+vStatus+", as defined for the Allocation Movement,"+" is not itself defined as 'Included in Order Items allocated total'"; "Cancel")
		End if 
	Else 
		Gen_Alert("No Movement Type has been defined for Allocation"; "Cancel")
	End if 
Else 
	Gen_Alert("You do not have access to allocate Stock Items"; "Try again")
End if 
ERR_MethodTrackerReturn("OrderI_AllocAu1"; $_t_oldMethodName)
