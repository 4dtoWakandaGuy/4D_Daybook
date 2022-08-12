If (False:C215)
	//object Name: [CONTACTS]Contact_In.oCONCompanyCode
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
	C_TEXT:C284($_t_EnteredCompanyCode; $_t_oldMethodName; COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Country; COM_t_County; COM_t_PostalCode; COM_t_Town; CON_t_CompanyAdType; CON_t_CompanyArea; CON_t_CompanyCode)
	C_TEXT:C284(CON_t_CompanyName; CON_t_CompanyTelephone; Con_T_Details; vArea; VDetails; vTel)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Contact_In.oCONCompanyCode"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		$_t_EnteredCompanyCode:=CON_t_CompanyCode
		[CONTACTS_COMPANIES:145]Company_Code:1:=CON_t_CompanyCode
		ContComp_SubLP(->[CONTACTS_COMPANIES:145]Company_Code:1)
		
		
		CON_t_CompanyCode:=[CONTACTS_COMPANIES:145]Company_Code:1
		If (CON_t_CompanyCode#"")
			CON_t_CompanyName:=[COMPANIES:2]Company_Name:2
			Con_T_Details:=VDetails
			CON_t_CompanyArea:=vArea
			CON_t_CompanyTelephone:=vTel
			COM_t_AddressLine1:=[COMPANIES:2]Address_Line_one:3
			COM_t_AddressLine2:=[COMPANIES:2]Address_Line_two:4
			COM_t_Town:=[COMPANIES:2]Town_or_City:5
			COM_t_County:=[COMPANIES:2]County_or_State:6
			COM_t_PostalCode:=[COMPANIES:2]Postal_Code:7
			COM_t_Country:=[COMPANIES:2]Country:8
			If (Not:C34([COMPANIES:2]Private:37))
				If (CON_t_CompanyAdType="")
					CON_t_CompanyAdType:="Work"
				End if 
			Else 
				If (CON_t_CompanyAdType="")
					CON_t_CompanyAdType:="Home"
				End if 
			End if 
			
			
		End if 
		
		
End case 

If (CON_t_CompanyCode="")  //bsw 24/05/04
	OBJECT SET TITLE:C194(bAddComp2Contact; "Cancel")
Else 
	OBJECT SET TITLE:C194(bAddComp2Contact; "Update")
End if 
ERR_MethodTrackerReturn("OBJ [CONTACTS].Contact_In.oCONCompanyCode"; $_t_oldMethodName)
