//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ValidateCalledAfterProcess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   01/02/2012 23:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Exit; $_bo_ProcessVisible)
	C_LONGINT:C283($_l_ProcessNumber; $_l_ProcessState; $_l_ProcessTime; $_l_Repeats; $_l_StockItemID; $_l_UniqueProcessID; $_l_UniqueProcessID2; $1; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_processName; $_t_processName2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ValidateCalledAfterProcess")

If (Count parameters:C259>=2)
	If ($1=Current process:C322)
		$_l_ProcessNumber:=0
	Else 
		$_l_ProcessNumber:=$1
		PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
		If ($_t_processName="ValidateCurrentStock") | ("ValidateCalledoff"=$_t_processName) | ("Validate Stock"=$_t_processName) | ("Application Process"=$_t_processName) | ("SP for"+"@"=$_t_processName) | ("Service Process"=$_t_processName) | ($_t_processName="Setup Stock") | ($_t_processName="Verify Stock")
			$_l_ProcessNumber:=0
		End if 
	End if 
	
	$_l_StockItemID:=$2
	If ($_l_ProcessNumber>0)
		$_bo_Exit:=False:C215
		$_l_Repeats:=0
		While (Process state:C330($_l_ProcessNumber)>=0) & (Not:C34($_bo_Exit))
			$_l_Repeats:=$_l_Repeats+1
			If ($_l_Repeats>60)
				$_l_Repeats:=1
			End if 
			
			PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_processName2; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID2)
			If ($_l_UniqueProcessID2#$_l_UniqueProcessID) | ($_t_processName#$_t_processName2)
				$_bo_Exit:=True:C214
			Else 
				DelayTicks(60*$_l_Repeats)
			End if 
		End while 
		
		
		STK_UpdateCalledOffQuantity(-$_l_StockItemID)
	End if 
End if 
ERR_MethodTrackerReturn("STK_ValidateCalledAfterProcess"; $_t_oldMethodName)
