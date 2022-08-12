//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_CachedDataPutBlob
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
	C_LONGINT:C283($i; $iExpirationMS; $iRecordCount)
	C_POINTER:C301($3; $pBlob)
	C_REAL:C285($2; $rTimeout)
	C_TEXT:C284(<>GEN_t_ERROR; $_t_oldMethodName; $0; $1; $sDataCode; $tResult)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_CachedDataPutBlob")

//Method:  IME_CachedDataPutBlob

//Purpose:  Puts any old Blob into the Cache
//Inputs:
//$1:  String (79) - Named Data Code
//$2:  Real - Timeout in Minutes
//$3 - Ptr - pointer to the blob
//Outputs:
//$0:  Text - Result Description

//NB: See also IME_CachedDataPut


$tResult:=<>GEN_t_ERROR

If (Count parameters:C259>2)
	
	$sDataCode:=$1
	$rTimeout:=$2
	$pBlob:=$3
	
	If ($rTimeout<0)
		$rTimeout:=60
	End if 
	
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=1  //$sDataCode
	[PREFERENCES:116]DataBlob:2:=$pBlob->
	
	If ($rTimeout=0)
		$iExpirationMS:=0
	Else 
		$iExpirationMS:=CAC_Seconds+(60*$rTimeout)  //Milliseconds+(1000*60*$rTimeout)
	End if 
	
	$tResult:=CAC_SaveRecord(->[PREFERENCES:116]; $sDataCode; $iExpirationMS)
	
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
	
End if 

$0:=$tResult
//end
ERR_MethodTrackerReturn("IME_CachedDataPutBlob"; $_t_oldMethodName)