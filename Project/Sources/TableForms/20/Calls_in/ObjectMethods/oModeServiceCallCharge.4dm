If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.oModeServiceCallCharge
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SC_al_ModeCharge;0)
	//ARRAY POINTER(SVS_aPtr_OrderItemsSetup;0)
	//ARRAY TEXT(SC_at_ModeCharge;0)
	C_LONGINT:C283($_l_ChargeMode)
	C_PICTURE:C286(SC_pic_LBMode)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.oModeServiceCallCharge"; Form event code:C388)
$_l_ChargeMode:=SC_al_ModeCharge{SC_at_ModeCharge}
LBi_EditListLay(->SVS_aPtr_OrderItemsSetup; ->SC_at_ModeCharge; ->SC_pic_LBMode; ->SC_al_ModeCharge; True:C214)
If ($_l_ChargeMode=3)
	If (OK=1)
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[SERVICE_CALLS:20]Call_Code:4)
		SC_LoadCharges
		
		//remember to issue a save before a search if not this proc
		LBi_EditListUpd(->SVS_aPtr_OrderItemsSetup; ->SC_at_ModeCharge; ->SC_pic_LBMode)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.oModeServiceCallCharge"; $_t_oldMethodName)
