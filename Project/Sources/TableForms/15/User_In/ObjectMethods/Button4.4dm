If (False:C215)
	//object Name: [USER]User_In.Button4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/11/2009 20:00
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop)
	C_TEXT:C284($_t_oldMethodName; CAT_t_PictureNaming; CAT_T_PicturePath)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Button4"; Form event code:C388)
If (CAT_T_PicturePath#"")
	
	Gen_Confirm("This function allows you to associate pictures with Products."+Char:C90(13)+" Are you ready to do this?")
	If (OK=1)
		If (CAT_t_PictureNaming#"")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			
			DIALOG:C40([USER:15]; "DS_PictureOrganizer")
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			
		Else 
			Gen_Alert("You need to set the Picture naming preference first")
			
		End if 
	Else 
		Gen_Alert("This can only be used with Pictures stored on disk")
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Button4"; $_t_oldMethodName)
