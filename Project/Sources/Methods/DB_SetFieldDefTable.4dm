//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetFieldDefTable
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/07/2012 19:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	C_LONGINT:C283($_l_TableRow)
	C_TEXT:C284($_t_oldMethodName; $_t_TableName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetFieldDefTable")

$_t_TableName:=$1
If ($_t_TableName#"")
	Load_Fields
	$_l_TableRow:=DB_GetTableNumFromNameString($_t_TableName)
	
	If ($_l_TableRow>0)
		QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3=<>DB_al_TableNums{$_l_TableRow})
		ORDER BY:C49([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]Sort_Order:4; >)
	End if 
End if 
ERR_MethodTrackerReturn("DB_SetFieldDefTable"; $_t_oldMethodName)