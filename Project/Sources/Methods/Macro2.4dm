//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2009 09:32`Method: Macro2
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_StopMacros)
	C_LONGINT:C283(<>RecBarUp; <>SCPT_l_currentScriptProcess; <>SCPT_l_PlayerActive; <>SYS_l_CancelProcess; $_l_CalledFromPalette; $_l_CountParameters; $_l_Index; $_l_ScriptFromProcess; $_l_ScriptRunProcess; $4; MAC_l_MessageWindow)
	C_LONGINT:C283(SCPT_l_Cancel; SCPT_l_ExecutionState; SCPT_l_InteractProcess; SCPT_l_ThisWindowPalette)
	C_TEXT:C284(<>RECTEXT; <>vMacroCode; $_t_FindMarker; $_t_oldMethodName; $_t_Replace; $_t_ScriptCode; $_t_ScriptOwner; $_t_ScriptOwner2; $_t_ScriptReturnVarName; $_t_ScriptText; $1)
	C_TEXT:C284($2; $3; $5; $6; $MC; $RT; vMTitle2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro2")
//TRACE
//Macro2 - used for launching  macros from 4D/Rep Gen procedures
$RT:=""
$MC:=""
If (Count parameters:C259>=1)
	$_t_ScriptCode:=$1
	If (Count parameters:C259>=2)
		$_t_ScriptOwner:=$2
	End if 
	If (Count parameters:C259>=3)  //note that if this is iS a value then we cannot run in another process 
		$_t_ScriptReturnVarName:=$3
		//also to note. Because of the way this used to work. Ie there were SET variable names we cannot call with this value as $0.
		//we must replace $0 with this variable name(as this would be how the function SHOULD now be written and replace the FORMER variables with this variable name.
		
	End if 
	If (Count parameters:C259>=5)
		$_l_ScriptFromProcess:=$4
	End if 
	
	//This was using from Parameter 3 as parameters to change
	//and i want $3 to be  the NAME of a variable to return(ie. $0)
	//-i want parameter $4 to be called from pallette(Previously SCPT_l_CalledFromPallette
	
	$_l_CountParameters:=Count parameters:C259
	If ($_t_ScriptCode#"")
		READ ONLY:C145([SCRIPTS:80])
		If ($_t_ScriptOwner2#"")
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ScriptCode; *)
			QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Person:5=$_t_ScriptOwner)
			If (Records in selection:C76([SCRIPTS:80])=0)
				QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ScriptCode; *)
				QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Person:5="")
			End if 
		Else 
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ScriptCode)
		End if 
		If (Records in selection:C76([SCRIPTS:80])#0)
			If ([SCRIPTS:80]Script_status:13#Disabled)
				If ([SCRIPTS:80]Same_Process:6) | ($_t_ScriptReturnVarName#"")
					
					
					If ($_l_ScriptFromProcess>0)
						$_l_CalledFromPalette:=$_l_ScriptFromProcess
						SET PROCESS VARIABLE:C370($_l_ScriptFromProcess; SCPT_l_InteractProcess; Current process:C322)
						SET PROCESS VARIABLE:C370($_l_ScriptFromProcess; SCPT_l_ExecutionState; 1)
						POST OUTSIDE CALL:C329($_l_ScriptFromProcess)
						
					End if 
					$_l_ScriptFromProcess:=0
					If (Count parameters:C259>4)  //i cannot see anywhere this is called
						For ($_l_Index; 5; $_l_CountParameters)  //these are parameters of things to replace in the script-so values we want to override(a way of making the script more contextual
							//these were marked by putting them in 
							IDLE:C311
							$_t_Replace:=${$_l_Index}
							If ($_t_Replace="")
								$_t_FindMarker:="$"+String:C10($_l_Index-2)+"$"
								$_t_ScriptText:=Replace string:C233($_t_ScriptText; $_t_FindMarker; "")
							Else 
								$_t_FindMarker:="$"+String:C10($_l_Index-2)+"$"
								$_t_ScriptText:=Replace string:C233($_t_ScriptText; $_t_FindMarker; $_t_Replace)
							End if 
						End for 
					Else 
						$_t_ScriptText:=[SCRIPTS:80]Recording_Text:4
					End if 
					//THE $_t_ScriptText Needs to be compiled on the fly
					If ($_l_CalledFromPalette>0)
						SCPT_l_ThisWindowPalette:=$_l_CalledFromPalette
					End if 
					If ($RT="NoClear")  //comes from a Macro Command within a Macro/
						//NG this wont matter in V18??
						<>SYS_l_CancelProcess:=0
						SCPT_l_Cancel:=0
						<>SYS_bo_StopMacros:=False:C215
						If ($_t_ScriptReturnVarName#"")
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "$0:="; $_t_ScriptReturnVarName+":=")
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "VMResultTIME"; $_t_ScriptReturnVarName)
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "VMResultText"; $_t_ScriptReturnVarName)
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "VMResultREAL"; $_t_ScriptReturnVarName)
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "VMResultPicture"; $_t_ScriptReturnVarName)
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "VMResultLongint"; $_t_ScriptReturnVarName)
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "VMResultDate"; $_t_ScriptReturnVarName)
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "VMResultBOOLEAN"; $_t_ScriptReturnVarName)
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "vmResult"; $_t_ScriptReturnVarName)  // 
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "vText:="; $_t_ScriptReturnVarName+":=")  // that COULD cause problems!!
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "$"; "SCPT_")
							
							
							Record_Play(1; $_t_ScriptText; False:C215; [SCRIPTS:80]Script_Code:1; True:C214)  //A parameter means don't clear RecPlayUp
							
						Else 
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "$"; "SCPT_")
							Record_Play(1; $_t_ScriptText; False:C215; [SCRIPTS:80]Script_Code:1; True:C214)  //A parameter means don't clear RecPlayUp
						End if 
					Else 
						<>SYS_l_CancelProcess:=0
						SCPT_l_Cancel:=0
						<>SYS_bo_StopMacros:=False:C215
						If ($_t_ScriptReturnVarName#"")
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "$0:="; $_t_ScriptReturnVarName+":=")
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "VMResultTIME"; $_t_ScriptReturnVarName)
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "VMResultText"; $_t_ScriptReturnVarName)
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "VMResultREAL"; $_t_ScriptReturnVarName)
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "VMResultPicture"; $_t_ScriptReturnVarName)
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "VMResultLongint"; $_t_ScriptReturnVarName)
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "VMResultDate"; $_t_ScriptReturnVarName)
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "VMResultBOOLEAN"; $_t_ScriptReturnVarName)
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "vmResult"; $_t_ScriptReturnVarName)  // 
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "vText:="; $_t_ScriptReturnVarName+":=")  // that COULD cause problems!!
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "$"; "SCPT_")
							
							Record_Play(1; $_t_ScriptText; False:C215; [SCRIPTS:80]Script_Code:1; True:C214)  //A parameter means don't clear RecPlayUp
							
						Else 
							$_t_ScriptText:=Replace string:C233($_t_ScriptText; "$"; "SCPT_")
							Record_Play(1; $_t_ScriptText; False:C215; [SCRIPTS:80]Script_Code:1; True:C214)
						End if 
					End if 
					If ($_l_CalledFromPalette>0)
						SET PROCESS VARIABLE:C370($_l_CalledFromPalette; SCPT_l_InteractProcess; 0)
						SET PROCESS VARIABLE:C370($_l_CalledFromPalette; SCPT_l_ExecutionState; 0)
						POST OUTSIDE CALL:C329($_l_CalledFromPalette)
						
					End if 
					
				Else 
					If ($_l_ScriptFromProcess>0)  //Actually this will never be so because if it runs in its own process the palette with have launched it
						SET PROCESS VARIABLE:C370($_l_ScriptFromProcess; SCPT_l_InteractProcess; 0)
						SET PROCESS VARIABLE:C370($_l_ScriptFromProcess; SCPT_l_ExecutionState; 0)
						POST OUTSIDE CALL:C329($_l_ScriptFromProcess)
					End if 
					If ($_t_ScriptCode#"")  //bsw 16/04/04
						$_l_ScriptRunProcess:=New process:C317("Record_Macro"; 256000; "Play"+$_t_ScriptCode; $_t_ScriptCode; $_l_ScriptFromProcess)
					End if 
					//$_t_ScriptText:=[SCRIPTS]Recording_Text
					
				End if 
				
			End if 
		End if 
	End if 
	
	MAC_l_MessageWindow:=0
	vMTitle2:="n/a"  //so that Error_Proc will say this if caused by Rep Gen
End if 
<>vMacroCode:=$MC
ERR_MethodTrackerReturn("Macro2"; $_t_oldMethodName)
