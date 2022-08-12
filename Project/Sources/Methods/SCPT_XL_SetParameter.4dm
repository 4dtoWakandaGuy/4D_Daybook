//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_SetParameter
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 06:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Platform)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_SetParameter")


///_O_PLATFORM PROPERTIES($_l_Platform)
Get_PlatformProperty("Platform"; ->$_l_Platform)
If ($_l_Platform=Windows:K25:3)
	
	If (Match regex:C1019("[\\u0001-\\u007F]+"; $2))
		
		SET ENVIRONMENT VARIABLE:C812($1; $2)
		
	Else 
		
		SET ENVIRONMENT VARIABLE:C812($1; $2)
		SET ENVIRONMENT VARIABLE:C812(Char:C90(0)*(Length:C16($2)); "")
		
	End if 
	
Else 
	
	SET ENVIRONMENT VARIABLE:C812($1; $2)
	
End if 
ERR_MethodTrackerReturn("SCPT_XL_SetParameter"; $_t_oldMethodName)
