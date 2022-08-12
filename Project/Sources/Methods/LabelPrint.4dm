//%attributes = {}
If (False:C215)
	//Project Method Name:      LabelPrint
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2009 08:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ch1; r1; r2; r3; r4; rComp; rCont; rContr; rDiary; rOrd; rState)
	C_TEXT:C284(<>MailSal; $_t_oldMethodName; vCompCode; vDetails; vJobTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LabelPrint")
Case of 
	: (rComp=1)
		//`````
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
			If ((Length:C16(vJobTitle)>1) & (r1=1))
				vDetails:=vJobTitle+Char:C90(13)+vDetails
			End if 
			vSalutation:=<>MailSal
		End if 
		//put this field on the label [MAILSORT MAIL]SSC
		//and these
		//[COMPANIES]Company Code
		//[CONTACTS]Contact Code
		Mail_LetAlloc("Label")
	: (rCont=1)
		MContComp_Calc
		//that will load the relevant co
		//put this field on the label [MAILSORT MAIL]SSC
		//and these
		//[COMPANIES]Company Code
		//[CONTACTS]Contact Code
		Mail_LetAlloc("Label")
		vCompCode:=[COMPANIES:2]Company_Code:1
	: (rDiary=1)
		RELATE ONE:C42([DIARY:12]Company_Code:1)
		RELATE ONE:C42([DIARY:12]Contact_Code:2)
		//that will load the relevant co
		//put this field on the label [MAILSORT MAIL]SSC
		//and these
		//[COMPANIES]Company Code
		//[CONTACTS]Contact Code
		Mail_LetAlloc("Label")
		vCompCode:=[COMPANIES:2]Company_Code:1
	: (rContr=1)
		RELATE ONE:C42([CONTRACTS:17]Company_Code:1)
		RELATE ONE:C42([CONTRACTS:17]Contact_Code:2)
		//that will load the relevant co
		//put this field on the label [MAILSORT MAIL]SSC
		//and these
		//[COMPANIES]Company Code
		//[CONTACTS]Contact Code
		Mail_LetAlloc("Label")
	: (rOrd>0)
		If (rOrd=2)
			RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
		End if 
		RELATE ONE:C42([ORDERS:24]Company_Code:1)
		RELATE ONE:C42([ORDERS:24]Contact_Code:2)
		//that will load the relevant co
		//put this field on the label [MAILSORT MAIL]SSC
		//and these
		//[COMPANIES]Company Code
		//[CONTACTS]Contact Code
		Mail_LetAlloc("Label")
	: ((rState=1) | (rState=3))
		MState_CalcRel
		//put this field on the label [MAILSORT MAIL]SSC•
		//and these
		//[COMPANIES]Company Code
		//[CONTACTS]Contact Code
		Mail_LetAlloc("Label")
	: (rState=2)
		RELATE ONE:C42([INVOICES:39]Company_Code:2)
		RELATE ONE:C42([INVOICES:39]Contact_Code:3)
		//put this field on the label [MAILSORT MAIL]SSC•
		//and these
		//[COMPANIES]Company Code
		//[CONTACTS]Contact Code
		Mail_LetAlloc("Label")
		
End case 
ERR_MethodTrackerReturn("LabelPrint"; $_t_oldMethodName)