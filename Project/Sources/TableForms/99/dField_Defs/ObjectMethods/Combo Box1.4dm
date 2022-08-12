If (False:C215)
	//object Name: [CUSTOM_FIELD_DEFINITiONS]dField_Defs.Combo Box1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CUSTOM_FIELD_DEFINITiONS].dField_Defs.Combo Box1"; Form event code:C388)
DB_SaveRecord(->[CUSTOM_FIELD_DEFINITiONS:99])
FurthFldD_InLPß("T")
If (<>DB_at_TableNames=0)
	<>DB_at_TableNames:=Find in array:C230(<>DB_al_TableNums; 2)
End if 
If (<>SYS_al_TableUniqueField{<>DB_at_TableNames}=0)
	Gen_Alert("Sorry, Field Definitions cannot currently be set up for this file"; "Cancel")
	<>DB_at_TableNames:=2
End if 
FurthFldD_InArr
ERR_MethodTrackerReturn("OBJ [CUSTOM_FIELD_DEFINITiONS].dField_Defs.Combo Box1"; $_t_oldMethodName)
