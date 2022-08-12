//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      MACROS SAVE COMMAND FIX
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/10/2010 08:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled)
	C_LONGINT:C283($_l_index)
	C_TEXT:C284($_t_message; $_t_oldMethodName; $_t_TextOLD)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MACROS SAVE COMMAND FIX")
READ WRITE:C146([SCRIPTS:80])

ALL RECORDS:C47([SCRIPTS:80])
FIRST RECORD:C50([SCRIPTS:80])

For ($_l_index; 1; Records in selection:C76([SCRIPTS:80]))
	
	$_t_message:="Replacing Save Record with DB_SaveRecord in Macros "+String:C10($_l_index)+Char:C90(13)+[SCRIPTS:80]Recording_Text:4
	If (Position:C15("DB_SaveRecord"; [SCRIPTS:80]Recording_Text:4)=-1)  //bsw otherwise it will keep replacing DB_SaveRecord to DB DB_SaveRecord...so on
		
		$_t_TextOLD:=[SCRIPTS:80]Recording_Text:4
		[SCRIPTS:80]Recording_Text:4:=Replace string:C233([SCRIPTS:80]Recording_Text:4; "SAVE RECORD(["; "DB_SaveRecord(->[")
		
		MESSAGE:C88($_t_message)
		
		If ($_t_TextOLD#[SCRIPTS:80]Recording_Text:4)
			
			MESSAGE:C88(Uppercase:C13($_t_message))
			DB_SaveRecord(->[SCRIPTS:80])
			
		End if 
	End if 
	
	NEXT RECORD:C51([SCRIPTS:80])
	
	If (<>SYS_bo_QuitCalled)
		$_l_index:=Records in selection:C76([SCRIPTS:80])
	End if 
	
End for 

REDUCE SELECTION:C351([SCRIPTS:80]; 0)
ERR_MethodTrackerReturn("MACROS SAVE COMMAND FIX"; $_t_oldMethodName)
