//%attributes = {}
If (False:C215)
	//Project Method Name:      CAC_DeleteRecord
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
	C_LONGINT:C283($_l_CacheRow; $_l_CacheRow2; $_l_CachesToClear; $4)
	C_PICTURE:C286($_pic_NullPicture)
	C_POINTER:C301($_ptr_CacheTable; $1)
	C_TEXT:C284(<>CAC_s_CacheNullCode; <>GEN_t_ERROR; <>GEN_t_OK; $_l_CacheRowToUse; $_t_CacheKey; $_t_oldMethodName; $_t_Result; $0; $2; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAC_DeleteRecord")
//CAC_DeleteRecord
//Rollo 10/11/99






$_t_Result:=<>GEN_t_ERROR

If (Count parameters:C259>1)
	
	$_ptr_CacheTable:=$1
	$_t_CacheKey:=$2
	
	If (Count parameters:C259>2)
		$_l_CacheRowToUse:=$3
	Else 
		$_l_CacheRowToUse:="1"
	End if 
	
	If (Count parameters:C259>3)
		$_l_CachesToClear:=$4
	Else 
		$_l_CachesToClear:=1
	End if 
	
	If ((Not:C34(Is nil pointer:C315($_ptr_CacheTable))) & ($_t_CacheKey#""))
		
		If (UTI_Semaphore("CacheManager"))
			
			Case of 
				: ($_l_CacheRowToUse="1")
					$_l_CacheRow:=Find in array:C230(<>CAC_at_CacheIndex; $_t_CacheKey)
				: ($_l_CacheRowToUse="2")
					$_l_CacheRow:=Find in array:C230(<>CAC_at_CacheIndex2; $_t_CacheKey)
				: ($_l_CacheRowToUse="3")
					$_l_CacheRow:=Find in array:C230(<>CAC_at_CacheIndex3; $_t_CacheKey)
				: ($_l_CacheRowToUse="23")
					//will have to loop
			End case 
			
			If ($_l_CacheRow>0)  //if this row isn't in the cache
				
				<>CAC_at_CacheIndex{$_l_CacheRow}:=<>CAC_s_CacheNullCode
				//If ($_l_CachesToClear>1)
				<>CAC_at_CacheIndex2{$_l_CacheRow}:=<>CAC_s_CacheNullCode
				//If ($_l_CachesToClear>2)
				<>CAC_at_CacheIndex3{$_l_CacheRow}:=<>CAC_s_CacheNullCode
				//End if
				//End if
				<>CAC_apic_CachePicture{$_l_CacheRow}:=$_pic_NullPicture
				
				$_t_Result:=<>GEN_t_OK
				
			End if 
			
			UTI_ClearSemaphore("CacheManager")
			
		End if 
		
	End if 
	
End if 

$0:=$_t_Result
ERR_MethodTrackerReturn("CAC_DeleteRecord"; $_t_oldMethodName)
