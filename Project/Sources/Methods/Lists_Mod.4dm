//%attributes = {}
If (False:C215)
	//Project Method Name:      Lists_Mod
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
	C_BOOLEAN:C305(<>ListsActive)
	C_LONGINT:C283($_l_FormDefaultHeight; $_l_FormDefaultWidth)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Lists_Mod")
If (Not:C34(<>ListsActive)) & (False:C215)
	Minor_Mod(->[LIST_ITEMS:95]; "Lists")
Else 
	Start_Process
	
	FORM GET PROPERTIES:C674([USER:15]; "List_Manager"; $_l_FormDefaultWidth; $_l_FormDefaultHeight)
	WIN_t_CurrentOutputform:="List_Manager"
	Open_Pro_Window("List Administrator"; 0; 2; ->[USER:15]; "List_Manager"; "AA_CloseManager")
	FS_SetFormSort(WIN_t_CurrentOutputform)
	DIALOG:C40([USER:15]; "List_Manager")
	Close_ProWin
	Process_End
	
End if 
ERR_MethodTrackerReturn("Lists_Mod"; $_t_oldMethodName)