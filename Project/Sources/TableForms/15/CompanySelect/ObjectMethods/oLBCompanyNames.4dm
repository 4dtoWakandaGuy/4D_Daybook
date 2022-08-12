If (False:C215)
	//object Name: [USER]CompanySelect.oLBCompanyNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/11/2012 09:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_CompanyCodes;0)
	C_LONGINT:C283($_l_event; $_l_Row; DB_l_ScreenSetting)
	C_TEXT:C284($_t_oldMethodName; DB_t_Address)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CompanySelect.oLBCompanyNames"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_l_Row:=Self:C308->
		If (DB_l_ScreenSetting=1)
			If ($_l_Row>0)
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=SD_at_CompanyCodes{$_l_Row})
				DB_t_Address:=[COMPANIES:2]ADDRESS:60
				UNLOAD RECORD:C212([COMPANIES:2])
				
			Else 
				DB_t_Address:=""
			End if 
			
		Else 
			DB_t_Address:=""
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].CompanySelect.oLBCompanyNames"; $_t_oldMethodName)
