If (False:C215)
	//object Name: [COMPANIES]Company_In.oDropSeach
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CO_at_SearchConstructs2;0)
	//ARRAY TEXT(CO_at_SearchOptions;0)
	//ARRAY TEXT(CO_at_SearchOptions2;0)
	C_LONGINT:C283($_l_event; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop)
	C_TEXT:C284($_t_Construct; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.oDropSeach"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (CO_at_SearchConstructs2{CO_at_SearchOptions2}#"")  //if this is blank do nothing
			OBJECT GET COORDINATES:C663([COMPANIES:2]Company_Name:2; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_t_Construct:=CO_at_SearchConstructs2{CO_at_SearchOptions2}
			CO_News([COMPANIES:2]Company_Name:2; $_l_ObjectLeft; $_l_ObjectBottom; $_t_Construct)
		Else 
			If (CO_at_SearchOptions2>Size of array:C274(CO_at_SearchOptions))  //we have selected to edit the settings(this will only be here if we are admin or designer
				CO_NewsEditSettings
			End if 
		End if 
		
End case 
CO_at_SearchOptions2:=0
ERR_MethodTrackerReturn("OBJ [COMPANIES].Company_In.oDropSeach"; $_t_oldMethodName)
