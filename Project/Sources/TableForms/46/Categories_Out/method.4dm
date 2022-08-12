If (False:C215)
	//Table Form Method Name: [TIME_BILLING_CATEGORIES]Categories_Out
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/09/2010 09:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop)
	C_TEXT:C284($_t_FormReference; $_t_oldMethodName; vButtDisO; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [TIME_BILLING_CATEGORIES].Categories_Out"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		FSetting_SetLabel(WIN_t_CurrentOutputform)
		INT_Setoutput(Table:C252(->[TIME_BILLING_CATEGORIES:46]); WIN_t_CurrentOutputform)
		
		
		If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
			WS_OutputResize
			WIN_bo_Resize:=False:C215
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
		OpenHelp(Table:C252(->[TIME_BILLING_CATEGORIES:46]); "Categories_Out")
		FSetting_SetLabel(WIN_t_CurrentOutputform)
		Cache_Initialise
		SD2_SetDiaryPopup
	: ($_l_event=On Activate:K2:9)  // | (vFromIn))
		OpenHelp(Table:C252(->[TIME_BILLING_CATEGORIES:46]); "Categories_Out")
		vButtDisO:="O              DT"
		Out_Buttons
		SD2_SetDiaryPopup
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[TIME_BILLING_CATEGORIES:46]; ->[TIME_BILLING_CATEGORIES:46]Category_Code:1; ->[TIME_BILLING_CATEGORIES:46]Category_Name:2; "Categories"; "DB_MenuNewRecord"; "Minor_Sel"; "Minor_Del"; ""; "Categories"; ""; 0; 0)
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
		
	: ($_l_event=On Close Detail:K2:24)
		$_t_FormReference:=Table name:C256(->[TIME_BILLING_CATEGORIES:46])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="O              DT"
		Out_Buttons
End case 
ERR_MethodTrackerReturn("FM:Categories_Out"; $_t_oldMethodName)
