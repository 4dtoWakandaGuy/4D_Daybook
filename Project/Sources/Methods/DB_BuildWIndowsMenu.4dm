//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_BuildWIndowsMenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/08/2012 11:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>PRC_al_ProcessCalledBy;0)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY LONGINT(<>PRC_al_ProcessState;0)
	//ARRAY LONGINT(<>PRC_al_UniqueID;0)
	//ARRAY LONGINT(<>PRC_al_WindowReference;0)
	ARRAY LONGINT:C221($_al_ProcessCalledBy; 0)
	ARRAY LONGINT:C221($_al_ProcessNum; 0)
	ARRAY LONGINT:C221($_al_ProcessState; 0)
	ARRAY LONGINT:C221($_al_UniqueID; 0)
	ARRAY LONGINT:C221($_al_WindowReference; 0)
	//ARRAY TEXT(<>PRC_at_ProcessName;0)
	ARRAY TEXT:C222($_at_ProcessName; 0)
	C_LONGINT:C283($_l_CountMenuItems; $_l_ProcessIndex; $_l_Retries)
	C_TEXT:C284($_t_MenuType; $_t_oldMethodName; $_t_WindowsMenuRef; $0; $1; $2; $3; $4; DB_t_MenusFormat; DB_t_MenusSetting; Db_t_MenuType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_BuildWIndowsMenu")
If ($1="")
	$_t_WindowsMenuRef:=Create menu:C408
End if 

If (Count parameters:C259>=2)
	Db_t_MenuType:=$2
	
End if 
If (Db_t_MenuType="")
	Db_t_MenuType:="4D menu"
End if 
If (Count parameters:C259>=3)
	DB_t_MenusFormat:=$3
End if 
If (Count parameters:C259>=3)
	DB_t_MenusSetting:=$4
End if 
$_t_MenuType:=Db_t_MenuType
If (Db_t_MenuType#"Menu string")
	If ($1="")
		$_t_WindowsMenuRef:=Create menu:C408
	Else 
		$_t_WindowsMenuRef:=$1
		$_l_CountMenuItems:=Count menu items:C405($_t_WindowsMenuRef)
		For ($_l_ProcessIndex; $_l_CountMenuItems; 1; -1)
			DELETE MENU ITEM:C413($_t_WindowsMenuRef; $_l_ProcessIndex)
		End for 
	End if 
	
Else 
	
End if 

ARRAY LONGINT:C221($_al_ProcessNum; 0)
ARRAY TEXT:C222($_at_ProcessName; 0)
ARRAY LONGINT:C221($_al_ProcessCalledBy; 0)
ARRAY LONGINT:C221($_al_WindowReference; 0)
ARRAY LONGINT:C221($_al_UniqueID; 0)
ARRAY LONGINT:C221($_al_ProcessState; 0)
$_l_Retries:=0
While (Semaphore:C143("$ProcArr"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks($_l_Retries*2)
End while 
PROC_SetProcess(0)  //Just to make sure this is inited
COPY ARRAY:C226(<>PRC_al_ProcessNum; $_al_ProcessNum)
COPY ARRAY:C226(<>PRC_at_ProcessName; $_at_ProcessName)
COPY ARRAY:C226(<>PRC_al_ProcessCalledBy; $_al_ProcessCalledBy)
COPY ARRAY:C226(<>PRC_al_WindowReference; $_al_WindowReference)  // 3/12/02 pb
COPY ARRAY:C226(<>PRC_al_UniqueID; $_al_UniqueID)
COPY ARRAY:C226(<>PRC_al_ProcessState; $_al_ProcessState)
CLEAR SEMAPHORE:C144("$ProcArr")
If (Size of array:C274($_al_UniqueID)>0)
	For ($_l_ProcessIndex; Size of array:C274($_al_UniqueID); 1; -1)
		If ($_al_WindowReference{$_l_ProcessIndex}=0) | ($_al_ProcessState{$_l_ProcessIndex}<0)
			DELETE FROM ARRAY:C228($_al_ProcessNum; $_l_ProcessIndex)
			DELETE FROM ARRAY:C228($_at_ProcessName; $_l_ProcessIndex)
			DELETE FROM ARRAY:C228($_al_ProcessCalledBy; $_l_ProcessIndex)
			DELETE FROM ARRAY:C228($_al_WindowReference; $_l_ProcessIndex)
			DELETE FROM ARRAY:C228($_al_UniqueID; $_l_ProcessIndex)
		End if 
	End for 
End if 
For ($_l_ProcessIndex; 1; Size of array:C274($_al_ProcessNum))
	If ($_al_ProcessNum{$_l_ProcessIndex}#Current process:C322)
		APPEND MENU ITEM:C411($_t_WindowsMenuRef; $_at_ProcessName{$_l_ProcessIndex})
		SET MENU ITEM METHOD:C982($_t_WindowsMenuRef; -1; "DB_ProcesstoFront")
		SET MENU ITEM PARAMETER:C1004($_t_WindowsMenuRef; -1; String:C10($_al_ProcessNum{$_l_ProcessIndex}))
	End if 
End for 
$0:=$_t_WindowsMenuRef
ERR_MethodTrackerReturn("DB_BuildWIndowsMenu"; $_t_oldMethodName)