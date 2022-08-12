//%attributes = {}
If (False:C215)
	//Project Method Name:      Trans_Check3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:07
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
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_Process; $_l_WindowRow; WIN_l_CurrentWinRef)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_TransactionCode; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_Check3")
$_l_Process:=Current process:C322
<>SYS_l_CancelProcess:=0

Open_PrD_Window($3)
//MESSAGE(Char(13))
FIRST RECORD:C50([TRANSACTIONS:29])
CREATE EMPTY SET:C140([TRANSACTIONS:29]; "Extra")
While ((Not:C34(End selection:C36([TRANSACTIONS:29]))) & (<>SYS_l_CancelProcess#$_l_Process))
	$_t_TransactionCode:=$1->
	RELATE ONE:C42($1->)
	MESSAGE:C88("  "+$_t_TransactionCode+Char:C90(13))
	While ((Not:C34(End selection:C36([TRANSACTIONS:29]))) & ($_t_TransactionCode=$1->) & (<>SYS_l_CancelProcess#$_l_Process))
		If ($2->="")
			ADD TO SET:C119([TRANSACTIONS:29]; "Extra")
		End if 
		NEXT RECORD:C51([TRANSACTIONS:29])
	End while 
End while 
USE SET:C118("Extra")
CLEAR SET:C117("Extra")
CLOSE WINDOW:C154
If (WIN_bo_TrackerInited)
	$_l_WindowRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowRow}
	End if 
End if 
ERR_MethodTrackerReturn("Trans_Check3"; $_t_oldMethodName)