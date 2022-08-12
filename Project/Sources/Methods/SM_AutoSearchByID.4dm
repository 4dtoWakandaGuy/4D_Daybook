//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_AutoSearchByID
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_QueryIDs;0)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_AutoSearchByID")
//This is  a method that enables a search to be created by the set manager which
//contains a series of parameters
// just pass a  series of parameters
//`witht the names of the searches
//this will build an array of the search IDs and call SM_l_AutoSearchbyID

ARRAY LONGINT:C221(SM_al_QueryIDs; Count parameters:C259)
For ($_l_Index; 1; Count parameters:C259)
	SM_al_QueryIDs{$_l_Index}:=${$_l_Index}
End for 
SM_L_AutoSearchbyID(0; ->SM_al_QueryIDs)
ERR_MethodTrackerReturn("SM_AutoSearchByID"; $_t_oldMethodName)
