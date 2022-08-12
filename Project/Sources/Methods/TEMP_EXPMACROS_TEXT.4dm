//%attributes = {}
If (False:C215)
	//Project Method Name:      TEMP_EXPMACROS_TEXT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_index)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TEMP_EXPMACROS_TEXT")
$_ti_DocumentRef:=DB_CreateDocument(""; "TEXT")

ALL RECORDS:C47([SCRIPTS:80])
For ($_l_index; 1; Records in selection:C76([SCRIPTS:80]))
	SEND PACKET:C103($_ti_DocumentRef; [SCRIPTS:80]Script_Code:1+Char:C90(13))
	SEND PACKET:C103($_ti_DocumentRef; [SCRIPTS:80]Recording_Text:4+Char:C90(13))
	NEXT RECORD:C51([SCRIPTS:80])
End for 
ERR_MethodTrackerReturn("TEMP_EXPMACROS_TEXT"; $_t_oldMethodName)
