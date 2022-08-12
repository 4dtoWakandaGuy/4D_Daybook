//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_Temp_ExpOrderNos
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/01/2010 18:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_MissingCodes; 0)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; <>SYS_bo_QuitCalled; $_bo_Compare)
	C_LONGINT:C283($_l_CurrentTIme; $_l_CurrentTIme2; $_l_Delay; $_l_Index)
	C_REAL:C285($1)
	C_TEXT:C284(<>EMAIL_t_DefaultReplyToAddress; <>PER_t_CurrentEmailFrom; $_t_DocumentPath; $_t_DocumentPath2; $_t_EmailAttachment; $_t_EmailSentTo; $_t_EmailText; $_t_MailID; $_t_oldMethodName; $_t_OrderCode; EMAIL_t_SendCalledFrom)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_Temp_ExpOrderNos")
While (Semaphore:C143("InitEmail"))
	DelayTicks(2)
End while 
If (<>Email_bo_PersonInited=False:C215)
	LOGIN_SetEmail
End if 
CLEAR SEMAPHORE:C144("InitEmail")
Repeat 
	If (Count parameters:C259>=1)
		$_l_Delay:=$1
	Else 
		$_l_Delay:=60*60*60
	End if 
	
	$_t_DocumentPath:=DB_GetDocumentPath
	$_bo_Compare:=False:C215
	$_t_DocumentPath2:=$_t_DocumentPath+"OrderCodes"
	If (Test path name:C476($_t_DocumentPath2+".txt")=Is a document:K24:1)
		COPY DOCUMENT:C541($_t_DocumentPath2+".TXT"; $_t_DocumentPath2+"_OLD"+".Txt"; *)
		$_bo_Compare:=True:C214
	End if 
	$_ti_DocumentRef:=DB_CreateDocument($_t_DocumentPath2+".TXT"; "TEXT")
	ALL RECORDS:C47([ORDERS:24])
	For ($_l_Index; 1; Records in selection:C76([ORDERS:24]))
		SEND PACKET:C103($_ti_DocumentRef; [ORDERS:24]Order_Code:3+Char:C90(13))
		NEXT RECORD:C51([ORDERS:24])
		
	End for 
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	ARRAY TEXT:C222($_at_MissingCodes; 0)
	If ($_bo_Compare)
		$_ti_DocumentRef:=DB_OpenDocument($_t_DocumentPath2+"_OLD"+".Txt"; "TEXT")
		Repeat 
			RECEIVE PACKET:C104($_ti_DocumentRef; $_t_OrderCode; Char:C90(13))
			If ($_t_OrderCode#"")
				
				QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_t_OrderCode)
				If (Records in selection:C76([ORDERS:24])=0)
					
					INSERT IN ARRAY:C227($_at_MissingCodes; Size of array:C274($_at_MissingCodes)+1; 1)
					$_at_MissingCodes{Size of array:C274($_at_MissingCodes)}:=$_t_OrderCode
				End if 
			End if 
			
		Until (ok=0)
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		If (Size of array:C274($_at_MissingCodes)>0)
			$_t_DocumentPath2:=$_t_DocumentPath+"MissingCodes"
			$_ti_DocumentRef:=DB_CreateDocument($_t_DocumentPath2+".TXT"; "TEXT")
			For ($_l_Index; 1; Size of array:C274($_at_MissingCodes))
				SEND PACKET:C103($_ti_DocumentRef; $_at_MissingCodes{$_l_Index}+Char:C90(13)+Char:C90(10))
				
				
			End for 
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
			$_t_EmailSentTo:="To"
			///EMAIL_t_EmailTo:="Steve Arentsen"
			//EmailAddress:="Steven.Arentsen@panacea-services.co.uk"
			$_t_EmailAttachment:=$_t_DocumentPath2+".TXT"
			$_t_EmailText:="The attached document contains Order codes which are missing"
			EMAIL_t_SendCalledFrom:="ORD_Temp_expOrder"
			$_t_MailID:=Email_Send(->$_t_EmailSentTo; ->EMAIL_t_EmailTo; ->EmailAddress; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "MissingOrderReport"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
			
		End if 
		
	End if 
	$_l_CurrentTIme:=Current time:C178*1
	//Wait an hour here
	Repeat 
		DelayTicks(10*60)  // 10 seconds
		$_l_CurrentTIme2:=Current time:C178*1
	Until (<>SYS_bo_QuitCalled) | ($_l_CurrentTIme2>=($_l_CurrentTIme+($_l_Delay)))
	
Until (<>SYS_bo_QuitCalled)
ERR_MethodTrackerReturn("ORD_Temp_ExpOrderNos"; $_t_oldMethodName)
