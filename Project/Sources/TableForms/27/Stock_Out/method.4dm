If (False:C215)
	//Table Form Method Name: [STOCK_MOVEMENT_ITEMS]Stock_out
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2012 08:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(STK_at_Types;0)
	//ARRAY TEXT(STK_at_TypesCode;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; STK_bo_ExcludeZero; STK_bo_LoadTypes; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; DEF_l_SettingsCalled; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop)
	C_TEXT:C284($_t_FormReference; $_t_oldMethodName; DOC_t_FormName; vButtDisO; vTitleR; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [STOCK_MOVEMENT_ITEMS].Stock_out"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		//  FSetting_SetLabel (WIN_t_CurrentOutputform)
		If (DEF_l_SettingsCalled=0)
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			DOC_t_FormName:=""
			INT_Setoutput(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); WIN_t_CurrentOutputform; ->DOC_t_FormName; 120)
			DEF_l_SettingsCalled:=1
			If (Not:C34(STK_bo_LoadTypes))
				ALL RECORDS:C47([STOCK_TYPES:59])
				SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Name:2; STK_at_Types; [STOCK_TYPES:59]Type_Code:1; STK_at_TypesCode)
				SORT ARRAY:C229(STK_at_Types; STK_at_TypesCode)
				INSERT IN ARRAY:C227(STK_at_Types; 1)
				
				STK_at_Types{1}:="All Types"
				INSERT IN ARRAY:C227(STK_at_TypesCode; 1)
				
				STK_at_Types:=1
				STK_bo_LoadTypes:=True:C214
				STK_bo_ExcludeZero:=False:C215
			End if 
		Else 
			DEF_l_SettingsCalled:=0
		End if 
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
		If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16>0)
			RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Company_To:2)
			RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
			RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Location:7)
		Else 
			REDUCE SELECTION:C351([COMPANIES:2]; 0)
			REDUCE SELECTION:C351([PRODUCTS:9]; 0)
			REDUCE SELECTION:C351([LOCATIONS:61]; 0)
		End if 
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); "Stock_out")
		Cache_Initialise
	: ($_l_event=On Activate:K2:9)  // | (vFromIn))
		OpenHelp(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); "Stock_out")
		vButtDisO:="O  P           DT"
		Out_Buttons
		vTitleR:=Uppercase:C13(Term_StoWT("Stock Items"))
	: ($_l_event=On Outside Call:K2:11)
		
		Out_ButtCall(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8; ->[STOCK_MOVEMENT_ITEMS:27]Company_To:2; "Stock"; ""; "Stock_Sel"; "Minor_Del"; ""; "Stock Items"; "StockI_OutCount"; 0; 0)
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
	: ($_l_event=On Close Detail:K2:24)
		$_t_FormReference:=Table name:C256(->[STOCK_MOVEMENT_ITEMS:27])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="O  P           DT"
		Out_Buttons
		vTitleR:=Uppercase:C13(Term_StoWT("Stock Items"))
		
End case 
ERR_MethodTrackerReturn("FM [STOCK_MOVEMENT_ITEMS].Stock_out"; $_t_oldMethodName)
