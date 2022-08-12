//%attributes = {}
If (False:C215)
	//Project Method Name:      Letter_Email
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 14:16
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	//C_UNKNOWN(k12003)
	//C_UNKNOWN(k12007)
	//C_UNKNOWN(rDiary)
	//C_UNKNOWN(vHeading)
	//C_UNKNOWN(vLetterCode)
	//C_UNKNOWN(vSearch)
	//C_UNKNOWN(vText)
	//C_UNKNOWN(Write_2)
	C_BOOLEAN:C305(<>Email_bo_PersonInited)
	C_LONGINT:C283($0; rDiary; WRITE_2; $_l_Error)
	C_POINTER:C301($1; $_ptr_CurrentTable; $1)
	C_TEXT:C284(<>PER_t_CurrentEmailFrom; $_t_ContacName; $_t_oldMethodName; vHeading; vLetterCode; vSearch; vText; <>MAIL_t_SMTPServer; <>PER_t_CurrentEmailFrom; $_t_ContacName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letter_Email")
//Letter_Email - see also Letter_Print
$_ptr_CurrentTable:=$1
While (Semaphore:C143("InitEmail"))
	DelayTicks(2)
End while 
If (<>Email_bo_PersonInited=False:C215)
	LOGIN_SetEmail
End if 
CLEAR SEMAPHORE:C144("InitEmail")
$0:=0
vSearch:=Contact_Email
If (vSearch="")
	vSearch:=Company_Email
End if 
$_t_ContacName:=[CONTACTS:1]Contact_Name:31
If (vSearch="")
	If (Records in selection:C76($_ptr_CurrentTable->)>1)
		MESSAGE:C88("   "+$_t_ContacName+(", "*(Num:C11($_t_ContacName#"")))+[COMPANIES:2]Company_Name:2+"    No Email Address"+Char:C90(13))
	Else 
		Gen_Alert("No suitable Email Address was found")
	End if 
	$0:=1
	
Else 
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=vLetterCode)
	Letter_Print2
	Case of 
		: (Documents_4DWriteAccessType(False:C215)="W@")
			If (OK=1)
				vText:=""
				Write_2:=WR New offscreen area:P12000:47  //wr new offscreen area
				WR PICTURE TO AREA:P12000:141(Write_2; [DOCUMENTS:7]Write_:5)
				Letter_Replace
				// WR O COMPUTE NOW (Write)
				//NG April 2000 update to 4D write 655-replaced above command
				WR EXECUTE COMMAND:P12000:113(Write_2; wr cmd compute references:K12007:172)
				WR SET DOC PROPERTY:P12000:109(Write_2; wr view references:K12003:17; 0)
				vHeading:=[DOCUMENTS:7]Heading:2
				WR SET SELECTION:P12000:3(Write_2; 0; 32000)
				vText:=WR Get selected text:P12000:21(Write_2)
				WR DELETE OFFSCREEN AREA:P12000:38(Write_2)
			End if 
			
		Else 
			vHeading:=[DOCUMENTS:7]Heading:2
			vText:=[DOCUMENTS:7]Text:3
			Letter_Replace
	End case 
	
	If ((rDiary=1) & ([DIARY:12]Document_Heading:32#""))
		vHeading:=[DIARY:12]Document_Heading:32
	End if 
	// vHeading:=IME_Replace(vHeading)
	vHeading:=ReplaceIME(vHeading)  // 22/04/02 pb
	//  $_l_Error:=IME SendMail(vSearch;vHeading;vText;0)
	$_l_Error:=SMTP_QuickSend(<>MAIL_t_SMTPServer; <>PER_t_CurrentEmailFrom; vSearch; vHeading; vText)  // 22/04/02 pb
	If ($_l_Error>0)
		If (Records in selection:C76($_ptr_CurrentTable->)>1)
			MESSAGE:C88("   "+$_t_ContacName+(", "*(Num:C11($_t_ContacName#"")))+[COMPANIES:2]Company_Name:2+" - Email Error"+Char:C90(13))
		Else 
			Gen_Alert("Mail Error "+String:C10($_l_Error))
		End if 
		$0:=2
	Else 
		//  Diary_Done ("EMAIL")
		// DB_SaveRecord(->[DIARY])
		AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
	End if 
	
End if 
ERR_MethodTrackerReturn("Letter_Email"; $_t_oldMethodName)
