//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_MultiOwnerClose
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 10:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SD_al_CombineGroupDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombinePersonDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombineResourceDiaries;0)
	C_BOOLEAN:C305(SD3_bo_FloatingDiarydisplayed)
	C_LONGINT:C283($_l_ProcessNumber; SD3_l_CallActionNum; SD3_l_DiaryActionNum)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_SDProcName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_MultiOwnerClose")
ARRAY LONGINT:C221(<>SD_al_CombineGroupDiaries; 0)
ARRAY LONGINT:C221(<>SD_al_CombinePersonDiaries; 0)
ARRAY LONGINT:C221(<>SD_al_CombineResourceDiaries; 0)
SD3_bo_FloatingDiarydisplayed:=False:C215
$_t_SDProcName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
$_l_ProcessNumber:=Process number:C372($_t_SDProcName)
If ($_l_ProcessNumber>0)
	SD3_l_CallActionNum:=14
	SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
	POST OUTSIDE CALL:C329($_l_ProcessNumber)
End if 
SD3_l_CallActionNum:=0
HIDE PROCESS:C324(Current process:C322)

// CANCEL
ERR_MethodTrackerReturn("SD_MultiOwnerClose"; $_t_oldMethodName)
