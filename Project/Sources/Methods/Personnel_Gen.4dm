//%attributes = {}
If (False:C215)
	//Project Method Name:      Personnel_Gen
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

$_t_oldMethodName:=ERR_MethodTracker("Personnel_Gen")
CREATE RECORD:C68([PERSONNEL:11])
If ([USER:15]Name:38="")
	[PERSONNEL:11]Initials:1:="GEN"
	[PERSONNEL:11]Name:2:="General User"
Else 
	[PERSONNEL:11]Initials:1:=Substring:C12(Str_Initials([USER:15]Name:38); 1; 5)
	[PERSONNEL:11]Name:2:=[USER:15]Name:38
End if 
DB_SaveRecord(->[PERSONNEL:11])
AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
UNLOAD RECORD:C212([PERSONNEL:11])
ERR_MethodTrackerReturn("Personnel_Gen"; $_t_oldMethodName)