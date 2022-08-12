//%attributes = {}
If (False:C215)
	//Project Method Name:      DBM_SumbitRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/10/2014 11:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_TableNumber)
	C_POINTER:C301($_ptr_inputFieldNames; $_ptr_inputFieldValues)
	C_TEXT:C284($_t_DataSourceName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBM_SumbitRecord")

//`The incoming table number, incoming Field names, incoming values(as strings)
//This will be extracted from a JSON object..are we already extracted at this point

Case of 
	: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
		
		
		
End case 
ERR_MethodTrackerReturn("DBM_SumbitRecord"; $_t_oldMethodName)