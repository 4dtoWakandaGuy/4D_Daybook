//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_InB2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_Status)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	C_LONGINT:C283(vCP; vCT)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>PER_t_CurrentUserName; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vArea; vSales; vSource; vStatus; vTele)
	C_TEXT:C284(vType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_InB2")
//Companies_InB2
If ([COMPANIES:2]Area:11#"")
	RELATE ONE:C42([COMPANIES:2]Area:11)
	vArea:=[AREAS:3]Area_Name:2
Else 
	REDUCE SELECTION:C351([AREAS:3]; 0)
	vArea:=""
End if 
If ([COMPANIES:2]Status:12#"")
	RELATE ONE:C42([COMPANIES:2]Status:12)
	vStatus:=[STATUS:4]Status_Name:2
Else 
	REDUCE SELECTION:C351([STATUS:4]; 0)
	vStatus:=""
End if 
If ([COMPANIES:2]Company_Type:13#"")
	RELATE ONE:C42([COMPANIES:2]Company_Type:13)
	vType:=[TYPES:5]Type_Name:2
Else 
	REDUCE SELECTION:C351([TYPES:5]; 0)
	vType:=""
End if 
If ([COMPANIES:2]Source:14#"")
	RELATE ONE:C42([COMPANIES:2]Source:14)
	vSource:=[SOURCES:6]Source_Name:2
Else 
	REDUCE SELECTION:C351([SOURCES:6]; 0)
	vSource:=""
End if 
If ([COMPANIES:2]Taken_By:26#<>PER_t_CurrentUserInitials)
	RELATE ONE:C42([COMPANIES:2]Taken_By:26)
	vTele:=[PERSONNEL:11]Name:2
Else 
	REDUCE SELECTION:C351([PERSONNEL:11]; 0)
	vTele:=<>PER_t_CurrentUserName
End if 
If ([COMPANIES:2]Sales_Person:29#<>PER_t_CurrentUserInitials)
	If ([COMPANIES:2]Sales_Person:29#"")
		RELATE ONE:C42([COMPANIES:2]Sales_Person:29)
		vSales:=[PERSONNEL:11]Name:2
	Else 
		vSales:=""
	End if 
Else 
	REDUCE SELECTION:C351([PERSONNEL:11]; 0)
	vSales:=<>PER_t_CurrentUserName
End if 
//If ([COMPANIES]Price Group#"")
// RELATE ONE([COMPANIES]Price Group)
// vPriceName:=[PRICE GROUPS]Price Name
//Else
// vPriceName:=""
//End if
//If ([COMPANIES]Default Stage#"")
// RELATE ONE([COMPANIES]Default Stage)
//vStage:=[CREDIT STAGES]Stage Name
//Else
// vStage:=""
//End if
If (DB_t_CurrentFormUsage="AS")
	DB_t_CurrentFormUsage:=""
End if 
If (vCT=0)
	If ([COMPANIES:2]Company_Code:1#"")
		QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
		QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
		
		SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
		QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
		
		QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32#1)
		
		UNLOAD RECORD:C212([CONTACTS:1])
	Else 
		REDUCE SELECTION:C351([CONTACTS:1]; 0)
	End if 
	
End if 
vCP:=1
ERR_MethodTrackerReturn("Companies_InB2"; $_t_oldMethodName)
