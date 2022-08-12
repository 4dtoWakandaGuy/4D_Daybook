//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_GoToCell
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 10:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_LONGINT:C283($2; $3)
	C_POINTER:C301($_ptr_ThisColumn; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_GoToCell")
//` LBGotoCell
// replaces AL_GotoCell
// 07/07/06 pb
// parameters: $1=pointer ott he listbox
// todo: this needs finishing!
ARRAY TEXT:C222($_at_ColumnNames; 0)
ARRAY TEXT:C222($_at_HeaderNames; 0)
ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
ARRAY POINTER:C280($_aptr_ColumnStyles; 0)

LISTBOX GET ARRAYS:C832($1->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
If ($2>0)
	If (Size of array:C274($_aptr_ColumnVariables)>=$2)
		
		If (Not:C34(Is nil pointer:C315($_aptr_ColumnVariables{$2})))
			$_ptr_ThisColumn:=$_aptr_ColumnVariables{$2}
			EDIT ITEM:C870($_ptr_ThisColumn->; $3)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("LB_GoToCell"; $_t_oldMethodName)