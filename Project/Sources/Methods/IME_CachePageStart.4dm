//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_CachePageStart
	//------------------ Method Notes ------------------
	//
	//Method: IME_CachePageStart
	//
	//Written by  Rollo on 12/14/98
	//
	//Purpose: Start recording a Page Cache, usually used as the first line of a Macro
	//If (IME_CachePageStart ("myCache";-1;"IME_t_Search")
	
	
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
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_Bytes; $_l_Index; $_l_Length; $_l_NoBrowserID; $_l_NoPrefix; $_l_NumberofIterations; $_l_offset; $2; $4; $5; IME_l_CachePageNoBrowserId)
	C_LONGINT:C283(IME_l_CachePageNoPrefix; IME_l_CachePageTimeout; IME_l_CacheUnusedChars)
	C_TEXT:C284(<>GEN_t_ERROR; $_t_oldMethodName; $_t_Result; $_t_Text; $_t_TextExtra; $1; $3; IME_t_CachePageDataCode; IME_t_CachePageReplace)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_CachePageStart")

If (Count parameters:C259>1)
	
	IME_t_CachePageDataCode:=$1
	IME_l_CachePageTimeout:=$2
	
	If (Count parameters:C259>3)
		$_l_NoPrefix:=$4
	Else 
		$_l_NoPrefix:=0
	End if 
	IME_l_CachePageNoPrefix:=$_l_NoPrefix
	
	If (Count parameters:C259>4)
		$_l_NoBrowserID:=$5
	Else 
		$_l_NoBrowserID:=0
	End if 
	IME_l_CachePageNoBrowserId:=$_l_NoBrowserID
	
	$_t_Result:=IME_CachedDataGet($1; "IME_blb_Result")
	If ($_t_Result=(<>GEN_t_ERROR+"@"))
		
		$0:=True:C214  //return true - means that the Macro then goes on to be processed normally
		//and will be recorded at the end by IME_CachePageStop
		
		If (Count parameters:C259>2)
			IME_t_CachePageReplace:=$3
		Else 
			IME_t_CachePageReplace:=""
		End if 
		
	Else 
		
		$_l_offset:=0
		$_l_Bytes:=BLOB size:C605(IME_blb_Result)
		If ($_l_Bytes=0)  //($_l_Bytes>31500)  `cannot use Caches >32K - they won't save - CAN now
			//here we say 31500 cos the text may expand in encrption
			
			If (Count parameters:C259>2)
				IME_t_CachePageReplace:=$3
			Else 
				IME_t_CachePageReplace:=""
			End if 
			
		Else 
			
			$_blb_Result:=IME_blb_Result
			$_t_TextExtra:=""
			UTI_BlobClear(->IME_blb_Result)
			
			$_l_NumberofIterations:=(($_l_Bytes-1)\28000)+1
			$_l_offset:=0
			For ($_l_Index; 1; $_l_NumberofIterations)
				If (($_l_Bytes-$_l_offset)<28000)
					$_l_Length:=$_l_Bytes-$_l_offset
					IME_l_CacheUnusedChars:=0
				Else 
					$_l_Length:=28000
					IME_l_CacheUnusedChars:=1000
				End if 
				$_t_Text:=BLOB to text:C555($_blb_Result; Mac text without length:K22:10; $_l_offset; $_l_Length)
				$_t_Text:=$_t_TextExtra+$_t_Text
				
				If (IME_t_CachePageReplace#"")
					$_t_Text:=IME_EncryptFind(Replace string:C233($_t_Text; "$*REPLACE*$"; IME_t_CachePageReplace); $_l_NoPrefix; $_l_NoBrowserID; ->IME_l_CacheUnusedChars)
				Else 
					$_t_Text:=IME_EncryptFind($_t_Text; $_l_NoPrefix; $_l_NoBrowserID; ->IME_l_CacheUnusedChars)
				End if 
				
				If (IME_l_CacheUnusedChars>0)
					$_t_TextExtra:=Substring:C12($_t_Text; Length:C16($_t_Text)-IME_l_CacheUnusedChars)
					$_t_Text:=Substring:C12($_t_Text; 1; Length:C16($_t_Text)-IME_l_CacheUnusedChars-1)
				Else 
					$_t_TextExtra:=""
				End if 
				
				TEXT TO BLOB:C554($_t_Text; IME_blb_Result; Mac text without length:K22:10; *)
			End for 
			
			$0:=False:C215
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("IME_CachePageStart"; $_t_oldMethodName)