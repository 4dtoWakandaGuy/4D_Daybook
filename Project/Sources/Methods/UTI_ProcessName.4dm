//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_ProcessName
	//------------------ Method Notes ------------------
	//******************************************************************************
	//
	//Method: UTI_ProcessName
	//
	//Written by  jmoore on 4/23/99
	//
	//Purpose: Returns name of process
	//
	//$1 - longint, optional, process ID
	//If not passed, assumes current process
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ProcessNumber; $_l_ProcessState; $_l_ProcessTime; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_ProcessName")

//******************************************************************************



If (Count parameters:C259=1)
	$_l_ProcessNumber:=$1
Else 
	$_l_ProcessNumber:=Current process:C322
End if 
PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
$0:=$_t_ProcessName
ERR_MethodTrackerReturn("UTI_ProcessName"; $_t_oldMethodName)
