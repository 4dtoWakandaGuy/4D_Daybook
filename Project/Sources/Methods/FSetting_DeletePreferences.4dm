//%attributes = {}
If (False:C215)
	//Project Method Name:      FSetting_DeletePreferences
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
	//ARRAY LONGINT(<>FS_al_FormSortDirection;0)
	//ARRAY LONGINT(<>FS_al_FormSortFieldNum;0)
	//ARRAY LONGINT(<>FS_al_FormSortTableNum;0)
	//ARRAY TEXT(<>FS_at_FormReference;0)
	//ARRAY TEXT(<>FS_at_FormSortTextLabelName;0)
	//ARRAY TEXT(<>FS_at_FormSortvariable;0)
	//ARRAY TEXT(<>FS_at_FormSortVarLabelName;0)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FSetting_DeletePreferences")
READ WRITE:C146([PERSONNEL:11])
QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
If (Records in selection:C76([PERSONNEL:11])>0)
	SET BLOB SIZE:C606([PERSONNEL:11]FormSettingsBLOB:40; 0)
	DB_SaveRecord(->[PERSONNEL:11])
	AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
	While (Semaphore:C143("$WriteFormsortPref"))  //To make sure it does not change during the write
		DelayTicks(2)
	End while 
	ARRAY TEXT:C222(<>FS_at_FormReference; 0)
	ARRAY LONGINT:C221(<>FS_al_FormSortDirection; 0)
	ARRAY LONGINT:C221(<>FS_al_FormSortFieldNum; 0)
	ARRAY LONGINT:C221(<>FS_al_FormSortTableNum; 0)
	ARRAY TEXT:C222(<>FS_at_FormSortvariable; 0)
	ARRAY TEXT:C222(<>FS_at_FormSortTextLabelName; 0)
	ARRAY TEXT:C222(<>FS_at_FormSortVarLabelName; 0)
	CLEAR SEMAPHORE:C144("$WriteFormsortPref")
End if 
ERR_MethodTrackerReturn("FSetting_DeletePreferences"; $_t_oldMethodName)