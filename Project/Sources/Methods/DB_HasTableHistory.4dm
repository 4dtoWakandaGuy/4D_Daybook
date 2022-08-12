//%attributes = {}

//Database Method Name:      DB_HasTableHistory
//------------------ Method Notes ------------------
//------------------ Revision Control ----------------
//Date Created:  02/10/2017
//Created BY:  Unknown
//Date Modified: 
//Modified By: DefaultUser
//Modification notes
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_TableNumber; $1)
	C_TEXT:C284($_t_TableName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_HasTableHistory")


$_l_TableNumber:=$1
$_t_TableName:=Table name:C256($_l_TableNumber)

Case of 
	: ($_t_TableName="x@")
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[IDENTIFIERS:16]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[PROCESSES_TO_HANDLE:115]))
		$0:=False:C215
	Else 
		$0:=True:C214
End case 
ERR_MethodTrackerReturn("DB_HasTableHistory"; $_t_oldMethodName)