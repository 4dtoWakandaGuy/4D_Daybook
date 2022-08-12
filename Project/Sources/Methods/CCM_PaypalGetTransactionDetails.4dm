//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_PaypalGetTransactionDetails
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/04/2012 10:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_TestMode; $5)
	C_LONGINT:C283($_l_CCMResponseCode)
	C_TEXT:C284($_t_CCMAuthorizationLogin; $_t_CCMAuthorizationPass; $_t_CCMAuthorizationPassID; $_t_CCMResponseCode; $_t_oldMethodName; $0; $1; $2; $3; $4; CCM_t_responseText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_PaypalGetTransactionDetails")
//TRACE

If (Count parameters:C259>=4)
	$_t_CCMAuthorizationLogin:=$2
	$_t_CCMAuthorizationPass:=$3
	$_t_CCMAuthorizationPassID:=$4
	If (Count parameters:C259>=5)
		$_bo_TestMode:=$5
	Else 
		$_bo_TestMode:=("timx_1334746876_biz_api1.me.com"=$_t_CCMAuthorizationLogin)
	End if 
	$0:=""
	$_l_CCMResponseCode:=CCM_PaypalRequest($_bo_TestMode; $_t_CCMAuthorizationLogin; $_t_CCMAuthorizationPass; $_t_CCMAuthorizationPassID; "DETAILS"; 0; "GetTransactionDetails"; $1)
	$0:=CCM_t_responseText
End if 
ERR_MethodTrackerReturn("CCM_PaypalGetTransactionDetails"; $_t_oldMethodName)