//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Term FSWT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 19:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>TermFLN)
	C_TEXT:C284($_t_ContactsTableName; $_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Term FSWT")
$0:=$1
$_t_ContactsTableName:=$1
$0:=DB_GetTranslatedTerminology(Table:C252(->[CONTACTS:1]); $_t_ContactsTableName)
If (False:C215)
	If (<>TermFLN)
		
		$0:=Replace string:C233($0; "Fore/Surname"; "First/Last N.")
		$0:=Replace string:C233($0; "Postcode"; "ZIP")
		$0:=Replace string:C233($0; "Forename"; "First Name")
		$0:=Replace string:C233($0; "Surname"; "Last Name")
		$0:=Replace string:C233($0; "Fore"; "First")
		$0:=Replace string:C233($0; "Sur"; "Last")
	End if 
End if 
ERR_MethodTrackerReturn("Term FSWT"; $_t_oldMethodName)
