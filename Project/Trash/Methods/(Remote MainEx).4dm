//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote MainEx
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
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess; $_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_DateTimeStamp; $_t_DocumentName; $_t_oldMethodName; $_t_Text; $_t_WindowTitle; vRec)
	C_TIME:C306(vDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote MainEx")
//Export to Main System
$_t_WindowTitle:="Export to Main"
QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
If ((Records in selection:C76([PERSONNEL:11])>0) & (<>SYS_l_CancelProcess#<>Process))
	Remote_ExStart
	READ WRITE:C146([PERSONNEL:11])
	$_t_DateTimeStamp:=Export_Stamp
	Open_PrD_Window($_t_WindowTitle+" (Cmd-. to Cancel)")
	MESSAGE:C88(Char:C90(13))
	
	LOAD RECORD:C52([PERSONNEL:11])
	If (Not:C34(Locked:C147([PERSONNEL:11])))
		$_t_DocumentName:=[PERSONNEL:11]Export_Path:11+":"+"From "+[PERSONNEL:11]Initials:1
		Remote_ExAppCre($_t_DocumentName)
		If (OK=1)
			MESSAGE:C88(Char:C90(13)+"   "+$_t_Text+" File: "+$_t_DocumentName+Char:C90(13)+Char:C90(13))
			SEND PACKET:C103(vDoc; "*START*"+vRec+[PERSONNEL:11]Initials:1+vRec+[PERSONNEL:11]Name:2+vRec+$_t_DateTimeStamp+vRec)
			If ([PERSONNEL:11]Person_Identity:13#"")
				SEND PACKET:C103(vDoc; "*P*"+vRec+Remote_Code([PERSONNEL:11]Person_Identity:13)+vRec)
			End if 
			
			//Companies
			If (<>SYS_l_CancelProcess#<>Process)
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Export:33>=[PERSONNEL:11]Last_Export:10; *)
				QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Export:33<":")
				Remote_ExComp
			End if 
			//Contacts
			If (<>SYS_l_CancelProcess#<>Process)
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Export:18>=[PERSONNEL:11]Last_Export:10; *)
				QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Export:18<":")
				Remote_ExCont
			End if 
			//Diary
			If (<>SYS_l_CancelProcess#<>Process)
				QUERY:C277([DIARY:12]; [DIARY:12]Export:24>=[PERSONNEL:11]Last_Export:10; *)
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Export:24<":")
				Remote_ExDry
			End if 
			//Orders & Order Items
			If (<>SYS_l_CancelProcess#<>Process)
				QUERY:C277([ORDERS:24]; [ORDERS:24]Export:24>=[PERSONNEL:11]Last_Export:10; *)
				QUERY:C277([ORDERS:24];  & ; [ORDERS:24]Export:24<":")
				Remote_ExOrd
			End if 
			Remote_ExMinAll
			//Letters
			If (<>SYS_l_CancelProcess#<>Process)
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Export:6>=[PERSONNEL:11]Last_Export:10; *)
				QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Export:6<":")
				Remote_ExLet("From ")
			End if 
			
			SEND PACKET:C103(vDoc; "*EXEND*"+vRec)
			If ((<>SYS_l_CancelProcess#<>Process) & ([PERSONNEL:11]Last_Export:10<$_t_DateTimeStamp))
				[PERSONNEL:11]Last_Export:10:=$_t_DateTimeStamp
				DB_SaveRecord(->[PERSONNEL:11])
				AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
			End if 
			
		Else 
			MESSAGE:C88("   The Export document for "+[PERSONNEL:11]Initials:1+" could not be created"+Char:C90(13))
		End if 
		Close_DocUMENT(vDoc)
	Else 
		MESSAGE:C88("      Data for "+[PERSONNEL:11]Initials:1+" could not be exported - record in use"+Char:C90(13))
	End if 
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Remote MainEx"; $_t_oldMethodName)
