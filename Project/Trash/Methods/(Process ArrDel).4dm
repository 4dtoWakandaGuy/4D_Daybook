//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Process ArrDel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/12/2010 08:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>PRC_al_ProcessCalledBy;0)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY LONGINT(<>PRC_al_UniqueID;0)
	//ARRAY LONGINT(<>PRC_al_WindowReference;0)
	//ARRAY TEXT(<>PRC_at_ProcessName;0)
	C_LONGINT:C283($_l_ProcessNumber; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Process ArrDel")
//Process ArrDel
//See also Process_End
While (Semaphore:C143("$ProcArr"))
	DelayTicks(2)
	
End while 
$_l_ProcessNumber:=<>PRC_al_ProcessNum{$1}
PROC_SetProcess($_l_ProcessNumber; 0; 0; -100)
If (False:C215)
	DELETE FROM ARRAY:C228(<>PRC_al_ProcessNum; $1; $2)
	DELETE FROM ARRAY:C228(<>PRC_at_ProcessName; $1; $2)
	//delete element(◊aProcMess;$1;$2)
	DELETE FROM ARRAY:C228(<>PRC_al_ProcessCalledBy; $1; $2)
	DELETE FROM ARRAY:C228(<>PRC_al_WindowReference; $1; $2)
	DELETE FROM ARRAY:C228(<>PRC_al_UniqueID; $1; 1)
End if 
CLEAR SEMAPHORE:C144("$ProcArr")
ERR_MethodTrackerReturn("Process ArrDel"; $_t_oldMethodName)
