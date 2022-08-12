//%attributes = {}
If (False:C215)
	//Project Method Name:      Remote_MainIm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
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
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess; $_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_DocumentPath; $_t_oldMethodName; $_t_WindowTitle; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vFld; vRec)
	C_TIME:C306(vDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote_MainIm")
//Import from Main System

$_t_WindowTitle:="Import from Main"
vFld:=Char:C90(200)
vRec:=Char:C90(201)
Open_PrD_Window($_t_WindowTitle+" (Cmd-. to Cancel)")
If (<>SYS_l_CancelProcess#<>Process)
	<>Process:=Current process:C322
	MESSAGE:C88(Char:C90(13))
	Remote_ImStart
	DB_t_CurrentFormUsage2:="Main"
	
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
	$_t_DocumentPath:=[PERSONNEL:11]Export_Path:11+":"+"For "+[PERSONNEL:11]Initials:1
	Remote_ImShowAr
	FIRST RECORD:C50([PERSONNEL:11])
	OK:=1
	ON ERR CALL:C155("Remote_Err")
	vDoc:=DB_OpenDocument($_t_DocumentPath)
	ON ERR CALL:C155("")
	If (OK=1)
		If (<>SYS_l_CancelProcess#<>Process)
			MESSAGE:C88("   Importing from File: "+$_t_DocumentPath+Char:C90(13)+Char:C90(13))
			Remote_ImGen("Main")
			CLOSE DOCUMENT:C267(vDoc)
			If (<>SYS_l_CancelProcess#<>Process)
				DELETE DOCUMENT:C159($_t_DocumentPath)
			End if 
			Remote_ImWait
			Remote_ImShow
		Else 
			CLOSE DOCUMENT:C267(vDoc)
		End if 
	Else 
		MESSAGE:C88("   No data for "+[PERSONNEL:11]Initials:1+Char:C90(13))
		Remote_ImWait
	End if 
End if 
CLOSE WINDOW:C154
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
ERR_MethodTrackerReturn("Remote_MainIm"; $_t_oldMethodName)
