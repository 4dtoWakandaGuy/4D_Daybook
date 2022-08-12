If (False:C215)
	//object Name: [LIST_LAYOUTS]Layout_In.Variable14
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 16:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(AL_at_SubFieldNames;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; AL_T_Formula)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [LIST_LAYOUTS].Layout_In.Variable14"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (AL_at_SubFieldNames{AL_at_SubFieldNames}#AL_T_Formula)
			AL_T_Formula:=AL_at_SubFieldNames{AL_at_SubFieldNames}
			[LIST_LAYOUTS:96]Formula:9:=AL_T_Formula
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [LIST_LAYOUTS].Layout_In.Variable14"; $_t_oldMethodName)
