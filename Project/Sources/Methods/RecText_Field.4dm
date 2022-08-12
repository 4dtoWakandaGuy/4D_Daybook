//%attributes = {}
If (False:C215)
	//Project Method Name:      RecText_Field
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>SYS_at_CurrentTableFieldNames;0)
	C_LONGINT:C283($_l_EndHighlight; $_l_FieldNumber; $_l_Length; $_l_StartHighlight; $_l_TableNumber)
	C_OBJECT:C1216($_obj_Data; $2)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_FieldName; $_t_oldMethodName; $_t_TableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("RecText_Field")
If (Count parameters:C259>=2)
	$_obj_Data:=$2
	If (Not:C34($_obj_Data.tableName=Null:C1517))
		$_t_TableName:=$_obj_Data.tableName
		
	End if 
	If (Not:C34($_obj_Data.tableNumber=Null:C1517))
		$_l_TableNumber:=$_obj_Data.tableNumber
	End if 
	If (Not:C34($_obj_Data.fieldName=Null:C1517))
		$_t_FieldName:=$_obj_Data.fieldName
		
	End if 
	If (Not:C34($_obj_Data.tableNumber=Null:C1517))
		$_l_FieldNumber:=$_obj_Data.fieldNumber
	End if 
Else 
	$_t_FieldName:=<>SYS_at_CurrentTableFieldNames{<>SYS_at_CurrentTableFieldNames}
	$_t_TableName:=<>DB_at_TableNames{<>DB_at_TableNames}
End if 
If ($_t_TableName#"")
	
	GET HIGHLIGHT:C209($1->; $_l_StartHighlight; $_l_EndHighlight)
	$_l_Length:=Length:C16($_t_TableName)
	If (Substring:C12($1->; $_l_StartHighlight-$_l_Length-2; $_l_Length+2)#("["+$_t_TableName+"]"))
		$1->:=Substring:C12($1->; 1; $_l_StartHighlight-1)+"["+$_t_TableName+"]"+$_t_FieldName+Substring:C12($1->; $_l_EndHighlight; 32000)
		$_l_EndHighlight:=$_l_StartHighlight+Length:C16($_t_FieldName)+2+$_l_Length
	Else 
		$1->:=Substring:C12($1->; 1; $_l_StartHighlight-1)+$_t_FieldName+Substring:C12($1->; $_l_EndHighlight; 32000)
		$_l_EndHighlight:=$_l_StartHighlight+Length:C16($_t_FieldName)
	End if 
	HIGHLIGHT TEXT:C210($1->; $_l_EndHighlight; $_l_EndHighlight)
Else 
	If (Count parameters:C259<2)
		<>SYS_at_CurrentTableFieldNames:=1
	End if 
End if 
ERR_MethodTrackerReturn("RecText_Field"; $_t_oldMethodName)
