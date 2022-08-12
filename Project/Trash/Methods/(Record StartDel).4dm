//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Record StartDel
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
	//Array LONGINT(<>PRC_al_ProcessState;0)
	//Array TEXT(<>PRC_at_ProcessName;0)
	C_LONGINT:C283(<>MenuProc; $_l_Index; $_l_ProcessCount; $_l_ProcessState)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record StartDel")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 

$_l_ProcessState:=Process state:C330(<>MenuProc)
$_l_ProcessCount:=0
For ($_l_Index; 1; Size of array:C274(<>PRC_at_ProcessName))
	If (<>PRC_al_ProcessState{$_l_Index}>=0)
		$_l_ProcessCount:=$_l_ProcessCount+1
	End if 
End for 


While ($_l_ProcessCount>1)  //((◊RecPlayUp#0) | ($_l_ProcessCount>1))
	DelayTicks(120)
	$_l_ProcessState:=Process state:C330(<>MenuProc)
	$_l_ProcessCount:=0
	For ($_l_Index; 1; Size of array:C274(<>PRC_at_ProcessName))
		If (<>PRC_al_ProcessState{$_l_Index}>=0)
			$_l_ProcessCount:=$_l_ProcessCount+1
		End if 
	End for 
	
End while 
ERR_MethodTrackerReturn("Record StartDel"; $_t_oldMethodName)