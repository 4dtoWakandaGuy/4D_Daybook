//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Fax FEStartM1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:27
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
	C_LONGINT:C283($_l_OK; $_l_WindowReferenceRow; $0; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName; $1; vConfirm; vSearch; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Fax FEStartM1")
//Fax FEStartM1 - Multi 1
$0:=0

QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1="Cover Pages")
vSearch:=[LIST_ITEMS:95]List_Entry:2
vConfirm:=$1
vT:=""
Open_Any_Window(304; 438)
DIALOG:C40([COMPANIES:2]; "dFax FECover")
CLOSE WINDOW:C154
$_l_OK:=OK
OK:=1
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
If ($_l_OK=0)
	$0:=9999
Else 
	PLUGCALL_FAX("SetDriver"; 1; "Fax")
	
	
End if 
ERR_MethodTrackerReturn("Fax FEStartM1"; $_t_oldMethodName)