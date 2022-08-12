If (False:C215)
	//Table Form Method Name: [PRODUCTS]Products_Out
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/06/2012 21:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_FormReference)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; PRD_bo_ScreenFilterLoaded; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM; PRD_l_FilterNLA; PROD_l_SettingsCalled; PROD_l_SortFieldWas; PROD_l_SortOrderWas; PROD_l_SortTableWas; SIZ_l_Minimized)
	C_LONGINT:C283(SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop)
	C_TEXT:C284($_t_oldMethodName; vButtDisO; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PRODUCTS].Products_Out"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		If (Not:C34(PRD_bo_ScreenFilterLoaded))
			PRD_l_FilterNLA:=ProductDeletionPreferences(False:C215)
			PRD_bo_ScreenFilterLoaded:=True:C214
		End if 
		//MESSAGE("1")  `4/1/2010
		If (PROD_l_SettingsCalled=0)
			//MESSAGE("2")  `4/1/2010
			FSetting_SetLabel(WIN_t_CurrentOutputform)
			//MESSAGE("3")  `4/1/2010
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			//MESSAGE("4")  `4/1/2010
			INT_Setoutput(Table:C252(->[PRODUCTS:9]); WIN_t_CurrentOutputform)
			PROD_l_SettingsCalled:=1
		Else 
			PROD_l_SettingsCalled:=0
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
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[PRODUCTS:9]); "Products_Out")
		Cache_Initialise("Master")
		FSetting_SetLabel(WIN_t_CurrentOutputform)
	: ($_l_event=On Activate:K2:9)  //| (vFromIn))
		OpenHelp(Table:C252(->[PRODUCTS:9]); "Products_Out")
		vButtDisO:="O              DT"
		Out_Buttons
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[PRODUCTS:9]; ->[PRODUCTS:9]Product_Code:1; ->[PRODUCTS:9]Product_Name:2; "Products"; "DB_MenuNewRecord"; "Prod_Sel"; "Products_OutDel"; "Master"; "Products"; "Products_OutCou"; 0; 0)
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		PROD_l_SortFieldWas:=FS_l_SortFieldNUM
		PROD_l_SortTableWas:=FS_l_SortTableNUM
		PROD_l_SortOrderWas:=FS_l_SortDirection
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
		
	: ($_l_event=On Close Detail:K2:24)
		FS_l_SortFieldNUM:=PROD_l_SortFieldWas
		FS_l_SortTableNUM:=PROD_l_SortTableWas
		FS_l_SortDirection:=PROD_l_SortOrderWas
		$_t_FormReference:=Table name:C256(->[PRODUCTS:9])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="O              DT"
		Out_Buttons
		
		
End case 
ERR_MethodTrackerReturn("FM:Products Out"; $_t_oldMethodName)
