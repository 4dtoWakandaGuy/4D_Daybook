//%attributes = {}
If (False:C215)
	//Project Method Name:      BDL_GetBLOB
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
	C_LONGINT:C283($_l_BlobSize; $_l_BytesToDelete; $_l_DeleteOffset; $_l_DestinationOffset; $_l_Element; $_l_NameArrOffset; $_l_NewBlobSize; $_l_offset; $_l_OffsetArrOffset; $_l_SIze; $_l_SizeArrOffset)
	C_LONGINT:C283($_l_TypeArrOffset)
	C_POINTER:C301($_ptr_BundleBLOB; $_ptr_BundleBLOB2; $1; $3)
	C_TEXT:C284(<>GEN_t_ERROR; <>GEN_t_OK; $_t_oldMethodName; $_t_Result; $0; $2; BDL_s_Name; BDL_t_Error)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BDL_GetBLOB")

//******************************************************************************
//
//Method: BDL_GetBLOB

//Purpose:  Gets a variable from a BLOb bundle as a BLOB - if
//it doesn't exist, it sets BDL_t_Error
//Different from BDL_GetVar as it doesn't require an existing
//variable, it bundles the result into a BLOB,

//CAUTION: To use this you MUST know the type of variable which the name
//refers to. It is a shortcut for careful programmers only! If you try to store a
//variable from the BLOb in a variable of a different type, who knows what
//gruesome events may transpire? I could have preceded the return variable
//with a longint saying what type it was, but that would reduce the
//usefulness of the function as a shortcut

//
//$1 - pointer to a BLOb bundle
//$2 - string 79, name of variable
//$3 - pointer to a blob to store result in
//Sets BDL_t_Error in the event of an error

//******************************************************************************
$_ptr_BundleBLOB2:=$1
BDL_s_Name:=$2
BDL_t_Error:=""

$_ptr_BundleBLOB:=$3


ARRAY TEXT:C222(BDL_at_BundleName; 0)  //needs to be process var so we can use binary search
ARRAY INTEGER:C220($_ai_BundleTypes; 0)
ARRAY LONGINT:C221($_al_BundleOffsets; 0)
ARRAY LONGINT:C221($_al_BundleSizes; 0)

If (<>BDL_bo_Compress)
	EXPAND BLOB:C535($_ptr_BundleBLOB2->)
End if 

Case of 
	: (BLOB size:C605($_ptr_BundleBLOB2->)<<>BDL_l_MINBDLSIZE)  //minimum size of an initialised Blob bundle
		BDL_t_Error:="Not a valid BLOb bundle"
	: ($_ptr_BundleBLOB2->{0}#Character code:C91("B")) | ($_ptr_BundleBLOB2->{1}#Character code:C91("D")) | ($_ptr_BundleBLOB2->{2}#Character code:C91("L"))
		BDL_t_Error:="Not a valid BLOb bundle"
	Else 
		$_l_BlobSize:=BLOB size:C605($_ptr_BundleBLOB2->)
		//First get name infomation...
		
		$_l_offset:=$_l_BlobSize-16
		$_l_NameArrOffset:=BLOB to longint:C551($_ptr_BundleBLOB2->; 0; $_l_offset)
		BLOB TO VARIABLE:C533($_ptr_BundleBLOB2->; BDL_at_BundleName; $_l_NameArrOffset)
		
		//$_l_offset:=$_l_BlobSize-12
		//$_l_TypeArrOffset:=BLOB to longint($_ptr_BundleBLOB2->;0;$_l_offset)
		// BLOB TO VARIABLE($_ptr_BundleBLOB2->;$_ai_BundleTypes;$_l_TypeArrOffset)
		
		$_l_offset:=$_l_BlobSize-8
		$_l_OffsetArrOffset:=BLOB to longint:C551($_ptr_BundleBLOB2->; 0; $_l_offset)
		BLOB TO VARIABLE:C533($_ptr_BundleBLOB2->; $_al_BundleOffsets; $_l_OffsetArrOffset)
		
		$_l_offset:=$_l_BlobSize-4
		$_l_SizeArrOffset:=BLOB to longint:C551($_ptr_BundleBLOB2->; 0; $_l_offset)
		BLOB TO VARIABLE:C533($_ptr_BundleBLOB2->; $_al_BundleSizes; $_l_SizeArrOffset)
		
		$_l_Element:=UTI_ArraySearch(->BDL_at_BundleName; ->BDL_s_Name)
		If ($_l_Element>0)  //the element already existed
			//  Remove number of bytes indicated at the offset
			//   $Type:=$_ai_BundleTypes{$_l_Element}
			$_l_offset:=$_al_BundleOffsets{$_l_Element}
			$_l_SIze:=$_al_BundleSizes{$_l_Element}
			
			$_l_DestinationOffset:=0
			//Now write number of bytes from bundle blob into return blob
			COPY BLOB:C558($_ptr_BundleBLOB2->; $_ptr_BundleBLOB->; $_l_offset; $_l_DestinationOffset; $_l_SIze)
			
		Else 
			BDL_t_Error:="No such element"
		End if 
		
End case 

If (<>BDL_bo_Compress)
	COMPRESS BLOB:C534($_ptr_BundleBLOB2->)
End if 

If (BDL_t_Error#"")
	// ALERT(BDL_t_Error)`remove ALERT Rollo 1/28/99
	$_t_Result:=<>GEN_t_ERROR+Char:C90(Tab:K15:37)+BDL_t_Error
Else 
	$_t_Result:=<>GEN_t_OK
End if 

$0:=$_t_Result
ERR_MethodTrackerReturn("BDL_GetBLOB"; $_t_oldMethodName)
