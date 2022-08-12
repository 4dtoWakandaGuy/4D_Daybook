//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_Indexing
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ProcessVisible; $0)
	C_LONGINT:C283($_l_ProcessOrigin; $_l_ProcessState; $_l_ProcessTime; $_l_UniqueProcessID; $l_proc)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_Indexing")

For ($l_proc; 1; Count tasks:C335)
	If ($0)  //It is indexing so Get out of loop
		$l_proc:=Count tasks:C335
	Else 
		PROCESS PROPERTIES:C336($l_proc; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID; $_l_ProcessOrigin)
		$0:=$_t_ProcessName="Index Builder"
	End if 
End for 
ERR_MethodTrackerReturn("DB_Indexing"; $_t_oldMethodName)