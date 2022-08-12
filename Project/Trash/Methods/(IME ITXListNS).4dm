//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME ITXListNS
	//------------------ Method Notes ------------------
	//IME ITXListNS
	//Rollo 17/6/2004
	
	//Extracted from IME_ITXPlay to enable it to be used also from IME_DBList
	
	//Controls the array-held memory of interProcess_Named Selections
	//used to maintain list data on the server so that it doesn't need
	//to be queried for each request
	
	//added semaphores - oddly, was never previously protected
	
	//NB: It APPEARS that the timer mechanism will cause the lists to be lost
	//from memory on the stroke of midnight on 31st Dec on any year
	//This bug not considered sufficiently important to fix yet
	
	//------------------ Revision Control ----------------
	//Date Created: 03/08/2012 10:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>IME_al_NamedSelectionTimestamp;0)
	//ARRAY TEXT(<>IME_at_NamedSelections;0)
	C_BOOLEAN:C305(<>IME_bo_NamedSelectionsInited; $_bo_First; $_bo_UseSemaphore)
	C_DATE:C307($_d_CurrentDate)
	C_LONGINT:C283(<>IME_l_ListTimeLimit; <>SYS_l_CancelProcess; $_l_ArraySize; $_l_CurrentProcess; $_l_MinimumStamp; $_l_SelectionPosition; $_l_TimeStamp; $0)
	C_TEXT:C284($_t_CurrentErrorMethod; $_t_NamedSelection; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME ITXListNS")

If (Not:C34(<>IME_bo_NamedSelectionsInited))
	IME_ImitMSlists
End if 

$_l_CurrentProcess:=Current process:C322
$_bo_First:=False:C215

$_t_NamedSelection:=$1

$_bo_UseSemaphore:=(UTI_Semaphore("ListNS"))

If ($_bo_UseSemaphore)
	
	$_d_CurrentDate:=Current date:C33
	$_l_TimeStamp:=(Month of:C24($_d_CurrentDate)*1000000)+(Day of:C23($_d_CurrentDate)*10000)+Num:C11(Substring:C12(Time string:C180(Current time:C178); 1; 5))
	
	$_l_ArraySize:=Size of array:C274(<>IME_al_NamedSelectionTimestamp)
	
	If ($_l_ArraySize>0)
		
		//clear things that have timed out
		
		$_l_MinimumStamp:=$_l_TimeStamp-<>IME_l_ListTimeLimit
		$_l_SelectionPosition:=1
		
		While (($_l_SelectionPosition<=$_l_ArraySize) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
			IDLE:C311
			If ((<>IME_al_NamedSelectionTimestamp{$_l_SelectionPosition}<$_l_MinimumStamp) & (<>IME_at_NamedSelections{$_l_SelectionPosition}#$_t_NamedSelection))
				$_t_CurrentErrorMethod:=Method called on error:C704
				ON ERR CALL:C155("Remote_Err")
				CLEAR NAMED SELECTION:C333(<>IME_at_NamedSelections{$_l_SelectionPosition})
				ON ERR CALL:C155($_t_CurrentErrorMethod)
				DELETE FROM ARRAY:C228(<>IME_at_NamedSelections; $_l_SelectionPosition; 1)
				DELETE FROM ARRAY:C228(<>IME_al_NamedSelectionTimestamp; $_l_SelectionPosition; 1)
				$_l_ArraySize:=$_l_ArraySize-1
			Else 
				$_l_SelectionPosition:=$_l_SelectionPosition+1
			End if 
		End while 
		
	End if 
	
	$_l_SelectionPosition:=Find in array:C230(<>IME_at_NamedSelections; $_t_NamedSelection)
	If ($_l_SelectionPosition<1)
		
		$_l_SelectionPosition:=Size of array:C274(<>IME_at_NamedSelections)+1
		INSERT IN ARRAY:C227(<>IME_at_NamedSelections; $_l_SelectionPosition; 1)
		INSERT IN ARRAY:C227(<>IME_al_NamedSelectionTimestamp; $_l_SelectionPosition; 1)
		<>IME_at_NamedSelections{$_l_SelectionPosition}:=$_t_NamedSelection
		$_bo_First:=True:C214
		
	End if 
	<>IME_al_NamedSelectionTimestamp{$_l_SelectionPosition}:=$_l_TimeStamp
	
	UTI_ClearSemaphore("ListNS")
	
End if 

If ($_bo_UseSemaphore)
	$0:=Num:C11($_bo_First)  //0 for existing, 1 for First time
Else 
	$0:=-1  //error
End if 
ERR_MethodTrackerReturn("IME ITXListNS"; $_t_oldMethodName)