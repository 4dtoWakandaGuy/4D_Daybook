//%attributes = {}
If (False:C215)
	//Project Method Name:      LBI_SetPicture
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SD2_offsetPicture)
	C_LONGINT:C283($_l_PicID; SD_l_PicID)
	C_PICTURE:C286($_Pic_Picture; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBI_SetPicture")
If (SD_l_PicID=0) | (SD_l_PicID>7)
	SD_l_PicID:=1
Else 
	SD_l_PicID:=SD_l_PicID+1
End if 
If (SD2_offsetPicture)
	$_l_PicID:=402+SD_l_PicID
	
	//GET PICTURE FROM LIBRARY($_l_PicID; $_Pic_Picture)
	$_Pic_Picture:=Get_Picture($_l_PicID)
	SD2_offsetPicture:=False:C215
Else 
	$_l_PicID:=409+SD_l_PicID
	SD_l_PicID:=SD_l_PicID-1
	//GET PICTURE FROM LIBRARY($_l_PicID; $_Pic_Picture)
	$_Pic_Picture:=Get_Picture($_l_PicID)
	SD2_offsetPicture:=True:C214
End if 

$0:=$_Pic_Picture
ERR_MethodTrackerReturn("LBI_SetPicture"; $_t_oldMethodName)
