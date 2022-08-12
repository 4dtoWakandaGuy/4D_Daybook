If (False:C215)
	//object Name: [USER]Licence_Accept.Button2
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
	C_BOOLEAN:C305(yLicence_ViewedPart2)
	C_LONGINT:C283(bViewPart; iViewingpart)
	C_TEXT:C284($_t_oldMethodName; tLicenceText; tLicenceText2; tTemp)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Licence_Accept.Button2"; Form event code:C388)
If (Form event code:C388=On Clicked:K2:4)
	Case of 
		: (iViewingpart=1)
			tTemp:=tLicenceText2
			OBJECT SET TITLE:C194(bViewPart; "View Part 1 of the Licence Text")
			iViewingpart:=2
			yLicence_ViewedPart2:=True:C214
		Else 
			tTemp:=tLicenceText
			OBJECT SET TITLE:C194(bViewPart; "View Part 2 of the Licence Text")
			iViewingpart:=1
	End case 
	//  SET ENTERABLE(tTemp;True)
	HIGHLIGHT TEXT:C210(tTemp; 1; 1)
	REDRAW:C174(tTemp)
	//  SET ENTERABLE(tTemp;False)
	
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].Licence_Accept.Button2"; $_t_oldMethodName)
