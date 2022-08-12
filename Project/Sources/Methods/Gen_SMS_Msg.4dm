//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_SMS_Msg
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SMS_at_Mobile;0)
	//ARRAY TEXT(SMS_at_Name;0)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal; MSG_bo_QuickMessage)
	C_LONGINT:C283(<>iSMS_MaxMessageLength; $_l_FieldNumber; $_l_Index; $_l_TableNumber; $_l_WindowReference)
	C_POINTER:C301($5; $6)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; $0; $1; $2; $3; $4; MSG_t_CharsRemain; vConfirm; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_SMS_Msg")
// Gen_SMS_Msg
//Creating and displaying SMS messages
// Parameters:
//       $1=Confirmation message
//       $2=the message to send
//       $3=One mobile no.(validated)--blank if $3 is used
//       $4 = One [Contacts]Contact Code
//       $5 = POINTER TO an array of mobile nos. (validated)
//       $6 = POINTER TO an array of Contact Codes
//       Use EITHER $3 & $4 OR $5 and $6
// 10/06/02 pb

<>SYS_bo_CurrentWindowModal:=True:C214
vConfirm:=$1
MSG_t_CharsRemain:=""
If (Count parameters:C259>1)
	vT:=$2
Else 
	vT:=""
End if 

$_l_WindowReference:=Open form window:C675([COMPANIES:2]; "dRequest_SMSText"; 1)

MSG_t_CharsRemain:="Characters remaining: "+String:C10(<>iSMS_MaxMessageLength)
Case of 
	: (MSG_bo_QuickMessage=True:C214)  // 19/12/02 pb
		ARRAY TEXT:C222(SMS_at_Mobile; 1)
		ARRAY TEXT:C222(SMS_at_Name; 1)
		ARRAY TEXT:C222(SD2_at_ContactIDs; 1)
		SMS_at_Mobile{1}:=$3  // mobile no.
		SMS_at_Name{1}:=""
		SD2_at_ContactIDs{1}:=""
		
	: ($3#"")  // Only one recipient has been specified
		ARRAY TEXT:C222(SMS_at_Mobile; 1)
		ARRAY TEXT:C222(SMS_at_Name; 1)
		ARRAY TEXT:C222(SD2_at_ContactIDs; 1)
		SMS_at_Mobile{1}:=$3  // mobile no.
		SMS_at_Name{1}:=[CONTACTS:1]Contact_Name:31
		SD2_at_ContactIDs{1}:=$4  // contact code
		
	Else 
		
		RESOLVE POINTER:C394($5; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		If ($_t_VariableName#"SMS_at_Mobile")
			ARRAY TEXT:C222(SMS_at_Mobile; 0)
			ARRAY TEXT:C222(SMS_at_Name; 0)
			ARRAY TEXT:C222(SD2_at_ContactIDs; 0)
			COPY ARRAY:C226($5->; SMS_at_Mobile)
			COPY ARRAY:C226($6->; SD2_at_ContactIDs)
		End if 
		
		ARRAY TEXT:C222(SMS_at_Name; Size of array:C274(SD2_at_ContactIDs))
		For ($_l_Index; 1; Size of array:C274(SD2_at_ContactIDs))
			If (SD2_at_ContactIDs{$_l_Index}#"")
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_ContactIDs{$_l_Index})
				SMS_at_Name{$_l_Index}:=[CONTACTS:1]Contact_Name:31
			End if 
		End for 
		SORT ARRAY:C229(SMS_at_Name; SD2_at_ContactIDs; SMS_at_Mobile)
End case 

DIALOG:C40([COMPANIES:2]; "dRequest_SMSText")
CLOSE WINDOW:C154
$0:=vT
<>SYS_bo_CurrentWindowModal:=False:C215
ERR_MethodTrackerReturn("Gen_SMS_Msg"; $_t_oldMethodName)