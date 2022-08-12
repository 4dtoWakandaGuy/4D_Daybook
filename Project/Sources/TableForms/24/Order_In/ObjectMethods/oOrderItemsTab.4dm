If (False:C215)
	//object Name: [ORDERS]Orders_In.Tab Control1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2010 06:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; ORD_l_SelectedViewTabOLD; vCT)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_In.Tab Control1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		vCT:=0
		If (ORD_l_SelectedViewTabOLD=1)
			If ([ORDER_ITEMS:25]Order_Code:1#"")
				DB_SaveRecord(->[ORDER_ITEMS:25])
				AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
			End if 
		End if 
		Orders_InLPß("P1")
		
End case 
ERR_MethodTrackerReturn("OBJ:Orders_In,ORD_at_ViewTabsLabels"; $_t_oldMethodName)
