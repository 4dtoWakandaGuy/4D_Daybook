//%attributes = {}
If (False:C215)
	//Project Method Name:      CCMTransaxDefinitions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/10/2009 09:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CCM_al_ResponseFields;0)
	//ARRAY TEXT(CCM_at_ResponseFieldName;0)
	//ARRAY TEXT(CCM_at_ResponseFieldDict;0)
	C_BOOLEAN:C305(CCM_bo_TransaxRecieveDefsLoaded)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("CCMTransaxDefinitions")
//NOTE. THERE ARE FIELD SEPERATORS BEFORE AND AFTER EACH of the First_Field WITH A COMMA IN BETWEEN
If (Not:C34(CCM_bo_TransaxRecieveDefsLoaded))
	ARRAY LONGINT:C221(CCM_al_ResponseFields; 12)
	ARRAY TEXT:C222(CCM_at_ResponseFieldName; 12)
	ARRAY TEXT:C222(CCM_at_ResponseFieldDict; 12)
	
	CCM_al_ResponseFields{1}:=1
	CCM_at_ResponseFieldName{1}:="STATUS_CODE"
	CCM_at_ResponseFieldDict{1}:="Indicates the result of the transaction"+"1=Approved"+"2=Declined"+"10=Error, 20=data or sys error"
	CCM_al_ResponseFields{2}:=2
	CCM_at_ResponseFieldName{2}:="STATUS_MSG"
	CCM_at_ResponseFieldDict{2}:="Text description of STATUS_CODE"
	CCM_al_ResponseFields{3}:=3
	CCM_at_ResponseFieldName{3}:="TRANS_ID"
	CCM_at_ResponseFieldDict{3}:="Transaction ID of completed transaction, Returned when any TransactionType is used and ther transaction is successful"
	//upto here there are commas between the fields so double when decoding
	CCM_al_ResponseFields{4}:=4
	CCM_at_ResponseFieldName{4}:="AUTH_CODE"
	CCM_at_ResponseFieldDict{4}:=" Transaction AUthorization Code"
	CCM_al_ResponseFields{5}:=5
	CCM_at_ResponseFieldName{5}:="AVS_CODE"
	CCM_at_ResponseFieldDict{5}:="The AVS result code, Y, D, or M=Exact match, 5 char numeric zip. A orB=address match only, W=0 character numeric zip match only Zp or L= 5 character numeric ZIP match only, N or C=no address or SZIP match, U=address unavailable, G or I =non us issuer,"+" R=issuer sys anavailable, E=not a mail/phone corder, S sercive not supported 0,0 or b AVS not available"
	CCM_al_ResponseFields{6}:=6
	CCM_at_ResponseFieldName{6}:="AVS MSG"
	CCM_at_ResponseFieldDict{6}:="Text Description of AVS result"
	CCM_al_ResponseFields{7}:=7
	CCM_at_ResponseFieldName{7}:="CVV2_CODE"
	CCM_at_ResponseFieldDict{7}:="M=CVV2/CVC3 match, N=CVV2/CVC2 No Match, P=Not Processed, S=Merchant"
	CCM_al_ResponseFields{8}:=8
	CCM_at_ResponseFieldName{8}:="CVV2_MSG"
	CCM_at_ResponseFieldDict{8}:="Text Description of CVV2_CODE"
	CCM_al_ResponseFields{9}:=9
	CCM_at_ResponseFieldName{9}:="ORDERID"
	CCM_at_ResponseFieldDict{9}:="Return of OrderID passed in during request"
	CCM_al_ResponseFields{10}:=10
	CCM_at_ResponseFieldName{10}:="CUSTOMER_VAULT_ID"
	CCM_at_ResponseFieldDict{10}:="If Customer_Vault_Action used, the Customer_Vault_ID will be returned"
	CCM_al_ResponseFields{11}:=11
	CCM_at_ResponseFieldName{11}:="FULLRESPONSE"
	CCM_at_ResponseFieldDict{11}:="Full response from gateway for troubleshooting purposes"
	CCM_al_ResponseFields{12}:=12
	CCM_at_ResponseFieldName{12}:="POSTSTRING"
	CCM_at_ResponseFieldDict{12}:="Full text request sent to gateway for troubleshooting purposes."
	CCM_bo_TransaxRecieveDefsLoaded:=True:C214
End if 
ERR_MethodTrackerReturn("CCMTransaxDefinitions"; $_t_oldMethodName)