//%attributes = {}
If (False:C215)
	//Project Method Name:      CCMAuthorizenetDefinitions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCMAuthorizenetDefinitions")
//NOTE. THERE ARE FIELD SEPERATORS BEFORE AND AFTER EACH of the First_Field WITH A COMMA IN BETWEEN
ARRAY LONGINT:C221(CCM_al_ResponseFields; 40)
ARRAY TEXT:C222(CCM_at_ResponseFieldName; 40)
ARRAY TEXT:C222(CCM_at_ResponseFieldDict; 40)

CCM_al_ResponseFields{1}:=1
CCM_at_ResponseFieldName{1}:="Response Code"
CCM_at_ResponseFieldDict{1}:="Indicates the result of the transaction"+"1=Approved"+"2=Declined"+"3=Error"
CCM_al_ResponseFields{2}:=2
CCM_at_ResponseFieldName{2}:="Response Subcode"
CCM_at_ResponseFieldDict{2}:="A code used by the system for internal transaction tracking"
CCM_al_ResponseFields{3}:=3
CCM_at_ResponseFieldName{3}:="Response Reason Code"
CCM_at_ResponseFieldDict{3}:=" code representing more details about the result of the transaction."
//upto here there are commas between the fields so double when decoding
CCM_al_ResponseFields{4}:=4
CCM_at_ResponseFieldName{4}:="Response Reason Text"
CCM_at_ResponseFieldDict{4}:=" Brief description of the result"
CCM_al_ResponseFields{5}:=5
CCM_at_ResponseFieldName{5}:="Approval Code"
CCM_at_ResponseFieldDict{5}:="The six-digit alphanumeric authorization code"
CCM_al_ResponseFields{6}:=6
CCM_at_ResponseFieldName{6}:="AVS Result Code"
CCM_at_ResponseFieldDict{6}:="Indicates the result of Address(AVS)checks:"+" A=Address(Street)matches, ZIP does not"+"B=Address information not provide"+"E=AVS error"+"G=Non-U.S. Card Issuing Bank"+"N=No Match on Address(Street)or ZIP"+"P=AVS not applicable for this tra"+"R=Retry – System unavailable or t"+"S=Service not supported by issuer"+"U=Address information is unavaila"+"W=0(Street)does not"+"X=Address(Street)and 9 digit ZIP match"+"Y=Address(Street)and 5 digit ZIP match"+"Z=0(Street)does not"
CCM_al_ResponseFields{7}:=7
CCM_at_ResponseFieldName{7}:="Transaction ID"
CCM_at_ResponseFieldDict{7}:="This number identifies the tran"
CCM_al_ResponseFields{8}:=8
CCM_at_ResponseFieldName{8}:="Invoice Number"
CCM_at_ResponseFieldDict{8}:=" from form input value fo"
CCM_al_ResponseFields{9}:=9
CCM_at_ResponseFieldName{9}:=""
CCM_at_ResponseFieldDict{9}:="Echoed from form input value fo"
CCM_al_ResponseFields{10}:=10
CCM_at_ResponseFieldName{10}:="Amount"
CCM_at_ResponseFieldDict{10}:="Echoed from form input value fo"
CCM_al_ResponseFields{11}:=11
CCM_at_ResponseFieldName{11}:="Method"
CCM_at_ResponseFieldDict{11}:="Echoed from form input value "
CCM_al_ResponseFields{12}:=12
CCM_at_ResponseFieldName{12}:="Transaction Type"
CCM_at_ResponseFieldDict{12}:="Echoed from form input value"
CCM_al_ResponseFields{13}:=13
CCM_at_ResponseFieldName{13}:="Customer ID"
CCM_at_ResponseFieldDict{13}:="Echoed from form input value"
CCM_al_ResponseFields{14}:=14
CCM_at_ResponseFieldName{14}:="Cardholder First Name"
CCM_at_ResponseFieldDict{15}:="Echoed from form input value"
CCM_al_ResponseFields{15}:=15
CCM_at_ResponseFieldName{15}:="Cardholder Last Name"
CCM_at_ResponseFieldDict{15}:="Echoed from form input value"
CCM_al_ResponseFields{16}:=16
CCM_at_ResponseFieldName{16}:="Company"
CCM_at_ResponseFieldDict{16}:="Echoed from form input value"
CCM_al_ResponseFields{17}:=17
CCM_at_ResponseFieldName{17}:="Billing Address"
CCM_at_ResponseFieldDict{17}:="Echoed from form input value"
CCM_al_ResponseFields{18}:=18
CCM_at_ResponseFieldName{18}:="City"
CCM_at_ResponseFieldDict{18}:="Echoed from form input value"
CCM_al_ResponseFields{19}:=19
CCM_at_ResponseFieldName{19}:="State"
CCM_at_ResponseFieldDict{19}:="Echoed from form input value"
CCM_al_ResponseFields{20}:=20
CCM_at_ResponseFieldName{20}:="Zip"
CCM_at_ResponseFieldDict{20}:="Echoed from form input value"
CCM_al_ResponseFields{21}:=21
CCM_at_ResponseFieldName{21}:="Country"
CCM_at_ResponseFieldDict{21}:="Echoed from form input value"
CCM_al_ResponseFields{22}:=22
CCM_at_ResponseFieldName{22}:="Phone"
CCM_at_ResponseFieldDict{22}:="Echoed from form input value"
CCM_al_ResponseFields{23}:=23
CCM_at_ResponseFieldName{23}:="Fax"
CCM_at_ResponseFieldDict{23}:="Echoed from form input value"
CCM_al_ResponseFields{24}:=24
CCM_at_ResponseFieldName{24}:="Email"
CCM_at_ResponseFieldDict{24}:="Echoed from form input value"
CCM_al_ResponseFields{25}:=25
CCM_at_ResponseFieldName{25}:="Ship to First Name"
CCM_at_ResponseFieldDict{25}:="Echoed from form input value"
CCM_al_ResponseFields{26}:=26
CCM_at_ResponseFieldName{26}:="Ship to Last Name"
CCM_at_ResponseFieldDict{26}:="Echoed from form input value"
CCM_al_ResponseFields{27}:=27
CCM_at_ResponseFieldName{27}:="Ship to Company"
CCM_at_ResponseFieldDict{27}:="Echoed from form input value fo"
CCM_al_ResponseFields{28}:=28
CCM_at_ResponseFieldName{28}:="Ship to Address"
CCM_at_ResponseFieldDict{28}:="Echoed from form input value fo"
CCM_al_ResponseFields{29}:=29
CCM_at_ResponseFieldName{29}:="Ship to City"
CCM_at_ResponseFieldDict{29}:="Echoed from form input value fo"
CCM_al_ResponseFields{30}:=30
CCM_at_ResponseFieldName{30}:="Ship to State"
CCM_at_ResponseFieldDict{30}:="Echoed from form input value fo"
CCM_al_ResponseFields{31}:=31
CCM_at_ResponseFieldName{31}:="Ship to Zip"
CCM_at_ResponseFieldDict{31}:="Echoed from form input value fo"
CCM_al_ResponseFields{32}:=32
CCM_at_ResponseFieldName{32}:="Ship to Country"
CCM_at_ResponseFieldDict{32}:="Echoed from form input value fo"
CCM_al_ResponseFields{33}:=33
CCM_at_ResponseFieldName{33}:="Tax Amount"
CCM_at_ResponseFieldDict{33}:="Echoed from form input value fo"
CCM_al_ResponseFields{34}:=34
CCM_at_ResponseFieldName{34}:="Duty Amount"
CCM_at_ResponseFieldDict{34}:="Echoed from form input value fo"
CCM_al_ResponseFields{35}:=35
CCM_at_ResponseFieldName{35}:="Freight Amount"
CCM_at_ResponseFieldDict{35}:="Echoed from form input value fo"
CCM_al_ResponseFields{36}:=36
CCM_at_ResponseFieldName{36}:="Tax Exempt Flag"
CCM_at_ResponseFieldDict{36}:="Echoed from form input value fo"
CCM_al_ResponseFields{37}:=37
CCM_at_ResponseFieldName{37}:="PO Number"
CCM_at_ResponseFieldDict{37}:="Echoed from form input value fo"
CCM_al_ResponseFields{38}:=38
CCM_at_ResponseFieldName{38}:="MD5 Hash"
CCM_at_ResponseFieldDict{38}:="System -generated hash that may be vali"
CCM_al_ResponseFields{39}:=39

CCM_at_ResponseFieldName{39}:="CVV2 Response Code"
CCM_at_ResponseFieldDict{39}:="Indicates the results of Card C"+"M=Match"+"N=No Match"+"P=Not Processed"+"S=Should have been present"+"U=Issuer unable to process reques"
CCM_al_ResponseFields{40}:=40

CCM_at_ResponseFieldName{40}:="Cardholder Authentication Verif(CAVV)Response Code"
CCM_at_ResponseFieldDict{40}:="Indicates the results of cardholder"+"Blank or not present=CAVV not validated"+"0=CAVV not validated because erro"+"1=CAVV failed validation"+"2=CAVV passed validation"+"3=CAVV validation could not be pe;issuer attempt incomplete"+"4=CAVV validation could not be pe;issuer system error"+"5=Reserved for future use"+"6=Reserved for future use"+"7=CAVV attempt-failed validation-issuer available(U.S.-issued card/non-U.S. acqui"+"rer)"+"8=CAVV attempt-passed validation-issuer available(U.S.-issued card/non-U.S. acqui"+"rer)"+"9=CAVV attempt-failed validation-issuer unavailable(U.S.-issued card/non-U.S. acq"+"uirer)"+"A=CAVV attempt-passed validation-issuer unavailable(U.S.-issued card/non-U.S. acq"+"uirer)"+"B=CAVV passed validation, informa"
//41-68


//Reserved for future use.
//69-


//Echo of merchant-defined fields.
ERR_MethodTrackerReturn("CCMAuthorizenetDefinitions"; $_t_oldMethodName)