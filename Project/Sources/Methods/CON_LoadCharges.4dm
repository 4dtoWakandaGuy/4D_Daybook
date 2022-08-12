//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_LoadCharges
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/12/2009 07:27`Method: CON_LoadCharges
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(vALLevels)
	//C_UNKNOWN(vOR)
	//ARRAY BOOLEAN(SVS_lb_ItemsSetup;0)
	//ARRAY LONGINT(CON_al_EditMode;0)
	//ARRAY POINTER(ORD_aPtr_OrderItemsSetup;0)
	//ARRAY POINTER(SVS_aptr_ListboxSetup;0)
	//ARRAY POINTER(SVS_aPtr_OrderItemsSetup;0)
	//ARRAY TEXT(CON_at_EditMode;0)
	C_BOOLEAN:C305($1; $_bo_NewLevel; $1)
	C_LONGINT:C283(vALLevels; vOR; $_l_ReuseLevel)
	C_PICTURE:C286(CON_pic_ModePict)
	C_REAL:C285($2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_LoadCharges")


If (vOR=0)
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Contract_Code:29=[CONTRACTS:17]Contract_Code:3)
	[CONTRACTS:17]Contract_Cost:7:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Contract_Cost:30)); 2; 2)
Else 
	REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
	
End if 
//AL_RemoveArrays (SC_PowerviewCHAR;1;256)
ARRAY POINTER:C280(SVS_aptr_ListboxSetup; 0)

If (Count parameters:C259>=2)
	$_bo_NewLevel:=$1
	$_l_ReuseLevel:=$2
Else 
	If (Size of array:C274(SVS_aptr_ListboxSetup)=0) & (vALLevels>0)
		$_bo_NewLevel:=True:C214
	Else 
		$_bo_NewLevel:=False:C215
	End if 
End if 
If (Size of array:C274(SVS_aptr_ListboxSetup)=0)
	//see also Contacts_InLPß
	LBi_ArrDefFill(->SVS_aptr_ListboxSetup; ->SVS_lb_ItemsSetup; ->[ORDER_ITEMS:25]Item_Number:27; ->[CONTRACTS:17]Contract_Code:3; "411111126"; "Items_in"; 9; "Products"; "Product"; ""; $_bo_NewLevel; $_l_ReuseLevel)
	
	LBI_InsertArr(->SVS_aptr_ListboxSetup; ->SVS_lb_ItemsSetup; 0; ->[ORDER_ITEMS:25]Order_Code:1; 0)
Else 
	OK:=1
	LBi_Prefs11(->SVS_aptr_ListboxSetup)
End if 
LBi_LoadSetup(->SVS_aptr_ListboxSetup; "B"; 3)

CON_at_EditMode:=1
CON_al_EditMode:=1

LBi_EditListLay(->SVS_aptr_ListboxSetup; ->CON_at_EditMode; ->CON_pic_ModePict; ->CON_al_EditMode)
ERR_MethodTrackerReturn("CON_LoadCharges"; $_t_oldMethodName)
