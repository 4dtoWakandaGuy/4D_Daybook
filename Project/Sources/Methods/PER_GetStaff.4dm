//%attributes = {}
If (False:C215)
	//Project Method Name:      PER_GetStaff
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
	//ARRAY TEXT(<>PER_al_AllStaffInitials;0)
	//ARRAY TEXT(<>PER_at_AllStaffInitials;0)
	//ARRAY TEXT(<>PER_at_AllStaffNames;0)
	//ARRAY TEXT(<>PER_at_StaffInitials;0)
	//ARRAY TEXT(<>PER_at_StaffNames;0)
	C_BOOLEAN:C305(PER_Bo_GetStaff)
	C_LONGINT:C283($_l_CallingProcess; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_Person; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PER_GetStaff")
If (Count parameters:C259>=2)
	$_l_CallingProcess:=$1
	$_t_Person:=$2
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Global_Access:47=False:C215; *)
	QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38>=0)
	If ($_t_Person#"")
		QUERY SELECTION:C341([PERSONNEL:11]; [PERSONNEL:11]Supervisor:4#$_t_Person)
	End if 
	ARRAY TEXT:C222(<>PER_at_AllStaffInitials; 0)
	ARRAY TEXT:C222(<>PER_at_AllStaffNames; 0)
	ARRAY TEXT:C222(<>PER_at_StaffInitials; 0)
	ARRAY TEXT:C222(<>PER_at_StaffNames; 0)
	
	SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; <>PER_at_AllStaffInitials; [PERSONNEL:11]Name:2; <>PER_at_AllStaffNames)
	//Thats all people which can be set as having a supervisor
	If ($_t_Person#"")
		
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Supervisor:4=$_t_Person; *)
		QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38>=0; *)
		QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Global_Access:47=False:C215)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; <>PER_at_StaffInitials; [PERSONNEL:11]Name:2; <>PER_at_StaffNames)
	End if 
	SET PROCESS VARIABLE:C370($_l_CallingProcess; PER_Bo_GetStaff; True:C214)
	
End if 
ERR_MethodTrackerReturn("PER_GetStaff"; $_t_oldMethodName)