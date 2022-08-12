//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      FurthFldD Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/08/2010 16:56
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	//ARRAY POINTER(CUS_aptr_LBSetup;0)
	//ARRAY TEXT(<>FUR_at_2dCustomFieldFormat;0;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0;0)
	C_BOOLEAN:C305(<>StartProc)
	C_LONGINT:C283($_l_LastTableNumber; MOD_CURRENTMODULE; MOD_l_CurrentModuleAccess)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFldD Mod")
//FurthFldD Mod
<>StartProc:=False:C215
Start_Process
If ((DB_GetModuleSettingByNUM(1))#5)
	
	FORM SET OUTPUT:C54([CUSTOM_FIELD_DEFINITiONS:99]; "FieldDefs Out")
	FORM SET INPUT:C55([CUSTOM_FIELD_DEFINITiONS:99]; "FieldDefs In13")  //NG April 2004 removed reference to ◊screen
	
	FORM SET OUTPUT:C54([CUSTOM_FIELDS:98]; "FurthFld Out")
	FORM SET INPUT:C55([CUSTOM_FIELDS:98]; "FurthFld In13")  //NG April 2004 removed reference to ◊screen)
	MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
	
	READ WRITE:C146([CUSTOM_FIELD_DEFINITiONS:99])
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	ARRAY POINTER:C280(CUS_aptr_LBSetup; 0)
	//  START TRANSACTION
	StartTransaction  // 13/05/02 pb
	
	MESSAGES OFF:C175
	Open_Pro_Window("Further Fields"; 0; 3; ->[CUSTOM_FIELD_DEFINITiONS:99]; "dField Defs")
	DIALOG:C40([CUSTOM_FIELD_DEFINITiONS:99]; "dField Defs")
	Close_ProWin
	MESSAGES ON:C181
	If (OK=1)
		//  VALIDATE TRANSACTION
		Transact_End  // 13/05/02 pb
		//see also ALStartup & Personnel_Mod
		$_l_LastTableNumber:=Get last table number:C254
		ARRAY TEXT:C222(<>FUR_at_CustomFieldNames; $_l_LastTableNumber; 0)
		ARRAY TEXT:C222(<>FUR_at_2dCustomFieldFormat; $_l_LastTableNumber; 0)  //NG November 2004
		ARRAY TEXT:C222(<>FUR_at_CustomFieldTypes; $_l_LastTableNumber; 0)
	Else 
		//   CANCEL TRANSACTION
		Transact_End  // 13/05/02 pb
	End if 
Else 
	Gen_Alert("Further Fields are not available in Daybook Silver"; "Cancel")
End if 
Process_End
ERR_MethodTrackerReturn("FurthFldD Mod"; $_t_oldMethodName)