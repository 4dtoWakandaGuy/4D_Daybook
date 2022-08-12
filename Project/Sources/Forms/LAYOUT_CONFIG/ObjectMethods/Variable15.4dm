If (False:C215)
	//object Name: Object Name:      LAYOUT_CONFIG.Variable15
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/11/2010 19:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(DB_aptr_Setup;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; LAY_bo_RecordEdited; LAY_bo_ShowLastColumn)
	C_LONGINT:C283($_l_Column; $_l_event; LAY_l_ConfigCancel; LAY_l_ConfigSave)
	C_POINTER:C301($_ptr_ArrayFormulas)
	C_TEXT:C284($_t_oldMethodName; AL_T_Formula)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ LAYOUT_CONFIG.Variable15"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		If (Length:C16(AL_T_Formula)>80)
			Gen_Alert("The maximum length of a formula is 80 characters")
			AL_T_Formula:=Substring:C12(AL_T_FOrmula; 1; 80)
		End if 
		//even thought we are storing this as text it is still limited to 80 chars
		//If (AL_at_FormulaType=2)
		[LIST_LAYOUTS:96]Formula:9:="•"+AL_T_Formula
		//Else
		[LIST_LAYOUTS:96]Formula:9:=AL_T_Formula
		LAY_bo_RecordEdited:=True:C214
		DB_bo_RecordModified:=True:C214
		$_l_Column:=[LIST_LAYOUTS:96]Order:7
		$_ptr_ArrayFormulas:=DB_aptr_Setup{6}
		$_ptr_ArrayFormulas->{$_l_Column}:=[LIST_LAYOUTS:96]Formula:9
		LAY_bo_ShowLastColumn:=True:C214
		LBi_LoadSetup(->DB_aptr_Setup)
		
		
		OBJECT SET VISIBLE:C603(LAY_l_ConfigSave; True:C214)
		OBJECT SET VISIBLE:C603(LAY_l_ConfigCancel; True:C214)
		//End if
		
End case 
ERR_MethodTrackerReturn("OBJ LAYOUT_CONFIG.Variable15"; $_t_oldMethodName)
