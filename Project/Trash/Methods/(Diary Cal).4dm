//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary Cal
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_WindowReferenceRow; vButt; WIN_l_CurrentWinRef)
	C_POINTER:C301($_Ptr_Variable)
	C_TEXT:C284($_t_oldMethodName; vCalMth; vCalYr)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary Cal")
//Diary Cal
vButt:=0
Open_Squ_Window
DIALOG:C40([DIARY:12]; "dDiary Cal")
CLOSE WINDOW:C154
If (vButt>0)
	$_Ptr_Variable:=Get pointer:C304("vD"+String:C10(vButt))
	vDate:=Date_FromStrs($_Ptr_Variable->; vCalMth; vCalYr)
End if 
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
ERR_MethodTrackerReturn("Diary Cal"; $_t_oldMethodName)