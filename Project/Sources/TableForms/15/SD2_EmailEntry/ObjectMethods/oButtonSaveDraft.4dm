If (False:C215)
	//object Name: [USER]SD2_EmailEntry.OSaveDraft
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SD2_bo_SaveDraftEmail)
	C_LONGINT:C283(iOK)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_EmailEntry.OSaveDraft"; Form event code:C388)  //added error tracker call 08/07/08 -kmw


iOK:=1
SD2_bo_SaveDraftEmail:=True:C214
POST OUTSIDE CALL:C329(Current process:C322)
ERR_MethodTrackerReturn("OBJ [USER].SD2_EmailEntry.OSaveDraft"; $_t_oldMethodName)  //added error tracker call 08/07/08 -kmw