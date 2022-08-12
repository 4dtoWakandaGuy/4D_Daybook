If (False:C215)
	//object Name: [CONTACTS]Contact_In.oCON_CompanyAddr6
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
	C_TEXT:C284($_t_oldMethodName; COM_t_Country; CON_t_CompanyCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Contact_In.oCON_CompanyAddr6"; Form event code:C388)
//SCRIPT : COM_t_Country
//FORM Company_In
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		COM_t_Country:=Uppers2(COM_t_Country)
		Companies_vAT2(->COM_t_Country)
		
		If (CON_t_CompanyCode="")
			If ([CONTACTS:1]Contact_Name:31#"")
				Company_No([CONTACTS:1]Contact_Name:31; ->CON_t_CompanyCode)
			End if 
		End if 
		
		
		GOTO OBJECT:C206([COMPANIES:2]Telephone:9)
End case 
ERR_MethodTrackerReturn("OBJ [CONTACTS].Contact_In.oCON_CompanyAddr6"; $_t_oldMethodName)
