If (False:C215)
	//object Method Name: Object Name:      [USER].ACC_PreferencesSetup.Variable5
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
	//ARRAY INTEGER(SD3_al_SelectedDiaryResources;0)
	//ARRAY LONGINT(ACC_al_aDiaryOwnerIDs;0)
	//ARRAY LONGINT(SD3_al_DiaryOwners_Resources;0)
	//ARRAY LONGINT(SD3_al_DiaryOwnersPersonIDS;0)
	//ARRAY LONGINT(SD3_al_PreSelDiaryItemOwners;0)
	//ARRAY LONGINT(SD3_al_SelectedDiaryOwners;0)
	//ARRAY TEXT(ACC_at_DiaryNames;0)
	//ARRAY TEXT(WS_at_DiaryOwnersPeople;0)
	//ARRAY TEXT(WS_at_DiaryOwnersResources;0)
	C_BOOLEAN:C305(ACC_bo_DataChange)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Element; $_l_Index; $_l_SizeofArray; ACC_l_UPDATEOWNERS; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; WS_l_KEYDiaryItemOwner; WS_l_UpdateOwners)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_PreferencesSetup.Variable5"; Form event code:C388)


//re-using the same form as in the diary
//who is that diary owner
WS_l_KEYDiaryItemOwner:=0
ARRAY LONGINT:C221(SD3_al_PreSelDiaryItemOwners; 0)
//Now we can display a dialogue
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1)
DIALOG:C40([USER:15]; "Diary_OwnerDialog")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
If (WS_l_UpdateOwners=1)
	$_l_SizeofArray:=Size of array:C274(SD3_al_DiaryOwnersPersonIDS)+Size of array:C274(SD3_al_DiaryOwners_Resources)
	ARRAY TEXT:C222(ACC_at_DiaryNames; $_l_SizeofArray)
	ARRAY LONGINT:C221(ACC_al_aDiaryOwnerIDs; $_l_SizeofArray)
	$_l_Element:=0
	For ($_l_Index; 1; Size of array:C274(SD3_al_DiaryOwnersPersonIDS))
		If (SD3_al_SelectedDiaryOwners{$_l_Index}=1)
			$_l_Element:=$_l_Element+1
			ACC_al_aDiaryOwnerIDs{$_l_Element}:=SD3_al_DiaryOwnersPersonIDS{$_l_Index}
			ACC_at_DiaryNames{$_l_Element}:=WS_at_DiaryOwnersPeople{$_l_Index}
		End if 
	End for 
	For ($_l_Index; 1; Size of array:C274(SD3_al_DiaryOwners_Resources))
		If (SD3_al_SelectedDiaryResources{$_l_Index}=1)
			$_l_Element:=$_l_Element+1
			ACC_al_aDiaryOwnerIDs{$_l_Element}:=SD3_al_DiaryOwners_Resources{$_l_Index}
			ACC_at_DiaryNames{$_l_Element}:=WS_at_DiaryOwnersResources{$_l_Index}
		End if 
	End for 
	ARRAY TEXT:C222(ACC_at_DiaryNames; $_l_Element)
	ARRAY LONGINT:C221(ACC_al_aDiaryOwnerIDs; $_l_Element)
	ACC_bo_DataChange:=True:C214
End if 
ERR_MethodTrackerReturn("OBJ:ACC_PreferencesSetup,bAdd"; $_t_oldMethodName)
