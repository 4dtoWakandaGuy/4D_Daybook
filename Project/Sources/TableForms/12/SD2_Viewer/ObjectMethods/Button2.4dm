If (False:C215)
	//object Name: [DIARY]SD2_Viewer.Button2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(SD2_aptr_ListControl;0)
	C_POINTER:C301($_Ptr_ListBox)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_Viewer.Button2"; Form event code:C388)
$_Ptr_ListBox:=SD2_aptr_ListControl{1}
SD2_SetInfoVisible(->SD2_aptr_ListControl; $_Ptr_ListBox)
ERR_MethodTrackerReturn("OBJ [DIARY].SD2_Viewer.Button2"; $_t_oldMethodName)