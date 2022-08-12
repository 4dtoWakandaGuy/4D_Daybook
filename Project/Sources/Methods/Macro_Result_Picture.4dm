//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_Result_Picture
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2011 14:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_PICTURE:C286($_pic_Nul; $0; SCPT_pic_PictureResult; VMResultPicture)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_Result_Picture")
SCPT_pic_PictureResult:=$_pic_Nul
If (Count parameters:C259=1)
	Macro($1; ""; "SCPT_pic_PictureResult")
Else 
	Macro($1; $2; "SCPT_pic_PictureResult")
End if 
$0:=SCPT_pic_PictureResult
ERR_MethodTrackerReturn("Macro_Result_Picture"; $_t_oldMethodName)