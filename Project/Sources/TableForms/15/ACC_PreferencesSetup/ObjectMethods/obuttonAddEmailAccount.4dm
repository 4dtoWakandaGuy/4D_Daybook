If (False:C215)
	//object Name: [USER]ACC_PreferencesSetup.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ACC_al_EmailOwnerIDS;0)
	//ARRAY LONGINT(SD3_al_DiaryOwnersPersonIDS;0)
	//ARRAY LONGINT(SD3_al_PreSelDiaryItemOwners;0)
	//ARRAY LONGINT(SD3_al_SelectedDiaryOwners;0)
	//ARRAY TEXT(ACC_at_EMailAccounts;0)
	//ARRAY TEXT(ACC_at_EMailAccountsUser;0)
	//ARRAY TEXT(WS_at_DiaryOwnersPeople;0)
	C_BOOLEAN:C305(ACC_bo_DataChange; WS_bo_HideResources)
	C_LONGINT:C283($_l_CurrentRow; $_l_CurrentWinRefOLD; $_l_Index; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_SizeofArray; ACC_l_UPDATEOWNERS; Badd; WIN_l_CurrentWinRef)
	C_LONGINT:C283(WIN_l_CurrentWinRefOLD; WS_l_KEYDiaryItemOwner; WS_l_UpdateOwners)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER]ACC_PreferencesSetup.Button1"; Form event code:C388)

OBJECT GET COORDINATES:C663(Badd; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_PreferencesSetup.Button1"; Form event code:C388)

//re-using the same form as in the diary
//who is that diary owner
WS_l_KEYDiaryItemOwner:=0
ARRAY LONGINT:C221(SD3_al_PreSelDiaryItemOwners; 0)
//Now we can display a dialogue
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1)
WS_bo_HideResources:=True:C214

DIALOG:C40([USER:15]; "Diary_OwnerDialog")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
If (WS_l_UpdateOwners=1)
	$_l_SizeofArray:=Size of array:C274(SD3_al_DiaryOwnersPersonIDS)
	ARRAY TEXT:C222(ACC_at_EMailAccounts; $_l_SizeofArray)
	ARRAY TEXT:C222(ACC_at_EMailAccountsUser; $_l_SizeofArray)
	ARRAY LONGINT:C221(ACC_al_EmailOwnerIDS; $_l_SizeofArray)
	$_l_CurrentRow:=0
	For ($_l_Index; 1; Size of array:C274(SD3_al_DiaryOwnersPersonIDS))
		If (SD3_al_SelectedDiaryOwners{$_l_Index}=1)
			$_l_CurrentRow:=$_l_CurrentRow+1
			ACC_al_EmailOwnerIDS{$_l_CurrentRow}:=SD3_al_DiaryOwnersPersonIDS{$_l_Index}
			ACC_at_EmailAccountsUser{$_l_CurrentRow}:=WS_at_DiaryOwnersPeople{$_l_Index}
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=SD3_al_DiaryOwnersPersonIDS{$_l_Index})
			ACC_at_EMailAccounts{$_l_CurrentRow}:=[PERSONNEL:11]Email_Address:36
		End if 
	End for 
	ARRAY TEXT:C222(ACC_at_EMailAccounts; $_l_CurrentRow)
	ARRAY TEXT:C222(ACC_at_EMailAccountsUser; $_l_CurrentRow)
	ARRAY LONGINT:C221(ACC_al_EmailOwnerIDS; $_l_CurrentRow)
	ACC_bo_DataChange:=True:C214
End if 
ERR_MethodTrackerReturn("OBJ:ACC_PreferencesSetup,bAdd"; $_t_oldMethodName)
