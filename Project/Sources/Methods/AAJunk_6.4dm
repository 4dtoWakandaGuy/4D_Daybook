//%attributes = {}

If (False:C215)
	//Project Method Name:      AAJunk_6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/12/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("AAJunk_6")
//4D_PRIMARY_KEY_WIZARD 
//TRACE
//$_l_TableNumber:=Table(->[DOCUMENTS])
//$LicencePath:=Get 4D folder(Licenses Folder)
//ALERT(String($_l_TableNumber))
//DB_SetAlltriggers (-1)
ERR_MethodTrackerReturn("AAJunk_6"; $_t_oldMethodName)