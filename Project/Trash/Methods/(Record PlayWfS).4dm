//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Record_PlayWfS
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
	C_BOOLEAN:C305($1)
	C_LONGINT:C283(<>MenuProc; <>SCPT_l_currentScriptProcess; <>SCPT_l_PlayerActive; $_l_CurrentProcess; $_l_FrontmostProcess; $_l_Parameter2; $2)
	C_POINTER:C301($_ptr_ScriptControl)
	C_TEXT:C284($_t_oldMethodName; $_t_Parameter1; vMTitle2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_PlayWfS")
//Record_PlayWfS - Wait for State
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (Count parameters:C259>=1)
	$_ptr_ScriptControl:=->$1
	If (Count parameters:C259>=2)
		$_l_Parameter2:=$2
	Else 
		$_t_Parameter1:=Str RemQuote(First_Param(vMTitle2))
		$_l_Parameter2:=Num:C11($_t_Parameter1)
	End if 
	
	
	$_l_CurrentProcess:=Current process:C322
	
	$_l_FrontmostProcess:=Frontmost process:C327(*)
	If ((($_l_FrontmostProcess#<>MenuProc) | (<>SCPT_l_currentScriptProcess=0)) & ($_l_FrontmostProcess#<>SCPT_l_currentScriptProcess))
		<>SCPT_l_currentScriptProcess:=$_l_FrontmostProcess
	End if 
	If (<>SCPT_l_currentScriptProcess#0)
		
		If (($_l_Parameter2>=0) & ($_l_Parameter2<7))
			DelayTicks(20)
			While ((Process state:C330(<>SCPT_l_currentScriptProcess)#$_l_Parameter2) & ((<>SCPT_l_PlayerActive>0) | ($_ptr_ScriptControl->)))
				DelayTicks(20)
			End while 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Record_PlayWfS"; $_t_oldMethodName)
