If (False:C215)
	//Project Form Method Name:      CCM_TestOptions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CCM_al_ResponseCodes;0)
	//ARRAY TEXT(CCM_at_ResponseReasons;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_Event; CCM_l_Badtransactions; CCM_l_Goodtransactions; opt_CCM_l_Goodtransactions_1; opt_CCM_l_Goodtransactions_2; opt_CCM_l_Goodtransactions_3; opt_CCM_l_Goodtransactions_4)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM CCM_TestOptions"; Form event code:C388)
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		WS_AutoscreenSize(3; 455; 355)
		CCM_l_Goodtransactions:=1
		
		CCM_l_Badtransactions:=0
		
		opt_CCM_l_Goodtransactions_1:=1
		opt_CCM_l_Goodtransactions_2:=0
		opt_CCM_l_Goodtransactions_3:=0
		opt_CCM_l_Goodtransactions_4:=0
		ARRAY TEXT:C222(CCM_at_ResponseReasons; 0)
		OBJECT SET VISIBLE:C603(CCM_at_ResponseReasons; False:C215)
		ARRAY LONGINT:C221(CCM_al_ResponseCodes; 0)
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 2)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Transaction Declined(2)")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 3)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Transaction Declined(3)")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 4)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Card used needs to be picked up")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 5)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Valid Amount required")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 6)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Card number is invalid")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 7)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Date format is incorrect")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 8)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Card has expired")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 9)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "ABA code invalid")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 10)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Account number invalid")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 11)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Duplicate Transaction Within 2 mins")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 12)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Auth Code required but not submitted")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 13)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Merchant Account not active")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 15)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Transaction ID is non-numeric")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 16)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Gateway has no record of transaction ID")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 17)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Merhcant not configured to accept the transacton")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 19)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Error occourred try again in 5 mins(19)")
		
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 20)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Error occourred try again in 5 mins(20)")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 21)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Error occourred try again in 5 mins(21)")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 22)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Error occourred try again in 5 mins(22)")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 23)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Error occourred try again in 5 mins(23)")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 25)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Error occourred try again in 5 mins(25)")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 26)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Error occourred try again in 5 mins(26)")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 27)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "AVS address does not match")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 28)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Merchant ID at the processor not configured")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 35)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Error occourred call Merchant service provider")
		APPEND TO ARRAY:C911(CCM_al_ResponseCodes; 39)
		APPEND TO ARRAY:C911(CCM_at_ResponseReasons; "Currency Code not valid")
End case 
ERR_MethodTrackerReturn("FM CCM_TestOptions"; $_t_oldMethodName)
