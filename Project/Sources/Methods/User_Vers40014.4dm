//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Vers40014
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/09/2009 08:39
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

$_t_oldMethodName:=ERR_MethodTracker("User_Vers40014")
If ((DB_GetModuleSettingByNUM(1))=5)
	[USER:15]ProdGroupBrand:140:=False:C215
	READ WRITE:C146([PERSONNEL:11])
	ALL RECORDS:C47([PERSONNEL:11])
	FIRST RECORD:C50([PERSONNEL:11])
	While (Not:C34(End selection:C36([PERSONNEL:11])))
		[PERSONNEL:11]Group_Code:28:=""
		[PERSONNEL:11]Analysis_Code:20:=""
		[PERSONNEL:11]Analysis_Only:25:=False:C215
		[PERSONNEL:11]Analysis_Override:24:=False:C215
		[PERSONNEL:11]Startup_Diary:16:=0
		DB_SaveRecord(->[PERSONNEL:11])
		AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
		NEXT RECORD:C51([PERSONNEL:11])
	End while 
	READ ONLY:C145([PERSONNEL:11])
	UNLOAD RECORD:C212([PERSONNEL:11])
End if 
ERR_MethodTrackerReturn("User_Vers40014"; $_t_oldMethodName)