//%attributes = {}
If (False:C215)
	//Project Method Name:      Cache_Initialise
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 11:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WS_al_CachedSelection;0;0)
	//ARRAY TEXT(WS_at_CachedSelectionName;0)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName; $1; WS_t_SelectionSetName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cache_Initialise")

//this method initializes the arrays for this process
//these array contain the previous selections

ARRAY LONGINT:C221(WS_al_CachedSelection; 0; 0)
ARRAY TEXT:C222(WS_at_CachedSelectionName; 0)
If (Count parameters:C259>=1)
	WS_t_SelectionSetName:=$1
Else 
	WS_t_SelectionSetName:=""
End if 
Cache_Update



//we insert rows into this array and a generic name

//to those rows we load the current selection
//until we reach 50 rows
//after we reach 50 Rows we drop the first row(oldest) and re-insert a 50'th row
ERR_MethodTrackerReturn("Cache_Initialise"; $_t_oldMethodName)
