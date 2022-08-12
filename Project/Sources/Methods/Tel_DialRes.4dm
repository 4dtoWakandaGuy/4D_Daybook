//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_DialRes
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
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_DialRes")

Case of 
	: ($1=300)
		$0:="Connect"
	: ($1=258)
		$0:="Disconect"  //- someone hung up immed
	: ($1=301)
		$0:="Busy"
	: ($1=256)
		$0:="SIT Tone"
	: ($1=257)
		$0:="Stop"
	: ($1=302)
		$0:="No answer"
	: ($1=303)
		$0:="Call unavailable"  //line died
End case 
ERR_MethodTrackerReturn("Tel_DialRes"; $_t_oldMethodName)