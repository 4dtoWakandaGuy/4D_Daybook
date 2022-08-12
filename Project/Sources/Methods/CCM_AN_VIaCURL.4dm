//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_AN_VIaCURL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/12/2009 12:48`Method: CCM_AN_VIaCURL
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ErrorCode)
	C_TEXT:C284($_t_Empty; $_t_Error; $_t_Input; $_t_oldMethodName; $_t_Output; $_t_SendRequest; $_t_SendURL; $RECtext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_AN_VIaCURL")


$_t_SendRequest:="requestType=BACKEND&"
//$_t_SendRequest:=$_t_SendRequest+"merchant_id="+String($merchantID)+"&"
//$_t_SendRequest:=$_t_SendRequest+"trnOrderNumber="+String($6)+"&"

//and so on... for all transaction fields...

//$_t_SendRequest:=fnURLEncode($_t_SendRequest)  ` encodes non-allowable url characters

$_t_SendURL:="https://www.beanstream.com/scripts/process_transaction.asp?"+$_t_SendRequest

$_t_Input:="curl "+$_t_SendURL
$_t_Empty:=""

LAUNCH EXTERNAL PROCESS:C811($_t_Input; $_t_Empty; $_t_Output; $_t_Error)

//$RECtext:=fnURLDecode($_t_Output)  ` decodes non-allowable url characters

//$_l_ErrorCode:=subCCTransactionParseResult($RECtext;$8;$9;$10)
ERR_MethodTrackerReturn("CCM_AN_VIaCURL"; $_t_oldMethodName)