//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetMenuBar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/01/2011 13:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_MenuBarNumber; $_l_MenuBarProcess; $2; $3)
	C_TEXT:C284($_t_MenuBarName; $_t_MenuName1; $_t_oldMethodName; $_t_ProcessName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetMenuBar")
//I have created this method so we can change the way menu bars work without changing much
$_t_ProcessName:=Process_Name(Current process:C322)


While (Semaphore:C143("$menuChanging"))
	DelayTicks(7)
End while 
//TRACE

If (Count parameters:C259>=1)
	$_t_MenuName1:=$1
	If (Count parameters:C259>=2)
		$_l_MenuBarNumber:=$2
	Else 
		$_l_MenuBarNumber:=1
	End if 
	If (Count parameters:C259>=3)
		$_l_MenuBarProcess:=$3
	Else 
		$_l_MenuBarProcess:=0
	End if 
	
	Case of 
		: ($_t_MenuName1#"")
			$_t_MenuBarName:=$_t_MenuName1
		Else 
			$_t_MenuBarName:="Menu bar #"+String:C10($_l_MenuBarNumber)
	End case 
	If ($_l_MenuBarProcess<=0)
		DelayTicks(3)
		SET MENU BAR:C67($_t_MenuBarName)
	Else 
		DelayTicks(3)
		SET MENU BAR:C67($_t_MenuBarName)
		If ($_l_MenuBarProcess=1)
			//BRING TO FRONT($_l_MenuBarProcess)
		End if 
		SET MENU BAR:C67($_t_MenuBarName)
		If ($_l_MenuBarProcess=1)
			//BRING TO FRONT($_l_MenuBarProcess)
		End if 
		
	End if 
End if 
CLEAR SEMAPHORE:C144("$menuChanging")
ERR_MethodTrackerReturn("DB_SetMenuBar"; $_t_oldMethodName)