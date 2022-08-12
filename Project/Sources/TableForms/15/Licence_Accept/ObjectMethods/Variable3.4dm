If (False:C215)
	//object Name: [USER]Licence_Accept.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(yAccepted; yLicence_ViewedPart2)
	C_LONGINT:C283(r1; r2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Licence_Accept.Variable3"; Form event code:C388)
Case of 
	: (yLicence_ViewedPart2=False:C215) & (False:C215)
		Gen_Alert("Please view Part Two of the Licence Agreement.")
		
	: (r1=0) & (r2=0)
		Gen_Alert("Please select one of the radio buttons.")
	: (r2=1)
		CONFIRM:C162("If you do not accept the licence agrement, you will not be able to enter your"+" licence number."; "Don't accept"; "Change mind")
		If (OK=1)  // don't accept
			yAccepted:=False:C215
			CANCEL:C270
		Else 
			// try again
		End if 
	Else 
		yAccepted:=True:C214
		ACCEPT:C269
End case 
ERR_MethodTrackerReturn("OBJ:Licence_Accept,bOK"; $_t_oldMethodName)
