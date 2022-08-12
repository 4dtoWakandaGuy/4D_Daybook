If (False:C215)
	//object Name: [USER]SVS_EditProductInvolved.oSVSPartsSelector
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 11:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SVS_al_SIStatusIDs;0)
	//ARRAY TEXT(SVS_at_SIStatus;0)
	C_LONGINT:C283($_l_event; SVS_l_PartsStatus)
	C_TEXT:C284($_t_oldMethodName; SVS_t_PartsStatus)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SVS_EditProductInvolved.oSVSPartsSelector"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		SVS_t_PartsStatus:=SVS_at_SIStatus{SVS_at_SIStatus}
		SVS_l_PartsStatus:=SVS_al_SIStatusIDs{SVS_at_SIStatus}  //
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SVS_EditProductInvolved.oSVSPartsSelector"; $_t_oldMethodName)
