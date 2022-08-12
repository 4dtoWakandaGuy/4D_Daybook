//%attributes = {}
If (False:C215)
	//Project Method Name:      JST_LoadOrderItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/12/2009 07:27`Method: JST_LoadOrderItems
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(JST_LB_ChargeItems;0)
	//ARRAY POINTER(JST_aPtr_OrderItemsSetup;0)
	C_BOOLEAN:C305($_bo_Load; $_bo_NewLevel; DB_bo_NoLoad)
	C_LONGINT:C283($_l_Event; vALLevels)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JST_LoadOrderItems")
//NG This method will load the CURRENT order items into an area list area.
//April 2004

If (Size of array:C274(JST_aPtr_OrderItemsSetup)=0) & (vALLevels>0)
	$_bo_NewLevel:=True:C214
Else 
	$_bo_NewLevel:=False:C215
End if 
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		If (Size of array:C274(JST_aPtr_OrderItemsSetup)=0)
			$_bo_Load:=True:C214
			//see also Contacts_InLPß
			//JST_LB_ChargeItems
			LBi_ArrDefFill(->JST_aPtr_OrderItemsSetup; ->JST_LB_ChargeItems; ->[ORDER_ITEMS:25]Item_Number:27; ->[JOB_STAGES:47]Job_Stage_code:52; "411111126"; "Items_in"; 10; "Order Items"; "Order Item"; ""; $_bo_NewLevel)
			
		Else 
			OK:=1
			LBi_Prefs11(->JST_aPtr_OrderItemsSetup)
		End if 
		
		Case of 
			: ($_l_Event=On Load:K2:1)
				
				
				LBi_LoadSetup(->JST_aPtr_OrderItemsSetup; "B")
			Else 
				//Eh not in all cases
				
				LBi_LoadSetup(->JST_aPtr_OrderItemsSetup; "P")
		End case 
		
	Else 
		LBi_ArrDefFill(->JST_aPtr_OrderItemsSetup; ->JST_LB_ChargeItems; ->[ORDER_ITEMS:25]Item_Number:27; ->[JOB_STAGES:47]Job_Stage_code:52; "411111126"; "Items_in"; 10; "Order Items"; "Order Item"; ""; True:C214)
		LBi_LoadSetup(->JST_aPtr_OrderItemsSetup; "P")
End case 
ERR_MethodTrackerReturn("JST_LoadOrderItems"; $_t_oldMethodName)