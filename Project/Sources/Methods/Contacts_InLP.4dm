//%attributes = {}
If (False:C215)
	//Project Method Name:      Contacts_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2/8/10 5:28 AM
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CON_lb_FurtherAnalysis;0)
	//ARRAY LONGINT(CON_al_ContactTabPage;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	//ARRAY POINTER(QUAL_aptr_Information;0)
	//ARRAY TEXT(COM_at_CompanyNames;0)
	//ARRAY TEXT(CON_at_AddressTypes;0)
	//ARRAY TEXT(CON_at_ContactTab;0)
	//ARRAY TEXT(PAL_at_PopUpMenu5;0)
	C_BOOLEAN:C305($_bo_CloseRelated; $_bo_ContactButtons; $_bo_LoadCompanies; $_bo_RefreshRelated; $_bo_SaveRelated; $_bo_Stop; $1; $2; CO_bo_ChangeTab; COM_bo_ChangeTab; CON_bo_CompanyDeletable)
	C_BOOLEAN:C305(CON_bo_Editaddress; DB_bo_NoLoad; PAL_bo_ButtonSubFunction; vFromIn)
	C_LONGINT:C283($_l_ButtonNumber; $_l_CurrentFormPage; $_l_Event; $_l_ModuleRow; $_l_ProcessState; $CON_l_CurrentSubArea; CB_3; CON_l_CurrentSubArea; CON_l_IPcall; CON_l_SubInfoProcess; DB_l_ButtonClickedFunction)
	C_LONGINT:C283(DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_FirstRecord; PAL_but_LastRecord; PAL_but_NextRecord; PAL_but_PreviousRecord; SD2_l_CallingProcess; vAccessSwNo; vNo2)
	C_LONGINT:C283(xMinus)
	C_POINTER:C301($_ptr_ListboxSetup; $_ptr_Table)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_PalletButtonName; $_t_PopupItemName; BAR_t_Button; COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Country; COM_t_County; COM_t_PostalCode; COM_t_Town)
	C_TEXT:C284(CON_t_CoAreaCode; CON_t_CompanyAdType; CON_t_CompanyCode; CON_t_CompanyFAX; CON_t_CompanyName; CON_t_CompanyTelephone; CON_t_FalseTab; CON_t_NewlyAddedCompCode; CON_t_ParentRecord; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu)
	C_TEXT:C284(PAL_BUTTON; SD2_t_TabFunction; vButtDisCom; vButtDisCon; vComp_TEL; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_InLP")

//Contacts_InLP
If (Count parameters:C259>=1)
	$_bo_LoadCompanies:=$1
Else 
	$_bo_LoadCompanies:=True:C214
End if 
If (Count parameters:C259>=2)
	$_bo_ContactButtons:=$2
Else 
	$_bo_ContactButtons:=True:C214
End if 


$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Resize:K2:27)
		LBI_Scrollonresize(->CON_lb_FurtherAnalysis)
		INT_SetInput(Table:C252(->[COMPANIES:2]); WIN_t_CurrentInputForm)
		
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[CONTACTS:1]); "Contact_In")
		OpenHelp(Table:C252(->[CONTACTS:1]); "Contact_In")
		If ($_bo_ContactButtons)
			If (Size of array:C274(PAL_at_PopUpMenu5)>=2)
				//NG April 2008 at the moment you can ontly delete Further analysis..
				PAL_at_PopUpMenu5{2}:="Further Analysis"
				$_t_PopupItemName:=PAL_at_PopUpMenu5{2}
				In_ButtChkDis(->vButtDisCon; "Contact"; $_t_PopupItemName)
			Else 
				ARRAY TEXT:C222(PAL_at_PopUpMenu5; 2)
				PAL_at_PopUpMenu5{1}:="Contact"
				PAL_at_PopUpMenu5{2}:="Further Analysis"
				In_ButtChkDis(->vButtDisCon; "Contact"; PAL_at_PopUpMenu5{2})
			End if 
		Else 
			If (vAccessSwNo=-1)
				vAccessSwNo:=0
			Else 
				vFromIn:=After:C31
			End if 
			
			In_ButtChkDis(->vButtDisCom; "Contact")
			
		End if 
	: ($_l_Event=On Outside Call:K2:11)
		If ($_bo_ContactButtons)
			Case of 
				: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
					If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
						DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
						SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
					End if 
					DB_l_ButtonClickedFunction:=0
				: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Subfunction"))
					TRACE:C157
					DB_l_ButtonClickedFunction:=0
					DB_SubFunctionHandler
					
				: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
					
					
					inButtSubHandle(FORM Get current page:C276; ->[CONTACTS:1]; WIN_t_CurrentInputForm)
					
				: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Enter Related Diary"))
					//Contextual enter to diary
					// This should behave as if the user had clicked on that tab and then went +
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Plus")
					CON_t_FalseTab:=SD2_t_TabFunction
					SD2_t_TabFunction:=""
					$CON_l_CurrentSubArea:=CON_l_CurrentSubArea
					CON_l_CurrentSubArea:=2
					inButtSubHandle(FORM Get current page:C276; ->[CONTACTS:1])
					CON_l_CurrentSubArea:=$CON_l_CurrentSubArea
					
				: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("View Related Diary"))
					//Here we call the 'companion' process because the diary tabs etc are not loaded here
					If (CON_l_SubInfoProcess>0)
						SET PROCESS VARIABLE:C370(CON_l_SubInfoProcess; SD2_t_TabFunction; SD2_t_TabFunction)
						SET PROCESS VARIABLE:C370(CON_l_SubInfoProcess; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
						SET PROCESS VARIABLE:C370(CON_l_SubInfoProcess; SD2_l_CallingProcess; SD2_l_CallingProcess)
						POST OUTSIDE CALL:C329(CON_l_SubInfoProcess)
						SD2_t_TabFunction:=""
					End if 
					DB_l_ButtonClickedFunction:=0
				: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
					$_bo_Stop:=False:C215
					$_bo_CloseRelated:=(DB_l_ButtonClickedFunction=DB_GetButtonFunction("OK")) | (IOK=1) | (iCancel=1) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Cancel"))
					
					$_bo_SaveRelated:=(DB_l_ButtonClickedFunction=DB_GetButtonFunction("OK")) | (IOK=1)
					//$_bo_RefreshRelated:=(DB_l_ButtonClickedFunction=DB_GetButtonFunction ("Related"))
					
					If (DB_l_ButtonClickedFunction=DB_GetButtonFunction("OK")) | (IOK=1)
						
						If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
							If (Not:C34(CON_bo_Editaddress))  // use when editing an existing
								Gen_Confirm("Add Contact to "+CON_t_CompanyName+"?"; "Yes"; "No")
							Else 
								OK:=1
							End if 
							CON_bo_Editaddress:=False:C215
							If (Not:C34(OK=1))
								[CONTACTS_COMPANIES:145]Address_DateDeleted:7:=Current date:C33(*)
								[CONTACTS_COMPANIES:145]Address_Status:5:=-1
								DB_SaveRecord(->[CONTACTS_COMPANIES:145])
								If ([CONTACTS:1]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
									[CONTACTS:1]Company_Code:1:=""
									CON_t_ParentRecord:=""
								End if 
							Else 
								//bsw/ng 24/05/04 keep the one which is being saved in memory
								CON_t_NewlyAddedCompCode:=[CONTACTS_COMPANIES:145]Company_Code:1  //bsw 24/05/04
							End if 
							
							
							
							
						Else 
							
							If (CON_t_CompanyAdType#"HOME")
								If (CON_bo_CompanyDeletable)
									[CONTACTS_COMPANIES:145]Address_DateDeleted:7:=Current date:C33(*)
									[CONTACTS_COMPANIES:145]Address_Status:5:=-1
									DB_SaveRecord(->[CONTACTS_COMPANIES:145])
									If ([CONTACTS:1]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
										[CONTACTS:1]Company_Code:1:=""
										CON_t_CompanyCode:=""
										DB_SaveRecord(->[CONTACTS:1])
										
									End if 
									//DELETE RECORD([CONTACTS_COMPANIES])
									QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
									QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
									
								End if 
								
							Else 
								//entering a home address for a contact?
								If (CON_t_CompanyCode#"")
									QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=CON_t_CompanyCode)
									If (Records in selection:C76([COMPANIES:2])=0)  //just to be safe
										CREATE RECORD:C68([COMPANIES:2])
										[COMPANIES:2]Address_Line_one:3:=COM_t_AddressLine1
										[COMPANIES:2]Address_Line_two:4:=COM_t_AddressLine2
										
										[COMPANIES:2]Area:11:=CON_t_CoAreaCode
										[COMPANIES:2]Company_Code:1:=CON_t_CompanyCode
										[COMPANIES:2]Country:8:=COM_t_Country
										[COMPANIES:2]County_or_State:6:=COM_t_County
										[COMPANIES:2]Default_Currency:59:=<>SYS_t_BaseCurrency
										[COMPANIES:2]EMail_After_At:55:=[CONTACTS:1]EMail_After_At:24
										[COMPANIES:2]Email_Before_At:58:=[CONTACTS:1]Email_Before_At:30
										[COMPANIES:2]Entry_Date:16:=[CONTACTS:1]Entry_Date:17
										[COMPANIES:2]Fax:10:=CON_t_CompanyFAX
										[COMPANIES:2]Postal_Code:7:=COM_t_PostalCode
										[COMPANIES:2]Private:37:=True:C214
										[COMPANIES:2]Sales_Person:29:=[CONTACTS:1]Sales_Person:25
										[COMPANIES:2]Source:14:=[CONTACTS:1]Source:16
										[COMPANIES:2]Taken_By:26:=[CONTACTS:1]Taken_by:29
										[COMPANIES:2]Telephone:9:=CON_t_CompanyTelephone
										[COMPANIES:2]Town_or_City:5:=COM_t_Town
										[COMPANIES:2]x_ID:63:=AA_GetNextID(->[COMPANIES:2]x_ID:63)
										SAVE RECORD:C53([COMPANIES:2])
										If ([CONTACTS:1]Company_Code:1="")
											[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
											CREATE RECORD:C68([CONTACTS_COMPANIES:145])
											[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
											[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
											[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
										End if 
										[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
										[CONTACTS_COMPANIES:145]Address_Type:2:=CON_t_CompanyAdType
										DB_SaveRecord(->[CONTACTS_COMPANIES:145])
									Else 
										If ([CONTACTS:1]Company_Code:1="")
											[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
											CREATE RECORD:C68([CONTACTS_COMPANIES:145])
											[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
											[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
											[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
										End if 
										[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
										[CONTACTS_COMPANIES:145]Address_Type:2:=CON_t_CompanyAdType
										DB_SaveRecord(->[CONTACTS_COMPANIES:145])
									End if 
									
									
									
								Else 
									Gen_Alert("You must enter an address before saving")
								End if 
								
							End if 
						End if 
						
					End if 
					If ($_bo_Stop=False:C215)
						BRING TO FRONT:C326(Current process:C322)
						
						In_ButtCall("P:Contacts_InMCA:C:Contacts_InMCA"; ""; "Contacts_InDel"; ->[CONTACTS:1]; ->[CONTACTS:1]Company_Code:1; "Contacts"; "2"; "Contacts_InLPB"; "OMaster"; "Cont_Sel"; ""; ->[IDENTIFIERS:16]; ->vButtDisCon)
						If ($_bo_CloseRelated)
							If (CON_l_SubInfoProcess>0)
								$_l_ProcessState:=Process state:C330(CON_l_SubInfoProcess)
								If ($_l_ProcessState>=0)
									If ($_bo_SaveRelated)
										SET PROCESS VARIABLE:C370(CON_l_SubInfoProcess; CON_l_IPcall; 200)
									Else 
										SET PROCESS VARIABLE:C370(CON_l_SubInfoProcess; CON_l_IPcall; 201)
									End if 
									POST OUTSIDE CALL:C329(CON_l_SubInfoProcess)
								End if 
								
							End if 
						End if 
						
					End if 
					DB_l_ButtonClickedFunction:=0
			End case 
			
		Else 
			Case of 
				: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
					
					
					inButtSubHandle(FORM Get current page:C276; ->[CONTACTS:1]; WIN_t_CurrentInputForm)
					
				: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
					$_bo_CloseRelated:=(DB_l_ButtonClickedFunction=DB_GetButtonFunction("OK")) | (IOK=1) | (iCancel=1) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Cancel"))
					$_bo_RefreshRelated:=(DB_l_ButtonClickedFunction=DB_GetButtonFunction("Related"))
					$_l_CurrentFormPage:=FORM Get current page:C276
					Case of 
						: ($_l_CurrentFormPage=1)
							$_ptr_Table:=->[CONTACTS:1]
							$_ptr_ListboxSetup:=->COM_aptr_LBItemsSetup
						: (($_l_CurrentFormPage=2) | ($_l_CurrentFormPage=3))
							$_ptr_Table:=->[IDENTIFIERS:16]
							$_ptr_ListboxSetup:=->COM_aptr_LBItemsSetup
						: ($_l_CurrentFormPage=4)
							$_ptr_Table:=->[INFORMATION:55]
							$_ptr_ListboxSetup:=->QUAL_aptr_Information
						Else 
							$_ptr_Table:=->[CONTACTS:1]
							$_ptr_ListboxSetup:=->COM_aptr_LBItemsSetup
					End case 
					
					In_ButtCall("P:Companies_InLPA:C:Companies_InCan"; ""; "Companies_InDel"; ->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; "Companies"; "1"; "Companies_InLPß"; "CMaster"; "Comp_Sel"; "Companies_InTel"; $_ptr_Table; ->vButtDisCom; $_ptr_ListboxSetup)
					If ($_bo_CloseRelated)
						If (CON_l_SubInfoProcess>0)
							$_l_ProcessState:=Process state:C330(CON_l_SubInfoProcess)
							If ($_l_ProcessState>=0)
								SET PROCESS VARIABLE:C370(CON_l_SubInfoProcess; CON_l_IPcall; 200)
								POST OUTSIDE CALL:C329(CON_l_SubInfoProcess)
							End if 
							
						End if 
					End if 
					If ($_bo_RefreshRelated)
						If (CON_l_SubInfoProcess>0)
							$_l_ProcessState:=Process state:C330(CON_l_SubInfoProcess)
							If ($_l_ProcessState>=0)
								SET PROCESS VARIABLE:C370(CON_l_SubInfoProcess; CON_l_IPcall; 100)
								POST OUTSIDE CALL:C329(CON_l_SubInfoProcess)
							End if 
							
						End if 
					End if 
					
					
			End case 
			
		End if 
		
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Menu Selected:K2:14) | ($_l_Event=On Plug in Area:K2:16)
		// If (Menu selected#0)
		//  $m:=Menu selected
		// If (($m\65536)=2050)
		//   Contacts_MenV ($m)
		// End if
		// End if
		
		Case of 
			: (CO_bo_ChangeTab=True:C214)
				DB_CompanyViewsTab
				CO_bo_ChangeTab:=False:C215
			: (COM_bo_ChangeTab=True:C214)
				DB_ContactViewsTab
				COM_bo_ChangeTab:=False:C215
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[CONTACTS:1]); "Contact_In")
				End if 
				BAR_t_Button:=""
				
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
			Else 
				Contacts_InLPD
				If ($_l_Event=On Menu Selected:K2:14)
					DB_SetInputFormMenu(Table:C252(->[CONTACTS:1]); "Contact_In")
					OpenHelp(Table:C252(->[CONTACTS:1]); "Contact_In")
					If ($_bo_ContactButtons)
						If (Size of array:C274(PAL_at_PopUpMenu5)>=2)
							//NG April 2008 at the moment you can ontly delete Further analysis..
							PAL_at_PopUpMenu5{2}:="Further Analysis"
							$_t_PopupItemName:=PAL_at_PopUpMenu5{2}
							In_ButtChkDis(->vButtDisCon; "Contact"; $_t_PopupItemName)
						Else 
							ARRAY TEXT:C222(PAL_at_PopUpMenu5; 2)
							PAL_at_PopUpMenu5{1}:="Contact"
							PAL_at_PopUpMenu5{2}:="Further Analysis"
							In_ButtChkDis(->vButtDisCon; "Contact"; PAL_at_PopUpMenu5{2})
						End if 
					Else 
						If (vAccessSwNo=-1)
							vAccessSwNo:=0
						Else 
							vFromIn:=After:C31
						End if 
						In_ButtChkDis(->vButtDisCom; "Contact")
					End if 
				End if 
				
		End case 
		
		vNo2:=Records in selection:C76([CONTACTS_COMPANIES:145])-xMinus
		xMinus:=0
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		ARRAY TEXT:C222(PAL_at_PopUpMenu5; 0)
		OpenHelp(Table:C252(->[CONTACTS:1]); "Contact_In")
		COM_t_AddressLine1:=""
		COM_t_AddressLine2:=""
		COM_t_Town:=""
		COM_t_County:=""
		COM_t_PostalCode:=""
		COM_t_Country:=""
		CON_t_CompanyAdType:=""
		
		ARRAY TEXT:C222(CON_at_ContactTab; 2)
		ARRAY LONGINT:C221(CON_al_ContactTabPage; 2)
		OBJECT SET FONT STYLE:C166(CON_at_ContactTab; 1)
		OBJECT SET FONT SIZE:C165(CON_at_ContactTab; 10)
		CON_al_ContactTabPage{1}:=1
		CON_al_ContactTabPage{2}:=2
		CON_at_ContactTab{1}:=" Address"
		CON_at_ContactTab{2}:="Further Analysis"
		CON_at_ContactTab:=1
		Contacts_InLPB($_bo_LoadCompanies)
		
		
		If ([CONTACTS:1]Company_Code:1#"")
			cb_3:=1
		Else 
			cb_3:=0
		End if 
		
		If (cb_3=1) | (True:C214)
			TRACE:C157
			
			OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; (cb_3=1))
			
			OBJECT SET VISIBLE:C603(*; "oCompanyName@"; (cb_3=1))
			
			OBJECT SET VISIBLE:C603(*; "oContactAddress"; (cb_3=1))
			
			OBJECT SET VISIBLE:C603(*; "oCONCompanyTel"; (cb_3=1))
			
			OBJECT SET VISIBLE:C603(*; "oCONCompanyFAX"; (cb_3=1))
			//OBJECT SET VISIBLE(*;"oCompanyNamesDropsDown";True)
			//OBJECT SET VISIBLE(*;"oCompanyName";True)
			
			
			
			//SET VISIBLE(BDeleteCompany;True)
			CON_bo_CompanyDeletable:=True:C214
			OBJECT SET VISIBLE:C603(*; "oCON_Company@"; (Not:C34(cb_3=1)))
			OBJECT SET VISIBLE:C603(*; "oCONCompany@"; (Not:C34(cb_3=1)))
			OBJECT SET VISIBLE:C603(*; "oCON_Sub@"; (cb_3=1))
			OBJECT SET VISIBLE:C603(*; "oContactAddress@"; (cb_3=1))
			
		Else 
			
			If (False:C215)
				OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oCompanyName"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oContactAddress"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oCONCompanyTel"; False:C215)
				If ([CONTACTS:1]Company_Code:1#"")
					OBJECT SET VISIBLE:C603(*; "oCONCompanyFAX"; False:C215)
				End if 
				//SET VISIBLE(BDeleteCompany;False)
				CON_bo_CompanyDeletable:=False:C215
				ARRAY TEXT:C222(CON_at_AddressTypes; 0)
				CON_GetAdressTypes(->CON_at_AddressTypes)
				
				OBJECT SET VISIBLE:C603(*; "oCON_Company@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCONCompany@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCON_Sub@"; False:C215)
				
			End if 
		End if 
		
		WS_KeepFocus
		If ([CONTACTS:1]Contact_Name:31#"")
			GOTO OBJECT:C206([CONTACTS:1]Comments:10)
		Else 
			GOTO OBJECT:C206([CONTACTS:1]Contact_Name:31)
		End if 
		If (Old:C35([CONTACTS:1]Contact_Code:2)#"")
			OBJECT SET ENTERABLE:C238([CONTACTS:1]Contact_Code:2; False:C215)
		End if 
		If ($_bo_ContactButtons)
			If (Size of array:C274(PAL_at_PopUpMenu5)>=2)
				//NG April 2008 at the moment you can ontly delete Further analysis..
				PAL_at_PopUpMenu5{2}:="Further Analysis"
				$_t_PopupItemName:=PAL_at_PopUpMenu5{2}
				In_ButtChkDis(->vButtDisCon; "Contact"; $_t_PopupItemName)
			Else 
				ARRAY TEXT:C222(PAL_at_PopUpMenu5; 2)
				PAL_at_PopUpMenu5{1}:="Contact"
				PAL_at_PopUpMenu5{2}:="Further Analysis"
				In_ButtChkDis(->vButtDisCon; "Contact"; PAL_at_PopUpMenu5{2})
				
			End if 
		Else 
			If (vAccessSwNo=-1)
				vAccessSwNo:=0
			Else 
				vFromIn:=After:C31
			End if 
			
			In_ButtChkDis(->vButtDisCom; "Contact")
			
		End if 
		DB_SetInputFormMenu(Table:C252(->[CONTACTS:1]); "Contact_In")
		If (Records in selection:C76([CONTACTS:1])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		INT_SetInput(Table:C252(->[CONTACTS:1]); WIN_t_CurrentInputForm)
		
		
	: ($_l_Event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Contacts_InLP"; $_t_oldMethodName)
