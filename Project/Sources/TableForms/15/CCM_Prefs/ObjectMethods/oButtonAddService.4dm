If (False:C215)
	//object Method Name: Object Name:      [USER].CCM_Prefs.Variable17
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/07/2012 16:16
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
	//ARRAY TEXT(CCM_At_AuthorizationProvider;0)
	//ARRAY TEXT(CCM_at_AuthPasswords;0)
	//ARRAY TEXT(CCM_at_AuthProviderName;0)
	C_LONGINT:C283($_l_AuthIndex; $_l_AuthRow; $_l_CurrentFormPage; $_l_CurrentRow; $_l_SizeofArray; Badd; CC_l_AuthActive; CCM_l_AuthorizationProvider; CCM_l_AuthServiceID; CCM_l_RunTest)
	C_TEXT:C284($_t_oldMethodName; CCM_T_AuthorizationLogin; CCM_T_AuthorizationPass; CCM_T_AuthorizationPassID; CCM_t_AuthorizationProvider; CCM_t_AuthorizationService)
	C_TIME:C306(CCM_ti_ReconcileTime)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER]CCM_Prefs.Variable17"; Form event code:C388)

If (Form event code:C388=On Clicked:K2:4)
	//TRACE
End if 

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_Prefs.Variable17"; Form event code:C388)
$_l_CurrentFormPage:=FORM Get current page:C276
Case of 
	: ($_l_CurrentFormPage=1)
		//Button is add
		CCM_l_AuthServiceID:=-1
		CC_l_AuthActive:=Num:C11(CCM_abo_AuthActive{0})
		CCM_t_AuthorizationService:=CCM_at_AuthNames{0}
		CCM_t_AuthorizationProvider:=CCM_at_AuthProviderName{0}
		CCM_l_AuthorizationProvider:=CCM_al_AuthProvidorID{0}
		CCM_T_AuthorizationLogin:=CCM_at_AuthLogins{0}
		CCM_T_AuthorizationPass:=CCM_at_AuthPasswords{0}
		CCM_T_AuthorizationPassID:=CCM_at_AuthIDs{0}
		CCM_l_RunTest:=0
		OBJECT SET VISIBLE:C603(CCM_At_AuthorizationProvider; True:C214)
		OBJECT SET ENTERABLE:C238(CCM_t_AuthorizationService; True:C214)
		
	Else 
		//button is save
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
							CCM_at_AuthLogins{$_l_SizeofArray}:=CCM_T_AuthorizationLogin
							CCM_at_AuthPasswords{$_l_SizeofArray}:=CCM_T_AuthorizationPass
							CCM_at_AuthIDs{$_l_SizeofArray}:=CCM_T_AuthorizationPassID
							CCM_al_TestMode{$_l_SizeofArray}:=CCM_l_RunTest
							CCM_al_reconcileTime{$_l_SizeofArray}:=CCM_ti_ReconcileTime*1
							OBJECT SET ENTERABLE:C238(CCM_t_AuthorizationService; False:C215)
							
						End if 
					Else 
						//nothing was entered so ignoring it
					End if 
					
				: (CCM_l_AuthServiceID>0)
					//Viewing one
					$_l_AuthRow:=Find in array:C230(CCM_al_Services; CCM_l_AuthServiceID)
					CCM_abo_AuthActive{$_l_AuthRow}:=(CC_l_AuthActive=1)
					CCM_at_AuthNames{$_l_AuthRow}:=CCM_t_AuthorizationService
					CCM_at_AuthProviderName{$_l_AuthRow}:=CCM_t_AuthorizationProvider
					CCM_al_AuthProvidorID{$_l_AuthRow}:=CCM_l_AuthorizationProvider
					CCM_at_AuthLogins{$_l_AuthRow}:=CCM_T_AuthorizationLogin
					CCM_at_AuthPasswords{$_l_AuthRow}:=CCM_T_AuthorizationPass
					CCM_at_AuthIDs{$_l_AuthRow}:=CCM_t_AuthorizationPassID
					
					
					CCM_al_TestMode{$_l_AuthRow}:=CCM_l_RunTest
					CCM_al_reconcileTime{$_l_AuthRow}:=CCM_ti_ReconcileTime*1
			End case 
			CCM_l_AuthServiceID:=0
			CC_l_AuthActive:=Num:C11(CCM_abo_AuthActive{0})
			CCM_t_AuthorizationService:=CCM_at_AuthNames{0}
			CCM_t_AuthorizationProvider:=CCM_at_AuthProviderName{0}
			CCM_l_AuthorizationProvider:=CCM_al_AuthProvidorID{0}
			CCM_T_AuthorizationLogin:=CCM_at_AuthLogins{0}
			CCM_T_AuthorizationPass:=CCM_at_AuthPasswords{0}
			CCM_t_AuthorizationPassID:=CCM_at_AuthIDs{0}
			
			CCM_ti_ReconcileTime:=?00:00:00?
			CCM_l_RunTest:=0
			CC_l_AuthActive:=1
		End if 
		
		
		OBJECT SET TITLE:C194(Badd; "Add Service")
		FORM GOTO PAGE:C247(1)
		OBJECT SET VISIBLE:C603(CCM_At_AuthorizationProvider; False:C215)
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].CCM_Prefs.Variable17"; $_t_oldMethodName)
