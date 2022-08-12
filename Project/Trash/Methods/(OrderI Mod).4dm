//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 14:54
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_AutoSearch)
	C_LONGINT:C283(vOrdI)
	C_TEXT:C284($_t_oldMethodName; $_t_RecordCode; $1; $2; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI Mod")
//Order Items Mod
Start_Process
OrderI_File
FORM SET OUTPUT:C54([ORDER_ITEMS:25]; "Items OutPrint")
WIN_t_CurrentOutputform:="Items OutPrint"
While (vOrdI=1)
	If (Count parameters:C259>=2)
		$_bo_AutoSearch:=($2="TRUE")
		$_t_RecordCode:=$1
		OrderI_Sel($_t_RecordCode; $_bo_AutoSearch)
		
	Else 
		
		OrderI_Sel
	End if 
	Gen_ModMidAster("View Order Items"; "Master"; ->[ORDER_ITEMS:25]; ->vOrdI; "Order Items"; "")
End while 
Orders_Unload
Process_End
ERR_MethodTrackerReturn("OrderI Mod"; $_t_oldMethodName)