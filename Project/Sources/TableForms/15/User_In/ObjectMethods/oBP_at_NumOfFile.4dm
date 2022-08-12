If (False:C215)
	//object Name: [USER]User_In.oBP_at_NumOfFile
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
	//ARRAY TEXT(BP_at_NumOfFile;0)
	C_LONGINT:C283(BP_l_NumOfFile)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oBP_at_NumOfFile"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (BP_at_NumOfFile{BP_at_NumOfFile}#"All")
			BP_l_NumOfFile:=Num:C11(BP_at_NumOfFile{BP_at_NumOfFile})
		Else 
			BP_l_NumOfFile:=999
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oBP_at_NumOfFile"; $_t_oldMethodName)
