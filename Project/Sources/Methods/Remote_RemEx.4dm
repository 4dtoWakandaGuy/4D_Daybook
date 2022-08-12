//%attributes = {}
If (False:C215)
	//Project Method Name:      Remote_RemEx
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(<>RemAllComp; <>RemOver; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess; $_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_DateTimeStamp; $_t_DocumentName; $_t_oldMethodName; $_t_Text; $_t_WindowTitle; $t; vRec)
	C_TIME:C306(vDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote_RemEx")
//Export to Remote Users
$_t_WindowTitle:="Export to Remote"
QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Require_Export:9=True:C214)
If ((Records in selection:C76([PERSONNEL:11])>0) & (<>SYS_l_CancelProcess#<>Process))
	Remote_ExStart
	READ WRITE:C146([PERSONNEL:11])
	READ WRITE:C146([COMPANIES:2])
	READ WRITE:C146([CONTACTS:1])
	READ WRITE:C146([PRODUCTS:9])
	$_t_DateTimeStamp:=Export_Stamp
	Open_PrD_Window($_t_WindowTitle+" (Cmd-. to Cancel)")
	MESSAGE:C88(Char:C90(13))
	
	FIRST RECORD:C50([PERSONNEL:11])
	While (Not:C34(End selection:C36([PERSONNEL:11])))
		LOAD RECORD:C52([PERSONNEL:11])
		If (Not:C34(Locked:C147([PERSONNEL:11])))
			If ([PERSONNEL:11]Office_Code:17#"")
				If ([PERSONNEL:11]Export_Path:11#"")
					$_t_DocumentName:=[PERSONNEL:11]Export_Path:11+":"+"For "+[PERSONNEL:11]Initials:1
					Remote_ExAppCre($_t_DocumentName)
					If (OK=1)
						MESSAGE:C88(Char:C90(13)+"   "+$_t_Text+" File: "+$_t_DocumentName+Char:C90(13)+Char:C90(13))
						SEND PACKET:C103(vDoc; "*START*"+vRec+[PERSONNEL:11]Initials:1+vRec+[PERSONNEL:11]Name:2+vRec+$_t_DateTimeStamp+vRec)
						If ([PERSONNEL:11]Person_Identity:13#"")
							SEND PACKET:C103(vDoc; "*P*"+vRec+Remote_Code([PERSONNEL:11]Person_Identity:13)+vRec)
						End if 
						If ([PERSONNEL:11]Office_Code:17#"")
							SEND PACKET:C103(vDoc; "*OC*"+vRec+[PERSONNEL:11]Office_Code:17+vRec)
						End if 
						If (<>RemOver)
							$t:="1"
						Else 
							$t:="0"
						End if 
						SEND PACKET:C103(vDoc; "*RO*"+vRec+$t+vRec)
						
						CREATE EMPTY SET:C140([DOCUMENTS:7]; "Letters")
						//Companies
						If (<>SYS_l_CancelProcess#<>Process)
							If ([PERSONNEL:11]Rem_AllChange:18=False:C215)
								QUERY:C277([DIARY:12]; [DIARY:12]Person:8=[PERSONNEL:11]Initials:1; *)
								QUERY:C277([DIARY:12];  | ; [DIARY:12]Originator:23=[PERSONNEL:11]Initials:1)
							End if 
							If ((<>RemAllComp) | ([PERSONNEL:11]Rem_AllChange:18))
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Export:33>=[PERSONNEL:11]Last_Export:10; *)
								QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Export:33<":")
							Else 
								MESSAGES OFF:C175
								RELATE ONE SELECTION:C349([DIARY:12]; [COMPANIES:2])
								MESSAGES ON:C181
								CREATE SET:C116([COMPANIES:2]; "CMaster")
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Taken_By:26=[PERSONNEL:11]Initials:1; *)
								QUERY:C277([COMPANIES:2];  | ; [COMPANIES:2]Sales_Person:29=[PERSONNEL:11]Initials:1)
								CREATE SET:C116([COMPANIES:2]; "Extra")
								UNION:C120("CMaster"; "Extra"; "CMaster")
								USE SET:C118("CMaster")
								QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Export:33>=[PERSONNEL:11]Last_Export:10; *)
								QUERY SELECTION:C341([COMPANIES:2];  & ; [COMPANIES:2]Export:33<":")
							End if 
							Remote_ExComp
						End if 
						//Contacts
						If (<>SYS_l_CancelProcess#<>Process)
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Export:18>=[PERSONNEL:11]Last_Export:10; *)
							QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Export:18<":")
							If ((<>RemAllComp=False:C215) & ([PERSONNEL:11]Rem_AllChange:18=False:C215))
								CREATE SET:C116([CONTACTS:1]; "Extra")
								INTERSECTION:C121("Extra"; "OMaster"; "Extra")
								USE SET:C118("Extra")
							End if 
							Remote_ExCont
						End if 
						//Diary
						If (<>SYS_l_CancelProcess#<>Process)
							If ([PERSONNEL:11]Rem_AllChange:18)
								QUERY:C277([DIARY:12]; [DIARY:12]Export:24>=[PERSONNEL:11]Last_Export:10; *)
								QUERY:C277([DIARY:12];  & ; [DIARY:12]Export:24<":")
							Else 
								QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Export:24>=[PERSONNEL:11]Last_Export:10; *)
								QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Export:24<":")
							End if 
							Remote_ExDry
						End if 
						//Products
						If (<>SYS_l_CancelProcess#<>Process)
							QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Export:22>=[PERSONNEL:11]Last_Export:10; *)
							QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Export:22<":")
							Remote_ExProd
						End if 
						//Orders & Order Items
						If (<>SYS_l_CancelProcess#<>Process)
							If ([PERSONNEL:11]Rem_AllChange:18)
								QUERY:C277([ORDERS:24]; [ORDERS:24]Export:24>=[PERSONNEL:11]Last_Export:10; *)
								QUERY:C277([ORDERS:24];  & ; [ORDERS:24]Export:24<":")
							Else 
								QUERY:C277([ORDERS:24]; [ORDERS:24]Taken_By:17=[PERSONNEL:11]Initials:1; *)
								QUERY:C277([ORDERS:24];  | ; [ORDERS:24]Person:5=[PERSONNEL:11]Initials:1)
								QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Export:24>=[PERSONNEL:11]Last_Export:10; *)
								QUERY SELECTION:C341([ORDERS:24];  & ; [ORDERS:24]Export:24<":")
							End if 
							Remote_ExOrd
						End if 
						Remote_ExMinAll
						//Letters
						If (<>SYS_l_CancelProcess#<>Process)
							QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Export:6>=[PERSONNEL:11]Last_Export:10; *)
							QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Export:6<":")
							If ([PERSONNEL:11]Rem_AllChange:18=False:C215)
								CREATE SET:C116([DOCUMENTS:7]; "Extra")
								INTERSECTION:C121("Letters"; "Extra"; "Letters")
								USE SET:C118("Letters")
							End if 
							Remote_ExLet("For ")
						End if 
						//Deletions
						If ((<>SYS_l_CancelProcess#<>Process) & ([PERSONNEL:11]Last_Export:10#""))
							QUERY:C277([DELETIONS:66]; [DELETIONS:66]Export:2>=[PERSONNEL:11]Last_Export:10; *)
							QUERY:C277([DELETIONS:66];  & ; [DELETIONS:66]Export:2<":")
							Remote_ExDel
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
					CLOSE DOCUMENT:C267(vDoc)
				Else 
					MESSAGE:C88("      Data for "+[PERSONNEL:11]Initials:1+" could not be exported - no Remote Path"+Char:C90(13))
				End if 
			Else 
				MESSAGE:C88("      Data for "+[PERSONNEL:11]Initials:1+" could not be exported - no Office Code"+Char:C90(13))
			End if 
		Else 
			MESSAGE:C88("      Data for "+[PERSONNEL:11]Initials:1+" could not be exported - record in use"+Char:C90(13))
		End if 
		NEXT RECORD:C51([PERSONNEL:11])
	End while 
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Remote_RemEx"; $_t_oldMethodName)
