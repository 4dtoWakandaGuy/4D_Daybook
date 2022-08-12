//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_TStartup
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
	//ARRAY LONGINT(<>TEL_al_4DProcess;0)
	//ARRAY LONGINT(<>TEL_al_ResourceID;0)
	//ARRAY LONGINT(<>TEL_al_TVProcess;0)
	//ARRAY TEXT(<>TEL_at_Processname;0)
	//ARRAY TEXT(<>TEL_at_ResourceTypes;0)
	C_BOOLEAN:C305(<>Tel_bo_Quitting; <>TelInstall)
	C_LONGINT:C283($_l_Index; vTelMaxTask)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_TStartup")
//tm_startup
//the task manager opens the default project and then reads in the 'code'

ARRAY TEXT:C222(<>TEL_at_ResourceTypes; 0)  //resource type associated with this line = NVOX, NVFX etc
ARRAY LONGINT:C221(<>TEL_al_ResourceID; 0)  //resource ID - first NVOX = 1 etc
ARRAY LONGINT:C221(<>TEL_al_4DProcess; 0)  //the 4D Process associated with this 'application' or line
ARRAY LONGINT:C221(<>TEL_al_TVProcess; 0)
ARRAY TEXT:C222(<>TEL_at_Processname; 0)  //the NAMED 4D PROCEDURE

//tm_startup starts up vTelMaxTask processes, each of which is the 4D Process TM_
//TM_MAIN handles the getting of the resource (voice channel, fax channel etc)
//before it calls any routines and makes sure that the line is idle (onhook) both
//before and after it cals the tmPROCNAME

//to customise this routine, simply replace the name of the routine which is
//called by tm_main by replacing the text "tm_Default" with the name of your
//4D procedure which will be repeatedly called.

//For example, if you have a 4D routine called 'myMailSystem' then replace the
//tmProcName{$_l_Index}:="tm_Default" with ◊tmProcName{$_l_Index}:="MyMailSystem"
//when tm_main has got the necessary voice resources, and has hung up the
//line it will call MyMailSystem.

//Your routine MyMailSystem can then answer the call - do whatever it needs to
//and hangup at the end. tm_Main will then clean up after you and call
//your procedure ad infinitum or until ◊quitting is set to true
//now load the 'project'
//at present - we are going to have MAXTASKS lines running tm_Default
//set the number of MAXTASKS before you call this - it is set to 1 in aaInitialise

<>Tel_bo_Quitting:=False:C215

For ($_l_Index; 1; vTelMaxTask)
	INSERT IN ARRAY:C227(<>TEL_at_ResourceTypes; 999)
	INSERT IN ARRAY:C227(<>TEL_al_ResourceID; 999)
	INSERT IN ARRAY:C227(<>TEL_at_Processname; 999)
	INSERT IN ARRAY:C227(<>TEL_al_4DProcess; 999)
	INSERT IN ARRAY:C227(<>TEL_al_TVProcess; 999)
	
	<>TEL_at_ResourceTypes{$_l_Index}:="NVOX"  //could also be NVFX, NINT NEXT etc
	<>TEL_al_ResourceID{$_l_Index}:=$_l_Index
	<>TEL_at_Processname{$_l_Index}:="Tel Demo"  //or your routine
	<>TelInstall:=False:C215
	$_t_ProcessName:="Telephony "+String:C10($_l_Index)
	<>TEL_al_4DProcess{$_l_Index}:=New process:C317("Tel_Main"; 256000; $_t_ProcessName)
	If (<>TEL_al_4DProcess{$_l_Index}=0)
		Gen_Alert("Error in launching process")
		$_l_Index:=5
	Else 
		//  Process_StartAr (◊tm4DProc{$_l_Index};$_t_ProcessName)`Put in to get them on the processes pal
		Repeat 
			IDLE:C311
		Until (<>TelInstall)
	End if 
End for 
ERR_MethodTrackerReturn("Tel_TStartup"; $_t_oldMethodName)
