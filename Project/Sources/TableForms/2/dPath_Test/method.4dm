If (False:C215)
	//Table Form Method Name: [COMPANIES]dPath_Test
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2012 19:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>LIC_bo_skipVersionControlOnExit; <>SYS_bo_LoggedIn; DB_bo_NoLoad; USR_bo_DisableTempButton)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_event; bLicenceFileAutoUpdateSettings; LR_l_LicenceType; xCancel; xOK; xtemp)
	C_PICTURE:C286(<>PictLogoMed)
	C_TEXT:C284(<>PathName; $_t_oldMethodName; LR_t_LicencedOrg; vText; vTitle1; vTitle16; vTitle17; vTitle2; vTitle3; vTitle4; vTitle5)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES]dPath_Test"; Form event code:C388)

//FM:dPath_Test

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dPath_Test"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dPath_Test")
		//GET PICTURE FROM LIBRARY(20240; <>PictLogoMed)
		<>PictLogoMed:=Get_Picture(20240)
		If (USR_bo_DisableTempButton)
			OBJECT SET ENABLED:C1123(xtemp; False:C215)
			
			<>LIC_bo_skipVersionControlOnExit:=True:C214
		Else 
			OBJECT SET ENABLED:C1123(xtemp; True:C214)
		End if 
		If ([USER:15]Last Version:92<"4.0.010")
			vTitle1:=""
		Else 
			vTitle1:=[USER:15]Name:38
		End if 
		vTitle2:=[USER:15]Organisation:1
		If (LR_l_LicenceType=2)
			vTitle2:=LR_t_LicencedOrg
		End if 
		vTitle3:=""
		vTitle7:=<>PathName
		//TRACE
		
		If (<>PathName="")
			vTitle4:="Required"
			vText:="Please enter your Daybook Licence No and Validation Code"+", which can be found on the form enclosed"+" in your Welcome Pack:"
			vTitle5:="Required"
			OBJECT SET ENABLED:C1123(xOK; False:C215)
		Else 
			If ([USER:15]Limit Date:58>=<>DB_d_CurrentDate)
				vTitle4:=String:C10(([USER:15]Limit Date:58-<>DB_d_CurrentDate)+1)+" days remaining"
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
		If (<>SYS_bo_LoggedIn)
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
		
		
		If (LR_l_LicenceType=2)  //New style licence
			FORM GOTO PAGE:C247(2)
			
		End if 
		
		//***** added kmw 11/01/07 *****
		If (Current user:C182="Designer")
			OBJECT SET ENABLED:C1123(bLicenceFileAutoUpdateSettings; True:C214)
		Else 
			OBJECT SET ENABLED:C1123(bLicenceFileAutoUpdateSettings; False:C215)
		End if 
		//*************************
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM:dPath_Test"; $_t_oldMethodName)
