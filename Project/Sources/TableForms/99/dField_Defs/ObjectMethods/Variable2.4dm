If (False:C215)
	//object Name: [CUSTOM_FIELD_DEFINITiONS]dField_Defs.Variable2
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
	//ARRAY TEXT(<>DB_at_TableNames;0)
	C_LONGINT:C283($_l_SelectedTableRow; vNo)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; WIN_t_CurrentOutputform)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CUSTOM_FIELD_DEFINITiONS].dField_Defs.Variable2"; Form event code:C388)
DB_SaveRecord(->[CUSTOM_FIELD_DEFINITiONS:99])
FurthFldD_InLPß("T")

$_l_SelectedTableRow:=<>DB_at_TableNames
vNo:=Records in selection:C76([CUSTOM_FIELD_DEFINITiONS:99])
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Open_Pro_Window("View Definitions"; 0; 1; ->[CUSTOM_FIELD_DEFINITiONS:99]; "FieldDefs_Out")
WIN_t_CurrentOutputform:="FieldDefs_Out"
WIn_SetFormSize(1; ->[CUSTOM_FIELD_DEFINITiONS:99]; "FieldDefs_Out")
MODIFY SELECTION:C204([CUSTOM_FIELD_DEFINITiONS:99]; *)
Close_ProWin
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
<>DB_at_TableNames:=$_l_SelectedTableRow
FurthFldD_InArr
ERR_MethodTrackerReturn("OBJ [CUSTOM_FIELD_DEFINITiONS].dField_Defs.Variable2"; $_t_oldMethodName)
