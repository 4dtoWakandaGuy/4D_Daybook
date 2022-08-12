If (False:C215)
	//object Name: [USER]User_In.oCat_MACPictTypes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 13:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CAT_al_SupportedPicTypes;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oCat_MACPictTypes"; Form event code:C388)
If (CAT_al_SupportedPicTypes>0)
	CAT_al_SupportedPicTypes{CAT_al_SupportedPicTypes}:=Abs:C99(CAT_al_SupportedPicTypes{CAT_al_SupportedPicTypes}-1)
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oCat_MACPictTypes"; $_t_oldMethodName)
