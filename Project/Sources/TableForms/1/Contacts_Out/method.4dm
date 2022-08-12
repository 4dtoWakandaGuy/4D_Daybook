If (False:C215)
	//Table Form Method Name: [CONTACTS]Contacts_Out
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_FormReference)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; DB_l_ButtonPrefsSet; CON_l_SettingsCalled; CON_l_SortFieldWas; CON_l_SortOrderWas; CON_l_SortTableWas; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM; SIZ_l_Minimized)
	C_LONGINT:C283(SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop)
	C_TEXT:C284($_t_oldMethodName; CON_S255_CompanyName; vButtDisO; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS].Contacts_Out"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		If (CON_l_SettingsCalled=0)
			
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			INT_Setoutput(Table:C252(->[CONTACTS:1]); WIN_t_CurrentOutputform)
			CON_l_SettingsCalled:=1
		Else 
			CON_l_SettingsCalled:=0
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
		If ([CONTACTS:1]Contact_Code:2#"")
			If ([COMPANIES:2]Company_Code:1#[CONTACTS:1]Company_Code:1)  //only here cos StatsView kills auto rels
				//RELATE ONE([CONTACTS]Company Code)
				CON_S255_CompanyName:=""
				If (Records in selection:C76([COMPANIES:2])>0)
					If ([COMPANIES:2]Company_Name:2="")
						If ([COMPANIES:2]Address_Line_one:3#"")
							CON_S255_CompanyName:=[COMPANIES:2]Address_Line_one:3
						Else 
							If ([COMPANIES:2]Deleted:61=1)
								CON_S255_CompanyName:="("+"Company Deleted"+")"
							Else 
								CON_S255_CompanyName:="Unknown"
							End if 
						End if 
						
					Else 
						CON_S255_CompanyName:=[COMPANIES:2]Company_Name:2
					End if 
				Else 
					CON_S255_CompanyName:="("+"NO ADDRESS"+")"
				End if 
			Else 
				If ([CONTACTS:1]Company_Code:1="")
					CON_S255_CompanyName:="("+"NO ADDRESS"+")"
				Else 
					CON_S255_CompanyName:=[COMPANIES:2]Company_Name:2
				End if 
				
			End if 
		Else 
			CON_S255_CompanyName:=""
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[CONTACTS:1]); "Contacts_Out")
		Cache_Initialise("OMaster")
		FSetting_SetLabel(WIN_t_CurrentOutputform)
		SD2_SetDiaryPopup
	: ($_l_event=On Activate:K2:9)  // | (vFromIn))
		OpenHelp(Table:C252(->[CONTACTS:1]); "Contacts_Out")
		If (DB_l_ButtonPrefsSet=1)
			vButtDisO:="O D MONPFSSSRCADT"
		Else 
			vButtDisO:="O                "
		End if 
		Out_Buttons
		SD2_SetDiaryPopup
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[CONTACTS:1]; ->[CONTACTS:1]Contact_Code:2; ->[CONTACTS:1]Contact_Code:2; "Contacts"; "DB_CreateNewRecord"; "Cont_Sel"; "Contacts_OutDel"; "OMaster"; "Cont_xAny"; ""; 1; 2)
	: ($_l_event=On Open Detail:K2:23)
		
		CON_l_SortFieldWas:=FS_l_SortFieldNUM
		CON_l_SortTableWas:=FS_l_SortTableNUM
		CON_l_SortOrderWas:=FS_l_SortDirection
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
	: ($_l_event=On Close Detail:K2:24)
		FS_l_SortFieldNUM:=CON_l_SortFieldWas
		FS_l_SortTableNUM:=CON_l_SortTableWas
		FS_l_SortDirection:=CON_l_SortOrderWas
		$_t_FormReference:=Table name:C256(->[CONTACTS:1])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		If (DB_l_ButtonPrefsSet=1)
			vButtDisO:="O D MONPFSSSRCADT"
		Else 
			vButtDisO:="O                "
		End if 
		Out_Buttons
		
		
End case 
ERR_MethodTrackerReturn("FM:Contacts_Out"; $_t_oldMethodName)
