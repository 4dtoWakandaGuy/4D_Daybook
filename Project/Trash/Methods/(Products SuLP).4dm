//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Products SuLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/10/2010 14:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_TEXT($_t_PalletButtonName)
	//ARRAY TEXT(PROD_at_SubsItems;0)
	C_BOOLEAN:C305(<>PER_bo_LbDefinitiionsInited; <>PER_bo_SystemSettingAccess; DB_bo_NoLoad; PAL_bo_ButtonSubFunction; DB_bo_RecordModified)
	C_LONGINT:C283($_l_Event; DB_l_ButtonClickedFunction; iCancel; iOK)
	C_REAL:C285(vAmount; vTot; vTotal)
	C_TEXT:C284($_t_oldMethodName; $Mand; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDisPro; vDates; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products SuLP")
//Products SuLP

$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Activate:K2:9)
		OpenHelp(Table:C252(->[PRODUCTS:9]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisPro)
		
	: ($_l_Event=On Outside Call:K2:11)
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET_MENU BAR(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				inButtSubHandle(FORM Get current page:C276; ->[PRODUCTS:9]; "Items Su13")
				
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				In_ButtCall("R:Products_SuLPA"; ""; ""; ->[PRODUCTS:9]; ->[PRODUCTS:9]Product_Code:1; "Products"; ""; "Products_SuLPB"; "Master"; "Prod_Sel"; ""; ->[SUBSCRIPTIONS:93]; ->vButtDisPro)
		End case 
	: ($_l_Event=On Clicked:K2:4)
		If (PAL_BUTTON#"")
			$_t_PalletButtonName:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_PalletButtonName)
			PAL_bo_ButtonSubFunction:=False:C215
		End if 
		
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([PRODUCTS:9]Issues_Number:27))
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([PRODUCTS:9]Every_Number:28))
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([PRODUCTS:9]Start_Number:30))
				//     If ([PRODUCTS]Unit No<8)
				//  If (([PRODUCTS]Start No<1) | ([PRODUCTS]Start No>7))
				//    Gen_Alert ("Please choose a Day number between "+Char(13)+"1 (Sunday) and 7
				//      [PRODUCTS]Start No:=2
				//     End if
				//    Else
				//    If (([PRODUCTS]Start No<1) | ([PRODUCTS]Start No>31))
				//      Gen_Alert ("Please choose a Month Day between 1 and 31";"OK")
				//     [PRODUCTS]Start No:=1
				//  End if
				//  End if
				//    Products_SuLPSN
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([PRODUCTS:9]Start_Days:31))
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([PRODUCTS:9]First_Issue_Date:32))
				vDates:=DayName([PRODUCTS:9]First_Issue_Date:32)
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([PRODUCTS:9]Minimum:11))
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([PRODUCTS:9]Subscription_Perpetual:41))
				DB_bo_RecordModified:=True:C214
			: (vTot=1)
				vTot:=0
				vTotal:=Round:C94(Sum:C1([SUBSCRIPTIONS:93]Amount_Excluding_Tax:8); 2)
				vAmount:=Round:C94(([PRODUCTS:9]Sales_Price:9-vTotal); 2)
		End case 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		OpenHelp(Table:C252(->[PRODUCTS:9]); WIN_t_CurrentInputForm)
		//Note this variable is not displayed on screen
		ARRAY TEXT:C222(PROD_at_SubsItems; 2)
		PROD_at_SubsItems{2}:="Editable"
		PROD_at_SubsItems{1}:="Selectable"
		If ((<>PER_bo_SystemSettingAccess) & (<>PER_bo_LbDefinitiionsInited))
			ARRAY TEXT:C222(PROD_at_SubsItems; 3)
			PROD_at_SubsItems{3}:="Definitions"
			//PROD_at_SubsItems{4}:="Diary Tab Settings"
			
		End if 
		Products_SuLPB
		In_ButtChkDis(->vButtDisPro)
	: ($_l_Event=On Deactivate:K2:10)
		//  PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Products SuLP"; $_t_oldMethodName)