If (False:C215)
	//Table Form Method Name: [SERVICE_CALLS]Calls_OutSol
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/09/2010 18:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_FormReference)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; DEF_l_SettingsCalled; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM; SC_l_SortFieldWas; SC_l_SortOrderWas; SC_l_SortTableWas; SIZ_l_Minimized; SIZ_l_OLDBottom)
	C_LONGINT:C283(SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop)
	C_TEXT:C284($_t_oldMethodName; vButtDisO; vComments; Vtitle; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [SERVICE_CALLS].Calls_OutSol"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		If (DEF_l_SettingsCalled=0)
			FSetting_SetLabel(WIN_t_CurrentOutputform)
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			Vtitle:="Problems & Solutions"
			INT_Setoutput(Table:C252(->[SERVICE_CALLS:20]); WIN_t_CurrentOutputform; ->Vtitle)
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
	: ($_l_event=On Display Detail:K2:22)
		If ([SERVICE_CALLS:20]Call_Code:4#"")
			RELATE ONE:C42([SERVICE_CALLS:20]Problem_Code:14)
			RELATE ONE:C42([SERVICE_CALLS:20]Solution_Code:16)
			vComments:=""
			QUERY:C277([SERVICE_CALLS_PRODUCTS:152]; [SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8=[SERVICE_CALLS:20]Call_Code:4)
			
			While (Not:C34(End selection:C36([SERVICE_CALLS_PRODUCTS:152])))
				RELATE ONE:C42([SERVICE_CALLS_PRODUCTS:152]Product_Code:1)
				vComments:=vComments+[PRODUCTS:9]Product_Name:2+Char:C90(13)
				NEXT RECORD:C51([SERVICE_CALLS_PRODUCTS:152])
			End while 
		Else 
			VComments:=""
			REDUCE SELECTION:C351([PROBLEMS:22]; 0)
			REDUCE SELECTION:C351([SOLUTIONS:23]; 0)
			
		End if 
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[SERVICE_CALLS:20]); "Calls_OutSol")
	: ($_l_event=On Activate:K2:9)  // |` (vFromIn))
		OpenHelp(Table:C252(->[SERVICE_CALLS:20]); "Calls_OutSol")
		vButtDisO:="OutAny$SP"
		Out_Buttons
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Call_Code:4; ->[SERVICE_CALLS:20]Company_Code:1; "Calls"; "DB_MenuNewRecord"; "Calls_Sel"; "Minor_Del"; "Master"; "Calls"; "Calls_OutCount"; 1; 2)
	: ($_l_event=On Open Detail:K2:23)
		SC_l_SortFieldWas:=FS_l_SortFieldNUM
		SC_l_SortTableWas:=FS_l_SortTableNUM
		SC_l_SortOrderWas:=FS_l_SortDirection
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
		
	: ($_l_event=On Close Detail:K2:24)
		FS_l_SortFieldNUM:=SC_l_SortFieldWas
		FS_l_SortTableNUM:=SC_l_SortTableWas
		FS_l_SortDirection:=SC_l_SortOrderWas
		$_t_FormReference:=Table name:C256(->[SERVICE_CALLS:20])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="OutAny$SP"
		Out_Buttons
		
End case 
ERR_MethodTrackerReturn("FM:Calls OutSol"; $_t_oldMethodName)
