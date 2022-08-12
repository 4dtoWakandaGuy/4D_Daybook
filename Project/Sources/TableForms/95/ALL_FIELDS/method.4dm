//Variable Declarations
If (True:C214)
	//C_UNKNOWN(x_ItemAttributesOBJECT)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_OBJECT:C1216($_obj_Lists)
	C_TEXT:C284($_t_oldMethodName; AA_t_listName; WS_T_Properties)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [LIST_ITEMS].ALL_FIELDS"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Display Detail:K2:22)
		WS_T_Properties:=""
		AA_t_listName:=""
		//WS_T_Properties:=Replace string(BLOB to text([LIST_ITEMS]X_Item_Attributes; 3); Char(13); " ")
		If (Not:C34([LIST_ITEMS:95]x_ItemAttributesOBJECT:11.properties=Null:C1517))
			WS_T_Properties:=JSON Stringify array:C1228([LIST_ITEMS:95]x_ItemAttributesOBJECT:11.properties)
		End if 
		If ([LIST_ITEMS:95]X_ListID:4>0)
			$_obj_Lists:=ds:C1482.X_LISTS.query("x_ID =:1"; [LIST_ITEMS:95]X_ListID:4)
			AA_t_listName:=$_obj_Lists[0].x_ListName
		End if 
		
End case 
ERR_MethodTrackerReturn("FM [LIST_ITEMS].ALL_FIELDS"; $_t_oldMethodName)
