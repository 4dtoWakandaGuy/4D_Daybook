If (False:C215)
	//Table Form Method Name: [JOBS]Job_Sheet
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>DataSize; $_l_event)
	C_TEXT:C284($_t_oldMethodName; vTitle; vTitle1; vTitle10; vTitle11; vTitle12; vTitle13; vTitle14; vTitle15; vTitle16; vTitle17)
	C_TEXT:C284(vTitle18; vTitle2; vTitle3; vTitle4; vTitle5; vTitle8; vTitle9)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [JOBS].Job_Sheet"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: (($_l_event=On Load:K2:1) | ($_l_event=On Printing Detail:K2:18)) & (Not:C34(DB_bo_NoLoad))
		
		Forms_SetFonts
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vDetails; ->[JOBS:26]Company_Code:3; ->[JOBS:26]Your_Order_Number:5; ->[JOBS:26]Start_Date:6; ->[JOBS:26]End_Date:7; ->[JOBS:26]Required_Date:8; ->[JOBS:26]Person:19; ->[JOBS:26]Job_Code:1; ->[JOBS:26]Job_Name:2; ->[JOBS:26]Job_Type:21; ->[JOBS:26]Stage_Code:18; ->[JOBS:26]Comments:15)
		//Set_Fonts ("vDetails+[JOBS]Company Code+[JOBS]Your Order No";◊DataSize)
		//Set_Fonts ("[JOBS]Start Date+[JOBS]End Date+[JOBS]Required Date";◊DataSize)
		//Set_Fonts ("[JOBS]Person+[JOBS]Job Code+[JOBS]Job Name";◊DataSize)
		//Set_Fonts ("[JOBS]Job Type+[JOBS]Stage Code";◊DataSize)
		//Set_Fonts ("[JOBS]Comments";◊DataSize)
		Jobs_Title
		RELATE ONE:C42([JOBS:26]Company_Code:3)
		RELATE ONE:C42([JOBS:26]Contact_Code:4)
		MCont_Add("L")
		vTitle:=[TABLE_RECORD_STATES:90]Entry_Name:5
		vTitle1:="Company & Contact"
		vTitle3:="Company Code"
		vTitle4:="Order No"
		vTitle2:="Start Date"
		vTitle11:="End Date"
		vTitle16:="Required Date"
		vTitle17:="Person"
		vTitle8:="Job Code & Name"
		vTitle10:="Job Type"
		vTitle9:="Current Stage"
		vTitle12:="Quoted "+[JOBS:26]Currency_Code:25
		vTitle14:="Budget "+[JOBS:26]Currency_Code:25
		vTitle13:="Actual "+[JOBS:26]Currency_Code:25
		vTitle5:="Cost "+[JOBS:26]Currency_Code:25
		vTitle15:="Invoiced "+[JOBS:26]Currency_Code:25
		vTitle18:="Comments"
End case 
Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  //(During)
		
		Set_FontsTitle
End case 
ERR_MethodTrackerReturn("FM [JOBS].Job_Sheet"; $_t_oldMethodName)
