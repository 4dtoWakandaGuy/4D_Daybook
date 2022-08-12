If (False:C215)
	//object Name: [PURCHASE_ORDERS]Purch_Ord_In13OLD.Variable17
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2009 20:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PO_al_Mode;0)
	//ARRAY LONGINT(PO_al_ViewTabsSettings;0)
	//ARRAY POINTER(POI_aptr_LBSetup;0)
	//ARRAY TEXT(PO_at_ModePO;0)
	//ARRAY TEXT(PO_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_Reload; $_bo_Switch)
	C_LONGINT:C283(SD_l_CurrentTable)
	C_PICTURE:C286(PO_pic_EditMode)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_ORDERS].PurchaseOrder_In.Variable17"; Form event code:C388)
$_bo_Reload:=(PO_al_Mode{PO_at_ModePO}=3)
$_bo_Switch:=True:C214
If (PO_al_ViewTabsSettings{PO_at_ViewTabsLabels}=3)
	$_bo_Switch:=False:C215
Else 
	If ([PURCHASE_ORDERS:57]Posted_Date:13#!00-00-00!)
		$_bo_Switch:=False:C215
	End if 
End if 
SD_l_CurrentTable:=Table:C252(->[PURCHASE_ORDERS:57])
LBi_EditListLay(->POI_aptr_LBSetup; ->PO_at_ModePO; ->PO_pic_EditMode; ->PO_al_Mode; $_bo_Switch)

If (OK=1) & ($_bo_Reload)
	QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
	
	PO_at_ModePO:=0
	LBi_RemoveAll(->POI_aptr_LBSetup)  // I have modified this to reload the arrays because its easier
	ARRAY POINTER:C280(POI_aptr_LBSetup; 0)
	PurchOrd_InLPß("P1")
	
End if 
//LBi_EditListLay (->POI_aptr_LBSetup)` NG 4.8.2006 not sure why this was here
ERR_MethodTrackerReturn("OBJ:Purch Ord In13,PO_at_ModePO"; $_t_oldMethodName)
