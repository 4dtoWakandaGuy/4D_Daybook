If (False:C215)
	//Table Form Method Name: [DOCUMENTS]Letters_Out
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; DEF_l_SettingsCalled; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop; WS_l_SelDocTemplateClass)
	C_TEXT:C284(<>SYS_t_4DWriteType; $_t_AccessType; $_t_FormReference; $_t_oldMethodName; vButtDisO; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform; WS_t_DocumentTemplateClass)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].Letters_Out"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		If (DEF_l_SettingsCalled=0)
			
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			INT_Setoutput(Table:C252(->[DOCUMENTS:7]); WIN_t_CurrentOutputform; ->WS_t_DocumentTemplateClass)
			DEF_l_SettingsCalled:=1
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
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DOCUMENTS:7]); "Letters_Out")
		Cache_Initialise("Master")
		FSetting_SetLabel(WIN_t_CurrentOutputform)
	: ($_l_event=On Activate:K2:9)  // (vFromIn))
		OpenHelp(Table:C252(->[DOCUMENTS:7]); "Letters_Out")
		vButtDisO:="O              DT"
		Out_Buttons
		//   If (◊Write="SW")` SuperWrite out 24/04/02 pb
		//    SET WINDOW TITLE("View Documents")
		//   End if
		
		DB_SetMenuBar(""; 9)
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[DOCUMENTS:7]; ->[DOCUMENTS:7]Document_Code:1; ->[DOCUMENTS:7]Heading:2; "Documents"; ("Letters_In"*Num:C11(<>SYS_t_4DWriteType#"SW"))+("Letters_SWNew"*Num:C11(<>SYS_t_4DWriteType="SW")); "Letters_Sel"; "Minor_DelEx"; "Master"; "Documents"; ""; 0; 0)
	: ($_l_event=On Open Detail:K2:23)
		Case of 
			: (WS_l_SelDocTemplateClass=1)  //letter templates
				$_t_AccessType:=Letters_FileI
			: (WS_l_SelDocTemplateClass=2)  //superreporttemplates
				FORM SET INPUT:C55([DOCUMENTS:7]; "Report_in")
			: (WS_l_SelDocTemplateClass=3)  //email templates
				FORM SET INPUT:C55([DOCUMENTS:7]; "eMail_in")
			: (WS_l_SelDocTemplateClass=5)  //others
				$_t_AccessType:=Letters_FileI
		End case 
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
	: ($_l_event=On Close Detail:K2:24)
		$_t_FormReference:=Table name:C256(->[DOCUMENTS:7])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="O              DT"
		Out_Buttons
End case 
ERR_MethodTrackerReturn("FM [DOCUMENTS].Letters_Out"; $_t_oldMethodName)
