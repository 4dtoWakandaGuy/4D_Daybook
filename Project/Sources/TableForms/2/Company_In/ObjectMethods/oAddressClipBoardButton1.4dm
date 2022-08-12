If (False:C215)
	//object Name: [COMPANIES]Company_In.Variable24
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_CopyText; $_t_oldMethodName; COM_t_DisplayAddress)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.Variable24"; Form event code:C388)
$_t_CopyText:=[COMPANIES:2]Company_Name:2+Char:C90(13)+COM_t_DisplayAddress
CLEAR PASTEBOARD:C402
SET TEXT TO PASTEBOARD:C523($_t_CopyText)
$_t_CopyText:=""
ERR_MethodTrackerReturn("OBJ [COMPANIES].Company_In.Variable24"; $_t_oldMethodName)