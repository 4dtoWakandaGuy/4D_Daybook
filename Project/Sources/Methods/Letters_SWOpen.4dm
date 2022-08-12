//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_SWOpen
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:52
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	C_BOOLEAN:C305(<>StartProc; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_OK; $_l_WindowReferenceRow; WIN_l_CurrentWinRef; xNext)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_SWOpen")
//Letters_SWOpen
Start_Process
Letters_File
Array_LCx(0)
<>StartProc:=False:C215
Open_Any_Window(228; 448)
DIALOG:C40([DOCUMENTS:7]; "dOpen")
CLOSE WINDOW:C154
$_l_OK:=OK
OK:=1
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 

If (($_l_OK=1) & (GEN_at_Identity{GEN_at_Identity}#"Not Defined"))
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=GEN_at_Identity{GEN_at_Identity})
	xNext:=0
	CREATE SET:C116([DOCUMENTS:7]; "Master")
	Open_Pro_Window(GEN_at_Identity{GEN_at_Identity})
	MODIFY RECORD:C57([DOCUMENTS:7]; *)
	Close_ProWin
End if 
Process_End
ERR_MethodTrackerReturn("Letters_SWOpen"; $_t_oldMethodName)