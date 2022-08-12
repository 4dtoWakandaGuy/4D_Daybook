If (False:C215)
	//object Name: [PURCHASE_INVOICES]Purchases_in.Variable15
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 10:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PI_al_ViewTabsSettings;0)
	//ARRAY LONGINT(PUR_al_ItemsMode;0)
	//ARRAY POINTER(PUR_aPtr_LBItemsSetup;0)
	//ARRAY TEXT(PI_at_ViewTabsLabels;0)
	//ARRAY TEXT(PUR_at_ItemMode;0)
	C_BOOLEAN:C305($_bo_Switch; $_bo_Update)
	C_PICTURE:C286(PI_pic_EditMode)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES].Purchases_in.Variable15"; Form event code:C388)
$_bo_Update:=(PUR_al_ItemsMode{PUR_at_ItemMode}=3)
$_bo_Switch:=True:C214

If (PUR_al_ItemsMode{PUR_at_ItemMode}=-1)  //setting is no edit and would change to edit- so if current view is no edit don't switch
	Case of 
		: (PI_al_ViewTabsSettings{PI_at_ViewTabsLabels}=3)
			$_bo_Switch:=False:C215
		Else 
			$_bo_Switch:=True:C214
	End case 
End if 
If ([PURCHASE_INVOICES:37]State:24>=1) | ([PURCHASE_INVOICES:37]Posted_Date:12#!00-00-00!)
	If (PUR_al_ItemsMode{PUR_at_ItemMode}=2)
		PUR_al_ItemsMode{PUR_at_ItemMode}:=-1
	End if 
End if 
LBi_EditListLay(->PUR_aPtr_LBItemsSetup; ->PUR_at_ItemMode; ->PI_pic_EditMode; ->PUR_al_ItemsMode; $_bo_Switch)

If (OK=1) & ($_bo_Update)
	QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
	
	LBi_RemoveAll(->PUR_aPtr_LBItemsSetup)
	ARRAY POINTER:C280(PUR_aPtr_LBItemsSetup; 0)
	Purch_InLPß("P1")
End if 
ERR_MethodTrackerReturn("OBJ [PURCHASE_INVOICES].Purchases_in.Variable15"; $_t_oldMethodName)
