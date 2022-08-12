If (False:C215)
	//Table Form Method Name: [CURRENT_STOCK]StockCurr_Alloc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2011 11:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_FormReference)
	C_BOOLEAN:C305(<>STK_bo_TypesInited; DB_bo_NoLoad; DB_bo_RecordModified; INT_bo_DetailOpen; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; ch1; DB_l_ButtonClickedFunction; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop; vItemNum; vNo)
	C_LONGINT:C283(vNo2)
	C_TEXT:C284($_t_oldMethodName; vButtDisO; vCompany; vCompCode; vContCode; vLocation; vOrderCode; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CURRENT_STOCK].StockCurr_Alloc"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		If (Not:C34(<>STK_bo_TypesInited))
			Order_Buttons
			<>STK_bo_TypesInited:=True:C214
		End if 
		
		FSetting_SetLabel(WIN_t_CurrentOutputform)
		
		If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
			WS_OutputResize
			WIN_bo_Resize:=False:C215
		End if 
		INT_Setoutput(Table:C252(->[CURRENT_STOCK:62]); WIN_t_CurrentOutputform)
	: ($_l_event=On Resize:K2:27)
		If (Not:C34(INT_bo_DetailOpen))
			If (Not:C34(WIN_bo_Resize))
				
				WS_OutputResize
			Else 
				WIN_bo_Resize:=False:C215
			End if 
			
		End if 
		
		INT_bo_DetailOpen:=False:C215
	: ($_l_event=On Display Detail:K2:22)
		If ([CURRENT_STOCK:62]Location:8#"")
			RELATE ONE:C42([CURRENT_STOCK:62]Location:8)
			vLocation:=[LOCATIONS:61]Location_Name:2
		Else 
			vLocation:=""
		End if 
		If ([CURRENT_STOCK:62]Item_Number:5=vItemNum)
			vContCode:="•"
		Else 
			vContCode:=""
		End if 
		If ([CURRENT_STOCK:62]Item_Number:5#0)
			RELATE ONE:C42([CURRENT_STOCK:62]Item_Number:5)
			vOrderCode:=[ORDER_ITEMS:25]Order_Code:1
			If (vOrderCode#"")
				RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
				vCompCode:=[ORDERS:24]Company_Code:1
				RELATE ONE:C42([ORDERS:24]Company_Code:1)
				vCompany:=[COMPANIES:2]Company_Name:2
			Else 
				vCompCode:=""
				vCompany:=""
			End if 
		Else 
			vOrderCode:=""
			vCompCode:=""
			vCompany:=""
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[CURRENT_STOCK:62]); "StockCurr_Alloc")
		If (vNo=vNo2)
			ch1:=1
		End if 
		Cache_Initialise("Master")
		FSetting_SetLabel(WIN_t_CurrentOutputform)
		SD2_SetDiaryPopup
	: ($_l_event=On Activate:K2:9)  //| (vFromIn))
		OpenHelp(Table:C252(->[CURRENT_STOCK:62]); "StockCurr_Alloc")
		vButtDisO:="O DPMONPF   R ADT"
		Out_Buttons
		SD2_SetDiaryPopup
	: ($_l_event=On Outside Call:K2:11)
		If (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Cancel"))
			If (DB_bo_RecordModified)
				DB_l_ButtonClickedFunction:=0
				Gen_Confirm("Are you sure you want to Cancel the Allocations made?"; "Try again"; "Cancel")
				If (OK=0)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Cancel")
				End if 
			End if 
		End if 
		Out_ButtCall(->[CURRENT_STOCK:62]; ->[CURRENT_STOCK:62]Product_Code:1; ->[CURRENT_STOCK:62]Stock_Type:3; "StockCurr"; ""; "StockCurr_Sel"; ""; "Master"; "Current Stock"; "StockCurr_OutCo"; 0; 0)
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=False:C215
	: ($_l_event=On Close Detail:K2:24)
		$_t_FormReference:=Table name:C256(->[CURRENT_STOCK:62])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="O DPMONPF   R ADT"
		Out_Buttons
		SD2_SetDiaryPopup
End case 
ERR_MethodTrackerReturn("FM:StockCurr_Alloc"; $_t_oldMethodName)
