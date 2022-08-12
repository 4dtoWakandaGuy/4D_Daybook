//%attributes = {}

If (False:C215)
	//Project Method Name:      Get Picture
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
	C_LONGINT:C283($_l_Ref; $1)
	C_PICTURE:C286($_pic_Picture; $0)
	C_TEXT:C284($_t_ImagePath; $_t_oldMethodName; $_t_PictureName; $_t_ResourcesFolder)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Get Picture")
$_t_ResourcesFolder:=Get 4D folder:C485(Current resources folder:K5:16)
$_t_ImagePath:=$_t_ResourcesFolder+"Images"

PICTURE LIBRARY LIST:C564($_al_PicRef; $_at_PicName)
$_l_Ref:=Find in array:C230($_al_PicRef; $1)
If ($_l_Ref>0)
	$_t_PictureName:=$_at_PicName{$_l_Ref}
	If (Test path name:C476($_t_ImagePath+Directory_Symbol+$_t_PictureName+".png")=Is a document:K24:1)
		READ PICTURE FILE:C678($_t_ImagePath+Directory_Symbol+$_t_PictureName+".png"; $_pic_Picture)
	End if 
End if 
$0:=$_pic_Picture
ERR_MethodTrackerReturn("Get Picture"; $_t_oldMethodName)