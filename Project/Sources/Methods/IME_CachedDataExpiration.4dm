//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_CachedDataExpiration
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
	C_BOOLEAN:C305($fContinue)
	C_LONGINT:C283($i; $i2DFrom; $i2DTo; $iExpirationMS; $iPosEnd; $iPosMid; $iPosStart; $iRecordCount; $j)
	C_POINTER:C301($pVariable; $pVariable2D)
	C_REAL:C285($2; $rTimeout)
	C_TEXT:C284(<>GEN_t_ERROR; $_t_oldMethodName; $0; $1; $sDataCode; $tResult)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_CachedDataExpiration")

//Method:  IME_CachedDataExpiration

//Purpose:  Update the Expiration time of the cache
//Inputs:
//$1:  String (79) - Named Data Code
//$2:  Real - Timeout in Minutes

//Outputs:
//$0:  Text - Result Description


$tResult:=<>GEN_t_ERROR

If (Count parameters:C259>1)
	
	$sDataCode:=$1
	$rTimeout:=$2
	
	If ($rTimeout<0)
		$rTimeout:=60
	End if 
	
	If ($rTimeout=0)
		$iExpirationMS:=0
	Else 
		$iExpirationMS:=CAC_Seconds+(60*$rTimeout)  //Milliseconds+(1000*60*$rTimeout)
	End if 
	
	$tResult:=CAC_SaveExpiration(->[PREFERENCES:116]; $sDataCode; $iExpirationMS)
	
End if 

$0:=$tResult
//end
ERR_MethodTrackerReturn("IME_CachedDataExpiration"; $_t_oldMethodName)