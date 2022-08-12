//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_BannerObjectMethod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:22`Method: Cal4D_BannerObjectMethod
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_BannerObjectMethod")

If (Count parameters:C259>=1)
	Cal4D_TextObjectMethod($1)
End if 
ERR_MethodTrackerReturn("Cal4D_BannerObjectMethod"; $_t_oldMethodName)