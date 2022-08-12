//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_InTLPDel
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
	C_LONGINT:C283(vNo; xDelete)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InTLPDel")
Are_You_Sure
If (OK=1)
	CREATE SET:C116([DIARY:12]; "Master")
	xDelete:=1
	Diary_InTLPA
	Minor_DeleteSingleRecord(->[DIARY:12]; ->[DIARY:12]Diary_Code:3; "Diary")
	DB_DeletionControl(->[DIARY:12])
	
	DELETE RECORD:C58([DIARY:12])
	CANCEL:C270
	USE SET:C118("Master")
	vNo:=Records in selection:C76([DIARY:12])
End if 
ERR_MethodTrackerReturn("Diary_InTLPDel"; $_t_oldMethodName)