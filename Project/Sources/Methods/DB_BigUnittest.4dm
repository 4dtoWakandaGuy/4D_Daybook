//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_BigUnittest
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/08/2012 11:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_MethodsWithUnitTests; 0)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_RowNumber)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_BigUnittest")

ARRAY TEXT:C222($_at_MethodsWithUnitTests; 0)
APPEND TO ARRAY:C911($_at_MethodsWithUnitTests; "DB_setFormCache")
APPEND TO ARRAY:C911($_at_MethodsWithUnitTests; "PO_LoadDFPriceGroup")
$_l_RowNumber:=0
If (Count parameters:C259>=1)
	$_l_RowNumber:=Find in array:C230($_at_MethodsWithUnitTests; $1)
End if 
$0:=($_l_RowNumber>0)
ERR_MethodTrackerReturn("DB_BigUnittest"; $_t_oldMethodName)