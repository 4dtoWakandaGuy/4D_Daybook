//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letters SWInfo
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
	//ARRAY TEXT(<>Per_at_PersonnelNames;0)
	//ARRAY TEXT(<>WP_at_DocumentDiaryActionCode;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_OK; $_l_WindowReferenceRow; ch1; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName; vTitle2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters SWInfo")
//Letters SWInfo
OK:=1
If ([DOCUMENTS:7]Document_Code:1="*TMP@")
	Letters_SWSaveA
End if 
If (OK=1)
	Open_Any_Window(236; 294)
	DIALOG:C40([DOCUMENTS:7]; "dGetInfo")
	CLOSE WINDOW:C154
	$_l_OK:=OK
	OK:=1
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	If ($_l_OK=1)
		[DOCUMENTS:7]Heading:2:=vTitle2
		[DOCUMENTS:7]Document_Type:13:=<>WP_at_DocumentDiaryActionCode{<>WP_at_DocumentDiaryActionCode}
		[DOCUMENTS:7]Person:10:=<>Per_at_PersonnelNames{<>Per_at_PersonnelNames}
		[DOCUMENTS:7]Standard:9:=(ch1=1)
	End if 
End if 
ERR_MethodTrackerReturn("Letters SWInfo"; $_t_oldMethodName)