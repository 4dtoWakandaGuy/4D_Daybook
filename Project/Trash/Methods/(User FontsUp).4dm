//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User_FontsUp
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
	C_LONGINT:C283(<>TextSize)
	C_TEXT:C284(<>FormFont; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_FontsUp")
//User_FontsUp
User_Fonts
If (Count parameters:C259=1)
	OBJECT SET FONT:C164([USER:15]TitDepCo:50; <>FormFont)
	OBJECT SET FONT:C164([USER:15]TitDepCoP:51; <>FormFont)
	OBJECT SET FONT:C164([USER:15]TitDepCoS:52; <>FormFont)
	OBJECT SET FONT:C164([USER:15]TitAdd:53; <>FormFont)
	OBJECT SET FONT:C164([USER:15]TitPay:54; <>FormFont)
	OBJECT SET FONT:C164([USER:15]TitPayB:55; <>FormFont)
	OBJECT SET FONT:C164([USER:15]TitReg:56; <>FormFont)
	OBJECT SET FONT:C164([USER:15]TitAuth:57; <>FormFont)
	OBJECT SET FONT SIZE:C165([USER:15]TitDepCo:50; <>TextSize)
	OBJECT SET FONT SIZE:C165([USER:15]TitDepCoP:51; <>TextSize)
	OBJECT SET FONT SIZE:C165([USER:15]TitDepCoS:52; <>TextSize)
	OBJECT SET FONT SIZE:C165([USER:15]TitAdd:53; <>TextSize)
	OBJECT SET FONT SIZE:C165([USER:15]TitPay:54; <>TextSize)
	OBJECT SET FONT SIZE:C165([USER:15]TitPayB:55; <>TextSize)
	OBJECT SET FONT SIZE:C165([USER:15]TitReg:56; <>TextSize)
	OBJECT SET FONT SIZE:C165([USER:15]TitAuth:57; <>TextSize)
End if 
ERR_MethodTrackerReturn("User_FontsUp"; $_t_oldMethodName)