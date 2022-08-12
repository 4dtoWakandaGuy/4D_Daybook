If (False:C215)
	//object Method Name: Object Name:      SCRIPT_FORM.oExecuteMacro
	//------------------ Method Notes ------------------
	//When we click this button we will do the following
	//)1 check we have a selected macro to execute
	//2) Check the current 'state' of the palette is not aleady executing
	//when we tell a script to execute the 'edit' and 'play' buttons become disabled...
	//3) if the palette is connected with an existing process then any macro is told to execute through that process
	//4)Note that previously this was just 'fronmost process!"
	//make sure when as we close the windows if the palette is running to tell it the 'parent' has changed
	//the parent also changes when we select any window
	//if we close the last window then the parent process is 0 and then any macro is called in its own process(regardless of the 'same process' setting
	//When we execute the macro the 'pause' and 'stop' buttons become available and at that point the PARENT is locked until the action is completed.
	//When the macro has finished the pause and stop buttons must reset ad the execute
	//it would be user expectation that if this palette is displayed and a listing or record is at the front that the palette will interact with that window
	//so IF a macro is running -called from this palette in process A and while it is running the user brings the window of process b to the front at this point the 'activate'
	//tries to set the parent of the palette..but then the parent has changed..
	// so when we execute we set the process ID of the CALLED parent-and this may be different to the current parent of the window(remember setting the parent from an outside call will have changed
	//the displayed list of scripts. A pause or stop in this case must do two things..firstly it must now which process to send the stop or pause command to and secondly it must bring that process to the front
	//this does not apply though when the parent was zero.
	
	//------------------ Revision Control ----------------
	//Date Created: 15/08/2012 14:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SCPT_abo_SameProcess;0)
	//ARRAY TEXT(SCPT_at_MacroCode;0)
	C_BOOLEAN:C305($_bo_ProcessVisible; $_bo_WaitForProcess)
	C_LONGINT:C283(<>menuProc; $_l_Column; $_l_event; $_l_ProcessState; $_l_ProcessTime; $_l_Row; $_l_UniqueProcessID; $SCPT_l_NewProcess; DB_l_ButtonClickedFunction; SCPT_but_1; SCPT_but_2)
	C_LONGINT:C283(SCPT_but_3; SCPT_but_4; SCPT_l_ExecutionState; SCPT_l_InteractProcess; SCPT_l_InteractUniqueID; SCPT_l_ParentProcess)
	C_TEXT:C284($_t_oldMethodName; $_t_processName; DB_t_ButtonClickedFunction)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/SCRIPT_FORM/oExecuteMacro"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		Case of 
			: (SCPT_l_ExecutionState=0)  // if the execution state is anything but zero ignore this
				$_bo_WaitForProcess:=False:C215
				If (SCPT_l_InteractProcess>0)
					//This only gets set if we are running a script in the parent process if the script is run in own process it does not have interaction with this process
					//that is because it could be a script that never ends and then we end up not being able to use the palette
					//note also that scripts started other than from this pallete do not affect the ability of a second script to run.
					//this is just to test that we dont have a terminated script hogging this
					PROCESS PROPERTIES:C336(SCPT_l_InteractProcess; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
					If ($_l_UniqueProcessID#SCPT_l_InteractUniqueID)
						SCPT_l_InteractProcess:=0
						SCPT_l_InteractUniqueID:=0
					Else 
						If ($_l_ProcessState>=0)
							$_bo_WaitForProcess:=True:C214
						End if 
					End if 
				End if 
				If ($_bo_WaitForProcess)
					//make sure that the process resets this value in the palette on completion of the script
					//we cannot start this macro because there is already one running(actually this button should not be enabled in this state because the  stop and pause button should be enabled
				Else 
					LISTBOX GET CELL POSITION:C971(*; "oLBScripts"; $_l_Column; $_l_Row)
					If ($_l_Row>0)
						
						//so its only if we get HERE that we are going to execute something.
						If (SCPT_l_ParentProcess=<>menuProc) | (SCPT_l_ParentProcess=0)
							//This is not associated with a window(process) therefore the execute needs to be in its OWN process
							OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
							OBJECT SET ENABLED:C1123(SCPT_but_4; False:C215)
							
							//OBJECT SET ENABLED(SCPT_but_3;False)
							//OBJECT SET ENABLED(SCPT_but_4;False)
							$SCPT_l_NewProcess:=New process:C317("Record_PlayP"; DB_ProcessMemoryinit(4); "Macro Playback"; SCPT_at_MacroCode{$_l_Row})
							//This process will launch its own 'pallete pausing mini window' note we only do that with scripts launched from the palette
						Else 
							//This palette is associated with a window process.. we will set the macro name to call and the 'call back' to this process so the
							//completing of the macro(either from its own process) or from the 'parent' process(in fact the a call will be from macro process to the window and from the window to this process
							If (SCPT_abo_SameProcess{$_l_Row})
								//Call the parent process to tell it to run the script...
								OBJECT SET VISIBLE:C603(SCPT_but_3; True:C214)
								OBJECT SET VISIBLE:C603(SCPT_but_4; True:C214)
								SET PROCESS VARIABLE:C370(SCPT_l_ParentProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("M:"))
								SET PROCESS VARIABLE:C370(SCPT_l_ParentProcess; DB_t_ButtonClickedFunction; "M:"+SCPT_at_MacroCode{$_l_Row})
								RESUME PROCESS:C320(SCPT_l_ParentProcess)
								POST OUTSIDE CALL:C329(SCPT_l_ParentProcess)
								SCPT_l_ExecutionState:=1
								//OBJECT SET ENABLED(SCPT_but_1;False)
								//OBJECT SET ENABLED(SCPT_but_2;False)
								//OBJECT SET ENABLED(SCPT_but_3;TRUE)
								//OBJECT SET ENABLED(SCPT_but_4;TRUE)
								OBJECT SET ENABLED:C1123(SCPT_but_1; False:C215)
								OBJECT SET ENABLED:C1123(SCPT_but_2; False:C215)
								
								OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
								OBJECT SET ENABLED:C1123(SCPT_but_4; False:C215)
								
								
							Else 
								//This process will launch its own 'pallete pausing mini window'-note we only do that with scripts launched from the palette
								//`this script will run in its own process-it has no relation to the parent script its idependent
								//OBJECT SET ENABLED(SCPT_but_3;False)
								//OBJECT SET ENABLED(SCPT_but_4;False)
								OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
								OBJECT SET ENABLED:C1123(SCPT_but_4; False:C215)
								
								$SCPT_l_NewProcess:=New process:C317("Record_PlayP"; DB_ProcessMemoryinit(4); "Macro Playback"; SCPT_at_MacroCode{$_l_Row})
							End if 
							
						End if 
					End if 
				End if 
				
				//Get the process state and if it is ended clear it...
				//NOTE this is
			: (SCPT_l_ExecutionState=2)
				SCPT_l_ExecutionState:=1
				OBJECT SET ENABLED:C1123(SCPT_but_1; False:C215)
				OBJECT SET ENABLED:C1123(SCPT_but_2; False:C215)
				OBJECT SET ENABLED:C1123(SCPT_but_3; True:C214)
				OBJECT SET ENABLED:C1123(SCPT_but_4; True:C214)
				
				
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ SCRIPT_FORM.oExecuteMacro"; $_t_oldMethodName)
