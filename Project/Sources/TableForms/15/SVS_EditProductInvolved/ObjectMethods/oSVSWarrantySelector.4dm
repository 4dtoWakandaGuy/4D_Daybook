If (False:C215)
	//object Name: [USER]SVS_EditProductInvolved.oSVSWarrantySelector
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
	//ARRAY LONGINT(SVS_al_WarrantyStatusIDs;0)
	//ARRAY TEXT(SVS_at_WarrantyStatus;0)
	C_LONGINT:C283($_l_event; SVS_l_Warranty)
	C_TEXT:C284($_t_oldMethodName; SVS_t_Warranty)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SVS_EditProductInvolved.oSVSWarrantySelector"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		SVS_t_Warranty:=SVS_at_WarrantyStatus{SVS_at_WarrantyStatus}
		SVS_l_Warranty:=SVS_al_WarrantyStatusIDs{SVS_at_WarrantyStatus}  //
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SVS_EditProductInvolved.oSVSWarrantySelector"; $_t_oldMethodName)
