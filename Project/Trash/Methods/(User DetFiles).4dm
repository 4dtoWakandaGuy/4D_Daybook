//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User DetFiles
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2009 11:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User DetFiles")
If (Count parameters:C259>=1)
	QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=$1)
	[IDENTIFIERS:16]Office_Code:4:=True:C214
	[IDENTIFIERS:16]Backslash:5:=True:C214
	DB_SaveRecord(->[IDENTIFIERS:16])
End if 
ERR_MethodTrackerReturn("User DetFiles"; $_t_oldMethodName)