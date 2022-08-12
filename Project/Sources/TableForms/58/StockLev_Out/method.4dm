If (False:C215)
	//Table Form Method Name: [STOCK_LEVELS]StockLev_out
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/05/2010 12:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_FormReference)
	C_BOOLEAN:C305(<>STK_bo_TypesInited; DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop)
	C_REAL:C285(vQuantity; vTotal)
	C_TEXT:C284($_t_oldMethodName; DOC_t_FormName; vButtDisO; vStatus; vTitle; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [STOCK_LEVELS].StockLev_out"; Form event code:C388)
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
		DOC_t_FormName:=""
		INT_Setoutput(Table:C252(->[STOCK_LEVELS:58]); WIN_t_CurrentOutputform; ->DOC_t_FormName; 119)
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
		RELATE ONE:C42([STOCK_LEVELS:58]Stock_Type:2)
		vQuantity:=STK_SumLevels
		vTotal:=STK_SumCosts
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[STOCK_LEVELS:58]); "StockLev_out")
		Cache_Initialise("Master")
		FSetting_SetLabel(WIN_t_CurrentOutputform)
	: ($_l_event=On Activate:K2:9)  // | (vFromIn))
		OpenHelp(Table:C252(->[STOCK_LEVELS:58]); "StockLev_out")
		vButtDisO:="O  P           DT"
		Out_Buttons
		vTitle:=Uppercase:C13(Term_StoWT("STOCK LEVELS:  "+vStatus))
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[STOCK_LEVELS:58]; ->[STOCK_LEVELS:58]Product_Code:1; ->[STOCK_LEVELS:58]Stock_Type:2; "Stock Levels"; ""; "StockLev_Sel"; "Minor_Del"; "Master"; "Stock Levels"; "StockLev_OutCou"; 0; 0)
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
	: ($_l_event=On Close Detail:K2:24)
		$_t_FormReference:=Table name:C256(->[STOCK_LEVELS:58])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="O  P           DT"
		Out_Buttons
End case 
ERR_MethodTrackerReturn("FM:StockLev Out"; $_t_oldMethodName)
