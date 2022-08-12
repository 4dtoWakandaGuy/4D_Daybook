//%attributes = {}
If (False:C215)
	//Project Method Name:      CAC_SaveRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY PICTURE(<>CAC_apic_CachePicture;0)
	//ARRAY REAL(<>CAC_ar_CacheExpirationMS;0)
	//ARRAY TEXT(<>CAC_at_CacheIndex;0)
	//ARRAY TEXT(<>CAC_at_CacheIndex2;0)
	//ARRAY TEXT(<>CAC_at_CacheIndex3;0)
	C_BLOB:C604($_blb_CacheBlob)
	C_LONGINT:C283(<>CAC_l_TimeOut; $_l_CacheRow; $_l_CacheRow2)
	C_POINTER:C301($_ptr_CacheTable; $1)
	C_REAL:C285($_r_ExpireMilliseconds; $3)
	C_TEXT:C284(<>CAC_s_CacheNullCode; <>GEN_t_ERROR; <>GEN_t_OK; $_l_CacheRowToUse; $_t_CacheKey; $_t_CacheKey2; $_t_CacheKey3; $_t_oldMethodName; $_t_Result; $0; $2)
	C_TEXT:C284($4; $5; $6)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAC_SaveRecord")
//CAC_SaveRecord
//Rollo 10/11/99



$_t_Result:=<>GEN_t_ERROR

If (Count parameters:C259>1)
	
	$_ptr_CacheTable:=$1
	$_t_CacheKey:=$2
	
	If (Count parameters:C259>2)
		$_r_ExpireMilliseconds:=$3
	Else 
		$_r_ExpireMilliseconds:=0
	End if 
	
	If ($_r_ExpireMilliseconds=0)
		$_r_ExpireMilliseconds:=CAC_Seconds+(60*<>CAC_l_TimeOut)  //Milliseconds+(1000*60*◊CAC_i_Timeout)
	End if 
	
	If (Count parameters:C259>3)
		$_l_CacheRowToUse:=$4
	Else 
		$_l_CacheRowToUse:="1"
	End if 
	
	If (Count parameters:C259>4)
		$_t_CacheKey2:=$5
	Else 
		$_t_CacheKey2:="n/a"
	End if 
	
	If (Count parameters:C259>5)
		$_t_CacheKey3:=$6
	Else 
		$_t_CacheKey3:="n/a"
	End if 
	
	If ((Not:C34(Is nil pointer:C315($_ptr_CacheTable))) & ($_t_CacheKey#"") & ($_r_ExpireMilliseconds>0))
		
		If (UTI_Semaphore("CacheManager"))
			Case of 
				: ($_l_CacheRowToUse="1")
					$_l_CacheRow:=Find in array:C230(<>CAC_at_CacheIndex; $_t_CacheKey)
				: ($_l_CacheRowToUse="2")
					$_l_CacheRow:=Find in array:C230(<>CAC_at_CacheIndex2; $_t_CacheKey2)
				: ($_l_CacheRowToUse="3")
					$_l_CacheRow:=Find in array:C230(<>CAC_at_CacheIndex3; $_t_CacheKey3)
				: ($_l_CacheRowToUse="23")
					//will have to loop
			End case 
			
			If ($_l_CacheRow<1)  //if this row isn't in the cache
				$_l_CacheRow2:=Find in array:C230(<>CAC_at_CacheIndex; <>CAC_s_CacheNullCode)  //find open element
				If ($_l_CacheRow2>0)
					$_l_CacheRow:=$_l_CacheRow2
				Else 
					//$_l_CacheRow:=Abs($_l_CacheRow)  `for UTI_ArraySearch method
					$_l_CacheRow:=Size of array:C274(<>CAC_at_CacheIndex)+1
					INSERT IN ARRAY:C227(<>CAC_at_CacheIndex; $_l_CacheRow; 1)
					INSERT IN ARRAY:C227(<>CAC_ar_CacheExpirationMS; $_l_CacheRow; 1)
					INSERT IN ARRAY:C227(<>CAC_apic_CachePicture; $_l_CacheRow; 1)
					INSERT IN ARRAY:C227(<>CAC_at_CacheIndex2; $_l_CacheRow; 1)
					INSERT IN ARRAY:C227(<>CAC_at_CacheIndex3; $_l_CacheRow; 1)
				End if 
			End if 
			
			<>CAC_at_CacheIndex{$_l_CacheRow}:=$_t_CacheKey
			<>CAC_ar_CacheExpirationMS{$_l_CacheRow}:=$_r_ExpireMilliseconds
			If ($_t_CacheKey2#"n/a")
				<>CAC_at_CacheIndex2{$_l_CacheRow}:=$_t_CacheKey2
			End if 
			If ($_t_CacheKey3#"n/a")
				<>CAC_at_CacheIndex3{$_l_CacheRow}:=$_t_CacheKey3
			End if 
			
			$_blb_CacheBlob:=CAC_RecordToBlob($_ptr_CacheTable)
			
			<>CAC_apic_CachePicture{$_l_CacheRow}:=BLOBtoPicture($_blb_CacheBlob)  //replaced  ITK_Blob2Pict 14/03/08
			
			
			UTI_ClearSemaphore("CacheManager")
			
			$_t_Result:=<>GEN_t_OK
			
		End if 
		
	End if 
	
End if 

$0:=$_t_Result
ERR_MethodTrackerReturn("CAC_SaveRecord"; $_t_oldMethodName)
