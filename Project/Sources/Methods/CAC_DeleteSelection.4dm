//%attributes = {}
If (False:C215)
	//Project Method Name:      CAC_DeleteSelection
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
	C_LONGINT:C283($_l_CacheCount; $_l_CacheRow; $_l_CacheRow2)
	C_PICTURE:C286($_pic_NullPicture)
	C_POINTER:C301($1; $pTable)
	C_TEXT:C284(<>CAC_s_CacheNullCode; <>GEN_t_ERROR; <>GEN_t_OK; $_t_CacheKey; $_t_oldMethodName; $_t_Result; $0; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAC_DeleteSelection")
//CAC_DeleteSelection
//Rollo 10/11/99

//deletes multiple rows that match the $_t_CacheKey
//(add your own @)




$_t_Result:=<>GEN_t_ERROR

If (Count parameters:C259>1)
	
	$pTable:=$1
	$_t_CacheKey:=$2
	
	If ((Not:C34(Is nil pointer:C315($pTable))) & ($_t_CacheKey#""))
		
		
		If (UTI_Semaphore("CacheManager"))
			
			$_l_CacheRow:=Find in array:C230(<>CAC_at_CacheIndex; $_t_CacheKey)
			$_l_CacheCount:=1
			
			While (($_l_CacheRow>0) & ($_l_CacheCount<5000))  // & (OK=1)
				
				<>CAC_at_CacheIndex{$_l_CacheRow}:=<>CAC_s_CacheNullCode
				<>CAC_at_CacheIndex2{$_l_CacheRow}:=<>CAC_s_CacheNullCode  //Rollo 5/17/2000
				<>CAC_at_CacheIndex3{$_l_CacheRow}:=<>CAC_s_CacheNullCode  //Rollo 5/17/2000
				
				<>CAC_apic_CachePicture{$_l_CacheRow}:=$_pic_NullPicture
				
				$_l_CacheRow:=Find in array:C230(<>CAC_at_CacheIndex; $_t_CacheKey)
				$_l_CacheCount:=$_l_CacheCount+1
				
			End while 
			
			$_t_Result:=<>GEN_t_OK
			
			UTI_ClearSemaphore("CacheManager")
			
		End if 
		
	End if 
	
End if 

$0:=$_t_Result
ERR_MethodTrackerReturn("CAC_DeleteSelection"; $_t_oldMethodName)
