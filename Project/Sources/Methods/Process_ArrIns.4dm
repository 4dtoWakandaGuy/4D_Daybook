//%attributes = {}
If (False:C215)
	//Project Method Name:      Process_ArrIns
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
	//Array LONGINT(<>PRC_al_ProcessCalledBy;0)
	//Array LONGINT(<>PRC_al_ProcessNum;0)
	//Array LONGINT(<>PRC_al_ProcessState;0)
	//Array LONGINT(<>PRC_al_UniqueID;0)
	//Array LONGINT(<>PRC_al_WindowReference;0)
	//Array TEXT(<>PRC_at_ProcessName;0)
	C_LONGINT:C283($0; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Process_ArrIns")
If (False:C215)  //to stop any calls from macros
	INSERT IN ARRAY:C227(<>PRC_al_ProcessNum; $1; $2)
	INSERT IN ARRAY:C227(<>PRC_at_ProcessName; $1; $2)
	//insert element(◊aProcMess;$1;$2)
	INSERT IN ARRAY:C227(<>PRC_al_ProcessCalledBy; $1; $2)
	INSERT IN ARRAY:C227(<>PRC_al_WindowReference; $1; $2)
	INSERT IN ARRAY:C227(<>PRC_al_UniqueID; $1; $2)
	INSERT IN ARRAY:C227(<>PRC_al_ProcessState; $1; $2)
	$0:=Size of array:C274(<>PRC_al_ProcessNum)
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("Process_ArrIns"; $_t_oldMethodName)