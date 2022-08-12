If (False:C215)
	//Table Form Method Name: Object Name:      [DOCUMENTS].EMail_IN
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; DB_bo_NoLoad)
	C_LONGINT:C283(EmailWrite)
	C_TEXT:C284(<>DB_t_UserGrEmailSMTP; <>DefSignature; <>Per_at_PersonnelNames_EmailFrom; <>Per_at_PersonnelNames_Signature; <>UserGr_EmailSignature; <>UserGr_Signature; $_t_oldMethodName; EMAIL_T_EmailSignature; EMAIL_t_FooterText; EMAIL_t_InsText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].EMail_IN"; Form event code:C388)
EMAIL_t_InsText:=""
If (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	While (Semaphore:C143("InitEmail"))
		DelayTicks(2)
	End while 
	If (<>Email_bo_PersonInited=False:C215)
		LOGIN_SetEmail
	End if 
	CLEAR SEMAPHORE:C144("InitEmail")
	
	OpenHelp(Table:C252(->[DOCUMENTS:7]); "EMail_IN")
	WR SET DOC PROPERTY:P12000:109(EmailWrite; wr view rulers:K12003:3; 0)
	WR SET DOC PROPERTY:P12000:109(EmailWrite; wr view statusbar:K12003:10; 0)
	WR SET DOC PROPERTY:P12000:109(EmailWrite; wr view menubar:K12003:11; 0)
	WR SET DOC PROPERTY:P12000:109(EmailWrite; wr view standard palette:K12003:12; 0)
	WR SET DOC PROPERTY:P12000:109(EmailWrite; wr view format palette:K12003:13; 0)
	WR SET DOC PROPERTY:P12000:109(EmailWrite; wr view style palette:K12003:14; 0)
	WR SET DOC PROPERTY:P12000:109(EmailWrite; wr view borders palette:K12003:15; 0)
	
	Case of   //Sender Address
		: (<>Per_at_PersonnelNames_EmailFrom#"")
			//[DOCUMENTS]SR_PreMacro:=◊Personnel_EmailFrom
		: (<>DB_t_UserGrEmailSMTP#"")
			//[DOCUMENTS]SR_PreMacro:=◊UserGr_EmailFrom
		Else 
			//[DOCUMENTS]SR_PreMacro:=◊DefReplyToaddress
	End case 
	EMAIL_t_FooterText:=""
	If (False:C215)  //BSW 24/06/01 - changed as directed by steve
		EMAIL_t_InsText:=Char:C90(13)+"----------------------"+Char:C90(13)+<>Per_at_PersonnelNames_EmailFrom+Char:C90(13)+Char:C90(13)+"Daybook 4.2.014a DEMO"
	Else 
		EMAIL_t_InsText:=""
	End if 
	Case of   //Reply To address
		: (<>Per_at_PersonnelNames_Signature#"")
			EMAIL_T_EmailSignature:=<>Per_at_PersonnelNames_Signature
		: (<>UserGr_EmailSignature#"")
			EMAIL_T_EmailSignature:=<>UserGr_Signature
		Else 
			EMAIL_T_EmailSignature:=<>DefSignature
	End case 
	EMAIL_t_InsText:=Char:C90(13)+EMAIL_T_EmailSignature  //EMAIL_t_InsText+Char(13)+
	WR INSERT TEXT:P12000:19(EmailWrite; EMAIL_t_InsText)
End if 
ERR_MethodTrackerReturn("FM [DOCUMENTS].EMail_IN"; $_t_oldMethodName)
