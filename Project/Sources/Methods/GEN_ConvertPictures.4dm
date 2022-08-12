//%attributes = {}

If (False:C215)
	//Project Method Name:      GEN_ConvertPictures
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/12/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PicRef; 0)
	ARRAY TEXT:C222($_at_PicName; 0)
	C_BLOB:C604($_blb_PicBlob)
	C_LONGINT:C283($_l_Index)
	C_PICTURE:C286($_pic_Picture)
	C_TEXT:C284($_t_oldMethodName; $_t_SelectPath)
	C_TIME:C306($_ti_Document)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("GEN_ConvertPictures")
PICTURE LIBRARY LIST:C564($_al_PicRef; $_at_PicName)
$_t_SelectPath:=Select folder:C670(""; "")

For ($_l_Index; 1; Size of array:C274($_at_PicName))
	//GET PICTURE FROM LIBRARY($_al_PicRef{$_l_Index}; $_pic_Picture)
	$_pic_Picture:=Get_Picture($_al_PicRef{$_l_Index})
	
	CONVERT PICTURE:C1002($_pic_Picture; ".png")
	PICTURE TO BLOB:C692($_pic_Picture; $_blb_PicBlob; ".png")
	$_ti_Document:=Create document:C266($_t_SelectPath+$_at_PicName{$_l_Index}+".png")
	CLOSE DOCUMENT:C267($_ti_Document)
	BLOB TO DOCUMENT:C526($_t_SelectPath+$_at_PicName{$_l_Index}+".png"; $_blb_PicBlob)
End for 
ERR_MethodTrackerReturn("GEN_ConvertPictures"; $_t_oldMethodName)
