//%attributes = {}
If (False:C215)
	//Project Method Name:      AddressFormats_InNew
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  17/08/2010 15:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($_boj_InputData)
	C_BOOLEAN:C305($_bo_OpenWindow; $_bo_ProcessStart; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AddressFormats_InNew")
If (Count parameters:C259>=1)
	$_bo_ProcessStart:=$1
Else 
	$_bo_ProcessStart:=True:C214
End if 
If (Count parameters:C259>=2)
	$_bo_OpenWindow:=$2
Else 
	$_bo_OpenWindow:=True:C214
End if 
If ($_bo_ProcessStart)
Else 
	$_boj_InputData:=New object:C1471("TableNumber"; Table:C252(->[ADDRESS_FORMATS:74]); "Format"; "Action"; "RecordTitle"; "Format"; "StartProcess"; $_bo_ProcessStart; "OpenWindow"; $_bo_OpenWindow)
	
	Minor_In($_boj_InputData)  //->[ADDRESS_FORMATS]; "Format"; "Format")
End if 
ERR_MethodTrackerReturn("AddressFormats_InNew"; $_t_oldMethodName)
