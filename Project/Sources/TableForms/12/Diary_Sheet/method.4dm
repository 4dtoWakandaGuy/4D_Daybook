If (False:C215)
	//Table Form Method Name: [DIARY]Diary_Sheet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>DataSize; <>TextSize; <>TitleSize)
	C_TEXT:C284(<>FormFont; $_t_oldMethodName; vDetails)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].Diary_Sheet"; Form event code:C388)
//LP Diary_Sheet

Case of 
	: (Form event code:C388=On Header:K2:17)
		SetfontsbyStringparameter(<>TitleSize; <>FormFont; Plain:K14:1; "*oLabelDiaryAction"; "*oLabelFor")
		SetFontsByPointerParameter(<>TitleSize; <>FormFont; Plain:K14:1; ->[DIARY:12]Person:8; ->[PERSONNEL:11]Name:2; -><>DB_d_CurrentDate)
		
	: (Form event code:C388=On Printing Detail:K2:18)
		SetfontsbyStringparameter(<>TitleSize; <>FormFont; Plain:K14:1; "*oLabelDiaryAction"; "*oLabelFor")
		SetFontsByPointerParameter(<>TitleSize; <>FormFont; Plain:K14:1; ->[DIARY:12]Person:8; ->[PERSONNEL:11]Name:2; -><>DB_d_CurrentDate)
		SetfontsbyStringparameter(<>TextSize; <>FormFont; Plain:K14:1; "*oLabelCompany"; "*oLabelAction"; "*oLabelDocument"; "*oLabelSource"; "*oLabelDate"; "*oLabelresult"; "*oLabelTime"; "*oLabelProduct")
		SetFontsByPointerParameter(<>DataSize; <>FormFont; Plain:K14:1; ->[DIARY:12]Company_Code:1; ->[DIARY:12]Contact_Code:2; ->[COMPANIES:2]Source:14; ->[COMPANIES:2]Telephone:9; ->[CONTACTS:1]Extn:9; ->[DIARY:12]Action_Code:9; ->[DIARY:12]Document_Code:15; ->[ACTIONS:13]Action_Name:2; ->vTitle4; ->vTitle1)
		SetFontsByPointerParameter(<>DataSize; <>FormFont; Plain:K14:1; ->[DIARY:12]Result_Code:11; ->[RESULTS:14]Result_Name:2; ->vTitle3; ->vTitle2; ->vDetails; ->[DIARY:12]Action_Details:10; ->[DIARY:12]Result_Description:12; ->[DIARY:12]Product_Code:13; ->[PRODUCTS:9]Product_Name:2)
		SetfontsbyStringparameter(<>TextSize; <>FormFont; Bold:K14:2; "*olabelActionDesc"; "*oLabelResultDesc")
		SetFontsByPointerParameter(<>TextSize; <>FormFont; Bold:K14:2; ->[DIARY:12]Contact_Code:2)
		
		
		RELATE ONE:C42([DIARY:12]Company_Code:1)
		RELATE ONE:C42([DIARY:12]Contact_Code:2)
		Company_Details
		vDetails:=[CONTACTS:1]Contact_Name:31+Char:C90(13)+vDetails
		RELATE ONE:C42([DIARY:12]Person:8)
		RELATE ONE:C42([DIARY:12]Action_Code:9)
		RELATE ONE:C42([DIARY:12]Result_Code:11)
		RELATE ONE:C42([DIARY:12]Product_Code:13)
End case 
ERR_MethodTrackerReturn("FM [DIARY].Diary_Sheet"; $_t_oldMethodName)
