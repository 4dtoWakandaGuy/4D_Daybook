//%attributes = {}
If (False:C215)
	//Project Method Name:      DS_importPicture
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DS_importPicture")
//this method will load a picture from file
READ PICTURE FILE:C678(""; [PICTURES:85]Picture:3)
ERR_MethodTrackerReturn("DS_importPicture"; $_t_oldMethodName)