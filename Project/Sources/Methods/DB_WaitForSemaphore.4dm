//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_WaitForSemaphore
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2013 12:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_MaxTime; $_l_Retries; $_l_TableNumber; $_l_Ticks; $2; $3; $4)
	C_POINTER:C301($_Ptr_Table)
	C_TEXT:C284($_t_oldMethodName; $_t_SemaphoreName; $1)
	C_TIME:C306($_ti_CurrentTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_WaitForSemaphore")

$_t_SemaphoreName:=$1
$_l_MaxTime:=$3  //seconds
$_l_Ticks:=$2
$_l_Retries:=0
$_ti_CurrentTime:=(Current time:C178*1)
If (Count parameters:C259>=4)
	$_l_TableNumber:=$4
	If ($_l_TableNumber>0)
		$_Ptr_Table:=Table:C252($_l_TableNumber)
	End if 
End if 

While (Semaphore:C143($_t_SemaphoreName; 60)) & (($_ti_CurrentTime+$_l_MaxTime)<(Current time:C178*1))
	
	
	
	If (Count parameters:C259>=4) & ($_l_TableNumber>0)
		UNLOAD RECORD:C212($_Ptr_Table->)
	End if 
	$_l_Retries:=$_l_Retries+1
	If ($_l_Retries>60)
		$_l_Retries:=1
	End if 
	DelayTicks($_l_Ticks*($_l_Retries))
	If (Count parameters:C259>=4) & ($_l_TableNumber>0)
		LOAD RECORD:C52($_Ptr_Table->)
	End if 
End while 
ERR_MethodTrackerReturn("DB_WaitForSemaphore"; $_t_oldMethodName)