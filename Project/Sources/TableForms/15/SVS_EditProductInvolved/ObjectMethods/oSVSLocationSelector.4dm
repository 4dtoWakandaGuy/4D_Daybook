If (False:C215)
	//object Name: [USER]SVS_EditProductInvolved.oSVSLocationSelector
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
	//ARRAY LONGINT(STK_al_CallLocations;0)
	//ARRAY TEXT(SVS_at_CallLocations;0)
	C_LONGINT:C283($_l_event; SVS_l_Itemlocation)
	C_TEXT:C284($_t_oldMethodName; SVS_t_ItemLocation)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SVS_EditProductInvolved.oSVSLocationSelector"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		SVS_t_ItemLocation:=SVS_at_CallLocations{SVS_at_CallLocations}
		SVS_l_Itemlocation:=STK_al_CallLocations{SVS_at_CallLocations}  //
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SVS_EditProductInvolved.oSVSLocationSelector"; $_t_oldMethodName)
