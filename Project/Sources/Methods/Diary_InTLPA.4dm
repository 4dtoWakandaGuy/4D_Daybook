//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_InTLPA
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
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InTLPA")
//If (DB_t_CurrentFormUsage3="Time_In")  `Ie if come from the Time_In procedure

//removed the above check 01/02/07 - kmw (seemed to mean would only do Time_Post if time was new...however Time_Post look slike it is meant to hanle posting modifications also/anyway)

DB_bo_RecordModified:=False:C215
//Time_Post
//End if
ERR_MethodTrackerReturn("Diary_InTLPA"; $_t_oldMethodName)