//%attributes = {}
If (False:C215)
	//Project Method Name:      DIARY_GetButtonPics
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
	C_LONGINT:C283($_l_CalPictureRef; $_l_CalPictureRef2; $_l_NextPicRef; $_l_PersonPicRef; $_l_PreviousPicRef; $_l_TImePictureRef; $_l_WhoseDiaryPicRef)
	C_PICTURE:C286(PIC_P_Time; SD2_pic_CalenderPic1; SD2_pic_CalenderPic2; SD2_pic_NextRecord; SD2_pic_PersonPic; SD2_pic_PreviousRecord; SD2_pic_WhoseDiary)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DIARY_GetButtonPics")
//This method gets pictures for the diary window
//by having pics in variables we can use OS contextual pics if we want
$_l_TImePictureRef:=2074
$_l_CalPictureRef:=2075
$_l_CalPictureRef2:=15524
$_l_WhoseDiaryPicRef:=2076
$_l_PreviousPicRef:=2077
$_l_NextPicRef:=2079
$_l_PersonPicRef:=2080
//The above numbers are what we set dynamically
//GET PICTURE FROM LIBRARY($_l_TImePictureRef; PIC_P_Time)
PIC_P_Time:=Get_Picture($_l_TImePictureRef)

//GET PICTURE FROM LIBRARY($_l_CalPictureRef; SD2_pic_CalenderPic1)
SD2_pic_CalenderPic1:=Get_Picture($_l_CalPictureRef)

//GET PICTURE FROM LIBRARY($_l_CalPictureRef2; SD2_pic_CalenderPic2)
SD2_pic_CalenderPic2:=Get_Picture($_l_CalPictureRef2)

//GET PICTURE FROM LIBRARY($_l_WhoseDiaryPicRef; SD2_pic_WhoseDiary)
SD2_pic_WhoseDiary:=Get_Picture($_l_WhoseDiaryPicRef)

//GET PICTURE FROM LIBRARY($_l_PreviousPicRef; SD2_pic_PreviousRecord)
SD2_pic_PreviousRecord:=Get_Picture($_l_PreviousPicRef)

//GET PICTURE FROM LIBRARY($_l_NextPicRef; SD2_pic_NextRecord)
SD2_pic_NextRecord:=Get_Picture($_l_NextPicRef)

//GET PICTURE FROM LIBRARY($_l_PersonPicRef; SD2_pic_PersonPic)
SD2_pic_PersonPic:=Get_Picture($_l_PersonPicRef)

ERR_MethodTrackerReturn("DIARY_GetButtonPics"; $_t_oldMethodName)
