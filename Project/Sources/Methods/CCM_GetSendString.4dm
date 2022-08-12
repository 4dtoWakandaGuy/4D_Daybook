//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_GetSendString
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 18:49`Method: CCM_GetSendString
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_GetSendString")
//NG May 2005
//this method translates some terms to PSP specific strings
If (Count parameters:C259>=2)
	
	Case of 
		: ($1="Transax")
			Case of 
				: ($2="PRIOR_AUTH_CAPTURE")
					$0:="capture"
				: ($2="AUTH_CAPTURE")
					$0:="sale"
				: ($2="AUTH_ONLY")
					$0:="auth"
				: ($2="Credit")
					$0:="refund"
				: ($2="VOID")
					$0:="Void"
			End case 
			
		: ($1="Authorize Net")
			Case of 
				: ($2="PRIOR_AUTH_CAPTURE")
					$0:="PRIOR_AUTH_CAPTURE"
				: ($2="AUTH_CAPTURE")
					$0:=$2
				: ($2="AUTH_ONLY")
					$0:=$2
				: ($2="Credit")
					$0:=$2
				: ($2="VOID")
					$0:=$2
			End case 
		: ($1="Planet Payment")
			
		: ($1="e-xact")
			
		: ($1="Link Point")
			
		: ($1="Worldpay")
			
			Case of 
				: ($2="PRIOR_AUTH_CAPTURE")
					$0:="0"
				: ($2="AUTH_CAPTURE")
					$0:="A"
				: ($2="AUTH_ONLY")
					$0:="E"
				: ($2="Credit")
					$0:="??"
			End case 
			
		: ($1="ION Gate")
			
		: ($1="Paypal")
			Case of 
				: ($2="PRIOR_AUTH_CAPTURE")
					$0:="CAPTURE"  //Not this redericts the module we use-from dodirect
				: ($2="AUTH_CAPTURE")
					$0:="Sale"
				: ($2="AUTH_ONLY")
					$0:="Authorization"
				: ($2="Credit")
					$0:="Refund"  //note this redirects the module we use to RefundTransaction or dononreferenced..must know
				: ($2="VOID")
					$0:="Void"
			End case 
			
	End case 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("CCM_GetSendString"; $_t_oldMethodName)