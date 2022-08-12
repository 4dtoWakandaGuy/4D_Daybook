If (False:C215)
	//Table Form Method Name: Object Name:      [USER].CCM_Prefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/06/2012 21:32
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CCM_abo_AuthActive;0)
	//ARRAY LONGINT(CCM_al_AuthorizationProviders;0)
	//ARRAY LONGINT(CCM_al_AuthProvidorID;0)
	//ARRAY LONGINT(CCM_al_reconcileTime;0)
	//ARRAY LONGINT(CCM_al_TestMode;0)
	//ARRAY LONGINT(CCM_al_Services;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY TEXT(CCM_at_AuthIDs;0)
	//ARRAY TEXT(CCM_at_AuthLogins;0)
	//ARRAY TEXT(CCM_at_AuthNames;0)
	//ARRAY TEXT(CCM_at_AuthorizationProvider;0)
	//ARRAY TEXT(CCM_at_AuthPasswords;0)
	//ARRAY TEXT(CCM_at_AuthProviderName;0)
	//ARRAY TEXT(DB_at_ModuleMenuNames;0)
	//ARRAY TEXT(DB_at_ModuleMenuReferences;0)
	C_BOOLEAN:C305(<>CCM_bo_CompanyCards; <>CCM_bo_Inited; <>CCM_bo_UseCoRef; CCM_bo_CardDecode; CCM_bo_CardLog; CCM_bo_CompanyCards; CCM_bo_IsLicenced; CCM_bo_useAVS; CCM_bo_UseCoRef; CCM_bo_useCV2; DB_bo_NoLoad)
	C_BOOLEAN:C305(PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_AddedItemID; $_l_ArraySize; $_l_ButtonFunction; $_l_ButtonNumber; $_l_CurrentElement; $_l_event; $_l_Index; $_l_ListID; $_l_MenuCount; $_l_ModulePostion; $_l_ProviderPostion)
	C_LONGINT:C283(BCreateLicence; BenterLicence; CC_l_AuthActive; CCM_l_AllowCOmpany; CCM_l_AllowDecode; CCM_l_AuthorizationProvider; CCM_l_AuthServiceID; CCM_l_LogDecodes; CCM_l_RunTest; CCM_l_useAVS; CCM_l_useCompanyReference)
	C_LONGINT:C283(CCM_l_useSecurity; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iOK; ModuleNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; CCM_t_EmailAddress; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID; CCM_t_AuthorizationProvider; CCM_t_AuthorizationService; DB_t_CUrrentMenuReference; PAL_BUTTON)
	C_TEXT:C284(vButtDisCCM)
	C_TIME:C306(CCM_ti_ReconcileTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].CCM_Prefs"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		If (Not:C34(<>CCM_bo_Inited))
			CCM_InitCreditCardModule
		End if 
		//OpenHelp (Table(->[USER]);"CCM_Prefs")
		WS_AutoscreenSize(3; 440; 736)
		
		ARRAY LONGINT:C221(CCM_al_Services; 0)
		ARRAY TEXT:C222(CCM_at_AuthNames; 0)
		ARRAY TEXT:C222(CCM_at_AuthorizationProvider; 0)
		ARRAY LONGINT:C221(CCM_al_AuthorizationProviders; 0)
		$_l_ListID:=AA_LoadListByName("Authorization Services V11"; ->CCM_At_AuthorizationProvider; ->CCM_al_AuthorizationProviders; False:C215)
		If (Size of array:C274(CCM_al_AuthorizationProviders)=0)
			$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Transax")  //as at the moment-just the one provider for V11
			//"Planet Payment";"e-Xact";"Link Point";"Worldpay";"ION Gate";"Firepay";"Surepay")
			$_l_ListID:=AA_LoadListByName("Authorization Services V11"; ->CCM_At_AuthorizationProvider; ->CCM_al_AuthorizationProviders; False:C215)
		End if 
		$_l_ProviderPostion:=Find in array:C230(CCM_At_AuthorizationProvider; "Authorize Net")
		If ($_l_ProviderPostion<0)
			$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Authorize Net")  //as at the moment-just the one provider for V11
			//"Planet Payment";"e-Xact";"Link Point";"Worldpay";"ION Gate";"Firepay";"Surepay")
			$_l_ListID:=AA_LoadListByName("Authorization Services V11"; ->CCM_At_AuthorizationProvider; ->CCM_al_AuthorizationProviders; False:C215)
		End if 
		If (True:C214)
			$_l_ProviderPostion:=Find in array:C230(CCM_At_AuthorizationProvider; "Paypal")
			If ($_l_ProviderPostion<0)
				$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Paypal")  // as at the moment-just the one provider for V11
				// "Planet Payment";"e-Xact";"Link Point";"Worldpay";"ION Gate";"Firepay";"Surepay")
				$_l_ListID:=AA_LoadListByName("Authorization Services V11"; ->CCM_At_AuthorizationProvider; ->CCM_al_AuthorizationProviders; False:C215)
			End if 
		End if 
		
		OBJECT SET VISIBLE:C603(CCM_At_AuthorizationProvider; False:C215)
		OBJECT SET VISIBLE:C603(*; "oTextLicenced"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oTextNotLicenced"; False:C215)
		
		CCM_LoadServiceProvidersV11(True:C214)
		CCM_l_AllowCOmpany:=Num:C11(CCM_bo_CompanyCards)
		CCM_l_useSecurity:=Num:C11(CCM_bo_useCV2)
		CCM_l_useAVS:=Num:C11(CCM_bo_useAVS)
		CCM_l_AllowDecode:=Num:C11(CCM_bo_CardDecode)
		CCM_l_LogDecodes:=Num:C11(CCM_bo_CardLog)
		If (CCM_l_AllowDecode=0)
			
			OBJECT SET VISIBLE:C603(CCM_l_LogDecodes; False:C215)
			OBJECT SET VISIBLE:C603(*; "oEmailLabel"; False:C215)
			OBJECT SET VISIBLE:C603(CCM_t_EmailAddress; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(CCM_l_LogDecodes; True:C214)
			OBJECT SET VISIBLE:C603(*; "oEmailLabel"; True:C214)
			If (CCM_l_LogDecodes=1)
				OBJECT SET VISIBLE:C603(*; "oEmailLabel"; True:C214)
				OBJECT SET VISIBLE:C603(CCM_t_EmailAddress; True:C214)
			End if 
		End if 
		
		CCM_l_useCompanyReference:=Num:C11(CCM_bo_UseCoRef)
		If (CCM_l_AllowCOmpany=0)
			OBJECT SET VISIBLE:C603(CCM_l_useCompanyReference; False:C215)
		End if 
		If (Current user:C182#"Designer")  //| (True)
			
			OBJECT SET VISIBLE:C603(BCreateLicence; False:C215)
		End if 
		
		If (CCM_bo_IsLicenced)
			OBJECT SET VISIBLE:C603(*; "oTextLicenced"; True:C214)
			OBJECT SET VISIBLE:C603(BenterLicence; False:C215)
			
		Else 
			OBJECT SET VISIBLE:C603(*; "oTextNotLicenced"; True:C214)
		End if 
		
		
		CCM_l_AuthServiceID:=0
		WS_GETPALLETEBUTTONS
		INT_SetDialog
		vButtDisCCM:="A DPMONPFSSSRCADT"
		Input_Buttons(->[USER:15]; ->vButtDisCCM)
		In_ButtChkDis(->vButtDisCCM)
		DB_t_CUrrentMenuReference:=Get menu bar reference:C979
		$_l_MenuCount:=Count menu items:C405(DB_t_CUrrentMenuReference)
		
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentMenuReference; $_l_MenuCount+1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
				$_l_MenuCount:=$_l_MenuCount+1
			End for 
		End if 
	: ($_l_event=On Activate:K2:9)
		OpenHelp(Table:C252(->[USER:15]); "CCM_Prefs")
		In_ButtChkDis(->vButtDisCCM)
		INT_SetDialog
	: ($_l_event=On Resize:K2:27)
		INT_SetDialog
	: ($_l_event=On Outside Call:K2:11)
		$_l_ButtonFunction:=DB_l_ButtonClickedFunction
		Case of 
			: (($_l_ButtonFunction=DB_GetButtonFunction("OK")) | (iOK=1))
				Case of 
					: (CCM_l_AuthServiceID=-1)  // adding a new one
						If (CCM_t_AuthorizationProvider#"")
							Gen_Confirm("Save Data for "+CCM_t_AuthorizationProvider+" ?"; "Yes"; "No")
							If (OK=1)
								If (CCM_t_AuthorizationService="")
									CCM_t_AuthorizationService:=CCM_t_AuthorizationProvider
								End if 
								$_l_CurrentElement:=0
								For ($_l_Index; 1; Size of array:C274(CCM_at_AuthNames))
									If (Position:C15(CCM_t_AuthorizationService; CCM_at_AuthNames{$_l_Index})>0)
										$_l_CurrentElement:=$_l_CurrentElement+1
									End if 
								End for 
								If ($_l_CurrentElement#0)
									CCM_t_AuthorizationService:=CCM_t_AuthorizationService+"_"+String:C10($_l_CurrentElement)
								End if 
								$_l_ArraySize:=Size of array:C274(CCM_abo_AuthActive)+1
								INSERT IN ARRAY:C227(CCM_abo_AuthActive; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(CCM_al_Services; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(CCM_at_AuthNames; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(CCM_at_AuthProviderName; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(CCM_al_AuthProvidorID; $_l_ArraySize; 1)  //m the list item id
								INSERT IN ARRAY:C227(CCM_at_AuthLogins; $_l_ArraySize; 1)  //Not used with all providers
								INSERT IN ARRAY:C227(CCM_at_AuthPasswords; $_l_ArraySize; 1)  //Not used with all providers
								INSERT IN ARRAY:C227(CCM_at_AuthIDs; $_l_ArraySize; 1)  //Not used with all providers
								INSERT IN ARRAY:C227(CCM_al_TestMode; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(CCM_al_reconcileTime; $_l_ArraySize; 1)
								CCM_abo_AuthActive{$_l_ArraySize}:=(CC_l_AuthActive=1)
								CCM_al_Services{$_l_ArraySize}:=AA_GetNextID(->CCM_l_AuthServiceID)
								CCM_at_AuthNames{$_l_ArraySize}:=CCM_t_AuthorizationService
								CCM_at_AuthProviderName{$_l_ArraySize}:=CCM_t_AuthorizationProvider
								CCM_al_AuthProvidorID{$_l_ArraySize}:=CCM_l_AuthorizationProvider
								CCM_at_AuthLogins{$_l_ArraySize}:=CCM_t_AuthorizationLogin
								CCM_at_AuthPasswords{$_l_ArraySize}:=CCM_t_AuthorizationPass
								CCM_at_AuthIDs{$_l_ArraySize}:=CCM_t_AuthorizationPassID
								CCM_al_TestMode{$_l_ArraySize}:=CCM_l_RunTest
								CCM_al_reconcileTime{$_l_ArraySize}:=CCM_ti_ReconcileTime*1
							End if 
						Else 
							//nothing was entered so ignoring it
						End if 
						
					: (CCM_l_AuthServiceID>0)
						//Viewing one
						$_l_ProviderPostion:=Find in array:C230(CCM_al_Services; CCM_l_AuthServiceID)
						CCM_abo_AuthActive{$_l_ProviderPostion}:=(CC_l_AuthActive=1)
						CCM_at_AuthNames{$_l_ProviderPostion}:=CCM_t_AuthorizationService
						CCM_at_AuthProviderName{$_l_ProviderPostion}:=CCM_t_AuthorizationProvider
						CCM_al_AuthProvidorID{$_l_ProviderPostion}:=CCM_l_AuthorizationProvider
						CCM_at_AuthLogins{$_l_ProviderPostion}:=CCM_t_AuthorizationLogin
						CCM_at_AuthPasswords{$_l_ProviderPostion}:=CCM_t_AuthorizationPass
						CCM_at_AuthIDs{$_l_ProviderPostion}:=CCM_t_AuthorizationPassID
						CCM_al_reconcileTime{$_l_ProviderPostion}:=CCM_ti_ReconcileTime*1
				End case 
				CCM_LoadServiceProvidersV11
				If (CCM_bo_COMPANYCARDS#<>CCM_bo_CompanyCards)
					Gen_Alert("Note: The change to company card preference will not be implemented for other use"+"rs till they next log in")
					
				End if 
				<>CCM_bo_CompanyCards:=CCM_bo_CompanyCards
				<>CCM_bo_UseCoRef:=CCM_bo_UseCoRef
				CANCEL:C270
				
			Else 
				CANCEL:C270
		End case 
		DB_l_ButtonClickedFunction:=0
	: ($_l_event=On Clicked:K2:4)
		If (PAL_BUTTON#"")
			$_t_PalletButtonName:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_PalletButtonName)
			PAL_bo_ButtonSubFunction:=False:C215
		Else 
			If (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModulePostion:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					SET MENU BAR:C67(9)
					
					DB_SetBrowserBarSelection($_l_ModulePostion; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_t_CUrrentMenuReference:=Get menu bar reference:C979
					$_l_MenuCount:=Count menu items:C405(DB_t_CUrrentMenuReference)
					
					If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
						For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
							INSERT MENU ITEM:C412(DB_t_CUrrentMenuReference; $_l_MenuCount+1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
							$_l_MenuCount:=$_l_MenuCount+1
						End for 
					End if 
				End if 
				BAR_t_Button:=""
				
				
			End if 
			
		End if 
End case 
ERR_MethodTrackerReturn("FM:CCM_Prefs"; $_t_oldMethodName)
