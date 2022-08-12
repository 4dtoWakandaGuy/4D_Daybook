If (False:C215)
	//object Name: [USER]Licence_Accept.Button3
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
	C_TEXT:C284($_t_oldMethodName; tLicenceText; tLicenceText2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Licence_Accept.Button3"; Form event code:C388)
If (Form event code:C388=On Clicked:K2:4)
	_O_PAGE SETUP:C299([PREFERENCES:116]; "Text")
	PRINT SETTINGS:C106
	If (OK=1)
		FORM SET OUTPUT:C54([PREFERENCES:116]; "Text")
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]TempText1:5:=tLicenceText
		PRINT RECORD:C71([PREFERENCES:116]; *)
		[PREFERENCES:116]TempText1:5:=tLicenceText2
		PRINT RECORD:C71([PREFERENCES:116]; *)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].Licence_Accept.Button3"; $_t_oldMethodName)
