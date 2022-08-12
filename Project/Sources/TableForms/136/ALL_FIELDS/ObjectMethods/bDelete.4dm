If (False:C215)
	//object Name: [CCM_PSPTransaction]ALL_FIELDS.bDelete
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
	C_LONGINT:C283($_l_RecordsinSet)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CCM_PSPTransaction].ALL_FIELDS.bDelete"; Form event code:C388)
$_l_RecordsinSet:=Records in set:C195("UserSet")
If ($_l_RecordsinSet=0)
	ALERT:C41("There are no selected records.")
Else 
	If ($_l_RecordsinSet=1)
		CONFIRM:C162("Do you really want to delete this record?")
	Else 
		CONFIRM:C162("Do you really want to delete these "+String:C10($_l_RecordsinSet)+" record?")
	End if 
	If (OK=1)
		CREATE SET:C116(Current form table:C627->; "saved")
		COPY SET:C600("UserSet"; "GlobSet")
		DIFFERENCE:C122("saved"; "GlobSet"; "saved")
		USE SET:C118("UserSet")
		DELETE SELECTION:C66(Current form table:C627->)
		USE SET:C118("saved")
		CLEAR SET:C117("saved")
		CLEAR SET:C117("GlobSet")
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [CCM_PSPTransaction].ALL_FIELDS.bDelete"; $_t_oldMethodName)
