If (False:C215)
	//object Name: [DIARY]Diary_InNEW.oContactCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; $_l_MouseButton; $_l_MouseX; $_l_MouseY)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InNEW.oContactCode"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Getting Focus:K2:7)
		GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
		If (Macintosh control down:C544 | ($_l_MouseButton=2))
			Self:C308->:="@"
			Diary_InD
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_InNEW.oContactCode"; $_t_oldMethodName)
