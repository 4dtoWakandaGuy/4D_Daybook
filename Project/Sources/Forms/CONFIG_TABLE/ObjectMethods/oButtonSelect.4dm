If (False:C215)
	//object Name: Object Name:      CONFIG_TABLE.oButtonSelect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/10/2012 09:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OptionKey)
	C_LONGINT:C283(DB_l_DisplayTable)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/CONFIG_TABLE/oButtonSelect"; Form event code:C388)

$_bo_OptionKey:=Gen_Option
CREATE SET:C116(Table:C252(DB_l_DisplayTable)->; "Temp")
If (Records in set:C195("DataSelected")>0)
	If ($_bo_OptionKey)
		DIFFERENCE:C122("Temp"; "DataSelected"; "Temp")
		USE SET:C118("Temp")
	Else 
		USE SET:C118("DataSelected")
	End if 
End if 
ERR_MethodTrackerReturn("OBJ CONFIG_TABLE.oButtonSelect"; $_t_oldMethodName)
