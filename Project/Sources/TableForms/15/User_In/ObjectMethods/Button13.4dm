If (False:C215)
	//object Name: [USER]User_In.Button13
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; CAT_t_PictureNaming; CAT_T_PicturePath)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Button13"; Form event code:C388)
If (CAT_T_PicturePath#"")
	
	Gen_Confirm("This Function allows you to associate pictures with Products."+" Are you ready to do this?")
	If (OK=1)
		If (CAT_t_PictureNaming#"")
			
		Else 
			Gen_Alert("You need to set the Picture naming preference first")
			
		End if 
	Else 
		Gen_Alert("This can only be used with Pictures stored on disk")
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Button13"; $_t_oldMethodName)
