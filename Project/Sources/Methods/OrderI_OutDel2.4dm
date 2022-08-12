//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_OutDel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 20:42
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

$_t_oldMethodName:=ERR_MethodTracker("OrderI_OutDel2")
Are_You_Sure
If (OK=1)
	CREATE SET:C116([ORDER_ITEMS:25]; "Master")
	USE SET:C118("Userset")
	FIRST RECORD:C50([ORDER_ITEMS:25])
	While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
		If ([ORDER_ITEMS:25]Item_Locked:16)
			//Gen_Alert ("You cannot delete Item Number";"Cancel")
		Else 
			If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>0)
				If ([ORDER_ITEMS:25]Item_Number:27>0)
					QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
					DELETE SELECTION:C66([SUBSCRIPTIONS:93])
				End if 
			End if 
			
		End if 
		NEXT RECORD:C51([ORDER_ITEMS:25])
	End while 
	DELETE SELECTION:C66([ORDER_ITEMS:25])
End if 
ERR_MethodTrackerReturn("OrderI_OutDel2"; $_t_oldMethodName)
