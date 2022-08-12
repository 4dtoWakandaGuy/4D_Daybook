//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_WebMessagesInit
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
	//ARRAY TEXT(IME_at_ErrorMessageName;0)
	//ARRAY TEXT(IME_at_ErrorMessageText;0)
	//ARRAY TEXT(IME_at_WarningMessageName;0)
	//ARRAY TEXT(IME_at_WarningMessageText;0)
	C_BOOLEAN:C305(IME_bo_ErrorMessageArraysInit; IME_bo_FromWebRequest; IME_bo_WarningMessageArraysInit)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_WebMessagesInit")


If (IME_bo_ErrorMessageArraysInit=False:C215)  //added 27/02/08
	ARRAY TEXT:C222(IME_at_ErrorMessageName; 0)  //added 27/02/08
	ARRAY TEXT:C222(IME_at_ErrorMessageText; 0)  //added 27/02/08
	IME_bo_ErrorMessageArraysInit:=True:C214  //added 27/02/08
End if   //added 27/02/08

If (IME_bo_WarningMessageArraysInit=False:C215)  //added 27/02/08
	ARRAY TEXT:C222(IME_at_WarningMessageName; 0)  //added 27/02/08
	ARRAY TEXT:C222(IME_at_WarningMessageText; 0)  //added 27/02/08
	IME_bo_WarningMessageArraysInit:=True:C214  //added 27/02/08
End if   //added 27/02/08
ERR_MethodTrackerReturn("IME_WebMessagesInit"; $_t_oldMethodName)