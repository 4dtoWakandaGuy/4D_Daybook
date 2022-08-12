//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_CachedDataPutText
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
	C_POINTER:C301($pVariable)
	C_REAL:C285($2; $rTimeout)
	C_TEXT:C284(<>GEN_t_ERROR; <>IME_t_CachedTextName; $_t_oldMethodName; $0; $1; $3; $sDataCode; $sVariableName; $tResult)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_CachedDataPutText")

//Method:  IME_CachedDataPutText

//Purpose:  Puts some Named Data into the Cache
//Inputs:
//$1:  String (79) - Named Data Code
//$2:  Real - Timeout in Minutes
//$3:  Text - Text to Put
//Outputs:
//$0:  Text - Result Description



$tResult:=<>GEN_t_ERROR

If (Count parameters:C259>2)
	
	$sDataCode:=$1
	$rTimeout:=$2
	
	$sVariableName:=<>IME_t_CachedTextName  //name of a variable, assigned in IME_Startup method
	$pVariable:=Get pointer:C304($sVariableName)
	
	$pVariable->:=$3
	
	$tResult:=IME_CachedDataPut($sDataCode; $rTimeout; $sVariableName)
	
End if 

$0:=$tResult
//end
ERR_MethodTrackerReturn("IME_CachedDataPutText"; $_t_oldMethodName)