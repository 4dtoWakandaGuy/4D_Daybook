//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetPathFromServer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 10:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_PathProcess)
	C_TEXT:C284($_t_Message; $_t_oldMethodName; $_t_Path; $0; $1; DB_t_ServerPath)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetPathFromServer")

If (Count parameters:C259>0)
	$_t_Message:=$1
Else 
	$_t_Message:="Select path"
End if 
$_t_Path:=""

START_SEMAPHORE("◊GetProcessfrompath")  //Only one can update version at a time

Case of 
	: (Application type:C494=4D Remote mode:K5:5)
		DB_t_ServerPath:=""
		$_l_PathProcess:=Execute on server:C373("DB_ServerSelectPath"; 64000; "Select Server Path"; $_t_Message; *)
		
		Repeat 
			IDLE:C311
			GET PROCESS VARIABLE:C371(-1; DB_t_ServerPath; DB_t_ServerPath)
			DelayTicks(60)
		Until (DB_t_ServerPath#"")
		
		$_t_Path:=DB_t_ServerPath
	: (Application type:C494=4D Server:K5:6)
		$_t_Path:=DB_SelectFolder("Please select the path")
End case 

$0:=$_t_Path

Stop_Semaphore("◊GetProcessfrompath")
ERR_MethodTrackerReturn("DB_GetPathFromServer"; $_t_oldMethodName)