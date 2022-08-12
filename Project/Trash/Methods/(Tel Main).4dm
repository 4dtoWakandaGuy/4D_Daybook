//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Tel Main
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:28
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>TEL_al_ResourceID;0)
	//ARRAY LONGINT(<>TEL_al_TelephonyProcess;0)
	//ARRAY TEXT(<>TEL_at_Processname;0)
	//ARRAY TEXT(<>TEL_at_ResourceTypes;0)
	C_BOOLEAN:C305(<>SYS_bo_StopMacros; <>Tel_bo_Quitting; <>TelInstall; <>TelMassErr; vTelActive)
	C_LONGINT:C283(<>SCPT_l_PlayerActive; <>SYS_l_CancelProcess; $_l_ProcessState; $_l_ProcessTime; $_l_ResourceID; $_l_Result; SCPT_l_Cancel; VTELRES; VTELTASK)
	C_TEXT:C284(<>RECTEXT; $_t_oldMethodName; $_t_oldMethodName2; $_t_ProcessName; $_t_ResourceType)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Tel Main")

//tm_main - Tel Main
//Start_Process `my proc for Daybook variables

//this routine is started ONCE for each line that is in use
//since this process mirrors a task we must create one

//since we may have to have specialist lines, the task takes it's resource info
//from two arrays ◊tmResType & ◊tmResID

$_t_ResourceType:=<>TEL_at_ResourceTypes{Size of array:C274(<>TEL_at_ResourceTypes)}
$_l_ResourceID:=<>TEL_al_ResourceID{Size of array:C274(<>TEL_al_ResourceID)}
$_t_ProcessName:=<>TEL_at_Processname{Size of array:C274(<>TEL_at_Processname)}

//create a new server task
PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
PLUGCALL_Telephony("Session"; 2)
$_l_Result:=0  //added to initialize ng 22.1.2004
If ($_l_Result=0)
	<>TEL_al_TelephonyProcess{Size of array:C274(<>TEL_al_TelephonyProcess)}:=vTelTask  //this is the SERVER task ID returned - used in every call to the server
	<>TelInstall:=True:C214
	$_l_Result:=Tel_WaitResourc($_t_ResourceType; $_l_ResourceID; 0)  //wait forever to allocate the resource
	If ($_l_Result>=0)
		Tel_Onhook  //go onhook at the start of the process
		vTelRes:=$_l_Result  //This is my line
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ProcessName)
		While ((<>TelMassErr=False:C215) & (<>Tel_bo_Quitting=False:C215) & (<>SYS_l_CancelProcess#Current process:C322))
			vTelActive:=True:C214
			
			//this is where the actual stuff goes on
			//we call a specified routine from ◊tmProcName
			//or a Macro if available
			If (Records in selection:C76([SCRIPTS:80])>0)
				If ([SCRIPTS:80]Script_status:13#Disabled)
					<>SYS_l_CancelProcess:=0
					SCPT_l_Cancel:=0
					<>SYS_bo_StopMacros:=False:C215
					Record_Play(0; [SCRIPTS:80]Recording_Text:4; False:C215; [SCRIPTS:80]Script_Code:1)
					
					//<>SCPT_l_PlayerActive:=0
				End if 
				
			Else 
				$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$_t_ProcessName)
				EXECUTE FORMULA:C63($_t_ProcessName)
			End if 
			
		End while 
		Tel_Release($_l_Result)  //release the resource we allocated above
	End if 
	PLUGCALL_Telephony("KILL"; 2)
	
	
Else 
	Gen_Alert("Had trouble creating Server Task "+$_t_ProcessName)
	<>TelInstall:=True:C214
End if 
Process_End  //use if use Processes Pal
ERR_MethodTrackerReturn("Tel Main"; $_t_oldMethodName)
