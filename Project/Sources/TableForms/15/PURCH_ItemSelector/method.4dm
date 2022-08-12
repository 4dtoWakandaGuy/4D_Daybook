If (False:C215)
	//Table Form Method Name: [USER]PURCH_ItemSelector
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/10/2010 18:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PI_abo_CopyItem;0)
	//ARRAY BOOLEAN(PI_abo_MarkItem;0)
	//ARRAY BOOLEAN(PO_lb_COPYITEMS;0)
	//ARRAY LONGINT(PI_al_dCopyItem;0)
	//ARRAY LONGINT(PI_al_DisplayItem;0)
	//ARRAY LONGINT(PI_al_dMarkItem;0)
	//ARRAY REAL(PI_ar_dProductQTY;0)
	//ARRAY TEXT(PI_at_DProductCode;0)
	//ARRAY TEXT(PI_at_dProductDes;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_SizeofArray; PO_l_BUT1; PO_l_But2; PO_l_BUT3; PO_l_BUT4; PO_l_BUT5; PO_l_BUT6; PO_l_BUT7; PO_l_BUT8; PO_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; PO_t_COL1; PO_t_COL2; PO_t_COL3; PO_t_COL4; PO_t_COL5; PO_t_COL6; PO_t_COL7; PO_t_COL8; PO_t_COL9; PO_t_HED1)
	C_TEXT:C284(PO_t_HED2; PO_t_HED3; PO_t_HED4; PO_t_HED5; PO_t_HED6; PO_t_HED7; PO_t_HED8; PO_t_HED9)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].PURCH_ItemSelector"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "PURCH_ItemSelector")
		
		WS_AutoscreenSize(3; 300; 500)
		INT_SetDialog
		
		
		ARRAY BOOLEAN:C223(PI_abo_CopyItem; 0)
		ARRAY BOOLEAN:C223(PI_abo_MarkItem; 0)
		$_l_SizeofArray:=Size of array:C274(PI_at_DProductCode)
		
		ARRAY BOOLEAN:C223(PI_abo_CopyItem; $_l_SizeofArray)
		ARRAY BOOLEAN:C223(PI_abo_MarkItem; $_l_SizeofArray)
		INT_SetLongintCheckFormat(->PI_al_dCopyItem)
		INT_SetLongintCheckFormat(->PI_al_dMarkItem)
		
		LB_SetupListbox(->PO_lb_COPYITEMS; "PO_t"; "PO_L"; 1; ->PI_at_DProductCode; ->PI_at_dProductDes; ->PI_ar_dProductQTY; ->PI_abo_CopyItem; ->PI_abo_MarkItem; ->PI_al_dCopyItem; ->PI_al_dMarkItem; ->PI_al_DisplayItem)
		//Get localized string("FieldLabels_loadQuery")
		LB_SetColumnHeaders(->PO_lb_COPYITEMS; "PO_L"; 1; "Product Code"; "Product Name"; "Quantity"; "Copy"; "Received"; ""; ""; "Item no")
		
		LB_SetEnterable(->PO_lb_COPYITEMS; False:C215; 0)
		LB_SetEnterable(->PO_lb_COPYITEMS; True:C214; 4)
		LB_SetEnterable(->PO_lb_COPYITEMS; True:C214; 5)
		LB_SetColumnWidths(->PO_lb_COPYITEMS; "PO_t"; 1; 147; 187; 55; 20; 20; 0; 0; 0)
		
		LB_SetScroll(->PO_lb_COPYITEMS; -2; -2)
		LB_StyleSettings(->PO_lb_COPYITEMS; "Black"; 9; "PO_t"; ->[PURCHASE_INVOICES:37])
		
End case 
ERR_MethodTrackerReturn("FM [USER].PURCH_ItemSelector"; $_t_oldMethodName)
