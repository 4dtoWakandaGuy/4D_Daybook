//%attributes = {}
If (False:C215)
	//Project Method Name:      CAC_Query
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
	//ARRAY PICTURE(<>CAC_apic_CachePicture;0)
	//ARRAY TEXT(<>CAC_at_CacheIndex;0)
	//ARRAY TEXT(<>CAC_at_CacheIndex2;0)
	//ARRAY TEXT(<>CAC_at_CacheIndex3;0)
	C_BLOB:C604($_blb_CacheBlob)
	C_LONGINT:C283($_l_CacheRow; $_l_CacheRowToUse2; $_l_Result)
	C_POINTER:C301($_ptr_CacheTable; $1)
	C_TEXT:C284(<>GEN_t_ERROR; <>GEN_t_OK; $_l_CacheRowToUse; $_t_CacheKey; $_t_CacheKey2; $_t_CacheKey3; $_t_CacheRowToUse; $_t_Compare; $_t_oldMethodName; $_t_Result; $0)
	C_TEXT:C284($2; $3; $4; $5)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAC_Query")
//CAC_Query
//Rollo 10/11/99

//Find a Cache row anr return it as the current row of the Table


$_t_Result:=<>GEN_t_ERROR

If (Count parameters:C259>1)
	$_ptr_CacheTable:=$1
	$_t_CacheKey:=$2
	
	If (Count parameters:C259>2)
		$_t_CacheRowToUse:=$3
	Else 
		$_t_CacheRowToUse:="1"
	End if 
	
	If (Count parameters:C259>3)
		$_t_CacheKey2:=$4
	Else 
		$_t_CacheKey2:="n/a"
	End if 
	
	If (Count parameters:C259>4)
		$_t_CacheKey3:=$5
	Else 
		$_t_CacheKey3:="n/a"
	End if 
	
	If ((Not:C34(Is nil pointer:C315($_ptr_CacheTable))) & ($_t_CacheKey#""))
		
		If (UTI_Semaphore("CacheManager"))
			Case of 
				: ($_t_CacheRowToUse="1")
					$_l_CacheRow:=Find in array:C230(<>CAC_at_CacheIndex; $_t_CacheKey)
				: ($_l_CacheRowToUse="2")
					$_l_CacheRow:=Find in array:C230(<>CAC_at_CacheIndex2; $_t_CacheKey)
				: ($_t_CacheRowToUse="3")
					$_l_CacheRow:=Find in array:C230(<>CAC_at_CacheIndex3; $_t_CacheKey)
				: ($_t_CacheRowToUse="13")
					//will have to loop
					$_l_CacheRow:=Find in array:C230(<>CAC_at_CacheIndex; $_t_CacheKey)
					If ($_l_CacheRow>0)
						$_t_Compare:=<>CAC_at_CacheIndex3{$_l_CacheRow}
					Else 
						$_t_Compare:=""
					End if 
					While (($_l_CacheRow>0) & ($_t_Compare#$_t_CacheKey2))
						$_l_CacheRow:=Find in array:C230(<>CAC_at_CacheIndex; $_t_CacheKey; $_l_CacheRow+1)
						If ($_l_CacheRow>0)
							$_t_Compare:=<>CAC_at_CacheIndex3{$_l_CacheRow}
						End if 
					End while 
					If ($_t_Compare#$_t_CacheKey2)
						$_l_CacheRow:=-1
					End if 
			End case 
			
			If ($_l_CacheRow>0)  //if this row isn't in the cache
				// $_blb_CacheBlob:=B2P_PictToBlob2 (◊CAC_aptr_CachePicture{$_l_CacheRowToUse})
				
				//$_blb_CacheBlob:=ITK_Pict2Blob (◊CAC_aptr_CachePicture{$_l_CacheRowToUse})
				$_blb_CacheBlob:=PictureToBLOB(<>CAC_apic_CachePicture{$_l_CacheRow})  //replaced  ITK_Pict2Blob 14/03/08
				
				$_l_Result:=CAC_BlobToRecord($_blb_CacheBlob; $_ptr_CacheTable)
				
				If ($_l_Result=0)
					$_t_Result:=<>GEN_t_OK
				End if 
			End if 
			UTI_ClearSemaphore("CacheManager")
		End if 
		
	End if 
	
End if 

$0:=$_t_Result
ERR_MethodTrackerReturn("CAC_Query"; $_t_oldMethodName)
