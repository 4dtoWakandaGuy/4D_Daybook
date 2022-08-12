//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_GetCard
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  11/08/2010 16:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(CCM_tName)
	C_DATE:C307(CCM_tExpiryDate)
	C_LONGINT:C283($_l_CCIsueNumber)
	C_REAL:C285(CCM_r_isinternal)
	C_TEXT:C284($_t_oldMethodName; CCM_t_CardNumber; CCM_t_issueNumber; CCM_tName; $_t_CardNumber; $_t_oldMethodName; CCM_t_CardNumber; CCM_t_issueNumber)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_GetCard")
If ([ORDERS:24]CC_Issue_No:54#"")
	CCM_r_isinternal:=801801801801
	$_l_CCIsueNumber:=Num:C11([ORDERS:24]CC_Issue_No:54)
	$_t_CardNumber:=""
	QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$_l_CCIsueNumber)
	If (Records in selection:C76([xCreditCardDetails:132])=1)
		$_t_CardNumber:=CCM_GetCardNumber
		
	End if 
	CCM_t_CardNumber:=$_t_CardNumber
	CCM_tExpiryDate:=[xCreditCardDetails:132]EndDate:8
	CCM_t_issueNumber:=[xCreditCardDetails:132]IssueNumber:10
	CCM_tName:=CCM_DecryptCardName
	
	
End if 
ERR_MethodTrackerReturn("CCM_GetCard"; $_t_oldMethodName)
