//%attributes = {}

//Database Method Name:      UTIL_ConvertImages
//------------------ Method Notes ------------------
//------------------ Revision Control ----------------
//Date Created:  05/03/2019
//Created BY:  Unknown
//Date Modified: 
//Modified By: DefaultUser
//Modification notes
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PictureRef; 0)
	ARRAY TEXT:C222($_at_PictureName; 0)
	C_LONGINT:C283($_l_Index; $_l_PicRef; $_l_Size)
	C_PICTURE:C286($_PIC_IMAGE)
	C_POINTER:C301($_PTR_PIC)
	C_TEXT:C284($_t_oldMethodName; $_t_PicName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("UTIL_ConvertImages")

ARRAY LONGINT:C221($_al_PictureRef; 0)
ARRAY TEXT:C222($_at_PictureName; 0)
PICTURE LIBRARY LIST:C564($_al_PictureRef; $_at_PictureName)
$_l_Size:=Size of array:C274($_al_PictureRef)
For ($_l_Index; 1; $_l_Size)
	$_l_PicRef:=$_al_PictureRef{$_l_Index}
	$_t_PicName:=$_at_PictureName{$_l_Index}
	$_PTR_PIC:=->$_PIC_IMAGE
	////GET PICTURE FROM LIBRARY($_al_PictureRef{$_l_Index}; $_PIC_IMAGE)
	$_PIC_IMAGE:=Get_Picture($_al_PictureRef{$_l_Index})
	//If (‘11999;51‘($_PTR_PIC)=1)
	CONVERT PICTURE:C1002($_PIC_IMAGE; ".PNG")
	//SET PICTURE TO LIBRARY($_PIC_IMAGE; $_l_PicRef; $_t_PicName)
	
	//End if 
End for 
ERR_MethodTrackerReturn("UTIL_ConvertImages"; $_t_oldMethodName)
