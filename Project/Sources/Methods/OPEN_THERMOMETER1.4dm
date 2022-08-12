//%attributes = {}
If (False:C215)
	//Project Method Name:      OPEN_THERMOMETER1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305($2; $3; Therm_bo_CloseThermometer; vDisallowStop; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_WindowReferenceRow; THERM_l_Thermometer; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName; $1; Therm_t_Message)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OPEN_THERMOMETER1")
//C_TEXT(◊_Message;$1)

//C_LONGINT(◊_Thermometer)
//C_BOOLEAN(◊Close_Thermo)


//◊_Message:=$1
Therm_t_Message:=$1


vDisallowStop:=$2  //added 27/06/08 -kmw

THERM_l_Thermometer:=1  //added 11/07/08 -kmw

//VER_CENTER WINDOW (350;150;Plain dialog box ;"")
VER_CENTERWINDOW(310; 110; Plain window:K34:13; "")  // 17/11/02 pb
DIALOG:C40([USER:15]; "Thermometer")
CLOSE WINDOW:C154
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
ERR_MethodTrackerReturn("OPEN_THERMOMETER1"; $_t_oldMethodName)