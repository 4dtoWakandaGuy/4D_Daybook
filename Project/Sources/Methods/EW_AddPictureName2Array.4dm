//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_AddPictureName2Array
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(EW_at_C01Codes;0)
	//ARRAY TEXT(EW_at_FolderPathName;0)
	//ARRAY TEXT(EW_at_PicturePath;0)
	C_LONGINT:C283($_l_SizeofArray)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_AddPictureName2Array")
// EW_AddPictureName2Array
// 11/11/03 PB
// adds additional pictures names to arrays when exporting to the BK
// These are for the subheadings

// parameters: $1 = the name of the picure to add
// $2 = the C01 code

If (Find in array:C230(EW_at_PicturePath; $1)<1)
	$_l_SizeofArray:=Size of array:C274(EW_at_PicturePath)+1
	INSERT IN ARRAY:C227(EW_at_PicturePath; $_l_SizeofArray; 1)
	INSERT IN ARRAY:C227(EW_at_FolderPathName; $_l_SizeofArray; 1)
	INSERT IN ARRAY:C227(EW_at_C01Codes; $_l_SizeofArray; 1)
	EW_at_PicturePath{$_l_SizeofArray}:=$1
	If (Find in array:C230(EW_at_FolderPathName; [CATALOGUE:108]Image_Path:4)<1)
		EW_at_FolderPathName{$_l_SizeofArray}:=[CATALOGUE:108]Image_Path:4
	End if 
	EW_at_C01Codes{$_l_SizeofArray}:=$2
End if 
ERR_MethodTrackerReturn("EW_AddPictureName2Array"; $_t_oldMethodName)