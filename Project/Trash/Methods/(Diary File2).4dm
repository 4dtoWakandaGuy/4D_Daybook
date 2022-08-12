//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_File2
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
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_File2")
$0:=False:C215
If (Diary_File)
	$0:=True:C214
	FORM SET OUTPUT:C54([DIARY:12]; "Diary Out")
	WIN_t_CurrentOutputform:="Diary Out"
End if 
ERR_MethodTrackerReturn("Diary_File2"; $_t_oldMethodName)