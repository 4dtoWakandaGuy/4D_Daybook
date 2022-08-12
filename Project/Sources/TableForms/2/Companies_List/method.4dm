If (False:C215)
	//Table Form Method Name: [COMPANIES]Companies_List
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
	C_TEXT:C284($_t_oldMethodName; vArea; vSales; vSource; vStatus; vTele; vType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].Companies_List"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		RELATE ONE:C42([COMPANIES:2]Status:12)
		vStatus:=[STATUS:4]Status_Name:2
		RELATE ONE:C42([COMPANIES:2]Company_Type:13)
		vType:=[TYPES:5]Type_Name:2
		RELATE ONE:C42([COMPANIES:2]Source:14)
		vSource:=[SOURCES:6]Source_Name:2
		RELATE ONE:C42([COMPANIES:2]Area:11)
		vArea:=[AREAS:3]Area_Name:2
		RELATE ONE:C42([COMPANIES:2]Sales_Person:29)
		vSales:=[PERSONNEL:11]Name:2
		RELATE ONE:C42([COMPANIES:2]Taken_By:26)
		vTele:=[PERSONNEL:11]Name:2
		
		Company_Details
		CompCont_Srch
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].Companies_List"; $_t_oldMethodName)
