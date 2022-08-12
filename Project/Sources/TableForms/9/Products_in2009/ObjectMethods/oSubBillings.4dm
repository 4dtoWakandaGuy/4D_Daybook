If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.oSubBillings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRD_LB_ProdComponents;0)
	//ARRAY BOOLEAN(PROD_lb_SubsBillings;0)
	//ARRAY LONGINT(PRD_al_SubsBillingID;0)
	C_BOOLEAN:C305(vFromIn)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ColumnNumber; $_l_event; $_l_Row; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; MOD_l_CurrentModuleAccess; SUBS_l_PageNumber)
	C_TEXT:C284($_t_CurrentInputForm; $_t_oldMethodName; $_t_Reference; $_t_WinCurrentInputForm; $_t_WIndowName; $_t_WindowTitle)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.oSubBillings"; Form event code:C388)
$_l_event:=Form event code:C388
LISTBOX GET CELL POSITION:C971(PRD_LB_ProdComponents; $_l_ColumnNumber; $_l_Row)

Case of 
		
	: ($_l_event=On Header Click:K2:40)
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
		
	: ($_l_event=On Clicked:K2:4)
		
	: ($_l_event=On Double Clicked:K2:5)
		If (PROD_lb_SubsBillings>0)
			SUBS_l_PageNumber:=1
			//$MenuReference:=
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_Subscriptions)
			READ WRITE:C146([SUBSCRIPTIONS:93])
			QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]x_ID:11=PRD_al_SubsBillingID{PROD_lb_SubsBillings})
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			$_t_WindowTitle:=Get window title:C450
			FORM SET INPUT:C55([SUBSCRIPTIONS:93]; "Subs_In")
			
			$_t_WinCurrentInputForm:="Subs_In"
			Open_Pro_Window(Get localized string:C991("MenuItem_Enter")+" "+"Subscription"; 0; 2; ->[SUBSCRIPTIONS:93]; $_t_CurrentInputForm)
			vFromIn:=False:C215
			$_t_WIndowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Subscription")
			$_t_WIndowName:=Term_StoWT($_t_WIndowName)
			SET WINDOW TITLE:C213($_t_WIndowName+" "+"Billing "+[SUBSCRIPTIONS:93]Product_Name:2)
			MODIFY RECORD:C57([SUBSCRIPTIONS:93]; *)
			$_t_Reference:="Subscriptions"+"_"+$_t_WinCurrentInputForm
			Close_ProWin($_t_Reference)
			INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_Reference)
			UNLOAD RECORD:C212([SUBSCRIPTIONS:93])
			READ ONLY:C145([SUBSCRIPTIONS:93])
			SET WINDOW TITLE:C213($_t_WindowTitle)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_SetInputFormMenu(Table:C252(->[PRODUCTS:9]); "Products_in2009")
			
		End if 
		
	: ($_l_event=On Data Change:K2:15)
		
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.oSubBillings"; $_t_oldMethodName)
