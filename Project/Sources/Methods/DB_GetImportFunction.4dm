//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetImportFunction
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   14/10/2010 21:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetImportFunction")
$0:=""
Case of 
	: ($1=Table:C252(->[COMPANIES:2]))
	: ($1=Table:C252(->[POSTAL_CODES:50]))
		//$0:="DB_ImporrtPostalCodes"
		
End case 
ERR_MethodTrackerReturn("DB_GetImportFunction"; $_t_oldMethodName)