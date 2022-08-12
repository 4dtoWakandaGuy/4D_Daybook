//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_CachePageStop
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
	C_BLOB:C604($_blb_Result; IME_blb_Result)
	C_LONGINT:C283($_l_Bytes; $_l_Index; $_l_iterations; $_l_Length; $_l_offset; IME_l_CachePageNoBrowserId; IME_l_CachePageNoPrefix; IME_l_CachePageTimeout; IME_l_CacheUnusedChars)
	C_TEXT:C284($_t_oldMethodName; $_t_TextExtra; $_t_TextResult; IME_t_CachePageDataCode; IME_t_CachePageReplace; IME_t_Result)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_CachePageStop")
//******************************************************************************
//
//Method: IME_CachePageStop
//
//Written by  Rollo on 12/14/98
//
//Purpose: Save a Cache record

//******************************************************************************


$_l_offset:=0
$_l_Bytes:=BLOB size:C605(IME_blb_Result)

$_blb_Result:=IME_blb_Result
$_t_TextExtra:=""
UTI_BlobClear(->IME_blb_Result)

//IME_t_Result:=BLOB to text($_blb_Result;Text without length ;$_l_offset;$_l_Bytes)

If ($_l_Bytes>0)
	$_l_iterations:=(($_l_Bytes-1)\28000)+1
	$_l_offset:=0
	For ($_l_Index; 1; $_l_iterations)
		If (($_l_Bytes-$_l_offset)<28000)
			$_l_Length:=$_l_Bytes-$_l_offset
			IME_l_CacheUnusedChars:=0
		Else 
			$_l_Length:=28000
			IME_l_CacheUnusedChars:=1000
		End if 
		IME_t_Result:=BLOB to text:C555($_blb_Result; Mac text without length:K22:10; $_l_offset; $_l_Length)
		IME_t_Result:=$_t_TextExtra+IME_t_Result
		
		If (IME_t_CachePageReplace#"")
			IME_t_Result:=Replace string:C233(IME_DecryptFind(IME_t_Result; IME_l_CachePageNoPrefix; IME_l_CachePageNoBrowserId; ->IME_l_CacheUnusedChars); IME_t_CachePageReplace; "$*REPLACE*$")
		Else 
			IME_t_Result:=IME_DecryptFind(IME_t_Result; IME_l_CachePageNoPrefix; IME_l_CachePageNoBrowserId; ->IME_l_CacheUnusedChars)
		End if 
		
		If (IME_l_CacheUnusedChars>0)
			$_t_TextExtra:=Substring:C12(IME_t_Result; Length:C16(IME_t_Result)-IME_l_CacheUnusedChars)
			IME_t_Result:=Substring:C12(IME_t_Result; 1; Length:C16(IME_t_Result)-IME_l_CacheUnusedChars-1)
		Else 
			$_t_TextExtra:=""
		End if 
		
		TEXT TO BLOB:C554(IME_t_Result; IME_blb_Result; Mac text without length:K22:10; *)
	End for 
End if 

$_t_TextResult:=IME_CachedDataPut(IME_t_CachePageDataCode; IME_l_CachePageTimeout; "IME_blb_Result")

IME_blb_Result:=$_blb_Result

IME_t_CachePageDataCode:=""
ERR_MethodTrackerReturn("IME_CachePageStop"; $_t_oldMethodName)