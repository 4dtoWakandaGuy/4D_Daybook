//%attributes = {}
If (False:C215)
	//Project Method Name:      SEL_PreviousSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SEL_PreviousSelection
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WS_al_CachedSelection;0)
	//ARRAY TEXT(WS_at_CachedSelectionName;0)
	C_BOOLEAN:C305(<>DB_bo_NewSearchActive; SEL_bo_CachePopSelected)
	C_LONGINT:C283($1; VNo; WS_l_CachedSelectionName)
	C_POINTER:C301($_Ptr_Table)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentOutputform; WS_t_SelectionSetName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SEL_PreviousSelection"; Form event code:C388)
If (SEL_bo_CachePopSelected)
	SEL_bo_CachePopSelected:=False:C215
Else 
	//goto next selection
	WS_l_CachedSelectionName:=WS_at_CachedSelectionName
	If (WS_l_CachedSelectionName=0)
		WS_l_CachedSelectionName:=Size of array:C274(WS_at_CachedSelectionName)
	End if 
	
	If (WS_l_CachedSelectionName>1)
		WS_l_CachedSelectionName:=WS_l_CachedSelectionName-1
	Else 
		WS_l_CachedSelectionName:=Size of array:C274(WS_at_CachedSelectionName)
	End if 
	If (Size of array:C274(WS_al_CachedSelection)<WS_l_CachedSelectionName)
		WS_l_CachedSelectionName:=(Size of array:C274(WS_al_CachedSelection))
	End if 
	WS_at_CachedSelectionName:=WS_l_CachedSelectionName
	If (Count parameters:C259>=1)
		$_Ptr_Table:=(Table:C252($1))
	Else 
		$_Ptr_Table:=Current form table:C627
		
	End if 
	CREATE SET FROM ARRAY:C641($_Ptr_Table->; WS_al_CachedSelection{WS_l_CachedSelectionName}; "TempSet")
	USE SET:C118("TempSet")
	If (Table:C252($_Ptr_Table)=Table:C252(->[PRODUCTS:9]))
		COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
	End if 
	If (WS_t_SelectionSetName#"")
		CREATE SET:C116($_Ptr_Table->; WS_t_SelectionSetName)
	End if 
	If (<>DB_bo_NewSearchActive)
		Srch_resetUnfilteredSelection($_Ptr_Table)
		SRCH_Applyfilterstoselection($_Ptr_Table)
		
	End if 
	FS_SetFormSort(WIN_t_CurrentOutputform)
	VNo:=Records in selection:C76($_Ptr_Table->)
End if 
ERR_MethodTrackerReturn("SEL_PreviousSelection"; $_t_oldMethodName)
