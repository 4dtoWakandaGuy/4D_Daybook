//%attributes = {}

If (False:C215)
	//Project Method Name:      Join_CodeUseSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/05/2021
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Codes; 0)
	ARRAY TEXT:C222($_at_CodeUsesCodes; 0)
	C_COLLECTION:C1488($_col_CodeUseCodes)
	C_LONGINT:C283($_l_CodeNumber; $_l_CodeUseTableLength; $_l_Index; $_l_RecordsinSelection; $_l_SizeofArray)
	C_OBJECT:C1216($_obj_DataStore; $_obj_EntitySelection; $_obj_QueryParameters; $_obj_RecordsinSelection; $1)
	C_TEXT:C284($_t_CodeUseCode; $_t_DSName; $_t_oldMethodName; $_t_QueryValues)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Join_CodeUseSelection")
If (Count parameters:C259>=1)
	$_obj_QueryParameters:=$1
	If (Not:C34($_obj_QueryParameters.toDSName=Null:C1517)) & (Not:C34($_obj_QueryParameters.toDsAttribute=Null:C1517)) & (Not:C34($_obj_QueryParameters.FromCollection=Null:C1517))
		$_obj_RecordsinSelection:=$_obj_QueryParameters.FromCollection
		$_l_CodeNumber:=$_obj_DataStore[$_obj_QueryParameters.toDSName].getInfo().tableNumber
		If ($_l_CodeNumber<1000)
			$_l_CodeUseTableLength:=3
		Else 
			$_l_CodeUseTableLength:=4  //future proofing
		End if 
		If ($_obj_RecordsinSelection.length>1)
			$_col_CodeUseCodes:=$_obj_RecordsinSelection.Code
			For each ($_t_CodeUseCode; $_col_CodeUseCodes)
				$_t_CodeUseCode:=Substring:C12($_t_CodeUseCode; $_l_CodeUseTableLength+1)
				
			End for each 
			
			$_obj_DataStore:=ds:C1482
			$_t_DSName:=$_obj_QueryParameters.toDSName
			$_t_QueryValues:=$_obj_QueryParameters.toDsAttribute+" in :1"
			$_obj_EntitySelection:=$_obj_DataStore[$_t_DSName].query($_t_QueryValues; $_col_CodeUseCodes)
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Join_CodeUseSelection"; $_t_oldMethodName)
