//%attributes = {}
If (False:C215)
	//Project Method Name:      Address_Contact
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>NoJT; $_bo_incJobTitle)
	C_TEXT:C284(<>MailSal; $_t_ContactDetails; $_t_oldMethodName; EMAIL_t_EmailTo; vDetails; vSalutation)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Address_Contact")
//Address_Contact

$_t_ContactDetails:=""
If (Records in selection:C76([CONTACTS:1])>0)
	$_t_ContactDetails:=Address_ContactName
	If ($_t_ContactDetails#"")
		$_t_ContactDetails:=$_t_ContactDetails+Char:C90(13)
	End if 
	$_bo_incJobTitle:=True:C214
	If ([CONTACTS_COMPANIES:145]Company_Code:1#[COMPANIES:2]Company_Code:1)
		QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
		QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
		QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1)
	End if 
	If ([CONTACTS_COMPANIES:145]Address_Type:2#"")
		If ([CONTACTS_COMPANIES:145]Address_Type:2#[TYPES:5]Type_Code:1)
			RELATE ONE:C42([CONTACTS_COMPANIES:145]Address_Type:2)
		End if 
		If ([TYPES:5]Omit_Job_Title:5)
			$_bo_incJobTitle:=False:C215
		End if 
	End if 
	If ($_bo_incJobTitle)
		If (([CONTACTS:1]Job_Title:6#"") & (<>NoJT=False:C215))
			$_t_ContactDetails:=$_t_ContactDetails+[CONTACTS:1]Job_Title:6+Char:C90(13)
		End if 
		If ([CONTACTS:1]Dept:8#"")
			$_t_ContactDetails:=$_t_ContactDetails+[CONTACTS:1]Dept:8+Char:C90(13)
		End if 
	End if 
	If (vDetails#("@"+$_t_ContactDetails+"@"))
		vDetails:=$_t_ContactDetails+vDetails
	End if 
	If (([CONTACTS:1]Title:3#"") & ([CONTACTS:1]Surname:5#""))
		vSalutation:="Dear "+[CONTACTS:1]Title:3+" "+[CONTACTS:1]Surname:5
	Else 
		If ([CONTACTS:1]Forename:4#"")
			vSalutation:="Dear "+[CONTACTS:1]Forename:4+" "+[CONTACTS:1]Surname:5
		Else 
			vSalutation:=<>MailSal
		End if 
	End if 
Else 
	vSalutation:=<>MailSal
End if 
If ([CONTACTS:1]Email_Before_At:30#"") & ([CONTACTS:1]EMail_After_At:24#"")
	
	EMAIL_t_EmailTo:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
Else 
	EMAIL_t_EmailTo:=""
End if 
ERR_MethodTrackerReturn("Address_Contact"; $_t_oldMethodName)
