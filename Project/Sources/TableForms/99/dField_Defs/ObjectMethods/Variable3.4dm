If (False:C215)
	//object Name: [CUSTOM_FIELD_DEFINITiONS]dField_Defs.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	ARRAY TEXT:C222($_at_FieldNames; 0)
	C_LONGINT:C283($_l_SizeofArray; vNo)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; WIN_t_CurrentOutputform)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CUSTOM_FIELD_DEFINITiONS].dField_Defs.Variable3"; Form event code:C388)

DB_SaveRecord(->[CUSTOM_FIELD_DEFINITiONS:99])
FurthFldD_InLPß("T")


READ WRITE:C146([CUSTOM_FIELDS:98])
QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3=<>DB_al_TableNums{<>DB_at_TableNames})
//QUERY([FIELD DEFS];[FIELD DEFS]File No=◊Files)
ARRAY TEXT:C222($_at_FieldNames; 0)
SELECTION TO ARRAY:C260([CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2; $_at_FieldNames)
$_l_SizeofArray:=Size of array:C274($_at_FieldNames)
If ($_l_SizeofArray>0)
	QUERY WITH ARRAY:C644([CUSTOM_FIELDS:98]Field_Name:3; $_at_FieldNames)
Else 
	REDUCE SELECTION:C351([CUSTOM_FIELDS:98]; 0)
End if 

vNo:=Records in selection:C76([CUSTOM_FIELDS:98])
If ((vNo=0) & (Records in table:C83([CUSTOM_FIELDS:98])>0))
	Gen_Confirm("There are no Custom-Field values for this table.  "+"Do you want to see values for all tables?"; "Yes"; "No")
	If (OK=1)
		ALL RECORDS:C47([CUSTOM_FIELDS:98])
	End if 
Else 
	If (vNo=0)
		Gen_Alert("No Further Field Values have as yet been created"; "Cancel")
	End if 
End if 

vNo:=Records in selection:C76([CUSTOM_FIELDS:98])
If (vNo>0)
	$_t_CurrentOutputform:=WIN_t_CurrentOutputform
	WIN_t_CurrentOutputform:="CustomFIelds_Out"
	Open_Pro_Window("View Values"; 0; 1; ->[CUSTOM_FIELDS:98]; "CustomFIelds_Out")
	WIn_SetFormSize(1; ->[CUSTOM_FIELDS:98]; "CustomFIelds_Out")
	MODIFY SELECTION:C204([CUSTOM_FIELDS:98]; *)
	Close_ProWin
	WIN_t_CurrentOutputform:=$_t_CurrentOutputform
	
End if 

READ ONLY:C145([CUSTOM_FIELDS:98])
UNLOAD RECORD:C212([CUSTOM_FIELDS:98])

FurthFldD_InArr
ERR_MethodTrackerReturn("OBJ [CUSTOM_FIELD_DEFINITiONS].dField_Defs.Variable3"; $_t_oldMethodName)
