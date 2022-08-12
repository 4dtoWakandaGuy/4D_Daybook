If (False:C215)
	//object Name: [CURRENT_STOCK]StockCurr_Alloc.Popup Drop down List1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/04/2010 13:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(STK_at_AllStockTypes;0)
	C_TEXT:C284($_t_oldMethodName; $_t_Status; vStatus; vTitle)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CURRENT_STOCK].StockCurr_Alloc.Popup Drop down List1"; Form event code:C388)

If (STK_at_AllStockTypes>0)
	$_t_Status:=vStatus
	vStatus:=STK_at_AllStockTypes{STK_at_AllStockTypes}
	If (vStatus#$_t_Status)
		CUT NAMED SELECTION:C334([CURRENT_STOCK:62]; "$Selection")
		OrderI_AllStSrc
		If (Records in selection:C76([CURRENT_STOCK:62])>0)
			vTitle:=Uppercase:C13(Term_StoWT("CURRENT STOCK:  "+vStatus))
			CLEAR NAMED SELECTION:C333("$Selection")
		Else 
			vStatus:=$_t_Status
			USE NAMED SELECTION:C332("$Selection")
			Gen_Alert(Term_StoWT("No Current Stock found - the selection is unchanged"); "")
		End if 
	End if 
End if 
If (vStatus#STK_at_AllStockTypes{STK_at_AllStockTypes})
	STK_at_AllStockTypes:=Find in array:C230(STK_at_AllStockTypes; vStatus)
	vTitle:=Uppercase:C13(Term_StoWT("CURRENT STOCK:  "+vStatus))
End if 
QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Type_Code:1=vStatus)
If ([STOCK_TYPES:59]Allocation_Allowed:8=False:C215)
	Gen_Alert(Term_StoWT("NB: Stock of this Type cannot be Allocated"))
End if 
ERR_MethodTrackerReturn("OBJ [CURRENT_STOCK].StockCurr_Alloc.Popup Drop down List1"; $_t_oldMethodName)
