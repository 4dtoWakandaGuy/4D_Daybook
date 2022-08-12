If (False:C215)
	//Table Form Method Name: [DIARY]Call_Summaries
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_TEXT:C284($_t_BuiltAddress; $_t_oldMethodName; vDetails)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].Call_Summaries"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)
		RELATE ONE:C42([DIARY:12]Contact_Code:2)
		Company_Details
		vDetails:=[CONTACTS:1]Contact_Name:31+Char:C90(13)+vDetails
		RELATE ONE:C42([DIARY:12]Person:8)
		RELATE ONE:C42([DIARY:12]Action_Code:9)
		RELATE ONE:C42([DIARY:12]Result_Code:11)
		RELATE ONE:C42([DIARY:12]Company_Code:1)
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
		$_t_BuiltAddress:=WS_BUILDADDRESS  // 19/11/02 pb
		If ($_t_BuiltAddress#[COMPANIES:2]ADDRESS:60)
			[COMPANIES:2]ADDRESS:60:=$_t_BuiltAddress
		End if 
		
End case 
ERR_MethodTrackerReturn("FM [DIARY].Call_Summaries"; $_t_oldMethodName)
