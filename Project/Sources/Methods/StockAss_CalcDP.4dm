//%attributes = {}
If (False:C215)
	//Project Method Name:      StockAss_CalcDP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2010 16:55
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(r1; r2; s1; s2)
	C_TEXT:C284(<>ProdCode; $_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss_CalcDP")
Start_Process
QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Assembly_Type:23=True:C214)
If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
	CREATE RECORD:C68([STOCK_MOVEMENTS:40])
	[STOCK_MOVEMENTS:40]Movement_Type:6:=[MOVEMENT_TYPES:60]Type_Code:1
	Move_InLPBDef
	Move_InType
	CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
	If (Count parameters:C259>=1)
		[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=$1
	Else 
		[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=<>ProdCode
	End if 
	[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=1
	[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=10
	s1:=0
	s2:=0
	r1:=0
	r2:=0
	StockAss_CalcD
Else 
	Gen_Alert("No Movement Type has been specified as being used for Assemblies"; "Cancel")
End if 
Process_End
ERR_MethodTrackerReturn("StockAss_CalcDP"; $_t_oldMethodName)
