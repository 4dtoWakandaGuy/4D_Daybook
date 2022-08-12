//%attributes = {}
If (False:C215)
	//Project Method Name:      Minor_DelRecords
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/11/2009 10:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1; $2)
	C_TEXT:C284(<>SYS_t_MainorRemote; $_t_oldMethodName; $_t_Text; $3; vFld; vRec)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Minor_DelRecords")
If ((Records in selection:C76($1->)>0) & (<>SYS_t_MainorRemote="M"))
	vFld:=Char:C90(200)
	vRec:=Char:C90(201)
	CREATE RECORD:C68([DELETIONS:66])
	[DELETIONS:66]Export:2:=Export_Stamp2([DELETIONS:66]Export:2)
	FIRST RECORD:C50($1->)
	While (Not:C34(End selection:C36($1->)))
		$_t_Text:=$2->
		[DELETIONS:66]Text:1:=[DELETIONS:66]Text:1+$3+vFld+$_t_Text+vFld+[DELETIONS:66]Export:2+vRec
		NEXT RECORD:C51($1->)
	End while 
	DB_SaveRecord(->[DELETIONS:66])
	AA_CheckFileUnlocked(->[DELETIONS:66]xRec_ID:3)
End if 
ERR_MethodTrackerReturn("Minor_DelRecords"; $_t_oldMethodName)
