If (False:C215)
	//object Name: [LIST_LAYOUTS]Layout_In.Variable15
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
	//ARRAY TEXT(AL_at_FormulaType;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; AL_T_Formula)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [LIST_LAYOUTS].Layout_In.Variable15"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		If (Length:C16(AL_T_Formula)>80)
			Gen_Alert("The maximum length of a formula is 80 characters")
			AL_T_Formula:=Substring:C12(AL_T_FOrmula; 1; 80)
		End if 
		//even thought we are storing this as text it is still limited to 80 chars
		If (AL_at_FormulaType=2)
			[LIST_LAYOUTS:96]Formula:9:="•"+AL_T_Formula
		Else 
			[LIST_LAYOUTS:96]Formula:9:=AL_T_Formula
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [LIST_LAYOUTS].Layout_In.Variable15"; $_t_oldMethodName)
