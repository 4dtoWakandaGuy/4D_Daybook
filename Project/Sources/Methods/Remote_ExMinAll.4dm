//%attributes = {}
If (False:C215)
	//Project Method Name:      Remote_ExMinAll
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote_ExMinAll")
Remote_ExMin(->[AREAS:3]; ->[AREAS:3]Area_Code:1; ->[AREAS:3]Export:3; "Areas"; 2; 5)
Remote_ExMin(->[POSTAL_CODES:50]; ->[POSTAL_CODES:50]Postal_Code_From:1; ->[POSTAL_CODES:50]Export:3; "Postcodes"; 2; 3)
Remote_ExMin(->[STATUS:4]; ->[STATUS:4]Status_Code:1; ->[STATUS:4]Export:3; "Status"; 2; 1)
Remote_ExMin(->[TYPES:5]; ->[TYPES:5]Type_Code:1; ->[TYPES:5]Export:3; "Types"; 2; 1)
Remote_ExMin(->[SOURCES:6]; ->[SOURCES:6]Source_Code:1; ->[SOURCES:6]Export:13; "Sources"; 2; 11)
Remote_ExMin(->[ADDITIONAL_RECORD_ANALYSIS:53]; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1; ->[ADDITIONAL_RECORD_ANALYSIS:53]Export:3; "Further Analyses"; 2; 1)
Remote_ExMin(->[ACTIONS:13]; ->[ACTIONS:13]Action_Code:1; ->[ACTIONS:13]Export:3; "Actions"; 2; 1)
Remote_ExMin(->[RESULTS:14]; ->[RESULTS:14]Result_Code:1; ->[RESULTS:14]Export:4; "Results"; 2; 2)
Remote_ExMin(->[WORKFLOW_CONTROL:51]; ->[WORKFLOW_CONTROL:51]WFControl_Code:10; ->[WORKFLOW_CONTROL:51]Export:9; "Sequences"; 1; 8)
Remote_ExMin(->[PRODUCT_GROUPS:10]; ->[PRODUCT_GROUPS:10]Group_Code:1; ->[PRODUCT_GROUPS:10]Export:7; "Groups"; 2; 5)
Remote_ExMin(->[PRODUCT_BRANDS:8]; ->[PRODUCT_BRANDS:8]Brand_Code:1; ->[PRODUCT_BRANDS:8]Export:3; "Brands"; 2; 1)
Remote_ExMin(->[PRICE_GROUPS:18]; ->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Export:7; "Price Groups"; 2; 5)
Remote_ExMin(->[PRICE_TABLE:28]; ->[PRICE_TABLE:28]Table_Code:12; ->[PRICE_TABLE:28]Export:11; "Price Table"; 1; 10)
Remote_ExMin(->[COUNTRIES:73]; ->[COUNTRIES:73]COUNTRY_CODE:1; ->[COUNTRIES:73]Export:3; "Countries"; 2; 1)
Remote_ExMin(->[ADDRESS_FORMATS:74]; ->[ADDRESS_FORMATS:74]Format_Code:1; ->[ADDRESS_FORMATS:74]Export:10; "Address Formats"; 1; 8)
ERR_MethodTrackerReturn("Remote_ExMinAll"; $_t_oldMethodName)