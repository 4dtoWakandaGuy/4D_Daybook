//%attributes = {}

If (False:C215)
	//Project Method Name:      SQL_GetDataToObject
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  19/05/2021
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_OBJECT:C1216($_obj_SqlObject; $_obj_SQLParameters; $1)
	C_TEXT:C284($_t_queryName)
End if 
//Code Starts Here
//this method will return an object that contains the data obtained from the SQL 
If (Count parameters:C259>=1)
	$_obj_SqlObject:=$1
	$_t_queryName:=$_obj_SqlObject.queryname
	$_obj_SQLParameters:=$_obj_SqlObject.Replacements
	//SQL_GetDataByObject($_obj_SqlObject)
End if 
