//%attributes = {}

If (False:C215)
	//Project Method Name:      Project_CodeUseSelection
	//------------------ Method Notes ------------------
	//this is a redo of Project_SelCU
	//here we are passed an object in the Project_SelCU the old method had 3 parameters $1 pointer to table $2 pointer to field use $3 is the code use
	
	//------------------ Revision Control ----------------
	//Date Created:  15/05/2021
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	ARRAY TEXT:C222($_at_CodeUsesCodes; 0)
	ARRAY TEXT:C222($_at_RecordCodes; 0)
	C_COLLECTION:C1488($_Col_CodeValues)
	C_LONGINT:C283($_l_Build; $_l_CodeNumber; $_l_CodeTable)
	C_OBJECT:C1216($_obj_CodeUses; $_obj_DataStore; $_obj_EntitySelection; $_obj_QueryParameters; $1)
	C_TEXT:C284($_t_CodeTable; $_t_CodeUse; $_t_queryValues)
End if 
//Code Starts Here
If (Count parameters:C259>=1)
	$_obj_QueryParameters:=$1
	If (Not:C34($_obj_QueryParameters.fromDSName=Null:C1517)) & (Not:C34($_obj_QueryParameters.fromDsAttribute=Null:C1517))
		$_obj_DataStore:=ds:C1482
		$_t_queryValues:=$_obj_QueryParameters.fromDsAttribute
		$_obj_EntitySelection:=$_obj_QueryParameters.FromCollection
		$_Col_CodeValues:=$_obj_EntitySelection[$_t_queryValues]
		$_l_CodeNumber:=$_obj_DataStore[$_obj_QueryParameters.fromDSName].getInfo().tableNumber
		$_t_CodeTable:=String:C10($_l_CodeNumber)
		$_t_CodeTable:=("0"*(3-Length:C16($_t_CodeTable)))+$_t_CodeTable
		$0:=ds:C1482.CODE_USES.query("Code  in :1 and Use =:1"; $_Col_CodeValues; $_l_CodeNumber)
	End if 
	
End if 
