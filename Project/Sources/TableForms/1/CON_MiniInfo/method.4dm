If (False:C215)
	//Table Form Method Name: [CONTACTS][tableForm]CON_MiniInfo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; CON_At_addressDetails; SD2_t_Minicontactcode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS].CON_MiniInfo"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		OpenHelp(Table:C252(->[USER:15]); "DiaryMiniView")
		If ([CONTACTS:1]Contact_Code:2#SD2_t_Minicontactcode)
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_t_Minicontactcode)
		End if 
		If ([COMPANIES:2]Company_Code:1#[CONTACTS:1]Company_Code:1)
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
			
		End if 
		CON_At_addressDetails:=""
		Address_Details(->CON_At_addressDetails)
		If ([CONTACTS:1]Job_Title:6#"")
			CON_At_addressDetails:=[CONTACTS:1]Job_Title:6+Char:C90(13)+CON_At_addressDetails
		End if 
		
		
		
End case 
ERR_MethodTrackerReturn("FM [CONTACTS].CON_MiniInfo"; $_t_oldMethodName)
