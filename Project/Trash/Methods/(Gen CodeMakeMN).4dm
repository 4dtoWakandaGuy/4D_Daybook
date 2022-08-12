//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_CodeMakeMN
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
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

$_t_oldMethodName:=ERR_MethodTracker("Gen_CodeMakeMN")
READ WRITE:C146([IDENTIFIERS:16])
QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=$1)
If ([IDENTIFIERS:16]Multiple_Numbers:7=False:C215)
	[IDENTIFIERS:16]Multiple_Numbers:7:=True:C214
	DB_SaveRecord(->[IDENTIFIERS:16])
	Gen_CodeCreate($1)
End if 
ERR_MethodTrackerReturn("Gen_CodeMakeMN"; $_t_oldMethodName)