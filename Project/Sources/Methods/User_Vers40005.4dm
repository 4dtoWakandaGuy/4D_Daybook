//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Vers40005
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:51
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

$_t_oldMethodName:=ERR_MethodTracker("User_Vers40005")
If ([USER:15]Town:4#"*NEW")
	If (Is macOS:C1572)
		
		User_Message(Char:C90(13)+"      Creating SR Pro Forms")
		Reports_FormCr
	End if 
End if 

ON ERR CALL:C155("Remote_Err")
//ALERT("Method called on error "+Method called on error+"User_Vers40005")

User_Message(Char:C90(13)+"      Updating List Layout Definitions")
READ WRITE:C146([LIST_LAYOUTS:96])
ALL RECORDS:C47([LIST_LAYOUTS:96])
FIRST RECORD:C50([LIST_LAYOUTS:96])
While (Not:C34(End selection:C36([LIST_LAYOUTS:96])))
	[LIST_LAYOUTS:96]Font_Size:11:=10
	[LIST_LAYOUTS:96]Colour:12:="Black"
	Layouts_Setting
	DB_SaveRecord(->[LIST_LAYOUTS:96])
	NEXT RECORD:C51([LIST_LAYOUTS:96])
End while 
READ ONLY:C145([LIST_LAYOUTS:96])
UNLOAD RECORD:C212([LIST_LAYOUTS:96])
ON ERR CALL:C155("")
ERR_MethodTrackerReturn("User_Vers40005"; $_t_oldMethodName)