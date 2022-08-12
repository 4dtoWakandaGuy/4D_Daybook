If (False:C215)
	//Table Form Method Name: [CONTACTS]QV_ITEMSSELECTOR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/10/2012 09:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(QV_lb_SelectItems;0)
	//ARRAY INTEGER(QV_ai_Tick;0)
	//ARRAY TEXT(QV_at_List;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; QV_ListSelected)
	C_LONGINT:C283($_l_event; QV_l_BUT1; QV_l_But2; QV_l_BUT3; QV_l_BUT4; QV_l_BUT5; QV_l_BUT6; QV_l_BUT7; QV_l_BUT8; QV_l_BUT9; QV_l_SelectType)
	C_TEXT:C284($_t_oldMethodName; QV_SelectText; QV_t_COL1; QV_t_COL2; QV_t_COL3; QV_t_COL4; QV_t_COL5; QV_t_COL6; QV_t_COL7; QV_t_COL8; QV_t_COL9)
	C_TEXT:C284(QV_t_EnteredItem; QV_t_HED1; QV_t_HED2; QV_t_HED3; QV_t_HED4; QV_t_HED5; QV_t_HED6; QV_t_HED7; QV_t_HED8; QV_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS].QV_ITEMSSELECTOR"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[CONTACTS:1]); "QV_ITEMSSELECTOR")
		
		Case of 
			: (QV_l_SelectType=1)
				QV_SelectText:=QV_t_EnteredItem+" exists in more than one group"+" Select the group(s) you wish to query"
			: (QV_l_SelectType=2)
				QV_SelectText:=QV_t_EnteredItem+" is an unknown group"+" Select the group you wish to query"
			: (QV_l_SelectType=3)
				QV_SelectText:=QV_t_EnteredItem+" is an unknown ITEM"+" Select the item you wish to query"
			: (QV_l_SelectType=4)
				QV_SelectText:=QV_t_EnteredItem+" exists in more than one group"+" Select the group(s) you wish to enter"
		End case 
		
		
		QV_ListSelected:=False:C215
		WS_AutoscreenSize(3; 300; 240)
		//position and size the window
		//QV_lb_SelectItems
		
		LB_SetupListbox(->QV_lb_SelectItems; "QV_t"; "QV_L"; 1; ->QV_ai_Tick; ->QV_at_List)
		
		LB_SetColumnHeaders(->QV_lb_SelectItems; "QV_L"; 1; "Selected"; "List")
		
		LB_SetColumnWidths(->QV_lb_SelectItems; "QV_t"; 1; 28; 183)
		LB_SetScroll(->QV_lb_SelectItems; -3; -2)
		LB_StyleSettings(->QV_lb_SelectItems; "Black"; 9; "QV_t"; ->[ACCOUNTS:32])
		LB_SetEnterable(->QV_lb_SelectItems; False:C215; 0)
		
		INT_SetLongintCheckFormat(->QV_ai_Tick)
		
End case 
ERR_MethodTrackerReturn("FM:QV_ITEMSSELECTOR"; $_t_oldMethodName)
