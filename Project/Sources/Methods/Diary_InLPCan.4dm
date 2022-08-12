//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_InLPCan
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
	C_LONGINT:C283(vNo)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InLPCan")
If ((DB_t_CurrentFormUsage2="Next") & ([DIARY:12]Action_Code:9=""))
	DB_SaveRecord(->[DIARY:12])
	AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
	DB_DeletionControl(->[DIARY:12])
	DELETE RECORD:C58([DIARY:12])
	USE SET:C118("DMaster")
	vNo:=Records in selection:C76([DIARY:12])
	DB_t_CurrentFormUsage2:=""
End if 
ERR_MethodTrackerReturn("Diary_InLPCan"; $_t_oldMethodName)