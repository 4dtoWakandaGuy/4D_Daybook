//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_DiaryTriggerPutInQueue
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
	//ARRAY LONGINT(<>SD_al_aDiaryQueue;0)
	C_LONGINT:C283($_l_DIaryQueueRow; $_l_Index; $_l_SizeofArray; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_DiaryTriggerPutInQueue")
//this is a nice simple method
//NOTE THE ARRAYS ARE DECLARED IS STARTUP AND SERVER STARTUP AT THE BEGINNING
While (Semaphore:C143("SD_CheckSets"))
	DelayTicks(2)
End while 
If (Count parameters:C259>=1)
	$_l_DIaryQueueRow:=Find in array:C230(<>SD_al_aDiaryQueue; -1)
	If ($_l_DIaryQueueRow>0)
		<>SD_al_aDiaryQueue{$_l_DIaryQueueRow}:=$1
	Else 
		$_l_SizeofArray:=Size of array:C274(<>SD_al_aDiaryQueue)
		INSERT IN ARRAY:C227(<>SD_al_aDiaryQueue; $_l_SizeofArray+1; 100)
		For ($_l_Index; ($_l_SizeofArray+1); (100+$_l_SizeofArray+1))
			<>SD_al_aDiaryQueue{$_l_Index}:=-1
		End for 
		<>SD_al_aDiaryQueue{$_l_SizeofArray+1}:=$1
	End if 
	
	
End if 
CLEAR SEMAPHORE:C144("SD_CheckSets")
ERR_MethodTrackerReturn("SD_DiaryTriggerPutInQueue"; $_t_oldMethodName)
