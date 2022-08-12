//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_CachedDataGetBlob
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
	C_LONGINT:C283($i)
	C_POINTER:C301($2; $pBlob)
	C_TEXT:C284(<>GEN_t_ERROR; <>GEN_t_OK; $_t_oldMethodName; $0; $1; $sDataCode; $tResult)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_CachedDataGetBlob")

//Method:  IME_CachedDataGetBlob

//Purpose:  Get a Blob from Cache
//Inputs:
//$1:  String (79) - Named Data Code
//$2 - Ptr - pointer to the blob
//Outputs:
//$0:  Text - Result Description

//NB: See also IME_CachedDataGet



$tResult:=<>GEN_t_ERROR

If (Count parameters:C259>1)
	
	$sDataCode:=$1
	$pBlob:=$2
	
	$tResult:=CAC_Query(->[PREFERENCES:116]; $sDataCode)
	
	If ([PREFERENCES:116]IDNumber:1>0)  //(Records in selection([BitBucket_4D])=1)
		
		$pBlob->:=[PREFERENCES:116]DataBlob:2
		$tResult:=<>GEN_t_OK
		
	Else 
		
		$tResult:=$tResult+Char:C90(Tab:K15:37)+"Data Not in Cache"
		
	End if 
	
End if 

$0:=$tResult
//end
ERR_MethodTrackerReturn("IME_CachedDataGetBlob"; $_t_oldMethodName)