If (False:C215)
	//Project Form Method Name: LR_LicenceRequest
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2012 17:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(DB_d_ExpiryDate; DB_d_ExpiryDateNEW)
	C_LONGINT:C283($_l_event; DB_l_ConcurrentUsers; xCancel; xOK)
	C_PICTURE:C286(<>PictLogoMed)
	C_TEXT:C284($_t_oldMethodName; DB_t_PathName; vText; Vtitle1; vTitle16; vTitle17; Vtitle2; vTitle3; vTitle4; vTitle5)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM LR_LicenceRequest"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1)
		//GET PICTURE FROM LIBRARY(20240; <>PictLogoMed)
		<>PictLogoMed:=Get_Picture(20240)
		Vtitle1:=DB_GetOrganisationAdministrator
		Vtitle2:=DB_GetOrganisation
		DB_t_PathName:=DB_GetLicenceString
		DB_d_ExpiryDate:=DB_GetLicenceExpiryDate
		DB_d_ExpiryDateNEW:=!00-00-00!
		DB_l_ConcurrentUsers:=DB_GetLicenceMaxUsers
		
		vTitle3:=""
		
		If (DB_t_PathName="")
			vTitle4:="Required"
			vText:="Please enter your Daybook Licence No and Validation Code"+", which can be found on the form enclosed"+" in your Welcome Pack:"
			vTitle5:="Required"
			OBJECT SET ENABLED:C1123(xOK; False:C215)
		Else 
			If (DB_d_ExpiryDate>=Current date:C33(*))
				vTitle4:=String:C10((DB_d_ExpiryDate-Current date:C33(*))+1)+" days remaining"
				vText:="If you wish to amend your current Daybook Licence, please"+" enter the new Licence No and Validation Code below:"
			Else 
				vTitle4:="Expired"
				vText:="The Validation for your current Daybook Licence"+Char:C90(13)+"has expired."+Char:C90(13)+"Please enter a new Validation Code below:"
				GOTO OBJECT:C206(vTitle3)
				OBJECT SET ENABLED:C1123(xOK; False:C215)
			End if 
			vTitle5:="Accepted"
		End if 
		If (Is Windows:C1573)
			OBJECT SET TITLE:C194(xCancel; "Exit")
		End if 
		If (DB_d_ExpiryDate>Current date:C33(*))
			OBJECT SET TITLE:C194(xCancel; "Cancel")
		End if 
		
		//If (◊PathVersion="Silver@")  `can't use ◊aMod cos may not be known
		//vTitle16:="For assistance, call Workstation Support on 020 7371 7161"
		//vTitle17:="International Calls: ... +44 20 7371 7161"
		//Else
		//vTitle16:="For assistance, call Workstation Support on 020 7371 7161"
		//vTitle17:="International Calls: ... +44 20 7371 7161"
		//End if
		
		//16/09/08 -kmw, changed from above to text below as requested by lance's email to maryvonne on 16/09/08
		vTitle16:="For assistance, call Clearday Software on 01296 399199"
		vTitle17:="International Calls: ... +44 1296 399199"
		
		
End case 
ERR_MethodTrackerReturn("FM LR_LicenceRequest"; $_t_oldMethodName)
