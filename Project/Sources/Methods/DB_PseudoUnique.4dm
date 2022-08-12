//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_PseudoUnique
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_PseudoUnique")
//This method is called by DB_Datachecker
//this will check for pseudo unique
//put in here any fields we want to treat as unique
//without setting the field parameter
$0:=False:C215
Case of 
	: ($1=Table:C252(->[CONTACTS:1]))
		Case of 
			: ($2=Field:C253(->[CONTACTS:1]Contact_Code:2))
				$0:=True:C214
			: ($2=Field:C253(->[CONTACTS:1]x_ID:33))
				$0:=True:C214
		End case 
	: ($2=Table:C252(->[COMPANIES:2]))
		Case of 
			: ($2=Field:C253(->[CONTACTS:1]Company_Code:1))
				$0:=True:C214
			: ($2=Field:C253(->[COMPANIES:2]x_ID:63))
				$0:=True:C214
		End case 
	: ($2=Table:C252(->[AddressRecords:125]))
		Case of 
			: ($2=Field:C253(->[AddressRecords:125]X_ID:1))
				$0:=True:C214
		End case 
	: ($2=Table:C252(->[SMS_Log:124]))
		Case of 
			: ($2=Field:C253(->[SMS_Log:124]X_ID:8))
				$0:=True:C214
		End case 
	: ($2=Table:C252(->[PREFERENCES:116]))
		Case of 
			: ($2=Field:C253(->[PREFERENCES:116]IDNumber:1))
				$0:=True:C214
		End case 
	: ($2=Table:C252(->[SALES_ProjectionLinks:114]))
		Case of 
			: ($2=Field:C253(->[SALES_ProjectionLinks:114]x_ID:1))
				$0:=True:C214
			: ($2=Field:C253(->[SALES_ProjectionLinks:114]UniqueReference:5))
				$0:=True:C214
		End case 
	: ($2=Table:C252(->[SALES_PROJECTION:113]))
		Case of 
			: ($2=Field:C253(->[SALES_PROJECTION:113]x_ID:1))
				$0:=True:C214
		End case 
	: ($2=Table:C252(->[x_ListUsage:112]))
		Case of 
			: ($2=Field:C253(->[x_ListUsage:112]x_ID:1))
				$0:=True:C214
		End case 
	: ($2=Table:C252(->[X_LISTS:111]))
		Case of 
			: ($2=Field:C253(->[X_LISTS:111]x_ID:1))
				$0:=True:C214
		End case 
	: ($2=Table:C252(->[Catalogue_Availability:110]))
		Case of 
			: ($2=Field:C253(->[Catalogue_Availability:110]x_ID:1))
				$0:=True:C214
		End case 
		
	: ($2=Table:C252(->[Catalogue_ProductLink:109]))
		Case of 
			: ($2=Field:C253(->[Catalogue_ProductLink:109]x_ID:1))
				$0:=True:C214
		End case 
	: ($2=Table:C252(->[CATALOGUE:108]))
		Case of 
			: ($2=Field:C253(->[CATALOGUE:108]x_ID:1))
				$0:=True:C214
		End case 
	: ($2=Table:C252(->[USER_SETS:105]))
		Case of 
			: ($2=Field:C253(->[USER_SETS:105]x_RecID:1))
				$0:=True:C214
		End case 
	: ($2=Table:C252(->[DATA_AUDITS:102]))
		Case of 
			: ($2=Field:C253(->[DATA_AUDITS:102]X_ID:1))
				$0:=True:C214
		End case 
	: ($2=Table:C252(->[LIST_ITEMS:95]))
		Case of 
			: ($2=Field:C253(->[LIST_ITEMS:95]X_ID:3))
				$0:=True:C214
		End case 
	: ($2=Table:C252(->[SUBSCRIPTIONS:93]))
		Case of 
			: ($2=Field:C253(->[SUBSCRIPTIONS:93]x_ID:11))
				$0:=True:C214
		End case 
	: ($2=Table:C252(->[PERSONNEL_GROUPS:92]))
		Case of 
			: ($2=Field:C253(->[PERSONNEL_GROUPS:92]Group_Code:1))
				$0:=True:C214
		End case 
		
	: ($2=Table:C252(->[SUBSCRIPTIONS:93]))
		Case of 
			: ($2=Field:C253(->[SUBSCRIPTIONS:93]x_ID:11))
				$0:=True:C214
		End case 
End case 
ERR_MethodTrackerReturn("DB_PseudoUnique"; $_t_oldMethodName)