If (False:C215)
	//object Name: [USER]Licence_Accept.Variable4
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
	C_LONGINT:C283(bViewPart; iViewingpart)
	C_TEXT:C284($_t_oldMethodName; tLicenceText; tTemp)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Licence_Accept.Variable4"; Form event code:C388)
Case of 
	: (ApplicationType_isSingleUser) & (Is compiled mode:C492=False:C215) & ((Current user:C182="Designer") | (Current user:C182="Administrator"))
		Licence_ResourceUpdate
		Licence_TextLoad
		tTemp:=tLicenceText
		REDRAW:C174(tTemp)
		OBJECT SET TITLE:C194(bViewPart; "View Part 2 of the Licence Text")
		iViewingpart:=1
End case 
ERR_MethodTrackerReturn("OBJ [USER].Licence_Accept.Variable4"; $_t_oldMethodName)
