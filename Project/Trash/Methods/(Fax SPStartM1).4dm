//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Fax_SPStartM1
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
	C_LONGINT:C283($_l_WindowReferenceRow; $0; Fax_Return; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName; $1; vConfirm; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Fax_SPStartM1")
//Fax_SPStartM1 - Multi 1
$0:=0
If (Fax_SPSetup)
	
	vConfirm:=$1
	vT:=""
	Open_Any_Window(304; 438)
	DIALOG:C40([COMPANIES:2]; "dFax SPCover")
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	If (OK=0)
		$0:=9999
	End if 
	
	If ($0=0)
		Fax_Return:=0
		PLUGCALL_FAX("SwitchPrinter"; 2; ""; ->Fax_Return)
		$0:=Fax_Return
	End if 
Else 
	$0:=1
End if 
ERR_MethodTrackerReturn("Fax_SPStartM1"; $_t_oldMethodName)