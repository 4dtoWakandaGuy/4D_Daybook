//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_ControlPanelTestClients
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:32
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
	C_LONGINT:C283(<>IWS_ControlPanelTestClientsProc; $_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>IWS_t_TestPages; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_ControlPanelTestClients")
////*******************************************//
////   IWS_ControlPanelTestClients
////   Author: Axel Muench, 10/12/2000
////
////
////*******************************************//



DB_SetMenuBar(""; 1)

<>IWS_t_TestPages:="PING"

UTI_WinCenter(500; 500; -1984; "Server Test")
DIALOG:C40([WEBSETUP_4D:129]; "WebTest_d")
CLOSE WINDOW:C154
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
<>IWS_ControlPanelTestClientsProc:=0
ERR_MethodTrackerReturn("IWS_ControlPanelTestClients"; $_t_oldMethodName)