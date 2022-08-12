//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_CachedDataDelete
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
	C_BOOLEAN:C305($2; $bMultiple)
	C_TEXT:C284($_t_oldMethodName; $1; $sDataKey; $tResult)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_CachedDataDelete")

//Method:  IME_CachedDataDelete

//Purpose:  Deletes data from the Generic Cache
//Inputs:
//$1:  String (79) - Data Key
//$2: Boolean - multiple?
//Outputs:
//$0:  Text - Access Ref or Error Code


If (Count parameters:C259>0)
	
	$sDataKey:=$1
	If (Count parameters:C259>1)
		$bMultiple:=$2
	Else 
		$bMultiple:=False:C215
	End if 
	
	If ($bMultiple)
		$tResult:=CAC_DeleteSelection(->[PREFERENCES:116]; $sDataKey)
	Else 
		$tResult:=CAC_DeleteRecord(->[PREFERENCES:116]; $sDataKey)
	End if 
	
End if 
//end

//LOG_ResetMethod
ERR_MethodTrackerReturn("IME_CachedDataDelete"; $_t_oldMethodName)