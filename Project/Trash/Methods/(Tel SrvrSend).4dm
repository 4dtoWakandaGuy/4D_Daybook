//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Tel SrvrSend
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
	C_PICTURE:C286($_pic_Picture)
	C_TEXT:C284($_t_oldMethodName; $_t_Path; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel SrvrSend")
//Tel SrvrSend

$_t_Path:=Tel_PictFind($1)
If ($_t_Path#"")
	$_pic_Picture:=[PICTURES:85]Picture:3
	PLUGCALL_Telephony("PIC2File"; 1)
	
	
Else 
	BEEP:C151
End if 
ERR_MethodTrackerReturn("Tel SrvrSend"; $_t_oldMethodName)
