//%attributes = {}
If (False:C215)
	//Project Method Name:      Letter_LoadD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2010 11:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0; $1)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName; DOC_t_DocumentCode; EMAIL_t_InsText; vFrom; vLetterCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letter_LoadD")
//Letter_LoadD
If (([DIARY:12]Document_Code:15#"") & ((vLetterCode="AUTO") | (Character code:C91(vLetterCode)=64) | (vLetterCode="")))
	RELATE ONE:C42([DIARY:12]Document_Code:15)
Else 
	If (Count parameters:C259>=2)
		QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$2->)
	Else 
		QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=vLetterCode)
	End if 
End if 
//Letter_Load   `Here we duplicate the document and make a new template.
//THE FIRST TIME WE VISIT WE TAKE A COPY OF THE DOC
//WE UPDATE THE DIARY DOC CODE
//AFTER THAT THE DOCUMENT REFERENCE IS THE COPY
//SO WE DONT COPY IT AGAIN.
If (Count parameters:C259>=2)
	If ($1=False:C215)
		If (Records in selection:C76([DOCUMENTS:7])=1)
			
			Case of 
				: ([DOCUMENTS:7]Document_Class:14=4D Write Letter Template) | ([DOCUMENTS:7]Document_Class:14=0)
					DUPLICATE RECORD:C225([DOCUMENTS:7])
					Let_No("M")
					Set_DocumentCode(2; "M"; DOC_t_DocumentCode)  //we have a copy of the document now
					[DOCUMENTS:7]Standard:9:=False:C215
					[DOCUMENTS:7]Document_Status:15:=0
				: ([DOCUMENTS:7]Document_Class:14=Text Email Template)
					DUPLICATE RECORD:C225([DOCUMENTS:7])
					Let_No("EM")
					Set_DocumentCode(2; "EM"; DOC_t_DocumentCode)  //we have a copy of the document now
					[DOCUMENTS:7]Standard:9:=False:C215
					[DOCUMENTS:7]Document_Status:15:=0
					//this is an email template-it does not have a signature on it
					//so we add the details for this at the bottom
					EMAIL_t_InsText:=Char:C90(13)+"----------------------"+Char:C90(13)+Char:C90(13)
					[DOCUMENTS:7]Text:3:=[DOCUMENTS:7]Text:3+EMAIL_t_InsText+Char:C90(13)+GetEmailSignature
				: ([DOCUMENTS:7]Document_Class:14=Text Email)
					Let_No("EM")
					Set_DocumentCode(2; "EM"; DOC_t_DocumentCode)  //we have a copy of the document now
					[DOCUMENTS:7]Standard:9:=False:C215
					[DOCUMENTS:7]Document_Status:15:=0
					//this is an email template-it does not have a signature on it
					//so we add the details for this at the bottom
					//EMAIL_t_InsText:=Char(13)+"----------------------"+Char(13)+[DIARY]Email_From+Char(1
					// [DOCUMENTS]Text:=[DOCUMENTS]Text+EMAIL_t_InsText+Char(13)+GetEmailSignature
			End case 
			[DOCUMENTS:7]Document_Class:14:=-(Abs:C99([DOCUMENTS:7]Document_Class:14))
			DB_SaveRecord(->[DOCUMENTS:7])
			$2->:=[DOCUMENTS:7]Document_Code:1
			[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
			$0:=True:C214
			
		End if 
	Else 
		$0:=$1
		
	End if 
End if 

//``````````````
If (vFrom="AUTO")
	RELATE ONE:C42([DIARY:12]Person:8)
	vFrom:=[PERSONNEL:11]Name:2
End if 
ERR_MethodTrackerReturn("Letter_LoadD"; $_t_oldMethodName)