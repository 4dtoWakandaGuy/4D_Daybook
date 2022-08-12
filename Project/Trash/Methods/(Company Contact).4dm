//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Company Contact
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ch1; r1; r2; r3; r4)
	C_TEXT:C284(<>MailSal; $_t_oldMethodName; vDetails; vJobTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Company Contact")
//Company Contact
If (r4=0)
	Case of 
		: (r1=1)
			CompCont_Srch
			QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Job_Title:6=vJobTitle)
		: (r2=1)
			Company_Cont2
		: (r3=1)
			CompCont_Srch
	End case 
	If ((Records in selection:C76([CONTACTS:1])=0) & (r3=0) & (ch1=1))
		If (r1=1)
			Company_Cont2
		Else 
			CompCont_Srch
			If (vJobTitle#"")
				QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Job_Title:6=vJobTitle)
			End if 
		End if 
		If (Records in selection:C76([CONTACTS:1])=0)
			CompCont_Srch
		End if 
	End if 
	If (Records in selection:C76([CONTACTS:1])>0)
		Address_Contact
	Else 
		If ((Length:C16(vJobTitle)>1) & (r1=1))
			vDetails:=vJobTitle+Char:C90(13)+vDetails
		End if 
		vSalutation:=<>MailSal
	End if 
Else 
	vSalutation:=<>MailSal
End if 
ERR_MethodTrackerReturn("Company Contact"; $_t_oldMethodName)