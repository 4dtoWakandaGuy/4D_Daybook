//%attributes = {}
If (False:C215)
	//Project Method Name:      CAC_DeleteSelectionTimeout
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
	C_LONGINT:C283($i; $iIndex)
	C_POINTER:C301($pTable)
	C_REAL:C285($rMS)
	C_TEXT:C284(<>CAC_s_CacheNullCode; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAC_DeleteSelectionTimeout")
//CAC_DeleteSelectionTimeout
//Rollo 10/11/99

//Remove Cache rows by Timeout


If (UTI_Semaphore("CacheManager"))
	
	$rMS:=CAC_Seconds  //Milliseconds
	
	For ($iIndex; 1; Size of array:C274(<>CAC_ar_CacheExpirationMS))
		
		If (<>CAC_at_CacheIndex{$iIndex}#<>CAC_s_CacheNullCode)
			If (<>CAC_ar_CacheExpirationMS{$iIndex}<$rMS)
				<>CAC_at_CacheIndex{$iIndex}:=<>CAC_s_CacheNullCode
				<>CAC_at_CacheIndex2{$iIndex}:=<>CAC_s_CacheNullCode  //Rollo 5/17/2000
				<>CAC_at_CacheIndex3{$iIndex}:=<>CAC_s_CacheNullCode  //Rollo 5/17/2000
			End if 
		End if 
		
	End for 
	
	UTI_ClearSemaphore("CacheManager")
	
End if 
ERR_MethodTrackerReturn("CAC_DeleteSelectionTimeout"; $_t_oldMethodName)
