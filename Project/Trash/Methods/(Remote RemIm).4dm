//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote RemIm
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
	C_BOOLEAN:C305(<>RemShowData; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess; $_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_DocumentName; $_t_oldMethodName; $_t_WindowTitle; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vFld; vRec)
	C_TIME:C306(vDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote RemIm")
//Import from Remote Users

$_t_WindowTitle:="Import from Remote"
Remote_ImStart
DB_t_CurrentFormUsage2:="Rem"

QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Require_Export:9=True:C214)
If (Records in selection:C76([PERSONNEL:11])>0)
	Remote_ImShowAr
	vFld:=Char:C90(200)
	vRec:=Char:C90(201)
	Open_PrD_Window($_t_WindowTitle+" (Cmd-. to Cancel)")
	If (<>SYS_l_CancelProcess#<>Process)
		<>Process:=Current process:C322
		MESSAGE:C88(Char:C90(13))
		FIRST RECORD:C50([PERSONNEL:11])
		While (Not:C34(End selection:C36([PERSONNEL:11])))
			LOAD RECORD:C52([PERSONNEL:11])
			If (Not:C34(Locked:C147([PERSONNEL:11])))
				$_t_DocumentName:=[PERSONNEL:11]Export_Path:11+":"+"From "+[PERSONNEL:11]Initials:1
				OK:=1
				ON ERR CALL:C155("Remote_Err")
				vDoc:=DB_OpenDocument($_t_DocumentName)
				ON ERR CALL:C155("")
				If (OK=1)
					If (<>SYS_l_CancelProcess#<>Process)
						MESSAGE:C88("   Importing from File: "+$_t_DocumentName+Char:C90(13)+Char:C90(13))
						Remote_ImGen("Rem")
						Close_DocUMENT(vDoc)
						DELETE DOCUMENT:C159($_t_DocumentName)
					Else 
						Close_DocUMENT(vDoc)
					End if 
				Else 
					MESSAGE:C88("   No data from "+[PERSONNEL:11]Initials:1+Char:C90(13))
				End if 
			Else 
				MESSAGE:C88("   "+[PERSONNEL:11]Initials:1+" could not be checked - record in use"+Char:C90(13))
			End if 
			MESSAGE:C88(Char:C90(13))
			NEXT RECORD:C51([PERSONNEL:11])
		End while 
		
		If ((<>RemShowData) & (<>SYS_l_CancelProcess#<>Process))
			FIRST RECORD:C50([PERSONNEL:11])
			While (Not:C34(End selection:C36([PERSONNEL:11])))
				Remote_ImShow
				NEXT RECORD:C51([PERSONNEL:11])
			End while 
		End if 
		
	End if 
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Remote RemIm"; $_t_oldMethodName)
