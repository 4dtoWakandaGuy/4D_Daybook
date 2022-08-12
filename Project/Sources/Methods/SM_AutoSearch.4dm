//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_AutoSearch
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_AutoSearch")
//This is  a method that enables a search to be created by a user just pass a  series of parameters
//`witht the names of the searches
//this will build an array of the search IDs and call SM_l_AutoSearchbyIDERR_MethodTrackerReturn ("SM_AutoSearch";$_t_oldMethodName)