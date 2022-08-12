If (False:C215)
	//object Name: [USER]User_In.oCallLocations
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 13:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(STK_al_CallLocations;0)
	//ARRAY TEXT(SVS_at_CallLocations;0)
	C_LONGINT:C283(SVS_l_DefaultLocationID)
	C_TEXT:C284($_t_oldMethodName; SVS_t_LocationName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oCallLocations"; Form event code:C388)

SVS_t_LocationName:=SVS_at_CallLocations{SVS_at_CallLocations}
SVS_l_DefaultLocationID:=STK_al_CallLocations{SVS_at_CallLocations}
ERR_MethodTrackerReturn("OBJ [USER].User_In.oCallLocations"; $_t_oldMethodName)