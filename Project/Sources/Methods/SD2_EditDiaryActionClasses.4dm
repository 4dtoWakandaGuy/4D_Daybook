//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_EditDiaryActionClasses
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_Nonmodifiable;0)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; SD_t_ViewActionClassNM)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_EditDiaryActionClasses")
ARRAY TEXT:C222(SD_at_Nonmodifiable; 3)
APPEND TO ARRAY:C911(SD_at_NonModifiable; "Scheduled Items")
APPEND TO ARRAY:C911(SD_at_NonModifiable; "Work Flow Items")
APPEND TO ARRAY:C911(SD_at_Nonmodifiable; "Notes Items")  //These types are locked
OBJECT GET COORDINATES:C663(SD_t_ViewActionClassNM; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153($_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom; -1)
DIALOG:C40([USER:15]; "Diary_Types")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
ERR_MethodTrackerReturn("SD2_EditDiaryActionClasses"; $_t_oldMethodName)