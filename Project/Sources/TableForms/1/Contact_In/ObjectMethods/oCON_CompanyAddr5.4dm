If (False:C215)
	//object Name: [CONTACTS]Contact_In.oCON_CompanyAddr5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; COM_t_Country; COM_t_PostalCode; CON_t_CompanyCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Contact_In.oCON_CompanyAddr5"; Form event code:C388)
//SCRIPT : COM_t_PostalCode
//FORM Company_In

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		RemoveLeadTr(Uppercase:C13(COM_t_PostalCode); ->COM_t_PostalCode)
		
		Companies_vAT2(->COM_t_Country)
		
		If (CON_t_CompanyCode="")
			If ([CONTACTS:1]Contact_Name:31#"")
				Company_No([CONTACTS:1]Contact_Name:31; ->CON_t_CompanyCode)
			End if 
		End if 
		
		GOTO OBJECT:C206(COM_t_Country)
End case 
ERR_MethodTrackerReturn("OBJ [CONTACTS].Contact_In.oCON_CompanyAddr5"; $_t_oldMethodName)
