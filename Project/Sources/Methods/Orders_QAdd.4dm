//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_QAdd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2012 09:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY REAL(ORD_ar_QuickAddQuantity;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdCode;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdName;0)
	//ARRAY TEXT(ORD_AT_QuickAddSerialNo;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; ORD_bo_QuickAddMode)
	C_LONGINT:C283($_l_Index; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_SizeofArray; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; vAB)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_QAdd")
//Orders QuickAdd

If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
	If (Not:C34(ORD_bo_QuickAddMode))
		//NG April 2004 Removed ◊ScreenG
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		OBJECT GET COORDINATES:C663(*; "oListBoxOrderitems1"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		QuickAdd_Start($_l_ObjectLeft+$_l_WindowLeft; $_l_WindowTop+$_l_ObjectTop; $_l_ObjectLeft+$_l_WindowLeft+550; $_l_WindowTop+$_l_ObjectBottom)
		If (False:C215)
			If (OK=1)
				$_l_SizeofArray:=Size of array:C274(ORD_AT_QuickAddProdCode)
				For ($_l_Index; 1; $_l_SizeofArray)
					If (((ORD_AT_QuickAddProdCode{$_l_Index}#"") | (ORD_AT_QuickAddProdName{$_l_Index}#"")) & (ORD_ar_QuickAddQuantity{$_l_Index}#0))
						CREATE RECORD:C68([ORDER_ITEMS:25])
						OrderI_SubLPB
						[ORDER_ITEMS:25]Quantity:3:=ORD_ar_QuickAddQuantity{$_l_Index}
						[ORDER_ITEMS:25]Product_Code:2:=ORD_AT_QuickAddProdCode{$_l_Index}
						RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
						OrderI_SubLPPC
						[ORDER_ITEMS:25]Product_Name:13:=ORD_AT_QuickAddProdName{$_l_Index}
						[ORDER_ITEMS:25]Serial_Number:24:=ORD_AT_QuickAddSerialNo{$_l_Index}
						DB_SaveRecord(->[ORDER_ITEMS:25])
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
					End if 
				End for 
				Orders_InLPOI(vAB)
				Orders_InLPß("S1")
				DB_bo_RecordModified:=True:C214
			End if 
			QuickAdd_Arr(0)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("Orders_QAdd"; $_t_oldMethodName)
