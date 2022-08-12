If (False:C215)
	//Table Form Method Name: [USER]Licence_Accept
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
	C_BLOB:C604(<>LicenceTextBlob; <>LicenceTextBlob2; LicenceTextBlob; LicenceTextBlob2)
	C_BOOLEAN:C305(DB_bo_NoLoad; yAccepted; yLicence_ViewedPart2)
	C_LONGINT:C283(bViewPart; iViewingPart; r1; r2)
	C_TEXT:C284($_t_oldMethodName; tLicenceText; tLicenceText2; tTemp)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].Licence_Accept"; Form event code:C388)


Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "Licence_Accept")
		yAccepted:=False:C215
		r1:=0
		r2:=0
		tLicenceText:=""
		tLicenceText2:=""
		If (ApplicationType_isSingleUser)  // single user
			Licence_TextLoad
		Else 
			Licence_TextLoad
			//C_BLOB(LicenceTextBlob;LicenceTextBlob2)
			//SET BLOB SIZE(LicenceTextBlob;0)
			//SET BLOB SIZE(LicenceTextBlob2;0)
			//GET PROCESS VARIABLE(-1;◊LicenceTextBlob;LicenceTextBlob)
			//a  `offset:=0
			//tLi  `cenceText:=BLOB to text(LicenceTextBlob;Mac text without length ;$_l_offset;32000)`
			//aGET PROCESS VARIABLE(-1;◊LicenceTextBlob2;LicenceTextBlob)
			//a$_l_offset:=0
			//tLicenceText2:=BLOB to text(LicenceTextBlob;Mac text without length ;$_l_offset;32000)
		End if 
		tTemp:=tLicenceText
		OBJECT SET TITLE:C194(bViewPart; "View Part 2 of the Licence Text")
		iViewingpart:=1
		yLicence_ViewedPart2:=False:C215
		INT_SetDialog
		
End case 
SET BLOB SIZE:C606(LicenceTextBlob; 0)
SET BLOB SIZE:C606(LicenceTextBlob2; 0)
SET BLOB SIZE:C606(<>LicenceTextBlob; 0)
SET BLOB SIZE:C606(<>LicenceTextBlob2; 0)
ERR_MethodTrackerReturn("FM:Licence_Accept"; $_t_oldMethodName)