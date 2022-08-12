//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_FmulReplace
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterPosition; $_l_DataType; $_l_FieldNumber; $_l_TableNumber; $_l_ThisColumn; $3)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayofColumnLabels; $_ptr_Field; $_ptr_Table; $_Ptr_ThisColumnField; $1)
	C_TEXT:C284($_t_After; $_t_Before; $_t_Column; $_t_FieldName; $_t_Input; $_t_oldMethodName; $_t_TableName; $_t_VariableName; $0; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_FmulReplace")

//This method is a direct replacement for ALFmulReplace
//ALFmulReplace - Formula Replace ~s with values
$_t_Input:=$2


$_l_CharacterPosition:=Position:C15("~"; $_t_Input)
While ($_l_CharacterPosition>0)
	//IDLE  ` 03/04/03 pb
	$_t_Before:=Substring:C12($_t_Input; 1; $_l_CharacterPosition-1)
	$_t_Column:=Substring:C12($_t_Input; $_l_CharacterPosition+1; 32000)
	$_l_CharacterPosition:=Position:C15("~"; $_t_Column)
	If ($_l_CharacterPosition>0)
		$_t_After:=Substring:C12($_t_Column; $_l_CharacterPosition+1; 32000)
		$_t_Column:=Substring:C12($_t_Column; 1; $_l_CharacterPosition-1)
		//$_t_Column:=$_t_Column+(" "*(15-Length($_t_Column)))+"@"
		//pad out to compare with front of Settings field
		$_ptr_ArrayofColumnLabels:=$1->{12}
		$_l_ThisColumn:=Find in array:C230($_ptr_ArrayofColumnLabels->; $_t_Column)
		If ($_l_ThisColumn>0)
			$_ptr_ArrayFieldPointers:=$1->{2}
			$_ptr_ArrayofArrayPointers:=$1->{3}
			$_l_DataType:=Type:C295(($_ptr_ArrayFieldPointers->{$_l_ThisColumn})->)
			Case of 
				: (($_l_DataType=0) | ($_l_DataType=2) | ($_l_DataType=24))
					$_t_Column:=Char:C90(34)+($_ptr_ArrayofArrayPointers->{$_l_ThisColumn})->{$3}+Char:C90(34)
					$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_ThisColumn}
					RESOLVE POINTER:C394($_Ptr_ThisColumnField; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
					$_ptr_Table:=Table:C252($_l_TableNumber)
					$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldNumber)
					$_t_TableName:=Table name:C256($_l_TableNumber)
					$_t_FieldName:=Field name:C257($_l_TableNumber; $_l_FieldNumber)
					$_t_Column:="->["+$_t_TableName+"]"+$_t_FieldName
				: (($_l_DataType=1) | ($_l_DataType=8) | ($_l_DataType=9) | ($_l_DataType=11))
					$_t_Column:=String:C10(($_ptr_ArrayofArrayPointers->{$_l_ThisColumn})->{$3})
				: ($_l_DataType=4)
					$_t_Column:="!"+String:C10(($_ptr_ArrayofArrayPointers->{$_l_ThisColumn})->{$3})+"!"
				: ($_l_DataType=6)
					$_t_Column:=("True"*Num:C11(($_ptr_ArrayofArrayPointers->{$_l_ThisColumn})->{$3}))+("False"*Num:C11(($_ptr_ArrayofArrayPointers->{$_l_ThisColumn})->{$3}=False:C215))
			End case 
			$_t_Input:=$_t_Before+$_t_Column+$_t_After
		Else 
			$_t_Input:=$_t_Before+$_t_After
		End if 
		$_l_CharacterPosition:=Position:C15("~"; $_t_Input)
	Else 
		$_t_Input:=$_t_Before+"~"+$_t_Column
		$_l_CharacterPosition:=0
	End if 
End while 
$_t_Input:=Macro_translate($_t_Input)
$0:=$_t_Input
ERR_MethodTrackerReturn("LBi_FmulReplace"; $_t_oldMethodName)