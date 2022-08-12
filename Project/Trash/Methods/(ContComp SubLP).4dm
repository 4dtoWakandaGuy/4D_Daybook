//%attributes = {}
If (False:C215)
	//Project Method Name:      ContComp SubLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/12/2009 14:55`Method: ContComp SubLP
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_Event; vCT)
	C_POINTER:C301($1)
	C_TEXT:C284(<>CompCode; $_t_oldMethodName; vArea; vCompName; vDetails; vFax; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vSurname; vTel)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ContComp SubLP")
$_l_Event:=Form event code:C388

//ContComp SubLP
//Copied & modified to L Companies SubQ

Case of 
	: ($_l_Event=On Data Change:K2:15)
		If (Count parameters:C259=0)
			Case of 
				: (Modified:C32([CONTACTS_COMPANIES:145]Company_Code:1))
					vCompName:=[CONTACTS_COMPANIES:145]Company_Code:1
					vSurname:=""
					DB_t_CurrentFormUsage2:="NoCan"
					vCT:=1
					Check_Company(->[CONTACTS_COMPANIES:145]Company_Code:1; ->[CONTACTS:1]Contact_Code:2; ->[CONTACTS:1])
					
					DB_t_CurrentFormUsage2:=""
					Contacts_InLPM
					<>CompCode:=[COMPANIES:2]Company_Code:1
				: (Modified:C32([CONTACTS_COMPANIES:145]Address_Type:2))
					If ([CONTACTS_COMPANIES:145]Address_Type:2#"")
						If ([CONTACTS_COMPANIES:145]Address_Type:2#"HOME")
							Check_Minor(->[CONTACTS_COMPANIES:145]Address_Type:2; ""; ->[TYPES:5]; ->[TYPES:5]Type_Code:1; ->[TYPES:5]Type_Name:2; "Types In"; "Address Type"; "4")
						Else 
							Uppers2([CONTACTS_COMPANIES:145]Address_Type:2)
						End if 
						Contacts_InLPM
					End if 
					
			End case 
		Else 
			Case of 
				: ($1->=[CONTACTS_COMPANIES:145]Company_Code:1)
					vCompName:=[CONTACTS_COMPANIES:145]Company_Code:1
					vSurname:=""
					DB_t_CurrentFormUsage2:="NoCan"
					vCT:=1
					Check_Company(->[CONTACTS_COMPANIES:145]Company_Code:1; ->[CONTACTS:1]Contact_Code:2; ->[CONTACTS:1]; False:C215; False:C215; False:C215)
					
					DB_t_CurrentFormUsage2:=""
					Contacts_InLPM
					<>CompCode:=[COMPANIES:2]Company_Code:1
				: ($1->=[CONTACTS_COMPANIES:145]Address_Type:2)
					If ([CONTACTS_COMPANIES:145]Address_Type:2#"")
						If ([CONTACTS_COMPANIES:145]Address_Type:2#"HOME")
							Check_Minor(->[CONTACTS_COMPANIES:145]Address_Type:2; ""; ->[TYPES:5]; ->[TYPES:5]Type_Code:1; ->[TYPES:5]Type_Name:2; "Types In"; "Address Type"; "4")
						Else 
							Uppers2([CONTACTS_COMPANIES:145]Address_Type:2)
						End if 
						Contacts_InLPM
					End if 
					
			End case 
		End if 
		
		If ([COMPANIES:2]Company_Code:1#[CONTACTS_COMPANIES:145]Company_Code:1)
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
			
			//RELATE ONE([CONTACTS_COMPANIES]Company Code)
		End if 
		Company_Details
		<>CompCode:=[COMPANIES:2]Company_Code:1
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		vDetails:=""
		vArea:=""
		vTel:=""
		vFax:=""
End case 
ERR_MethodTrackerReturn("ContComp SubLP"; $_t_oldMethodName)