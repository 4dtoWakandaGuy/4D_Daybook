//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_TESTSTOCKLEVEL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/10/2014 18:31
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

$_t_oldMethodName:=ERR_MethodTracker("AA_TESTSTOCKLEVEL")
ALL RECORDS:C47([PRODUCTS:9])

DIALOG:C40("DB_ProductTest")
ERR_MethodTrackerReturn("AA_TESTSTOCKLEVEL"; $_t_oldMethodName)