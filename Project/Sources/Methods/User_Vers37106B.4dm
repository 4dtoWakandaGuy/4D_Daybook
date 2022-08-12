//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Vers37106B
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
	C_LONGINT:C283(<>SYS_l_MaxConnectedUsers)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_Vers37106B")
If (<>SYS_l_MaxConnectedUsers>1)
	User_Message(Char:C90(13)+"    Updating to 'Multiple' Unique Numbers")
	Gen_CodeMakeMN(4)
	Gen_CodeMakeMN(7)
	Gen_CodeMakeMN(8)
	Gen_CodeMakeMN(10)
	Gen_CodeMakeMN(15)
	Gen_CodeMakeMN(16)
	Gen_CodeMakeMN(18)
	Gen_CodeMakeMN(19)
	Gen_CodeMakeMN(24)
	Gen_CodeMakeMN(25)
	Gen_CodeMakeMN(28)
	UNLOAD RECORD:C212([IDENTIFIERS:16])
	READ ONLY:C145([IDENTIFIERS:16])
End if 
ERR_MethodTrackerReturn("User_Vers37106B"; $_t_oldMethodName)