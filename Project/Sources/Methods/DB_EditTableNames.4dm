//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_EditTableNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/02/2010 10:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_EditTableNames")
$0:=$1
Case of 
	: ($1="SEQUENCES")
		$0:="WORKFLOW_CONTROL"
	: ($1="Stock levels")
		$0:="Stock_levels"
	: ($1="Stock levels")
		$0:="Stock_levels"
	: ($1="ACC BALANCES")
		$0:="ACCOUNT_BALANCES"
	: ($1="FURTHERS")
		$0:="ADDITIONAL_RECORD_ANALYSIS"
	: ($1="ADDRESS FORMATS")
		$0:="ADDRESS_FORMATS"
	: ($1="Contacts_FURTHERS")
		
		$0:="CONTACT_RECORD_ANALYSIS"
	: ($1="FILE STATES")
		$0:="TABLE_RECORD_STATES"
	: ($1="FURTHER FIELDS")
		$0:="CUSTOM_FIELDS"
		
End case 
ERR_MethodTrackerReturn("DB_EditTableNames"; $_t_oldMethodName)