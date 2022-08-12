If (False:C215)
	//Table Form Method Name: [CONTRACT_RECORD_ANALYSIS]Furthers_Sub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [CONTRACT_RECORD_ANALYSIS].Furthers_Sub"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2))
				Check_Minor(->[CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2; ""; ->[ADDITIONAL_RECORD_ANALYSIS:53]; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2; "Furthers In"; "Further Analysis")
				DB_bo_RecordModified:=True:C214
		End case 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]); "Furthers_Sub")
		[CONTRACT_RECORD_ANALYSIS:88]Unique_code:1:=[CONTRACTS:17]Contract_Code:3
End case 
ERR_MethodTrackerReturn("FM [CONTRACT_RECORD_ANALYSIS].Furthers_Sub"; $_t_oldMethodName)
