//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_ClosePrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:32
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
	//ARRAY LONGINT(CCM_al_TestMode;0)
	//ARRAY LONGINT(CCM_al_Services;0)
	//ARRAY TEXT(CCM_at_AuthIDs;0)
	//ARRAY TEXT(CCM_at_AuthLogins;0)
	//ARRAY TEXT(CCM_at_AuthNames;0)
	//ARRAY TEXT(CCM_at_AuthPasswords;0)
	//ARRAY TEXT(CCM_at_AuthProviderName;0)
	C_BOOLEAN:C305(<>CCM_bo_CompanyCards; <>CCM_bo_UseCoRef; $_bo_Cancel; $_bo_Save)
	C_LONGINT:C283($_l_ArraySize; $_l_AuthServiceRow; $_l_Index; $_l_OK; $_l_ScreenCentre; $_l_CurrentWinRefOLD; CC_l_AuthActive; CCM_l_AuthorizationProvider; CCM_l_AuthServiceID; CCM_l_RunTest; WIN_l_CurrentWinRef)
	C_LONGINT:C283(WIN_l_CurrentWinRefOLD; AA_l_CurrentListiD; xDelete)
	C_TEXT:C284($_t_oldMethodName; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID; CCM_t_AuthorizationProvider; CCM_t_AuthorizationService; UTI_t_CloseMessage; vConfirm)
	C_TIME:C306(CCM_ti_ReconcileTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_ClosePrefs")
UTI_t_CloseMessage:="Do you want to save the changes?"
$_l_ScreenCentre:=Screen width:C187/2
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentre-182; 80; $_l_ScreenCentre+182; 175)
DIALOG:C40([COMPANIES:2]; "dClose")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
$_bo_Save:=False:C215
$_bo_Cancel:=False:C215
If (OK=1)
	$_bo_Save:=True:C214
Else 
	If (xDelete=1)
		//In V6 at least the form eve
		$_bo_Cancel:=True:C214
		
	End if 
End if 
If ($_bo_Save) | ($_bo_Cancel)
	If ($_bo_Save)
		$_l_OK:=0
		Case of 
			: (CCM_l_AuthServiceID=-1)  // adding a new one
				If (CCM_t_AuthorizationProvider#"")
					Gen_Confirm("Save Data for "+CCM_t_AuthorizationProvider+" ?"; "Yes"; "No")
					If (OK=1)
						If (CCM_t_AuthorizationService="")
							CCM_t_AuthorizationService:=CCM_t_AuthorizationProvider
						End if 
						$_l_AuthServiceRow:=0
						For ($_l_Index; 1; Size of array:C274(CCM_at_AuthNames))
							If (Position:C15(CCM_t_AuthorizationService; CCM_at_AuthNames{$_l_Index})>0)
								$_l_AuthServiceRow:=$_l_AuthServiceRow+1
							End if 
						End for 
						If ($_l_AuthServiceRow#0)
							CCM_t_AuthorizationService:=CCM_t_AuthorizationService+"_"+String:C10($_l_AuthServiceRow)
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
				$_l_AuthServiceRow:=Find in array:C230(CCM_al_Services; CCM_l_AuthServiceID)
				CCM_abo_AuthActive{$_l_AuthServiceRow}:=(CC_l_AuthActive=1)
				CCM_at_AuthNames{$_l_AuthServiceRow}:=CCM_t_AuthorizationService
				CCM_at_AuthProviderName{$_l_AuthServiceRow}:=CCM_t_AuthorizationProvider
				CCM_al_AuthProvidorID{$_l_AuthServiceRow}:=CCM_l_AuthorizationProvider
				CCM_at_AuthLogins{$_l_AuthServiceRow}:=CCM_t_AuthorizationLogin
				CCM_at_AuthPasswords{$_l_AuthServiceRow}:=CCM_t_AuthorizationPass
				CCM_at_AuthIDs{$_l_AuthServiceRow}:=CCM_t_AuthorizationPassid
				CCM_al_TestMode{$_l_AuthServiceRow}:=CCM_l_RunTest
				CCM_al_reconcileTime{$_l_AuthServiceRow}:=CCM_ti_ReconcileTime*1
		End case 
		CCM_LoadServiceProvidersV11
		<>CCM_bo_CompanyCards:=CCM_bo_CompanyCards
		<>CCM_bo_UseCoRef:=CCM_bo_UseCoRef
	End if 
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("CCM_ClosePrefs"; $_t_oldMethodName)