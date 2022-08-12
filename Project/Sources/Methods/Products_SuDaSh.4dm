//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_SuDaSh
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/10/2010 10:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OrderItemNumber; $_l_SelectedMenu)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName; vButtDisPro)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_SuDaSh")
//Products Subs Dates Show
If (Modified record:C314([SUBSCRIPTIONS:93]))
	DB_SaveRecord(->[SUBSCRIPTIONS:93])
	AA_CheckFileUnlocked(->[SUBSCRIPTIONS:93]x_ID:11)
End if 
$_l_SelectedMenu:=0
$_t_MenuItemParameter:=Get selected menu item parameter:C1005
If ($_t_MenuItemParameter="")
	$_l_SelectedMenu:=Sel_LPmi("Products_SuDaSh")
End if 
If (vButtDisPro="IP@")
	$_l_OrderItemNumber:=0
Else 
	$_l_OrderItemNumber:=[ORDER_ITEMS:25]Item_Number:27
End if 
Case of 
	: ($_l_SelectedMenu=3) | ($_t_MenuItemParameter="AllItems")
		
		QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
		QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=$_l_OrderItemNumber)
	: ($_l_SelectedMenu=4) | ($_t_MenuItemParameter="Issues")
		QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
		QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=$_l_OrderItemNumber; *)
		QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7="ISS")
	: ($_l_SelectedMenu=5) | ($_t_MenuItemParameter="Renewals")
		QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
		QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=$_l_OrderItemNumber; *)
		QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7="REN")
	: ($_l_SelectedMenu=6) | ($_t_MenuItemParameter="Billing")
		QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
		QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=$_l_OrderItemNumber; *)
		QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7="B@")
End case 
ERR_MethodTrackerReturn("Products_SuDaSh"; $_t_oldMethodName)