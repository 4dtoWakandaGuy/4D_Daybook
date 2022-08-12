//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_Soundex
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_FilterCompanyName; $_t_oldMethodName; $_t_Soundex; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_Soundex")
//this method can be called from a trigger to build a soundex
//it will return the soundex in $
$_t_FilterCompanyName:=DB_CompanyNameClean($1)
$_t_Soundex:=DB_BuildSoundex($_t_FilterCompanyName)
$0:=$_t_Soundex
ERR_MethodTrackerReturn("DB_Soundex"; $_t_oldMethodName)