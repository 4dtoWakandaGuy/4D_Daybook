//%attributes = {}
If (False:C215)
	//Project Method Name:      LOG_text
	//------------------ Method Notes ------------------
	
	//LOG_Text factored out into it's own function from "Gen_Alert" so I could use it elsewhere also -11/03/09, kmw
	
	
	//Based on code factored out of Gen_Alert - output line of text to log file with date and time.
	
	//Appends text to a log file.
	
	//Takes log file name as $2 or defaults to "DaybookLogFile.txt" if none passed.
	
	//Automatically creates the log file if it doesn't yet exist.
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:49
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ErrorTryingtoLog; $0)
	C_LONGINT:C283($_l_MaxTries; $_l_NumTries)
	C_TEXT:C284($_t_LogFilePath; $_t_oldMethodName; $_t_TexttoLog; $1; $2)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LOG_Text")


$_t_TexttoLog:=$1


If (Count parameters:C259>1)
	If ($2#"")
		$_t_LogFilePath:=$2
	Else 
		$_t_LogFilePath:="DaybookLogFile.txt"
	End if 
Else 
	$_t_LogFilePath:="DaybookLogFile.txt"
End if 


//

$_bo_ErrorTryingtoLog:=False:C215

$_l_MaxTries:=6
$_l_NumTries:=0

While (Semaphore:C143("$LOG_Text") & ($_l_NumTries<$_l_MaxTries))
	DelayTicks(10)
	If (Semaphore:C143("$LOG_Text"))
		$_l_NumTries:=$_l_NumTries+1
	End if 
End while 

If ($_l_NumTries<$_l_MaxTries)  //didn't time out trying to get semaphore
	
	If (Test path name:C476($_t_LogFilePath)#Is a document:K24:1)
		$_ti_DocumentRef:=DB_CreateDocument($_t_LogFilePath)
		
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	End if 
	
	//If (in write mode - how do i check this withou tgenerating an error and detecting for that???)
	
	If (Is macOS:C1572)
		//_O_SET DOCUMENT CREATOR($_t_LogFilePath;"ttxt")
	End if 
	$_ti_DocumentRef:=Append document:C265($_t_LogFilePath)
	
	$_bo_ErrorTryingtoLog:=False:C215
	
	If (OK=0)  //` couldn't open it for some reason
		$_bo_ErrorTryingtoLog:=True:C214
	Else 
		SEND PACKET:C103($_ti_DocumentRef; (String:C10(Current date:C33)+Char:C90(9)+String:C10(Current time:C178)+Char:C90(9)+$_t_TexttoLog+Char:C90(13)))
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		
	End if 
	//Else   `couldn't Open_Document in write mode
	//$_bo_ErrorTryingtoLog:=True
	//End if
Else   //gave up trying to get the semaphore
	$_bo_ErrorTryingtoLog:=True:C214
End if 

CLEAR SEMAPHORE:C144("$LOG_Text")


$0:=$_bo_ErrorTryingtoLog
ERR_MethodTrackerReturn("LOG_Text"; $_t_oldMethodName)