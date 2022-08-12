//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetFirstFreeHandlerID
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
	C_BOOLEAN:C305($_bo_ProcessFound)
	C_LONGINT:C283($_l_Index; $_l_IndexWSHandlerProcessNumber; $0)
	C_TEXT:C284(<>IWS_t_HandlerProcess; $_l_IndexWSHandlerProcessName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetFirstFreeHandlerID")
//Method: IWS_GetFirstFreeHandlerID
//
//Purpose: returns a number for the first free handler ID
//
//$0 - longint, handler ID to be combined with "IWS_Handler"

$_l_Index:=0
$_bo_ProcessFound:=False:C215
Repeat 
	$_l_Index:=$_l_Index+1
	$_l_IndexWSHandlerProcessName:=<>IWS_t_HandlerProcess+" "+String:C10($_l_Index; "00")  // create Process_Name - nb not local process!!!
	$_l_IndexWSHandlerProcessNumber:=Process number:C372($_l_IndexWSHandlerProcessName)
	If ($_l_IndexWSHandlerProcessNumber=0)
		//this has not been taken, so we can use this
		$_bo_ProcessFound:=True:C214
	Else 
		If (Process state:C330($_l_IndexWSHandlerProcessNumber)=Aborted:K13:1) | (Process state:C330($_l_IndexWSHandlerProcessNumber)=Does not exist:K13:3)  //it doesn't exist or was aborted
			$_bo_ProcessFound:=True:C214
		End if 
	End if 
Until ($_bo_ProcessFound)


$0:=$_l_Index
ERR_MethodTrackerReturn("IWS_GetFirstFreeHandlerID"; $_t_oldMethodName)