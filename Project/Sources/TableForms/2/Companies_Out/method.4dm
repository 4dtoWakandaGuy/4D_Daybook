If (False:C215)
	//Table Form Method Name: [COMPANIES]Companies_Out
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; $_l_Process; CO_l_SortFieldWas; CO_l_SortOrderWas; CO_l_SortTableWas; COM_l_SettingsCalled; DB_l_ButtonPrefsSet; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM)
	C_LONGINT:C283(SIZ_l_COLastBottom; SIZ_l_COLastLeft; SIZ_l_COLastRight; SIZ_l_COLastTop; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop; vNo)
	C_POINTER:C301($_ptr_Field; $_ptr_Table)
	C_TEXT:C284($_t_CompanyCode; $_t_FormReference; $_t_oldMethodName; CON_S255_CompanyName; FS_t_SortVariableName; vButtDisO; vRequest; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].Companies_Out"; Form event code:C388)


$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "Companies_Out")
		If (COM_l_SettingsCalled=0)
			Cache_Initialise("CMaster")
			FSetting_SetLabel(WIN_t_CurrentOutputform)
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			COM_l_SettingsCalled:=1
		Else 
			COM_l_SettingsCalled:=0
			
		End if 
		SD2_SetDiaryPopup
	: ($_l_event=On Header:K2:17)
		INT_Setoutput(Table:C252(->[COMPANIES:2]); WIN_t_CurrentOutputform)
		
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
		
	: ($_l_event=On Activate:K2:9)  // | (vFromIn))
		OpenHelp(Table:C252(->[COMPANIES:2]); "Companies_Out")
		If (DB_l_ButtonPrefsSet=1)
			vButtDisO:="O D MONPFSSSRCADT"
		Else 
			vButtDisO:="O                "
		End if 
		Out_Buttons
		SD2_SetDiaryPopup
	: ($_l_event=On Unload:K2:2)
		SIZ_l_Minimized:=0
		SIZ_l_COLastLeft:=0
		SIZ_l_COLastTop:=0
		SIZ_l_COLastRight:=0
		SIZ_l_COLastBottom:=0
	: ($_l_event=On Open Detail:K2:23)
		
		CO_l_SortFieldWas:=FS_l_SortFieldNUM
		CO_l_SortTableWas:=FS_l_SortTableNUM
		CO_l_SortOrderWas:=FS_l_SortDirection
		COPY NAMED SELECTION:C331([COMPANIES:2]; "Current selection")
		$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
		SET QUERY DESTINATION:C396(Into set:K19:2; "OneRecord")
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
		SET QUERY DESTINATION:C396(0)
		
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
	: ($_l_event=On Close Detail:K2:24)
		FS_l_SortFieldNUM:=CO_l_SortFieldWas
		FS_l_SortTableNUM:=CO_l_SortTableWas
		FS_l_SortDirection:=CO_l_SortOrderWas
		$_t_FormReference:=Table name:C256(->[COMPANIES:2])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		$_l_Process:=Frontmost process:C327
		USE NAMED SELECTION:C332("Current selection")
		QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61#1)
		Case of 
			: (FS_l_SortFieldNUM>0)
				$_ptr_Table:=Table:C252(FS_l_SortTableNUM)
				$_ptr_Field:=Field:C253(FS_l_SortTableNUM; FS_l_SortFieldNUM)
				WT_SORT_TABLE_3($_ptr_Table; ""; $_ptr_Field; False:C215)
			: (FS_t_SortVariableName#"")
		End case 
		
		//FS_SetFormSort (WIN_t_CurrentOutputform)
		vNo:=Records in selection:C76([COMPANIES:2])
		COPY NAMED SELECTION:C331([COMPANIES:2]; "Current selection")
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		HIGHLIGHT RECORDS:C656("OneRecord")
		
		If (DB_l_ButtonPrefsSet=1)
			vButtDisO:="O D MONPFSSSRCADT"
		Else 
			vButtDisO:="O                "
		End if 
		Out_Buttons
		BRING TO FRONT:C326($_l_Process)
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; ->[COMPANIES:2]Company_Name:2; "Companies"; "DB_CreateNewRecord"; "Comp_Sel"; "Companies_OutDe"; "CMaster"; "Comp_xAny"; "Companies_OutCo"; 1; 0)
		
		
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
	: ($_l_event=On Resize:K2:27)
	: ($_l_event=On Display Detail:K2:22)
		CON_S255_CompanyName:=""
		
		If ([COMPANIES:2]Company_Name:2="")
			If ([COMPANIES:2]Address_Line_one:3#"")
				CON_S255_CompanyName:="("+[COMPANIES:2]Address_Line_one:3+")"
			Else 
				If ([COMPANIES:2]Deleted:61=1)
					CON_S255_CompanyName:="("+"Company Deleted"+")"
				Else 
					If ([COMPANIES:2]Company_Code:1#"")
						CON_S255_CompanyName:="("+"Unknown"+")"
					End if 
				End if 
			End if 
			
		Else 
			CON_S255_CompanyName:=[COMPANIES:2]Company_Name:2
		End if 
		
		
	Else 
		
End case 
ERR_MethodTrackerReturn("FM:Companies_Out"; $_t_oldMethodName)
