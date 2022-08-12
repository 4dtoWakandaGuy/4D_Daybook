//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders PPDel3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 20:58
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StockPostOr)
	C_LONGINT:C283($_l_RecordsinSelection)
	C_TEXT:C284($_t_oldMethodName; vProdCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders PPDel3")
If ((DB_GetModuleSettingByNUM(Module_StockControl)>0) & (<>StockPostOr))
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
	If (([MOVEMENT_TYPES:60]Serial_Forcing:16) | ([MOVEMENT_TYPES:60]Serial_Warning:15))
		$_l_RecordsinSelection:=Records in selection:C76([ORDER_ITEMS:25])
		COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Sel")
		QUERY SELECTION BY FORMULA:C207([ORDER_ITEMS:25]; Orders_PPDelSel)
		If ($_l_RecordsinSelection#Records in selection:C76([ORDER_ITEMS:25]))
			If ([MOVEMENT_TYPES:60]Serial_Forcing:16)
				Gen_Alert("Order Items for "+vProdCode+" must be allocated a Serial Number"; "Cancel")
				OK:=0
			Else 
				Gen_Confirm("Warning: Order Items for "+vProdCode+"  should be allocated Serial Numbers"; "Continue"; "Cancel")
				If (OK=1)
					USE NAMED SELECTION:C332("$Sel")
				End if 
			End if 
		End if 
		CLEAR NAMED SELECTION:C333("$Sel")
	End if 
End if 
//If (OK=1)
//vNumber:=Gen_CodePref (13)
// vDelDate:=[ORDER ITEMS]Delivery Date
// vDate:=[ORDER ITEMS]Invoice Date
//  If (vDelDate=!00/00/00!)
//  vDelDate:=◊CDate
//  End if
//End if
ERR_MethodTrackerReturn("Orders PPDel3"; $_t_oldMethodName)
