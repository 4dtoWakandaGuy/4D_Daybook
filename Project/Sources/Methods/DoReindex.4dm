//%attributes = {}
If (False:C215)
	//Project Method Name:      DoReindex
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
	//ARRAY LONGINT(<>PRC_al_ProcessState;0)
	//ARRAY TEXT(<>PRC_at_ProcessName;0)
	C_LONGINT:C283(<>IDX_l_IndexingProcess; $_l_Active; $_l_ProcessIndex)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DoReindex")
// DoReindex
// 25/2/00 pb


Case of 
	: (Count users:C342>1)
		ALERT:C41("Please ask all other users to log off the database before yo use this utility.")
		
	: (<>IDX_l_IndexingProcess>0)
		BRING TO FRONT:C326(<>IDX_l_IndexingProcess)
		
	: (Size of array:C274(<>PRC_at_ProcessName)>1)
		$_l_Active:=0
		For ($_l_ProcessIndex; 1; Size of array:C274(<>PRC_at_ProcessName))
			If (<>PRC_al_ProcessState{$_l_ProcessIndex}>=0)
				$_l_Active:=$_l_Active+1
			End if 
		End for 
		If ($_l_Active>0)
			ALERT:C41("Please close all other screens before using this utility.")
		Else 
			<>IDX_l_IndexingProcess:=New process:C317("ProcessIndexUtility"; DB_ProcessMemoryinit(1); "Reindexing Process")
		End if 
	Else 
		<>IDX_l_IndexingProcess:=New process:C317("ProcessIndexUtility"; DB_ProcessMemoryinit(1); "Reindexing Process")
End case 
ERR_MethodTrackerReturn("DoReindex"; $_t_oldMethodName)