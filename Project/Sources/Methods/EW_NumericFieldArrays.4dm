//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_NumericFieldArrays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(EW_at_NumericFields;0)
	//ARRAY LONGINT(EW_al_NumericFieldNums;0)
	//ARRAY LONGINT(EW_al_NumericFieldTablenums;0)
	C_LONGINT:C283($_l_ArraySize; $1; $2; $3)
	C_REAL:C285(iNumericCount)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_NumericFieldArrays")
// EW_numericfieldArrays
//Builds a set of arrays of numeric field info
// for use in Calculations
// parameters: $1=the field number
//                     $2=the table number
//                     $3=the field type
// sample call:     EW_NumericFieldArrays ($FieldNumber;$lTableNumber;$type)
// 21/08/02 pb


If (($3=Is real:K8:4) | ($3=Is integer:K8:5) | ($3=Is longint:K8:6))  // it's numeric
	//$_l_NumericCount=iNumericCount+1
	EW_at_NumericFields{iNumericCount}:=Field name:C257($2; $1)
	EW_al_NumericFieldNums{iNumericCount}:=$1
	EW_al_NumericFieldTablenums{iNumericCount}:=$2
End if 
$_l_ArraySize:=Size of array:C274(EW_at_NumericFields)
If (iNumericCount=$_l_ArraySize)
	INSERT IN ARRAY:C227(EW_at_NumericFields; $_l_ArraySize+1; 50)
	INSERT IN ARRAY:C227(EW_al_NumericFieldNums; $_l_ArraySize+1; 50)
	INSERT IN ARRAY:C227(EW_al_NumericFieldTablenums; $_l_ArraySize+1; 50)
End if 
ERR_MethodTrackerReturn("EW_NumericFieldArrays"; $_t_oldMethodName)