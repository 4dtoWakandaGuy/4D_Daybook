If (False:C215)
	//Table Form Method Name: [INFORMATION]Information_Out
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/10/2009 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(vButtDisO)
	//C_UNKNOWN(vName)
	//C_UNKNOWN(vStage)
	C_BOOLEAN:C305(INT_bo_DetailOpen; WIN_bo_Resize; DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_LONGINT:C283($_l_event; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop; <>PER_l_CurrentUserID; $_l_event; SIZ_l_OLDBOTTOM; SIZ_l_OLDLEFT; SIZ_l_OLDRIGHT)
	C_LONGINT:C283(SIZ_l_OLDTOP)
	C_TEXT:C284(vButtDisO; vName; vStage; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform; $_t_FormReference; $_t_oldMethodName; WIN_t_CurrentOutputform)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [INFORMATION].Information_Out"; Form event code:C388)
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Header:K2:17)
		INT_Setoutput(Table:C252(->[INFORMATION:55]); WIN_t_CurrentOutputform)
		FSetting_SetLabel(WIN_t_CurrentOutputform)
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
	: ($_l_event=On Display Detail:K2:22)
		// ONE([INFORMATION]Company Code)
		//RELATE ONE([INFORMATION]Contact Code)
		
		vName:=[CONTACTS:1]Contact_Name:31
		
		
		vStage:="N"
		
		If ([INFORMATION:55]QualityID:14>0)
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=[INFORMATION:55]QualityID:14)
			[INFORMATION:55]SubGroup:6:=[LIST_ITEMS:95]List_Entry:2
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=[INFORMATION:55]QualityGroupID:15)
			[INFORMATION:55]Group:2:=[LIST_ITEMS:95]List_Entry:2
		End if 
		
		
		
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[INFORMATION:55]); "Information_Out")
		Cache_Initialise
		FSetting_SetLabel(WIN_t_CurrentOutputform)
	: ($_l_event=On Activate:K2:9)  //| (vFromIn))
		OpenHelp(Table:C252(->[INFORMATION:55]); "Information_Out")
		vButtDisO:="O  P           DT"
		Out_Buttons
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[INFORMATION:55]; ->[INFORMATION:55]Information_Code:9; ->[INFORMATION:55]Contact_Code:1; "Qualities"; ""; "Qualities_Sel"; "Minor_Del"; "Master"; "Qualities"; ""; 0; 0)
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
		
	: ($_l_event=On Close Detail:K2:24)
		$_t_FormReference:=Table name:C256(->[INFORMATION:55])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="O  P           DT"
		Out_Buttons
		
End case 
ERR_MethodTrackerReturn("FM [INFORMATION].Information_Out"; $_t_oldMethodName)
