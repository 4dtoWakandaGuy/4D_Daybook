//%attributes = {}
If (False:C215)
	//Project Method Name:      CAC_SaveExpiration
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(<>CAC_ar_CacheExpirationMS;0)
	//ARRAY TEXT(<>CAC_at_CacheIndex;0)
	//ARRAY TEXT(<>CAC_at_CacheIndex2;0)
	//ARRAY TEXT(<>CAC_at_CacheIndex3;0)
	C_LONGINT:C283(<>CAC_l_TimeOut; $iIndex)
	C_POINTER:C301($1; $pTable)
	C_REAL:C285($3; $rExpirationMS)
	C_TEXT:C284(<>GEN_t_ERROR; <>GEN_t_OK; $_t_oldMethodName; $0; $2; $4; $sCacheIndexesToUse; $sKey; $tResult)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAC_SaveExpiration")
//CAC_SaveExpiration
//Rollo 10/11/99

//don't save the whole record - just update the expiration
//- a major advantage over the old method



$tResult:=<>GEN_t_ERROR

If (Count parameters:C259>1)
	
	$pTable:=$1
	$sKey:=$2
	
	If (Count parameters:C259>2)
		$rExpirationMS:=$3
	Else 
		$rExpirationMS:=0
	End if 
	
	If ($rExpirationMS=0)
		$rExpirationMS:=CAC_Seconds+(60*<>CAC_l_TimeOut)  //Milliseconds+(1000*60*◊CAC_i_Timeout)
	End if 
	
	If (Count parameters:C259>3)
		$sCacheIndexesToUse:=$4
	Else 
		$sCacheIndexesToUse:="1"
	End if 
	
	If ((Not:C34(Is nil pointer:C315($pTable))) & ($sKey#"") & ($rExpirationMS>0))
		
		If (UTI_Semaphore("CacheManager"))
			
			Case of 
				: ($sCacheIndexesToUse="1")
					$iIndex:=Find in array:C230(<>CAC_at_CacheIndex; $sKey)
				: ($sCacheIndexesToUse="2")
					$iIndex:=Find in array:C230(<>CAC_at_CacheIndex2; $sKey)
				: ($sCacheIndexesToUse="3")
					$iIndex:=Find in array:C230(<>CAC_at_CacheIndex3; $sKey)
				: ($sCacheIndexesToUse="23")
					//will have to loop
			End case 
			
			If ($iIndex>0)  //if this row is in the cache
				<>CAC_ar_CacheExpirationMS{$iIndex}:=$rExpirationMS
			End if 
			
			UTI_ClearSemaphore("CacheManager")
			
			$tResult:=<>GEN_t_OK
			
		End if 
		
	End if 
	
End if 

$0:=$tResult
ERR_MethodTrackerReturn("CAC_SaveExpiration"; $_t_oldMethodName)
