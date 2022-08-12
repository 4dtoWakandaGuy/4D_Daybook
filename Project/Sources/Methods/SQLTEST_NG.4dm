//%attributes = {}
If (False:C215)
	//Project Method Name:      SQLTEST_NG
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/10/2014 14:00
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

$_t_oldMethodName:=ERR_MethodTracker("SQLTEST_NG")

//_USER_TABLES

//mSQLQueryStr:="SELECT * FROM _USER_TABLES"
ERR_MethodTrackerReturn("SQLTEST_NG"; $_t_oldMethodName)