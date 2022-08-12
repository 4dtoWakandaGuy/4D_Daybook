If (False:C215)
	//object Name: [COMPANIES]Company_In.COM_t_AccPayableEmail
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.COM_t_AccPayableEmail"; Form event code:C388)

Company_docPrintPrefSet("AccPayableEmail"; "email"; False:C215; Self:C308->)
ERR_MethodTrackerReturn("OBJ [COMPANIES].Company_In.COM_t_AccPayableEmail"; $_t_oldMethodName)