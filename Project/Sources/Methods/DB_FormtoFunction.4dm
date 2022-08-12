//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_FormtoFunction
	//------------------ Method Notes ------------------
	//This method is passed the name of a data entry form and will return the nam of the function to call for entering data.
	//this is replacing the mechanism used in output forms where the name of the function was paseed in $5 to the outbuttcall.
	//because in the new form there is only one flexible form this will use the input form as defined in the definitions to get the name
	
	//------------------ Revision Control ----------------
	//Date Created: 15/04/2010 19:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	//C_UNKNOWN($1)
	C_TEXT:C284($0; $1; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_FormtoFunction")
If (Count parameters:C259>=1)
	Case of 
		: ($1="Company_In")
			$0:="CO_EnterNewRecord"
		: ($1="Contact_In")
			$0:="CON_EnterNewRecord"
	End case 
End if 
ERR_MethodTrackerReturn("DB_FormtoFunction"; $_t_oldMethodName)
