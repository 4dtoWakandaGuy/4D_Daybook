//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_CachedDataGetText
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
	C_TEXT:C284(<>GEN_t_ERROR; <>GEN_t_OK; <>IME_t_CachedTextName; $_t_oldMethodName; $0; $1; $sDataCode; $sVariableName; $tResult)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_CachedDataGetText")

//Method:  IME_CachedDataGetText

//Purpose:  Puts some Named Data into the Cache
//Inputs:
//$1:  String (79) - Named Data Code
//Outputs:
//$0:  Text - Text from Data Cache



$tResult:=<>GEN_t_ERROR

If (Count parameters:C259>0)
	
	$sDataCode:=$1
	
	$sVariableName:=<>IME_t_CachedTextName  //name of a variable, assigned in IME_Init method
	$pVariable:=Get pointer:C304($sVariableName)
	
	$tResult:=IME_CachedDataGet($sDataCode; $sVariableName)
	
	If ($tResult=<>GEN_t_OK)
		$tResult:=$pVariable->
	End if 
	
End if 

$0:=$tResult
//end
ERR_MethodTrackerReturn("IME_CachedDataGetText"; $_t_oldMethodName)