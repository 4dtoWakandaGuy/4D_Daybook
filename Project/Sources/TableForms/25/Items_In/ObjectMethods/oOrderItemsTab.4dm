If (False:C215)
	//object Name: [ORDER_ITEMS]Items_in.oOrderItemsTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/08/2012 23:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(ORDI_aptr_ListBoxPointers;0)
	//ARRAY TEXT(OI_at_OrderItemTabs;0)
	//ARRAY TEXT(ORDI_at_ViewTabsLabels;0)
	C_LONGINT:C283(<>OrdI_l_OpenonPage; <>ordi_l_TabLabel; ORDI_l_LBLevel)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_TEXT:C284($_t_oldMethodName; $_t_SubEntityName; vButtDisOI)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].Items_in.oOrderItemsTab"; Form event code:C388)
//If (OI_at_OrderItemTabs#Current form page)
Case of 
	: (OI_at_OrderItemTabs=2)
		<>OrdI_l_OpenonPage:=2
		FORM GOTO PAGE:C247(2)
		GOTO OBJECT:C206([ORDER_ITEMS:25]Required_Date:10)
		If (Size of array:C274(ORDI_aptr_ListBoxPointers)>=9)
			$_ptr_ArrayReferences:=ORDI_aptr_ListBoxPointers{9}
			If (Size of array:C274($_ptr_ArrayReferences->)>=10)
				$_t_SubEntityName:=$_ptr_ArrayReferences->{10}
				If (FORM Get current page:C276>2)
					In_ButtChkDis(->vButtDisOI; "Order Item"; $_t_SubEntityName)
				Else 
					In_ButtChkDis(->vButtDisOI; "Order Item")
				End if 
			End if 
		End if 
	: (OI_at_OrderItemTabs=1)
		<>OrdI_l_OpenonPage:=1
		FORM GOTO PAGE:C247(1)
		GOTO OBJECT:C206([ORDER_ITEMS:25]Product_Name:13)
		HIGHLIGHT TEXT:C210([ORDER_ITEMS:25]Product_Name:13; 32000; 32000)
		If (Size of array:C274(ORDI_aptr_ListBoxPointers)>=9)
			$_ptr_ArrayReferences:=ORDI_aptr_ListBoxPointers{9}
			If (Size of array:C274($_ptr_ArrayReferences->)>=10)
				$_t_SubEntityName:=$_ptr_ArrayReferences->{10}
				If (FORM Get current page:C276>2)
					In_ButtChkDis(->vButtDisOI; "Order Item"; $_t_SubEntityName)
				Else 
					In_ButtChkDis(->vButtDisOI; "Order Item")
				End if 
			End if 
		End if 
	: (OI_at_OrderItemTabs>2)
		<>OrdI_l_OpenonPage:=3
		<>ordi_l_TabLabel:=OI_at_OrderItemTabs-2
		FORM GOTO PAGE:C247(3)
		ORDI_at_ViewTabsLabels:=OI_at_OrderItemTabs-2
		LBi_RemoveAll(->ORDI_aptr_ListBoxPointers)
		ARRAY POINTER:C280(ORDI_aptr_ListBoxPointers; 0)
		ORDI_LoadSubArea(ORDI_l_LBLevel)  //the first window
End case 
If (Size of array:C274(ORDI_aptr_ListBoxPointers)>=9)
	$_ptr_ArrayReferences:=ORDI_aptr_ListBoxPointers{9}
	If (Size of array:C274($_ptr_ArrayReferences->)>=10)
		$_t_SubEntityName:=$_ptr_ArrayReferences->{10}
		If (OI_at_OrderItemTabs>2)
			If (False:C215)  //if and when we make items removable then we can enable this
				In_ButtChkDis(->vButtDisOI; "Order Item"; $_t_SubEntityName)
			Else 
				In_ButtChkDis(->vButtDisOI; "Order Item")
			End if 
		Else 
			In_ButtChkDis(->vButtDisOI; "Order Item")
		End if 
	End if 
End if 


//End if
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].Items_in.oOrderItemsTab"; $_t_oldMethodName)
