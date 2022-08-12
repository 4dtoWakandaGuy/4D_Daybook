//%attributes = {}
If (False:C215)
	//Project Method Name:      Minor_DeleteSingleRecord
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
	C_POINTER:C301($1; $2)
	C_TEXT:C284(<>SYS_t_MainorRemote; $_t_oldMethodName; $3; vFld; vRec)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Minor_DeleteSingleRecord")
If (($2->#"") & (<>SYS_t_MainorRemote="M"))
	vFld:=Char:C90(200)
	vRec:=Char:C90(201)
	CREATE RECORD:C68([DELETIONS:66])
	[DELETIONS:66]Export:2:=Export_Stamp2([DELETIONS:66]Export:2)
	[DELETIONS:66]Text:1:=[DELETIONS:66]Text:1+$3+vFld+$2->+vFld+[DELETIONS:66]Export:2+vRec
	DB_SaveRecord(->[DELETIONS:66])
	AA_CheckFileUnlocked(->[DELETIONS:66]xRec_ID:3)
End if 
ERR_MethodTrackerReturn("Minor_DeleteSingleRecord"; $_t_oldMethodName)