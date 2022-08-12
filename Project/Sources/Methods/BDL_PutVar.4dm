//%attributes = {}
If (False:C215)
	//Project Method Name:      BDL_PutVar
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
	C_BOOLEAN:C305(<>BDL_bo_Compress; $_bo_New)
	C_LONGINT:C283($_l_BlobSize; $_l_BundleType; $_l_BytesToDelete; $_l_DeleteOffset; $_l_Element; $_l_NameArrOffset; $_l_offset; $_l_OffsetArrOffset; $_l_OffsetsIndex; $_l_SizeArrOffset; $_l_TypeArrOffset)
	C_POINTER:C301($_ptr_BundleBLOB; $_ptr_BundleNameVariable; $1; $3)
	C_TEXT:C284(<>GEN_t_ERROR; <>GEN_t_OK; $_t_oldMethodName; $_t_Result; $0; $2; BDL_s_Name; BDL_t_Error)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BDL_PutVar")
//******************************************************************************
//
//Method: BDL_PutVar

//Purpose:  Sets a variable in a BLOb bundle - if
//it doesn't exist, it adds one
//
//$1 - pointer to a BLOb bundle
//$2 - string 79, name of variable

//$3 - pointer to a variable to store
//If this parameter is not passed, then the assumption is
//that the second parameter is the name of an existing
//variable

//Sets BDL_t_Error in the event of an error

//******************************************************************************



If (Count parameters:C259>1)
	
	BDL_t_Error:=""
	$_ptr_BundleBLOB:=$1
	BDL_s_Name:=$2
	
	If (Count parameters:C259=3)
		$_ptr_BundleNameVariable:=$3
	Else 
		$_ptr_BundleNameVariable:=Get pointer:C304(BDL_s_Name)
	End if 
	//changed by John, 4/27/99, so this test applies even where
	//a pointer is passed in $3
	If (Is nil pointer:C315($_ptr_BundleNameVariable))
		BDL_t_Error:="No such variable!"
	End if 
	If (BDL_t_Error="")
		ARRAY TEXT:C222(BDL_at_BundleName; 0)  //needs to be process var so we can use binary search
		ARRAY INTEGER:C220($_ai_BundleTypes; 0)
		ARRAY LONGINT:C221($_al_BundleOffsets; 0)
		ARRAY LONGINT:C221($_al_BundleSizes; 0)
		
		//**** THIS IS THE SEQUENCE OF OPERATIONS NECESSARY:
		//Test validity of bundle by looking at first 3 bytes
		//Read out arrays, by using offsets recorded in
		//longints. Each longint is 4 bytes long, so we know
		//exactly where it is in relation to the end of the blob.
		//Wipe bytes from $_l_NameArrOffset to end of BLOb
		//Find position of existing element, record offset
		//If it exists
		//  Remove number of bytes indicated at the offset
		//  Find all offsets higher
		//  than the one for this element
		//  Reduce them by the size of the element deleted
		//If necessary, add new element to arrays
		//Record blob size as offset for new element
		//Write new element to blob with VARIABLE TO BLOB(xxx;xxx;*)
		//Record new size. Store new size minus old size as element size
		
		//Now do all the standard finishing
		
		If (BLOB size:C605($_ptr_BundleBLOB->)<<>BDL_l_MINBDLSIZE)  //minimum size of an initialised Blob bundle
			BDL_InitBdl($_ptr_BundleBLOB)
			
		Else 
			If ($_ptr_BundleBLOB->{0}#Character code:C91("B")) | ($_ptr_BundleBLOB->{1}#Character code:C91("D")) | ($_ptr_BundleBLOB->{2}#Character code:C91("L"))
				BDL_InitBdl($_ptr_BundleBLOB)
			Else 
				If (<>BDL_bo_Compress)
					EXPAND BLOB:C535($_ptr_BundleBLOB->)
				End if 
			End if 
		End if 
		$_l_BlobSize:=BLOB size:C605($_ptr_BundleBLOB->)
		//First get name infomation...
		$_l_offset:=$_l_BlobSize-16
		$_l_NameArrOffset:=BLOB to longint:C551($_ptr_BundleBLOB->; 0; $_l_offset)
		//now record where we are going to delete from. Copy it
		$_l_DeleteOffset:=$_l_NameArrOffset  //because the next call will change it
		BLOB TO VARIABLE:C533($_ptr_BundleBLOB->; BDL_at_BundleName; $_l_NameArrOffset)
		//Now get type information...
		$_l_offset:=$_l_BlobSize-12
		$_l_TypeArrOffset:=BLOB to longint:C551($_ptr_BundleBLOB->; 0; $_l_offset)
		BLOB TO VARIABLE:C533($_ptr_BundleBLOB->; $_ai_BundleTypes; $_l_TypeArrOffset)
		//Now get offset information...
		$_l_offset:=$_l_BlobSize-8
		$_l_OffsetArrOffset:=BLOB to longint:C551($_ptr_BundleBLOB->; 0; $_l_offset)
		BLOB TO VARIABLE:C533($_ptr_BundleBLOB->; $_al_BundleOffsets; $_l_OffsetArrOffset)
		//Now get size information...
		$_l_offset:=$_l_BlobSize-4
		$_l_SizeArrOffset:=BLOB to longint:C551($_ptr_BundleBLOB->; 0; $_l_offset)
		BLOB TO VARIABLE:C533($_ptr_BundleBLOB->; $_al_BundleSizes; $_l_SizeArrOffset)
		
		//Wipe bytes from $_l_DeleteOffset to end of BLOb. We are going to be writing
		//earlier on in the blob
		$_l_BytesToDelete:=$_l_BlobSize-$_l_DeleteOffset
		DELETE FROM BLOB:C560($_ptr_BundleBLOB->; $_l_DeleteOffset; $_l_BytesToDelete)
		
		$_l_Element:=UTI_ArraySearch(->BDL_at_BundleName; ->BDL_s_Name)
		If ($_l_Element>0)  //the element already existed
			//  Remove number of bytes indicated at the offset
			$_l_offset:=$_al_BundleOffsets{$_l_Element}
			$_l_BytesToDelete:=$_al_BundleSizes{$_l_Element}
			DELETE FROM BLOB:C560($_ptr_BundleBLOB->; $_l_offset; $_l_BytesToDelete)
			//  Find all offsets higher
			//  than the one for this element
			//  Reduce them by the size of the element deleted
			
			For ($_l_OffsetsIndex; 1; Size of array:C274($_al_BundleOffsets))
				If ($_al_BundleOffsets{$_l_OffsetsIndex}>$_l_offset)
					$_al_BundleOffsets{$_l_OffsetsIndex}:=$_al_BundleOffsets{$_l_OffsetsIndex}-$_l_BytesToDelete
				End if 
			End for 
			$_bo_New:=False:C215
		Else 
			$_l_Element:=UTI_ArrayInsertAt(->BDL_at_BundleName; ->BDL_s_Name)
			INSERT IN ARRAY:C227(BDL_at_BundleName; $_l_Element; 1)
			INSERT IN ARRAY:C227($_ai_BundleTypes; $_l_Element; 1)
			INSERT IN ARRAY:C227($_al_BundleOffsets; $_l_Element; 1)
			INSERT IN ARRAY:C227($_al_BundleSizes; $_l_Element; 1)
			BDL_at_BundleName{$_l_Element}:=BDL_s_Name
			$_ai_BundleTypes{$_l_Element}:=Type:C295($_ptr_BundleNameVariable->)
			$_bo_New:=True:C214
		End if 
		$_l_BundleType:=$_ai_BundleTypes{$_l_Element}
		
		$_al_BundleOffsets{$_l_Element}:=BLOB size:C605($_ptr_BundleBLOB->)
		VARIABLE TO BLOB:C532($_ptr_BundleNameVariable->; $_ptr_BundleBLOB->; *)
		$_al_BundleSizes{$_l_Element}:=BLOB size:C605($_ptr_BundleBLOB->)-$_al_BundleOffsets{$_l_Element}
		
		//Now do all the standard finishing ....
		$_l_NameArrOffset:=BLOB size:C605($_ptr_BundleBLOB->)
		VARIABLE TO BLOB:C532(BDL_at_BundleName; $_ptr_BundleBLOB->; *)
		$_l_TypeArrOffset:=BLOB size:C605($_ptr_BundleBLOB->)
		VARIABLE TO BLOB:C532($_ai_BundleTypes; $_ptr_BundleBLOB->; *)
		$_l_OffsetArrOffset:=BLOB size:C605($_ptr_BundleBLOB->)
		VARIABLE TO BLOB:C532($_al_BundleOffsets; $_ptr_BundleBLOB->; *)
		$_l_SizeArrOffset:=BLOB size:C605($_ptr_BundleBLOB->)
		VARIABLE TO BLOB:C532($_al_BundleSizes; $_ptr_BundleBLOB->; *)
		
		LONGINT TO BLOB:C550($_l_NameArrOffset; $_ptr_BundleBLOB->; 0; *)
		LONGINT TO BLOB:C550($_l_TypeArrOffset; $_ptr_BundleBLOB->; 0; *)
		LONGINT TO BLOB:C550($_l_OffsetArrOffset; $_ptr_BundleBLOB->; 0; *)
		LONGINT TO BLOB:C550($_l_SizeArrOffset; $_ptr_BundleBLOB->; 0; *)
		
		If (<>BDL_bo_Compress)
			COMPRESS BLOB:C534($_ptr_BundleBLOB->)
		End if 
	End if 
	
	If (BDL_t_Error#"")
		// ALERT(BDL_t_Error)`remove ALERT S. Frey 12/8/98
		$_t_Result:=<>GEN_t_ERROR+Char:C90(Tab:K15:37)+BDL_t_Error
	Else 
		$_t_Result:=<>GEN_t_OK
	End if 
	
End if 

$0:=$_t_Result
ERR_MethodTrackerReturn("BDL_PutVar"; $_t_oldMethodName)
