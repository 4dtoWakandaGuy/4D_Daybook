If (False:C215)
	//object Name: [USER]SD2_EmailEntry.OsendEmail
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 16:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SD2_bo_SaveDraftEmail; SD2_bo_SentFromFormButton)
	C_LONGINT:C283(iOK)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_EmailEntry.OsendEmail"; Form event code:C388)  //added error tracker call 08/07/08 -kmw


iOK:=1
SD2_bo_SaveDraftEmail:=False:C215
SD2_bo_SentFromFormButton:=True:C214  //added 27/11/08 v631b120i -kmw
POST OUTSIDE CALL:C329(Current process:C322)
ERR_MethodTrackerReturn("OBJ [USER].SD2_EmailEntry.OsendEmail"; $_t_oldMethodName)  //added error tracker call 08/07/08 -kmw
