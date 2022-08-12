//%attributes = {}
If (False:C215)
	//Project Method Name:      CACHE_SCPT_aCachedSelectionNAME
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/05/2012 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WS_al_CachedSelection;0)
	//ARRAY TEXT(WS_at_CachedSelectionName;0)
	C_LONGINT:C283($1; VNo; WS_l_CachedSelectionName)
	C_POINTER:C301($_Ptr_Table)
	C_TEXT:C284($_t_NewSelectionName; $_t_oldMethodName; WIN_t_CurrentOutputform; WS_t_SelectionSetName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CACHE_SCPT_aCachedSelectionNAME"; 0; String:C10(WS_at_CachedSelectionName))

If (WS_at_CachedSelectionName>0)
	If (Macintosh option down:C545) | (Windows Alt down:C563)
		$_t_NewSelectionName:=Request:C163("Rename The Selection"; WS_at_CachedSelectionName{WS_at_CachedSelectionName})
		If ($_t_NewSelectionName#"")
			WS_at_CachedSelectionName{WS_at_CachedSelectionName}:=$_t_NewSelectionName
		End if 
	End if 
	
	WS_l_CachedSelectionName:=WS_at_CachedSelectionName
	If (Count parameters:C259=0)
		$_Ptr_Table:=Current form table:C627
	Else 
		$_Ptr_Table:=Table:C252($1)
	End if 
	CREATE SET FROM ARRAY:C641($_Ptr_Table->; WS_al_CachedSelection{WS_at_CachedSelectionName}; "TempSet")
	USE SET:C118("TempSet")
	If (Table:C252($_Ptr_Table)=Table:C252(->[PRODUCTS:9]))
		COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
	End if 
	If (WS_t_SelectionSetName#"")
		CREATE SET:C116($_Ptr_Table->; WS_t_SelectionSetName)
	End if 
	FS_SetFormSort(WIN_t_CurrentOutputform)
End if 
//WS_at_CachedSelectionName:=0
VNo:=Records in selection:C76($_Ptr_Table->)
ERR_MethodTrackerReturn("CACHE_SCPT_aCachedSelectionNAME"; $_t_oldMethodName)
