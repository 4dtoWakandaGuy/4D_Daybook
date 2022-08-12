If (False:C215)
	//object Name: [CONTACTS]Contact_In.oCON_CompanyAdType
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
	C_LONGINT:C283($_l_event; bAddComp2Contact)
	C_TEXT:C284($_t_oldMethodName; COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Country; COM_t_County; COM_t_PostalCode; COM_t_Town; CON_t_CompanyAdType; CON_t_CompanyCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Contact_In.oCON_CompanyAdType"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		[CONTACTS_COMPANIES:145]Address_Type:2:=CON_t_CompanyAdType
		ContComp_SubLP(->[CONTACTS_COMPANIES:145]Address_Type:2)
		
		CON_t_CompanyAdType:=[CONTACTS_COMPANIES:145]Address_Type:2
		If (CON_t_CompanyCode="")
			If (CON_t_CompanyAdType="HOME")
				//Enter a home address
				OBJECT SET ENTERABLE:C238(COM_t_AddressLine1; True:C214)
				OBJECT SET ENTERABLE:C238(COM_t_AddressLine2; True:C214)
				OBJECT SET ENTERABLE:C238(COM_t_Town; True:C214)
				OBJECT SET ENTERABLE:C238(COM_t_County; True:C214)
				OBJECT SET ENTERABLE:C238(COM_t_PostalCode; True:C214)
				OBJECT SET ENTERABLE:C238(COM_t_Country; True:C214)
				GOTO OBJECT:C206(COM_t_AddressLine1)
				OBJECT SET ENTERABLE:C238(*; "oCONCompanyCode"; False:C215)
			End if 
		End if 
		If (CON_t_CompanyCode="") & (CON_t_CompanyAdType#"HOME")  //bsw 24/05/04
			OBJECT SET TITLE:C194(bAddComp2Contact; "Cancel")
		Else 
			OBJECT SET TITLE:C194(bAddComp2Contact; "Update")
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [CONTACTS].Contact_In.oCON_CompanyAdType"; $_t_oldMethodName)
