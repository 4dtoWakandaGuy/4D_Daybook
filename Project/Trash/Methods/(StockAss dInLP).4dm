//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockAss dInLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/02/2011 17:19 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SRQtyT;0)
	//ARRAY TEXT(SRSerial;0)
	//ARRAY BOOLEAN(STK_lb_Assemblies;0)
	//Array LONGINT(aApptO;0)
	//Array REAL(SRAmount;0)
	//Array REAL(SRPrice;0)
	//Array REAL(SRRate;0)
	//Array TEXT(SRDesc;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_Event; DB_l_ButtonClickedFunction; iCancel; iOK; STK_l_BUT1; STK_l_But2; STK_l_BUT3; STK_l_BUT4; STK_l_BUT5; STK_l_BUT6; STK_l_BUT7)
	C_LONGINT:C283(STK_l_BUT8; STK_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; STK_t_COL1; STK_t_COL2; STK_t_COL3; STK_t_COL4; STK_t_COL5; STK_t_COL6; STK_t_COL7; STK_t_COL8; STK_t_COL9; STK_t_HED1)
	C_TEXT:C284(STK_t_HED2; STK_t_HED3; STK_t_HED4; STK_t_HED5; STK_t_HED6; STK_t_HED7; STK_t_HED8; STK_t_HED9; vButtDisCom; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss dInLP")
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		vButtDisCom:="I DPMO  FSSSRCADT"
		Input_Buttons(->[STOCK_MOVEMENT_ITEMS:27]; ->vButtDisCom)
		WS_AutoscreenSize(2; 404; 560)
		INT_SetInput(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); WIN_t_CurrentInputForm)
		//STK_lb_Assemblies
		
		LB_SetupListbox(->STK_lb_Assemblies; "STK_t"; "STK_L"; 1; ->SRQtyT; ->SRSerial; ->SRDesc; ->SRPrice; ->SRRate; ->SRAmount; ->aApptO)
		
		LB_SetColumnHeaders(->STK_lb_Assemblies; "STK_L"; 1; " "; "Product Qty & Cost"; "Name Serial Number"; "Required"; "In Stock"; "To Assemble"; "Total Available")
		
		LB_SetColumnWidths(->STK_lb_Assemblies; "STK_t"; 1; 16; 160; 160; 45; 45; 45; 45)
		LB_SetScroll(->STK_lb_Assemblies; -3; -2)
		LB_StyleSettings(->STK_lb_Assemblies; "Black"; 9; "STK_t"; ->[ACCOUNTS:32])
		LB_SetEnterable(->STK_lb_Assemblies; False:C215; 0)
	: ($_l_Event=On Activate:K2:9)
		OpenHelp(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisCom)
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		In_ButtCall(""; ""; ""; ->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8; "StockI"; ""; ""; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisCom)
		DB_l_ButtonClickedFunction:=0
End case 
ERR_MethodTrackerReturn("StockAss dInLP"; $_t_oldMethodName)