//%attributes = {}

If (False:C215)
	//Project Method Name:      DesignSaver
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled)
	C_LONGINT:C283($_l_Index; $_l_Max)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DesignSaver")

//$_t_oldMethodName:=ERR_MethodTracker ("DesignSaver")
// DesignSaver
// Modified 09/05/02 PB

$_l_Max:=5

While (<>SYS_bo_QuitCalled=False:C215)  // 09/05/02 pb
	IDLE:C311
	//◊ForcedSave:=True
	
	For ($_l_Index; 1; $_l_Max)
		DelayTicks(60*60*5)
		If (<>SYS_bo_QuitCalled)
			$_l_Index:=$_l_Max
		End if 
	End for 
	//Alt+Shift+Cmd+S
	
	POST KEY:C465(Character code:C91("S"); Shift key mask:K16:3+Command key mask:K16:1+Option key mask:K16:7)
	POST KEY:C465(Character code:C91("S"); Command key mask:K16:1+Option key mask:K16:7)
	
	//BRING TO FRONT(1)  ` user/runtime proc pb
End while 
//ERR_MethodTrackerReturn ("DesignSaver";$_t_oldMethodName)