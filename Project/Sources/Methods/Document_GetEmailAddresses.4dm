//%attributes = {}
If (False:C215)
	//Project Method Name:      Document_GetEmailAddresses
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 20:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_DocumentReference; $_t_EmailMailAddress; $_t_oldMethodName; $_t_ToEmailAddress; $_t_ToRoleCode; $0; $1; $2; $3; $4; COM_t_AccPayableEmail)
	C_TEXT:C284(COM_t_AccReceivableEmail; EMAIL_t_DocEmailRoletoText; Rep_t_docEmailToTxt)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Document_GetEmailAddresses")

If (Count parameters:C259>0)
	$_t_DocumentReference:=$1
Else 
	$_t_DocumentReference:=[DOCUMENTS:7]Document_Code:1
End if 

If (Count parameters:C259>1)
	$_t_ToEmailAddress:=$2
Else 
	$_t_ToEmailAddress:=Rep_t_docEmailToTxt
End if 

If (Count parameters:C259>2)
	$_t_ToRoleCode:=$3
Else 
	$_t_ToRoleCode:=EMAIL_t_DocEmailRoletoText
End if 


$_t_EmailMailAddress:=""

If ($_t_DocumentReference#"")
	
	Company_docPrintPrefGet("AccPayableEmail"; "email"; ->COM_t_AccPayableEmail)  //init AccPayableEmail
	Company_docPrintPrefGet("AccReceivableEmail"; "email"; ->COM_t_AccReceivableEmail)  //AccReceivableEmail
	Case of 
		: (($_t_ToEmailAddress="Accounts payable email") & (COM_t_AccPayableEmail#""))
			$_t_EmailMailAddress:=COM_t_AccPayableEmail
			
		: (($_t_ToEmailAddress="Accounts receivable email") & (COM_t_AccPayableEmail#""))
			$_t_EmailMailAddress:=COM_t_AccReceivableEmail
			
		: (($_t_ToEmailAddress="Contact where Role is") & ($_t_ToRoleCode#""))
			CREATE SET:C116([CONTACTS:1]; "$keepMyContacts")
			If (Count parameters:C259>=4)
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$4; *)
				QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Role:11=$_t_ToRoleCode)
				If (Records in selection:C76([CONTACTS:1])=1)
					$_t_EmailMailAddress:=[CONTACTS:1]Email_Address:35
				End if 
			End if 
			USE SET:C118("$keepMyContacts")
		Else 
			$_t_EmailMailAddress:=[CONTACTS:1]Email_Address:35
	End case 
	
	
	
	
End if 

$0:=$_t_EmailMailAddress
ERR_MethodTrackerReturn("Document_GetEmailAddresses"; $_t_oldMethodName)
