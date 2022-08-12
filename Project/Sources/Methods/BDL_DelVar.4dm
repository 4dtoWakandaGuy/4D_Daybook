//%attributes = {}
If (False:C215)
	//Project Method Name:      BDL_DelVar
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
	ARRAY INTEGER:C220($_ai_BundleTypes; 0)
	ARRAY LONGINT:C221($_al_BundleOffsets; 0)
	ARRAY LONGINT:C221($_al_BundleSizes; 0)
	//ARRAY TEXT(BDL_at_BundleName;0)
	C_BOOLEAN:C305(<>BDL_bo_Compress)
	C_LONGINT:C283($_l_BlobSize; $_l_BytesToDelete; $_l_DeleteOffset; $_l_Element; $_l_Find; $_l_NameArrayOffset; $_l_NewBlobSize; $_l_offset; $_l_OffsetArrayOffset; $_l_OffsetsIndex; $_l_ParametersIndex)
	C_LONGINT:C283($_l_SIzeArrayOffset; $_l_TypeArrayOffset)
	C_POINTER:C301($_ptr_BundleBLOB; $1)
	C_TEXT:C284(<>GEN_t_ERROR; <>GEN_t_OK; $_t_oldMethodName; $_t_Result; $0; BDL_s_Name; BDL_t_Error)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BDL_DelVar")

//******************************************************************************
//
//Method: BDL_DelVar
//
//Purpose: Removes a var or vars from a BLOb bundle
//
//$1 - pointer to a BLOb bundle
//$2...$n - string 79, names of variables/references
//
//******************************************************************************
$_ptr_BundleBLOB:=$1

If (<>BDL_bo_Compress)
	EXPAND BLOB:C535($_ptr_BundleBLOB->)
End if 

BDL_t_Error:=""
Case of 
	: (BLOB size:C605($_ptr_BundleBLOB->)<<>BDL_l_MINBDLSIZE)  //minimum size of an initialised Blob bundle
		BDL_t_Error:="Invalid BLOb bundle"
	: ($_ptr_BundleBLOB->{0}#Character code:C91("B")) | ($_ptr_BundleBLOB->{1}#Character code:C91("D")) | ($_ptr_BundleBLOB->{2}#Character code:C91("L"))
		BDL_t_Error:="Invalid BLOb bundle"
	Else 
		For ($_l_ParametersIndex; 2; Count parameters:C259)
			BDL_s_Name:=${$_l_ParametersIndex}
			
			ARRAY TEXT:C222(BDL_at_BundleName; 0)  //needs to be process var so we can use binary search
			ARRAY INTEGER:C220($_ai_BundleTypes; 0)
			ARRAY LONGINT:C221($_al_BundleOffsets; 0)
			ARRAY LONGINT:C221($_al_BundleSizes; 0)
			//**** THIS IS THE SEQUENCE OF OPERATIONS NECESSARY:
			//Test validity of bundle by looking at first 3 bytes
			//Read out arrays, by using offsets recorded in
			//longints. Each longint is 4 bytes long, so we know
			//exactly where it is in relation to the end of the blob.
			//Wipe bytes from $_l_NameArrayOffset to end of BLOb
			//Find position of existing element, record offset
			//If it exists
			//  Remove number of bytes indicated at the offset
			//  Sort arrays by offset and find all offsets higher
			//  than the one for this element
			//  Reduce them by the size of the element deleted
			//If necessary, add new element to arrays
			//Record blob size as offset for new element
			//Write new element to blob with VARIABLE TO BLOB(xxx;xxx;*)
			//Record new size. Store new size minus old size as element size
			//Sort arrays again, this time by name
			//Now do all the standard finishing
			
			$_l_BlobSize:=BLOB size:C605($_ptr_BundleBLOB->)
			
			//First get name infomation...
			$_l_offset:=$_l_BlobSize-16
			$_l_NameArrayOffset:=BLOB to longint:C551($_ptr_BundleBLOB->; 0; $_l_offset)
			//now record where we are going to delete from. Copy it
			$_l_DeleteOffset:=$_l_NameArrayOffset  //because the next call will change it
			BLOB TO VARIABLE:C533($_ptr_BundleBLOB->; BDL_at_BundleName; $_l_NameArrayOffset)
			//Now get type information...
			$_l_offset:=$_l_BlobSize-12
			$_l_TypeArrayOffset:=BLOB to longint:C551($_ptr_BundleBLOB->; 0; $_l_offset)
			BLOB TO VARIABLE:C533($_ptr_BundleBLOB->; $_ai_BundleTypes; $_l_TypeArrayOffset)
			//Now get offset information...
			$_l_offset:=$_l_BlobSize-8
			$_l_OffsetArrayOffset:=BLOB to longint:C551($_ptr_BundleBLOB->; 0; $_l_offset)
			BLOB TO VARIABLE:C533($_ptr_BundleBLOB->; $_al_BundleOffsets; $_l_OffsetArrayOffset)
			//Now get size information...
			$_l_offset:=$_l_BlobSize-4
			$_l_SIzeArrayOffset:=BLOB to longint:C551($_ptr_BundleBLOB->; 0; $_l_offset)
			BLOB TO VARIABLE:C533($_ptr_BundleBLOB->; $_al_BundleSizes; $_l_SIzeArrayOffset)
			
			
			//Wipe bytes from $_l_DeleteOffset to end of BLOb. We are going to be writing
			//earlier on in the blob
			$_l_BytesToDelete:=$_l_BlobSize-$_l_DeleteOffset
			//Rollo 2/26/2001 - why was this being deleted here??
			//DELETE FROM BLOB($_ptr_BundleBLOB->;$_l_DeleteOffset;$_l_BytesToDelete)
			
			$_l_Element:=UTI_ArraySearch(->BDL_at_BundleName; ->BDL_s_Name)
			If ($_l_Element>0)  //the element already existed
				//  Remove number of bytes indicated at the offset
				
				If ($_l_BytesToDelete>0)  //Rollo 2/26/2001
					DELETE FROM BLOB:C560($_ptr_BundleBLOB->; $_l_DeleteOffset; $_l_BytesToDelete)  //Rollo 2/26/2001
				End if   //Rollo 2/26/2001
				
				$_l_offset:=$_al_BundleOffsets{$_l_Element}
				$_l_BytesToDelete:=$_al_BundleSizes{$_l_Element}
				DELETE FROM BLOB:C560($_ptr_BundleBLOB->; $_l_offset; $_l_BytesToDelete)
				DELETE FROM ARRAY:C228(BDL_at_BundleName; $_l_Element)
				DELETE FROM ARRAY:C228($_ai_BundleTypes; $_l_Element)
				DELETE FROM ARRAY:C228($_al_BundleOffsets; $_l_Element)
				DELETE FROM ARRAY:C228($_al_BundleSizes; $_l_Element)
				
				//  Find all offsets higher
				//  than the one for this element
				//  Reduce them by the size of the element deleted
				For ($_l_OffsetsIndex; 1; Size of array:C274($_al_BundleOffsets))
					If ($_al_BundleOffsets{$_l_OffsetsIndex}>$_l_offset)
						$_al_BundleOffsets{$_l_OffsetsIndex}:=$_al_BundleOffsets{$_l_OffsetsIndex}-$_l_BytesToDelete
					End if 
				End for 
				//Now do all the standard finishing ....
				$_l_NameArrayOffset:=BLOB size:C605($_ptr_BundleBLOB->)
				VARIABLE TO BLOB:C532(BDL_at_BundleName; $_ptr_BundleBLOB->; *)
				$_l_TypeArrayOffset:=BLOB size:C605($_ptr_BundleBLOB->)
				VARIABLE TO BLOB:C532($_ai_BundleTypes; $_ptr_BundleBLOB->; *)
				$_l_OffsetArrayOffset:=BLOB size:C605($_ptr_BundleBLOB->)
				VARIABLE TO BLOB:C532($_al_BundleOffsets; $_ptr_BundleBLOB->; *)
				$_l_SIzeArrayOffset:=BLOB size:C605($_ptr_BundleBLOB->)
				VARIABLE TO BLOB:C532($_al_BundleSizes; $_ptr_BundleBLOB->; *)
				LONGINT TO BLOB:C550($_l_NameArrayOffset; $_ptr_BundleBLOB->; 0; *)
				LONGINT TO BLOB:C550($_l_TypeArrayOffset; $_ptr_BundleBLOB->; 0; *)
				LONGINT TO BLOB:C550($_l_OffsetArrayOffset; $_ptr_BundleBLOB->; 0; *)
				LONGINT TO BLOB:C550($_l_SIzeArrayOffset; $_ptr_BundleBLOB->; 0; *)
			Else 
				BDL_t_Error:="No such element as "+BDL_s_Name
			End if 
		End for 
		
End case 

If (<>BDL_bo_Compress)
	COMPRESS BLOB:C534($_ptr_BundleBLOB->)
End if 

If (BDL_t_Error#"")
	// ALERT(BDL_t_Error)`remove ALERT Rollo 1/28/99
	$_t_Result:=<>GEN_t_ERROR+Char:C90(Tab:K15:37)+BDL_t_Error
Else 
	$_t_Result:=<>GEN_t_OK
End if 

$0:=$_t_Result

//LOG_ResetMethod
ERR_MethodTrackerReturn("BDL_DelVar"; $_t_oldMethodName)
