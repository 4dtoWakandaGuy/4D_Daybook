//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Process ArrDef
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
	//ARRAY LONGINT(<>PRC_al_ProcessCalledBy;0)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY LONGINT(<>PRC_al_UniqueID;0)
	//ARRAY LONGINT(<>PRC_al_WindowReference;0)
	//ARRAY TEXT(<>PRC_at_ProcessName;0)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Process ArrDef")
If (False:C215)
	ARRAY LONGINT:C221(<>PRC_al_ProcessNum; $1)
	ARRAY TEXT:C222(<>PRC_at_ProcessName; $1)
	//ARRAY INTEGER(◊aProcMess;$1)
	ARRAY LONGINT:C221(<>PRC_al_ProcessCalledBy; $1)
	ARRAY LONGINT:C221(<>PRC_al_WindowReference; $1)
	ARRAY LONGINT:C221(<>PRC_al_UniqueID; $1)
	
End if 
ERR_MethodTrackerReturn("Process ArrDef"; $_t_oldMethodName)