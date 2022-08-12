//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_GetOtherrelated
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1; $2; $3; $4; $5)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_GetOtherrelated")
//This method is called when putting an order/job/project etc number onto
//a pipeline projectiion
//it sets the currency, company, contact info
//$1=Pointer to variable containing related table number
//$2=Pointer to the variable containing the related record ID
//($2 is only sent so we can make sure we have the right record to start with)

//$3=Pointer for where to return the ID of the currency
//$4=Pointer for where to return the company ID
//$5=Pointer for where to return the contact ID
If ($1->>0)
	Case of 
		: ($1->=Table:C252(->[PROJECTS:89]))
			
			READ ONLY:C145([PROJECTS:89])
			If ($2->#[PROJECTS:89]X_ID:11)
				QUERY:C277([PROJECTS:89]; [PROJECTS:89]X_ID:11=$2->)
			End if 
			//we want the project Currency????
			//as there is none! (I think we will be changing the projects)
			//this will currently be the BASE currency
			READ ONLY:C145([CURRENCIES:71])
			QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=<>SYS_t_BaseCurrency)
			$3->:=[CURRENCIES:71]X_ID:3
			READ ONLY:C145([COMPANIES:2])
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[PROJECTS:89]Company_Code:3)
			$4->:=[COMPANIES:2]x_ID:63
			READ ONLY:C145([CONTACTS:1])
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[PROJECTS:89]Contact_Code:4)
			$5->:=[CONTACTS:1]x_ID:33
			
			
			
		: ($1->=Table:C252(->[JOBS:26]))
			
			READ ONLY:C145([JOBS:26])
			If ($2->#[JOBS:26]x_ID:49)
				QUERY:C277([JOBS:26]; [JOBS:26]x_ID:49=$2->)
			End if 
			//we want the Job Currency????
			READ ONLY:C145([CURRENCIES:71])
			If ([JOBS:26]Currency_Code:25#"")
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=[JOBS:26]Currency_Code:25)
			Else 
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=<>SYS_t_BaseCurrency)
			End if 
			$3->:=[CURRENCIES:71]X_ID:3
			READ ONLY:C145([COMPANIES:2])
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[JOBS:26]Company_Code:3)
			$4->:=[COMPANIES:2]x_ID:63
			READ ONLY:C145([CONTACTS:1])
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[JOBS:26]Contact_Code:4)
			$5->:=[CONTACTS:1]x_ID:33
			
		: ($1->=Table:C252(->[ORDERS:24]))
			
			READ ONLY:C145([ORDERS:24])
			If ($2->#[ORDERS:24]x_ID:58)
				QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=$2->)
			End if 
			//we want the Job Currency????
			READ ONLY:C145([CURRENCIES:71])
			If ([ORDERS:24]Currency_Code:32#"")
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=[ORDERS:24]Currency_Code:32)
			Else 
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=<>SYS_t_BaseCurrency)
			End if 
			$3->:=[CURRENCIES:71]X_ID:3
			READ ONLY:C145([COMPANIES:2])
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[ORDERS:24]Company_Code:1)
			$4->:=[COMPANIES:2]x_ID:63
			READ ONLY:C145([CONTACTS:1])
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[ORDERS:24]Contact_Code:2)
			$5->:=[CONTACTS:1]x_ID:33
			
			
		Else 
			// ALERT("Unimplimented feature-contact programming team. Table"+String($1->))
			Gen_Alert("Unimplimented feature-contact programming team. Table"+String:C10($1->))
	End case 
End if 
ERR_MethodTrackerReturn("SP_GetOtherrelated"; $_t_oldMethodName)
