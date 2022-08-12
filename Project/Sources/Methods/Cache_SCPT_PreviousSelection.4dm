//%attributes = {}
If (False:C215)
	//Project Method Name:      Cache_SCPT_PreviousSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 13:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WS_al_CachedSelection;0)
	//ARRAY TEXT(WS_at_CachedSelectionName;0)
	C_BOOLEAN:C305(SEL_bo_CachePopSelected)
	C_LONGINT:C283($_l_Event; VNo; WS_l_CachedSelectionName)
	C_POINTER:C301($_Ptr_Table)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentOutputform; WS_t_SelectionSetName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cache_SCPT_PreviousSelection")
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		//goto Previous selection
		If (WS_l_CachedSelectionName>1)
			WS_l_CachedSelectionName:=WS_l_CachedSelectionName-1
		Else 
			WS_l_CachedSelectionName:=Size of array:C274(WS_at_CachedSelectionName)
		End if 
		
		//$_Ptr_Table:=Current default table
		CREATE SET FROM ARRAY:C641($_Ptr_Table->; WS_al_CachedSelection{WS_l_CachedSelectionName}; "TempSet")
		USE SET:C118("TempSet")
		If (WS_t_SelectionSetName#"")
			CREATE SET:C116($_Ptr_Table->; WS_t_SelectionSetName)
		End if 
		FS_SetFormSort(WIN_t_CurrentOutputform)
		VNo:=Records in selection:C76($_Ptr_Table->)
		
End case 
ERR_MethodTrackerReturn("Cache_SCPT_PreviousSelection"; $_t_oldMethodName)
