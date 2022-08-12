//%attributes = {}
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 19/01/2012 01:33
	//Method Name: ErrorProcSpecial
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
End if 
//Moved into it's own method 04/04/08 -kmw


C_POINTER:C301($1; $pText)

C_POINTER:C301($2; $pNoEmail)

C_POINTER:C301($3; $pErrorInMethod)


$pText:=$1

$pNoEmail:=$2

$pErrorInMethod:=$3


Case of 
	: (Error=-1)
		C_LONGINT:C283($errSQLServer)
		C_TEXT:C284($errCode; $errText; $errODBC)
		SQL GET LAST ERROR:C825($errCode; $errText; $errODBC; $errSQLServer)
		$pText->:=$pText->+"SQL "+$errText
		
	: (Error=<>Err_l_NoError)
		$pNoEmail->:=True:C214  //dont want to know about this
		$pText->:=""
		<>Err_bo_ManualHandler:=True:C214
		<>Err_l_NoError:=0  //always clear it-its always for a one off
		
		
	: (Error=1006)
		$pText->:=""
		
		
	: (Error=-27)
		$pText->:=$pText->+"Problem opening or closing connection with printer"
	: (Error=-108)
		
		If (Is Windows:C1573)
			$pNoEmail->:=True:C214  //dont want to know about this
			$pText->:=$pText->+"Please use 4D customiser to allocation more or larger blocks of memory to your 4D"+" application"
		End if 
		
	: (Error=-1054)
		$pNoEmail->:=True:C214  //dont want to know about this
		$pText->:=$pText->+"Daybook is trying to write to a file on your hard drive, please configure your OS"+" to allow you to write to this file"
		
	: (Error=-128)
		$pNoEmail->:=True:C214  //dont want to know about this
		$pText->:=$pText->+"Printing interrupted by the user"
		
	: ((Error<-32) & (Error>-125))
		If (FileErrorTranslate(Error; $pText)=False:C215)  //Added kmw 30/10/08 v631b120c
			If (Error>-85)  //Added kmw 30/10/08 v631b120c (if FileErrorTranslate doesn't know this error code then revert to the simple old "File access error" message that was previously used for errors between -32 and -85)
				$pText->:=$pText->+"File access error. "
			End if 
		End if 
		//Check for special PDF995 additional file access error info (ie if PDF995_DoDocument was used for the document operation then it will have recorded the file path so we can add that to the error message as well)
		C_TEXT:C284(PDF995_DocumentOperation; PDF995_Param1; PDF995_Param2; PDF995_Param3; PDF995_Param4)
		Case of 
			: (PDF995_DocumentOperation="COPY DOCUMENT")
				$pText->:=$pText->+Char:C90(13)
				If (PDF995_Param3="*")
					$pText->:=$pText->+"Tried to copy from '"+PDF995_Param1+"' to '"+PDF995_Param2+"' - (overwrite option was turned on)."
				Else 
					$pText->:=$pText->+"Tried to copy from '"+PDF995_Param1+"' to '"+PDF995_Param2+"' - (overwrite option was turned off)."
				End if 
				
			: (PDF995_DocumentOperation="MOVE DOCUMENT")
				$pText->:=$pText->+Char:C90(13)
				$pText->:=$pText->+"Tried to move from '"+PDF995_Param1+"' to '"+PDF995_Param2+"'."
				
			: (PDF995_DocumentOperation="DELETE DOCUMENT")
				$pText->:=$pText->+Char:C90(13)
				$pText->:=$pText->+"Tried to delete '"+PDF995_Param1+"'."
				
			Else 
				
		End case 
		
		
	: ((Error=-193) | (Error=-4100) | (Error=-4101) | (Error=-4101) | (Error=-4101))
		$pText->:=$pText->+"Printer problem"
		
	: (Error=-9949)
		$pNoEmail->:=True:C214  //dont want to know about this
		
		$pText->:=$pText->+"You do not have access to 4D Write."+"  Try Quitting and logging on again as a WP user."
	: (Error=-9976)
		$pNoEmail->:=True:C214  //dont want to know about this
		$pText->:=$pText->+"A backup is in progress, check with you administrator before logging in again"
		QUIT 4D:C291
	: (Error=-9997)
		$pText->:=$pText->+"The maximum number of records has been reached"
	: (Error=-9998)
		C_TEXT:C284(<>SYS_t_LastSavedTableName; <>SYS_t_UniqueFields)
		If (<>SYS_t_LastSavedTableName#"")
			$pText->:="The record in "+<>SYS_t_LastSavedTableName+","+<>SYS_t_UniqueFields+"cannot be saved because another already"+" exists with an identical Unique Code"
		Else 
			$pText->:="The record(?) cannot be saved because another already"+" exists with an identical Unique Code"
		End if 
	: (Error=-9999)
		$pText->:=$pText->+"No more room to save the record"
	: (Error=-10000)
		$pText->:=$pText->+"Invalid record address (the data file needs to be repaired)"
	: (Error=-10001)
		$pText->:=$pText->+"Invalid index page (the data file needs to be repaired)"
	: (Error=-10002)
		$pText->:=$pText->+"Invalid record structure (the data file needs to be repaired)"
	: (Error=-10003)
		$pText->:=$pText->+"Record # is out of range (the data file needs to be repaired)"
	: (Error=-10004)
		$pText->:=$pText->+"Index page # is out of range (the data file needs to be repaired)"
		
	: (Error=9910) | (Error=9911) | (Error=9912) | (Error=9913) | (Error=9914)
		$WebServiceErrorCode:=WEB SERVICE Get info:C780(Web Service error code:K48:5)
		$WebServiceDetailedMessage:=WEB SERVICE Get info:C780(Web Service detailed message:K48:6)
		$WebServiceHTTPErrorCode:=WEB SERVICE Get info:C780(Web Service HTTP status code:K48:7)
		$WebServiceFaultActor:=WEB SERVICE Get info:C780(Web Service fault actor:K48:8)
		$pText->:=$pText->+"Problem with web service... "
		$pText->:=$pText->+Char:C90(13)+"WS Err Code: "+$WebServiceErrorCode
		$pText->:=$pText->+Char:C90(13)+"WS Err Error Message: "+$WebServiceDetailedMessage
		$pText->:=$pText->+Char:C90(13)+"WS HTTP Error Code: "+$WebServiceHTTPErrorCode
		$pText->:=$pText->+Char:C90(13)+"WS Fault Actor: "+$WebServiceFaultActor
		
		
	Else 
		$pText->:=$pText->+"in Method  : "+error method+" at line number "+String:C10(Error line)+Char:C90(13)+"(Process :"+Process_Name(Current process:C322)+")"
		
End case 