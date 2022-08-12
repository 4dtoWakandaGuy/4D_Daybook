//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_ListPropertiesUpdate
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0; $3; AA_bo AddPropertyItem; AA_bo_SavePropertiesITEMS)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $1; AA_l_LoadPropertyItemsListID; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName; $2; AA_t_PropertyName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_at_ListPropertiesUpdate")
//this method displays a window with the current SUBLIST
// of a given property
//pass the sublist ID in $1 and the PROPERTY NAME is $2
//pass TRUE in $3 if you are trying to add
//NOTE THIS IS ONLY TO BE USED FOR LIST PROPERTIES SUBLISTS
//USE IT WITH ANY OTHER ITEMS AND YOU WILL CAUSE YOURSELF PROBLEMS


$0:=False:C215

If (Count parameters:C259>=3)
	AA_l_LoadPropertyItemsListID:=$1
	AA_t_PropertyName:=$2
	If (Count parameters:C259>=3)
		AA_bo AddPropertyItem:=$3
	Else 
		AA_bo AddPropertyItem:=False:C215
	End if 
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1)
	DIALOG:C40([USER:15]; "List_PropertiesItemManager")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	If (AA_bo_SavePropertiesITEMS)
		//we have items to update
		$0:=True:C214
	Else 
		$0:=False:C215
	End if 
	
End if 
ERR_MethodTrackerReturn("AA_at_ListPropertiesUpdate"; $_t_oldMethodName)
