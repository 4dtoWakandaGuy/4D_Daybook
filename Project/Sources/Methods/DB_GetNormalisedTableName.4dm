//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetNormalisedTableName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/03/2013 00:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_MenuParameter; $_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetNormalisedTableName")

$_t_MenuParameter:=Uppers2((Table name:C256(Table:C252($1))))
$_t_MenuParameter:=Replace string:C233($_t_MenuParameter; "_"; " ")
$0:=$_t_MenuParameter
ERR_MethodTrackerReturn("DB_GetNormalisedTableName"; $_t_oldMethodName)