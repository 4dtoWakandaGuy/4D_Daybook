//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_GetCurrentUserProcess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/10/2012 11:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_AL_UserProcessID;0)
	//ARRAY TEXT(<>DBWS_at_UserProcess;0)
	//ARRAY TEXT(<>DBWS_at_UserProcessName;0)
	C_LONGINT:C283($_l_NewProcessess; $_l_UserProcessRow; $0; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_GetCurrentUserProcess")

$_l_UserProcessRow:=Find in array:C230(<>DBWS_at_UserProcess; $2)
If ($_l_UserProcessRow<0)
	$_l_NewProcessess:=New process:C317("DBWS_UserData"; 512000; $2+" Web Cache"; $1)
	APPEND TO ARRAY:C911(<>DBWS_at_UserProcess; $2)
	APPEND TO ARRAY:C911(<>DBWS_at_UserProcessName; Process_Name($_l_NewProcessess))
	APPEND TO ARRAY:C911(<>DB_AL_UserProcessID; $_l_NewProcessess)
	$_l_UserProcessRow:=Find in array:C230(<>DBWS_at_UserProcess; $2)
	
Else 
	
	
	$_t_ProcessName:=Process_Name(<>DB_AL_UserProcessID{$_l_UserProcessRow})
	If (Process state:C330(<>DB_AL_UserProcessID{$_l_UserProcessRow})=Aborted:K13:1) | (Process state:C330(<>DB_AL_UserProcessID{$_l_UserProcessRow})=Does not exist:K13:3) | ($_t_ProcessName#($2+" Web Cache"))
		
		$_l_NewProcessess:=New process:C317("DBWS_UserData"; 512000; $2+" Web Cache"; $1)
		<>DBWS_at_UserProcess{$_l_UserProcessRow}:=$2
		<>DBWS_at_UserProcessName{$_l_UserProcessRow}:=Process_Name($_l_NewProcessess)
		<>DB_AL_UserProcessID{$_l_UserProcessRow}:=$_l_NewProcessess
	End if 
End if 
$0:=$_l_UserProcessRow
ERR_MethodTrackerReturn("DBWS_GetCurrentUserProcess"; $_t_oldMethodName)