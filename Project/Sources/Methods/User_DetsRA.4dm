//%attributes = {}
If (False:C215)
	//Project Method Name:      User_DetsRA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("User_DetsRA")
//User_DetsRA
QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=1)
If ([IDENTIFIERS:16]Office_Code:4=False:C215)
	[IDENTIFIERS:16]Office_Code:4:=True:C214
	[IDENTIFIERS:16]Backslash:5:=True:C214
	DB_SaveRecord(->[IDENTIFIERS:16])
	User_DetFiles(2)
	User_DetFiles(3)
	User_DetFiles(5)
	User_DetFiles(6)
	User_DetFiles(17)
	User_DetFiles(20)
	User_DetFiles(21)
End if 
ERR_MethodTrackerReturn("User_DetsRA"; $_t_oldMethodName)