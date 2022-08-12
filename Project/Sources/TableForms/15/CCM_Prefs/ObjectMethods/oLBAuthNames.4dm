If (False:C215)
	//object Method Name: Object Name:      [USER].CCM_Prefs.oLBAuthNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/11/2012 09:24
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CCM_abo_AuthActive;0)
	//ARRAY LONGINT(CCM_al_AuthProvidorID;0)
	//ARRAY LONGINT(CCM_al_reconcileTime;0)
	//ARRAY LONGINT(CCM_al_Services;0)
	//ARRAY LONGINT(CCM_al_TestMode;0)
	//ARRAY TEXT(CCM_at_AuthIDs;0)
	//ARRAY TEXT(CCM_at_AuthLogins;0)
	//ARRAY TEXT(CCM_at_AuthNames;0)
	//ARRAY TEXT(CCM_at_AuthorizationProvider;0)
	//ARRAY TEXT(CCM_at_AuthPasswords;0)
	//ARRAY TEXT(CCM_at_AuthProviderName;0)
	C_LONGINT:C283($_l_AuthIndex; $_l_CurrentRow; $_l_event; $_l_Row; $_l_SelectedRow; $_l_ServiceRow; $_l_SizeofArray; Badd; CC_l_AuthActive; CCM_but_ShowCredentials; CCM_but_ShowLogin)
	C_LONGINT:C283(CCM_but_ShowPassword; CCM_l_AuthorizationProvider; CCM_l_AuthServiceID; CCM_l_RunTest)
	C_TEXT:C284($_t_oldMethodName; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID; CCM_t_AuthorizationProvider; CCM_t_AuthorizationService; CCM_t_WebLink)
	C_TIME:C306(CCM_ti_ReconcileTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_Prefs.oLBAuthNames"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			$_l_SelectedRow:=$_l_Row
			If (CCM_l_AuthServiceID#0)
				Case of 
					: (CCM_l_AuthServiceID=-1)  // adding a new one
						If (CCM_t_AuthorizationProvider#"")
							Gen_Confirm("Save Data for "+CCM_t_AuthorizationProvider+" ?"; "Yes"; "No")
							If (OK=1)
								If (CCM_t_AuthorizationService="")
									CCM_t_AuthorizationService:=CCM_t_AuthorizationProvider
								End if 
								$_l_CurrentRow:=0
								For ($_l_AuthIndex; 1; Size of array:C274(CCM_at_AuthNames))
									If (Position:C15(CCM_t_AuthorizationService; CCM_at_AuthNames{$_l_AuthIndex})>0)
										$_l_CurrentRow:=$_l_CurrentRow+1
									End if 
								End for 
								If ($_l_CurrentRow#0)
									CCM_t_AuthorizationService:=CCM_t_AuthorizationService+"_"+String:C10($_l_CurrentRow)
								End if 
								$_l_SizeofArray:=Size of array:C274(CCM_abo_AuthActive)+1
								INSERT IN ARRAY:C227(CCM_abo_AuthActive; $_l_SizeofArray; 1)
								INSERT IN ARRAY:C227(CCM_al_Services; $_l_SizeofArray; 1)
								INSERT IN ARRAY:C227(CCM_at_AuthNames; $_l_SizeofArray; 1)
								INSERT IN ARRAY:C227(CCM_at_AuthProviderName; $_l_SizeofArray; 1)
								INSERT IN ARRAY:C227(CCM_al_AuthProvidorID; $_l_SizeofArray; 1)  //m the list item id
								INSERT IN ARRAY:C227(CCM_at_AuthLogins; $_l_SizeofArray; 1)  //Not used with all providers
								INSERT IN ARRAY:C227(CCM_at_AuthPasswords; $_l_SizeofArray; 1)  //Not used with all providers
								INSERT IN ARRAY:C227(CCM_at_AuthIDs; $_l_SizeofArray; 1)  //Not used with all providers
								INSERT IN ARRAY:C227(CCM_al_TestMode; $_l_SizeofArray; 1)
								INSERT IN ARRAY:C227(CCM_al_reconcileTime; $_l_SizeofArray; 1)
								CCM_abo_AuthActive{$_l_SizeofArray}:=(CC_l_AuthActive=1)
								CCM_al_Services{$_l_SizeofArray}:=AA_GetNextID(->CCM_l_AuthServiceID)
								CCM_at_AuthNames{$_l_SizeofArray}:=CCM_t_AuthorizationService
								CCM_at_AuthProviderName{$_l_SizeofArray}:=CCM_t_AuthorizationProvider
								CCM_al_AuthProvidorID{$_l_SizeofArray}:=CCM_l_AuthorizationProvider
								CCM_at_AuthLogins{$_l_SizeofArray}:=CCM_t_AuthorizationLogin
								CCM_at_AuthPasswords{$_l_SizeofArray}:=CCM_t_AuthorizationPass
								CCM_at_AuthIDs{$_l_SizeofArray}:=CCM_t_AuthorizationPassID
								CCM_al_TestMode{$_l_SizeofArray}:=CCM_l_RunTest
								CCM_al_reconcileTime{$_l_SizeofArray}:=CCM_ti_ReconcileTime*1
							End if 
						Else 
							//nothing was entered so ignoring it
						End if 
						
					: (CCM_l_AuthServiceID>0)
						//Viewing one
						$_l_ServiceRow:=Find in array:C230(CCM_al_Services; CCM_l_AuthServiceID)
						CCM_abo_AuthActive{$_l_ServiceRow}:=(CC_l_AuthActive=1)
						CCM_at_AuthNames{$_l_ServiceRow}:=CCM_t_AuthorizationService
						CCM_at_AuthProviderName{$_l_ServiceRow}:=CCM_t_AuthorizationProvider
						CCM_al_AuthProvidorID{$_l_ServiceRow}:=CCM_l_AuthorizationProvider
						CCM_at_AuthLogins{$_l_ServiceRow}:=CCM_t_AuthorizationLogin
						CCM_at_AuthPasswords{$_l_ServiceRow}:=CCM_t_AuthorizationPass
						CCM_at_AuthIDs{$_l_ServiceRow}:=CCM_t_AuthorizationPassID
						CCM_al_TestMode{$_l_ServiceRow}:=CCM_l_RunTest
						CCM_al_reconcileTime{$_l_ServiceRow}:=CCM_ti_ReconcileTime*1
				End case 
				CCM_l_AuthServiceID:=0
				CC_l_AuthActive:=Num:C11(CCM_abo_AuthActive{0})
				CCM_t_AuthorizationService:=CCM_at_AuthNames{0}
				CCM_t_AuthorizationProvider:=CCM_at_AuthProviderName{0}
				CCM_l_AuthorizationProvider:=CCM_al_AuthProvidorID{0}
				CCM_t_AuthorizationLogin:=CCM_at_AuthLogins{0}
				CCM_t_AuthorizationPass:=CCM_at_AuthPasswords{0}
				CCM_t_AuthorizationPassID:=CCM_at_AuthIDs{0}
				CCM_ti_ReconcileTime:=?00:00:00?
				CCM_l_RunTest:=0
				
				
			End if 
			
			CCM_at_AuthNames:=$_l_SelectedRow
			CCM_l_AuthServiceID:=CCM_al_Services{$_l_Row}
			CC_l_AuthActive:=Num:C11(CCM_abo_AuthActive{$_l_Row})
			CCM_t_AuthorizationService:=CCM_at_AuthNames{$_l_Row}
			CCM_t_AuthorizationProvider:=CCM_at_AuthProviderName{$_l_Row}
			CCM_l_AuthorizationProvider:=CCM_al_AuthProvidorID{$_l_Row}
			CCM_t_AuthorizationLogin:=CCM_at_AuthLogins{$_l_Row}
			CCM_t_AuthorizationPass:=CCM_at_AuthPasswords{$_l_Row}
			CCM_t_AuthorizationPassID:=CCM_at_AuthIDs{$_l_Row}
			CCM_l_RunTest:=CCM_al_TestMode{$_l_Row}
			CCM_ti_ReconcileTime:=Time:C179(Time string:C180(CCM_al_reconcileTime{$_l_Row}))
			
			Case of 
				: (CCM_t_AuthorizationProvider="Authorize Net")
					CCM_t_WebLink:="www.authorizenet.com"
					
					If (CCM_t_AuthorizationLogin#"")
						OBJECT SET VISIBLE:C603(CCM_t_AuthorizationLogin; False:C215)
						OBJECT SET VISIBLE:C603(CCM_but_ShowLogin; True:C214)
					Else 
						OBJECT SET VISIBLE:C603(CCM_t_AuthorizationLogin; True:C214)
						OBJECT SET VISIBLE:C603(CCM_but_ShowLogin; False:C215)
					End if 
					If (CCM_t_AuthorizationLogin#"")
						OBJECT SET VISIBLE:C603(CCM_t_AuthorizationPass; False:C215)
						OBJECT SET VISIBLE:C603(CCM_but_ShowPassword; True:C214)
					Else 
						OBJECT SET VISIBLE:C603(CCM_t_AuthorizationPass; True:C214)
						OBJECT SET VISIBLE:C603(CCM_but_ShowPassword; False:C215)
					End if 
					
					FORM GOTO PAGE:C247(2)
					OBJECT SET TITLE:C194(Badd; "Save Service")
				: (CCM_t_AuthorizationProvider="Paypal")
					CCM_t_WebLink:="www.paypal.com"
					If (CCM_t_AuthorizationLogin#"")
						OBJECT SET VISIBLE:C603(CCM_t_AuthorizationLogin; False:C215)
						OBJECT SET VISIBLE:C603(CCM_but_ShowPassword; True:C214)
					Else 
						OBJECT SET VISIBLE:C603(CCM_t_AuthorizationLogin; True:C214)
						OBJECT SET VISIBLE:C603(CCM_but_ShowPassword; False:C215)
					End if 
					If (CCM_t_AuthorizationPass#"")
						OBJECT SET VISIBLE:C603(CCM_t_AuthorizationPass; False:C215)
						OBJECT SET VISIBLE:C603(CCM_but_ShowLogin; True:C214)
					Else 
						OBJECT SET VISIBLE:C603(CCM_t_AuthorizationPass; True:C214)
						OBJECT SET VISIBLE:C603(CCM_but_ShowLogin; False:C215)
					End if 
					If (CCM_t_AuthorizationPassID#"")
						OBJECT SET VISIBLE:C603(CCM_t_AuthorizationPassID; False:C215)
						OBJECT SET VISIBLE:C603(CCM_but_ShowCredentials; True:C214)
					Else 
						OBJECT SET VISIBLE:C603(CCM_t_AuthorizationPassID; True:C214)
						OBJECT SET VISIBLE:C603(CCM_but_ShowCredentials; False:C215)
					End if 
					
					
					FORM GOTO PAGE:C247(10)
					OBJECT SET TITLE:C194(Badd; "Save Service")
				: (CCM_t_AuthorizationProvider="Planet Payment")
					CCM_t_WebLink:="www.planetpayment.com"
					FORM GOTO PAGE:C247(5)
					OBJECT SET TITLE:C194(Badd; "Save Service")
				: (CCM_t_AuthorizationProvider="e-xact")
					CCM_t_WebLink:="www.e-xact.com"
					FORM GOTO PAGE:C247(3)
					OBJECT SET TITLE:C194(Badd; "Save Service")
				: (CCM_t_AuthorizationProvider="Link Point")
					CCM_t_WebLink:="www.linkpoint.com"
					FORM GOTO PAGE:C247(6)
					OBJECT SET TITLE:C194(Badd; "Save Service")
				: (CCM_t_AuthorizationProvider="Worldpay")
					CCM_t_WebLink:="www.worldpay.com"
					FORM GOTO PAGE:C247(7)
					OBJECT SET TITLE:C194(Badd; "Save Service")
				: (CCM_t_AuthorizationProvider="ION Gate")
					CCM_t_WebLink:="www.iongate.com"
					FORM GOTO PAGE:C247(8)
					OBJECT SET TITLE:C194(Badd; "Save Service")
				: (CCM_t_AuthorizationProvider="Firepay")
					CCM_t_WebLink:="wwwfirepay.com"
					FORM GOTO PAGE:C247(4)
					OBJECT SET TITLE:C194(Badd; "Save Service")
				: (CCM_t_AuthorizationProvider="Surepay")
					CCM_t_WebLink:="wwwsurepay.com"
					FORM GOTO PAGE:C247(9)
					OBJECT SET TITLE:C194(Badd; "Save Service")
			End case 
			OBJECT SET ENTERABLE:C238(CCM_t_AuthorizationService; True:C214)
			OBJECT SET VISIBLE:C603(CCM_At_AuthorizationProvider; False:C215)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].CCM_Prefs.oLBAuthNames"; $_t_oldMethodName)
