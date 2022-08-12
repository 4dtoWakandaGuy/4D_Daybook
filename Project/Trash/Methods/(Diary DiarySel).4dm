//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_DiarySel
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
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_DiarySel")
Diary_Sel
If (DB_t_CurrentFormUsage="L")
	QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Document_Code:15#"")
End if 
If (OK=1)
	SET WINDOW TITLE:C213("Diary: Found Items")
End if 
ERR_MethodTrackerReturn("Diary_DiarySel"; $_t_oldMethodName)