If (False:C215)
	//Table Form Method Name: [COMPANIES]CO_NewsSettings
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
	//ARRAY LONGINT(CO_al_FieldNos;0)
	//ARRAY LONGINT(CO_al_TokenFields;0)
	//ARRAY TEXT(CO_at_FIeldNames;0)
	//ARRAY TEXT(CO_at_SearchOptions;0)
	//ARRAY TEXT(CO_at_TokenFields;0)
	//ARRAY TEXT(CO_at_TokenOptions;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_FieldIndex; $_l_FieldRow; CO_al_CurSearchOpt; CO_l_WebTable)
	C_TEXT:C284($_t_oldMethodName; CO_T_SearchConstruct)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].CO_NewsSettings"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		CO_LoadWebSearchtokens(True:C214; CO_l_WebTable)
		
		ARRAY TEXT:C222(CO_at_TokenFields; Size of array:C274(CO_al_TokenFields))
		
		For ($_l_FieldIndex; 1; Size of array:C274(CO_al_TokenFields))
			$_l_FieldRow:=Find in array:C230(CO_al_FieldNos; CO_al_TokenFields{$_l_FieldIndex})
			CO_at_TokenFields{$_l_FieldIndex}:=CO_at_FIeldNames{$_l_FieldRow}
		End for 
		
		
		CO_T_SearchConstruct:=""
		//Set all the arrays to 0
		CO_at_SearchOptions:=0
		CO_at_TokenOptions:=0
		CO_at_TokenFields:=0
		CO_al_CurSearchOpt:=0
		WS_AutoscreenSize(3; 370; 350)
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].CO_NewsSettings"; $_t_oldMethodName)
