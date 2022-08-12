//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_GetDebugInfo
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
	ARRAY LONGINT:C221($_al_Array2; 0)
	ARRAY LONGINT:C221($_al_Array3; 0)
	ARRAY TEXT:C222($_at_Array1; 0)
	C_LONGINT:C283($_l_FreelMemory; $_l_FreelStack; $_l_PhysicalMemory; $_l_TotalMemory)
	C_TEXT:C284(<>DB_t_SERVERVERSION; $_t_debuginfo; $_t_Delimiter; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_GetDebugInfo")


//bsw 14/07/03
//$1 delimiter optional default is carriage return
$_t_oldMethodName:=ERR_MethodTracker("DB_GetDebugInfo")

If (Count parameters:C259>0)
	$_t_Delimiter:=$1
Else 
	$_t_Delimiter:=Char:C90(13)
End if 
ARRAY TEXT:C222($_at_Array1; 0)
ARRAY LONGINT:C221($_al_Array2; 0)
ARRAY LONGINT:C221($_al_Array3; 0)

//AP AVAILABLE MEMORY ($_l_TotalMemory;$_l_PhysicalMemory;$_l_FreelMemory;$_l_FreelStack)
///GET MEMORY STATISTICS(1;$_at_Array1;$_al_Array2;$_al_Array3)
///$_l_PhysicalMemory:=$_al_Array2{3}
///$_l_FreelMemory:=$_al_Array2{4}

$_t_debuginfo:="DAYBOOK VERSION: "+VER_GetVersion+" Build: "+String:C10(VER_GetBuildNumber)+$_t_Delimiter
$_t_debuginfo:=$_t_debuginfo+"OS: "+DBGetOSVersion+$_t_Delimiter
$_t_debuginfo:=$_t_debuginfo+"MACHINE: "+Current machine:C483+$_t_Delimiter
$_t_debuginfo:=$_t_debuginfo+"MEMORY: Total "+String:C10($_l_TotalMemory)+", Physical "+String:C10($_l_PhysicalMemory)+", Free "+String:C10($_l_FreelMemory)+", Free stack "+String:C10($_l_FreelStack)+$_t_Delimiter

If (Application type:C494=4D Remote mode:K5:5)  //4D CLIENT
	GET PROCESS VARIABLE:C371(-1; <>DB_t_SERVERVERSION; <>DB_t_SERVERVERSION)
	$_t_debuginfo:=$_t_debuginfo+"4D SERVER VERSION: "+<>DB_t_SERVERVERSION+$_t_Delimiter
	$_t_debuginfo:=$_t_debuginfo+"4D CLIENT VERSION: "+DB_GetClientVersion+$_t_Delimiter
End if 

$0:=$_t_debuginfo
ERR_MethodTrackerReturn("DB_GetDebugInfo"; $_t_oldMethodName)