If (False:C215)
	//Table Form Method Name: [USER]SD2_PersonAdd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2013 01:02
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_lb_EventInvites;0)
	//ARRAY BOOLEAN(SD_lb_People;0)
	//ARRAY BOOLEAN(SD2_abo_FoundNameSelect;0)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY LONGINT(<>PRC_al_WindowReference;0)
	ARRAY LONGINT:C221($_al_ContactTypeSelect; 0)
	//ARRAY LONGINT(SD2_al_ContactTypeSelect;0)
	//ARRAY LONGINT(SD2_al_FoundNameCLass;0)
	//ARRAY LONGINT(SD2_al_FoundNameID;0)
	//ARRAY LONGINT(SD2_al_InviteeClass;0)
	//ARRAY LONGINT(SD2_al_InviteeStatus;0)
	//ARRAY LONGINT(SD2_al_InviteStati;0)
	//ARRAY LONGINT(SD2_al_PerIDS;0)
	//ARRAY LONGINT(SD2_al_RecordID;0)
	//ARRAY TEXT(AA_at_ProffesionallAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefix;0)
	//ARRAY TEXT(SD2_at_ContactEmailSelect;0)
	//ARRAY TEXT(SD2_at_ContactNamesSelect;0)
	//ARRAY TEXT(SD2_at_ContactsSelect;0)
	//ARRAY TEXT(SD2_at_ContCompany;0)
	//ARRAY TEXT(SD2_at_EmailOption;0)
	//ARRAY TEXT(SD2_at_FoundDataInfo;0)
	//ARRAY TEXT(SD2_at_FoundNameCode;0)
	//ARRAY TEXT(Sd2_at_FoundNameCompany;0)
	//ARRAY TEXT(SD2_at_FoundNames;0)
	//ARRAY TEXT(SD2_at_inviteeClass;0)
	//ARRAY TEXT(SD2_at_InviteeEmailAddress;0)
	//ARRAY TEXT(SD2_at_InviteeEmailOption;0)
	//ARRAY TEXT(SD2_at_Invitees;0)
	//ARRAY TEXT(SD2_at_InviteeStatus;0)
	//ARRAY TEXT(SD2_at_InviteStati;0)
	//ARRAY TEXT(SD2_at_PerEmailAfterAt;0)
	//ARRAY TEXT(SD2_at_PerEmailBeforeAt;0)
	//ARRAY TEXT(SD2_at_PerEmails;0)
	//ARRAY TEXT(SD2_at_PerFirstNames;0)
	//ARRAY TEXT(SD2_at_PerInits;0)
	//ARRAY TEXT(SD2_at_perLastNames;0)
	//ARRAY TEXT(SD2_at_PerNames;0)
	//ARRAY TEXT(SD2_at_StatusPop;0)
	C_BOOLEAN:C305($_bo_BringtoFront; $_bo_DeleteRow1; $_bo_GetOut; $_bo_OK; $_bo_ReadOnly; DB_bo_NoLoad; SD2_al_CallBackReceived; SD2_bo_FindActive; SD2_bo_FindVisible)
	C_LONGINT:C283($_l_ArraySize; $_l_AtPosition; $_l_CharacterPosition; $_l_ColumnsWidth; $_l_Delay; $_l_event; $_l_FirstColumnWIdth; $_l_FirstRow; $_l_Index; $_l_KeeptTopAt; $_l_Nul)
	C_LONGINT:C283($_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectHeight; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectRight; $_l_ObjectRIght2; $_l_ObjectTop; $_l_ObjectTop2; $_l_ObjectWidth; $_l_Repeats)
	C_LONGINT:C283($_l_Retries; $_l_Time; $_l_Width; $_l_WindowBottom; $_l_WindowHeight; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $_l_WindowWidth; DOC_l_CallEvent; SD_l_InviteeContext)
	C_LONGINT:C283(SD2_l_EditID; SD2_l_EditingRow; SD2_l_EmailCalledback; SD2_l_EmailChoiceProc; SD2_l_InviteeMode; SD2_l_LastSelected; SD2_l_Onetime; SD2_l_Searchprocess; SD2_l_SelectedAdressee; SD2_l_SelectedInSubprocess; SD2_l_StillLoading)
	C_LONGINT:C283(SD2_l_StopSearch; SD2_l_winHeight; SD2_l_winLeft; SD2_l_winTop; SD2_l_winWidth; SD2a_l_BUT1; SD2a_l_But2; SD2a_l_BUT3; SD2a_l_BUT4; SD2a_l_BUT5; SD2a_l_BUT6)
	C_LONGINT:C283(SD2a_l_BUT7; SD2a_l_BUT8; SD2a_l_BUT9)
	C_REAL:C285(SRCH_r_Timer; SRCH_r_TimerOLD)
	C_TEXT:C284($_t_ContactCode; $_t_EmailAddress; $_t_Name; $_t_oldMethodName; SD2_t_ContactFirstnames; SD2_t_ContactSurname; SD2_t_ContactTitle; SD2_t_SearchCriteria; SD2_T_SearchValue; SD2_t_WindowTitle; SD2a_t_COL1)
	C_TEXT:C284(SD2a_t_COL2; SD2a_t_COL3; SD2a_t_COL4; SD2a_t_COL5; SD2a_t_COL6; SD2a_t_COL7; SD2a_t_COL8; SD2a_t_COL9; SD2a_t_HED1; SD2a_t_HED2; SD2a_t_HED3)
	C_TEXT:C284(SD2a_t_HED4; SD2a_t_HED5; SD2a_t_HED6; SD2a_t_HED7; SD2a_t_HED8; SD2a_t_HED9; SRCH_T_ParamPassed; SRCH_t_SearchValue; SRCH_t_SearchValueOLD)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SD2_PersonAdd"; Form event code:C388)  //added error tracker call 08/07/08 -kmw



//This is a clever little screen for adding people to a diary it looks up people in the context of PERSONNEL or CONTACTS. This is adding them as 'invitees'
$_l_event:=Form event code:C388
$_l_Time:=60*2

If (False:C215)
	If ($_l_event#On Unload:K2:2) & ($_l_event#On Outside Call:K2:11) & ($_l_event#On Resize:K2:27) & ($_l_event#On Load:K2:1) & ($_l_event#On Clicked:K2:4) & ($_l_event#On Activate:K2:9) & ($_l_event#On Getting Focus:K2:7) & ($_l_event#On Display Detail:K2:22) & ($_l_event#On Mouse Move:K2:35) & ($_l_event#On Mouse Enter:K2:33) & ($_l_event#On Mouse Leave:K2:34)
		
		
		
	End if 
End if 

If ($_l_event#On Activate:K2:9) & (False:C215)
	
	
	BRING TO FRONT:C326(Current process:C322)
End if 


Case of 
		
	: ($_l_event=On Resize:K2:27)
		
		
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		OBJECT GET COORDINATES:C663(*; "oBexitInvitees"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		
		$_l_WindowHeight:=$_l_WindowBottom-$_l_windowTop
		$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
		If ($_l_WindowHeight>SD2_l_winHeight) | ($_l_WindowWidth>SD2_l_winWidth) | (True:C214)
			
			
			
			SD2_l_winHeight:=$_l_WindowHeight
			SD2_l_winWidth:=$_l_WindowWidth
			Gen_SetobjectPositionByname("oBexitInvitees"; $_l_WindowHeight-($_l_ObjectHeight+10); $_l_WindowWidth-($_l_ObjectWidth+15))
			If (Not:C34(SD2_bo_FindVisible))  // set list box bottom relative to  exit button
				
				
				$_l_Nul:=0
				OBJECT GET COORDINATES:C663(*; "oInvitees"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_KeeptTopAt:=$_l_ObjectTop
				Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oBexitInvitees"; "oInvitees"; 13; 1; 10)
				OBJECT GET COORDINATES:C663(*; "oInvitees"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				Gen_SetobjectPositionByname("oInvitees"; $_l_KeeptTopAt; $_l_ObjectLeft; $_l_ObjectBottom; $_l_ObjectRight)
				
			Else 
				BEEP:C151
				OBJECT GET COORDINATES:C663(*; "oInvitees"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRIght2; $_l_ObjectBottom2)
				
				If (($_l_WindowHeight-$_l_ObjectBottom2)<145)
					$_l_ObjectHeight:=145-($_l_WindowHeight-$_l_ObjectBottom2)
					Gen_SetobjectPositionByname("oInvitees"; $_l_ObjectTop2; $_l_ObjectLeft2; $_l_ObjectTop2+$_l_ObjectHeight; $_l_ObjectRIght2)
				End if 
				SD2_l_winHeight:=$_l_WindowHeight
				SD2_l_winWidth:=$_l_WindowWidth
				Gen_SetobjectPositionByname("oBexitInvitees"; $_l_WindowHeight-($_l_ObjectHeight+10); $_l_WindowWidth-($_l_ObjectWidth+15))
				
				Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oInvitees"; "oRoundArea"; 8; 1; 3)
				Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oInvitees"; "oFocusRing"; 8; 1; 3)
				Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oInvitees"; "oSearchCriteriaButton1"; 8; 1; 9)
				//oSearchCriteria
				Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oInvitees"; "oSearchCriteria"; 8; 1; 11)
				Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oInvitees"; "oSearchvalue"; 8; 1; 11)
				//oSearchClearButton
				Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oInvitees"; "oSearchClearButton"; 8; 1; 11)
				OBJECT GET COORDINATES:C663(*; "oRoundArea"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oRoundArea"; "oAddressBook"; 8; 1; 3)
				
				$_l_Nul:=0
				OBJECT GET COORDINATES:C663(*; "oAddressBook"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_KeeptTopAt:=$_l_ObjectTop
				Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oBexitInvitees"; "oAddressBook"; 13; 1; 10)
				OBJECT GET COORDINATES:C663(*; "oAddressBook"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				Gen_SetobjectPositionByname("oAddressBook"; $_l_KeeptTopAt; 1; $_l_ObjectBottom; $_l_ObjectRight)
			End if 
		End if 
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		SD2_bo_FindVisible:=False:C215
		SD2_t_WindowTitle:=Get window title:C450
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		If (SD2_l_winLeft#$_l_WindowLeft) | ($_l_windowTop#SD2_l_winTop)
			SD2_l_winLeft:=$_l_WindowLeft
			SD2_l_winTop:=$_l_windowTop
			SD2_l_winHeight:=$_l_WindowBottom-$_l_windowTop
			SD2_l_winWidth:=$_l_WindowRight-$_l_WindowLeft
			If (SD2_l_EmailChoiceProc>0)  //Tell the process to MOVE
				
				
				$_l_Retries:=0
				While (Semaphore:C143("$SD2NamesCall"))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(2*$_l_Retries)
				End while 
				SET PROCESS VARIABLE:C370(SD2_l_EmailChoiceProc; DOC_l_CallEvent; 5)
				BRING TO FRONT:C326(SD2_l_EmailChoiceProc)
				POST OUTSIDE CALL:C329(SD2_l_EmailChoiceProc)
				CLEAR SEMAPHORE:C144("$SD2NamesCall")
			End if 
		End if 
		SD2_l_StillLoading:=1
		SD2_bo_FindActive:=False:C215
		SD2_t_SearchCriteria:=""
		SD2_T_SearchValue:=""
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=0)
		//QUERY([PERSONNEL]; & ;[PERSONNEL]Active=True)
		ARRAY LONGINT:C221(SD2_al_PerIDS; 0)
		ARRAY TEXT:C222(SD2_at_PerInits; 0)
		ARRAY TEXT:C222(SD2_at_PerNames; 0)
		ARRAY TEXT:C222(SD2_at_PerFirstNames; 0)
		ARRAY TEXT:C222(SD2_at_perLastNames; 0)
		ARRAY TEXT:C222(SD2_at_PerEmails; 0)
		ARRAY TEXT:C222(SD2_at_PerEmailBeforeAt; 0)
		ARRAY TEXT:C222(SD2_at_PerEmailAfterAt; 0)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; SD2_al_PerIDS; [PERSONNEL:11]Initials:1; SD2_at_PerInits; [PERSONNEL:11]Name:2; SD2_at_PerNames; [PERSONNEL:11]Email_Address:36; SD2_at_PerEmails)
		$_l_ArraySize:=Size of array:C274(SD2_al_PerIDS)
		ARRAY TEXT:C222(SD2_at_PerFirstNames; $_l_ArraySize)
		ARRAY TEXT:C222(SD2_at_perLastNames; $_l_ArraySize)
		ARRAY TEXT:C222(SD2_at_PerEmailBeforeAt; $_l_ArraySize)
		ARRAY TEXT:C222(SD2_at_PerEmailAfterAt; $_l_ArraySize)
		AA_LoadNameArrays
		For ($_l_Index; 1; $_l_ArraySize)
			SD2_t_ContactFirstnames:=""
			SD2_t_ContactSurname:=""
			AA_ParseName(SD2_at_PerNames{$_l_Index}; 0; ->SD2_t_ContactTitle; ->SD2_t_ContactFirstnames; ->SD2_t_ContactSurname; ->AA_at_Salutations; ->AA_at_SNprefix; ->AA_at_ProffesionallAdditions)
			SD2_at_PerFirstNames{$_l_Index}:=SD2_t_ContactFirstnames
			SD2_at_perLastNames{$_l_Index}:=SD2_t_ContactSurname
			$_l_AtPosition:=Position:C15(Char:C90(64); SD2_at_PerEmails{$_l_Index})
			If ($_l_AtPosition>0)
				SD2_at_PerEmailBeforeAt{$_l_Index}:=Substring:C12(SD2_at_PerEmails{$_l_Index}; 1; $_l_CharacterPosition-1)
				SD2_at_PerEmailAfterAt{$_l_Index}:=Substring:C12(SD2_at_PerEmails{$_l_Index}; $_l_CharacterPosition+1)
			End if 
		End for 
		
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_Width:=$_l_WindowRight-$_l_WindowLeft
		SD2_l_EditingRow:=0
		SD2_l_SelectedInSubprocess:=0
		ARRAY TEXT:C222(SD2_at_ContCompany; 0)  //for any contacts added we need the company code
		
		
		ARRAY TEXT:C222(SD2_at_ContCompany; Size of array:C274(SD2_at_InviteeEmailAddress))
		Case of 
			: (SD_l_InviteeContext=0)
				LB_SetupListbox(->SD_lb_EventInvites; "SD2a_t"; "SD2a_L"; 1; ->SD2_at_InviteeEmailAddress; ->SD2_at_Invitees; ->SD2_at_InviteeStatus; ->SD2_al_InviteeStatus; ->SD2_al_InviteeClass; ->SD2_at_inviteeClass; ->SD2_al_RecordID; ->SD2_at_ContCompany)
				LB_SetColumnHeaders(->SD_lb_EventInvites; "SD2a_L"; 1; "Email"; "Name"; "Status"; "LongintStatus"; "Longint Class"; "Class"; "RecordID"; "Company Code")
				
				$_l_ColumnsWidth:=$_l_Width-(170+52+20)
				If ($_l_ColumnsWidth>250)
					$_l_ColumnsWidth:=250
					$_l_FirstColumnWIdth:=$_l_Width-(250+52+20)
				Else 
					$_l_FirstColumnWIdth:=170
				End if 
				LB_SetColumnWidths(->SD_lb_EventInvites; "SD2a_t"; 1; $_l_FirstColumnWIdth; $_l_ColumnsWidth-10; 65; 0; 0; 0; 0)
				LB_SetEnterable(->SD_lb_EventInvites; False:C215; 0)
				LB_SetEnterable(->SD_lb_EventInvites; True:C214; 1)
				If ([DIARY:12]Done:14=False:C215) & ([DIARY:12]Result_Code:11="")  //not done
					
					
					//note that if the status is SENT then it cant be changed!
					LB_SetEnterable(->SD_lb_EventInvites; True:C214; 3)
					ARRAY TEXT:C222(SD2_at_StatusPop; 2)
					SD2_at_StatusPop{1}:="Do not send"
					SD2_at_StatusPop{2}:="Not sent"
					LB_SetChoiceList("SD2invstatus"; ->SD2_at_StatusPop; ->SD2_at_InviteeStatus)
					
				End if 
			: (SD_l_InviteeContext=1)  //Email
				
				
				ARRAY TEXT:C222(SD2_at_EmailOption; 0)
				
				APPEND TO ARRAY:C911(SD2_at_EmailOption; "To")
				APPEND TO ARRAY:C911(SD2_at_EmailOption; "CC")
				APPEND TO ARRAY:C911(SD2_at_EmailOption; "BCC")
				LB_SetupListbox(->SD_lb_EventInvites; "SD2a_t"; "SD2a_L"; 1; ->SD2_at_InviteeEmailOption; ->SD2_at_InviteeEmailAddress; ->SD2_at_Invitees; ->SD2_at_InviteeStatus; ->SD2_al_InviteeStatus; ->SD2_al_InviteeClass; ->SD2_at_inviteeClass; ->SD2_al_RecordID; ->SD2_at_ContCompany)
				LB_SetColumnHeaders(->SD_lb_EventInvites; "SD2a_L"; 1; "Option"; "Email"; "Name"; "Status"; "LongintStatus"; "Longint Class"; "Class"; "RecordID")
				$_l_ColumnsWidth:=$_l_Width-((200+52+20)+35)
				If ($_l_ColumnsWidth>250)
					$_l_ColumnsWidth:=250
					$_l_FirstColumnWIdth:=$_l_Width-((250+52+20)+35)
				Else 
					$_l_FirstColumnWIdth:=250
				End if 
				LB_SetColumnWidths(->SD_lb_EventInvites; "SD2a_t"; 1; 35; $_l_FirstColumnWIdth; $_l_ColumnsWidth; 0; 0; 0; 0; 0)
				LB_SetEnterable(->SD_lb_EventInvites; False:C215; 0)
				LB_SetEnterable(->SD_lb_EventInvites; True:C214; 1)
				LB_SetEnterable(->SD_lb_EventInvites; True:C214; 2)
				LB_SetChoiceList("SD2_EmailSendOpts"; ->SD2_at_EmailOption; ->SD2_at_InviteeEmailOption)
				
		End case 
		
		LB_SetScroll(->SD_lb_EventInvites; -3; -2)
		LB_StyleSettings(->SD_lb_EventInvites; "Black"; 9; "SD2a_t"; ->[DIARY:12])
		LB_Setdividers(->SD_lb_EventInvites; 0; 0)  //Both off
		
		
		LBI_Scrollonresize(->SD_lb_EventInvites)
		OBJECT SET VISIBLE:C603(*; "oSearch@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oFocus@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oRound@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAddressBook"; False:C215)
		
		//`````
		//now goto  the list box area
		Case of 
			: (SD2_l_InviteeMode=1)  //Adding invitee
				
				
				If (SD2_al_RecordID{Size of array:C274(SD2_al_RecordID)}=0)
					$_l_ArraySize:=Size of array:C274(SD2_at_InviteeEmailAddress)
					If ($_l_ArraySize>0)
						LISTBOX DELETE ROWS:C914(SD_lb_EventInvites; $_l_ArraySize)
					End if 
				End if 
				
				//DISABLE BUTTON(*;"oInviteeAdd")
				GOTO OBJECT:C206(SD_lb_EventInvites)
				$_l_ArraySize:=Size of array:C274(SD2_at_InviteeEmailAddress)
				LISTBOX INSERT ROWS:C913(SD_lb_EventInvites; 1)
				Case of 
					: (SD_l_InviteeContext=1)  //email
						
						
						SD2_at_InviteeEmailOption{1}:="To"
				End case 
				LB_SetScroll(->SD_lb_EventInvites; 1; 1)
				Case of 
					: (SD_l_InviteeContext=0)
						//SD2_at_InviteeStatus;->SD2_al_InviteeStatus
						$_l_FirstRow:=Find in array:C230(SD2_al_InviteStati; 1)
						If ($_l_FirstRow>0)
							SD2_al_InviteeStatus{1}:=1
							SD2_at_InviteeStatus{1}:=SD2_at_InviteStati{$_l_FirstRow}
						End if 
					: (SD_l_InviteeContext=1)
						SD2_al_InviteeStatus{1}:=1
						SD2_at_InviteeStatus{1}:="Not Sent"
				End case 
				EDIT ITEM:C870(SD2_at_InviteeEmailAddress; 1)
				//EDIT ITEM(SD2_at_InviteeEmailAddress{1})
				SD2_l_EmailCalledback:=2
				POST OUTSIDE CALL:C329(Current process:C322)
				SD2_l_SelectedAdressee:=1
			: (SD2_l_InviteeMode=2)  //  clicked on invitee list so just view
				
				OBJECT SET ENABLED:C1123(*; "oInviteeAdd"; True:C214)
				//_O_ENABLE BUTTON(*;"oInviteeAdd")
				If (SD2_l_EditID#0)
					$_l_FirstRow:=Find in array:C230(SD2_al_RecordID; SD2_l_EditID)
					If ($_l_FirstRow>0)
						EDIT ITEM:C870(SD2_at_InviteeEmailAddress; $_l_FirstRow)
						SD2_l_SelectedAdressee:=$_l_FirstRow
					End if 
				End if 
				SD2_l_EditID:=0
		End case 
		
		
		BRING TO FRONT:C326(Current process:C322)  //trying to correct problem with "on deactivate" not always gettign triggered (for instance instance it doesn''t get triggered if user clicks on a different window immediately after the window has been loaded which is why this is here as after doing this it seems to help it recognise an on deactivate) -10/12/08 -v631b120k -kmw
		
		
		
	: ($_l_event=On Unload:K2:2) & (Not:C34(DB_bo_NoLoad))
		
		
		
		
		SET WINDOW TITLE:C213(SD2_t_WindowTitle)
		If (SD2_l_Searchprocess>0)
			SET PROCESS VARIABLE:C370(SD2_l_Searchprocess; SD2_l_StopSearch; 1)
		End if 
		
		If (SD2_l_EmailChoiceProc>0)
			//Tell the process to end
			SET PROCESS VARIABLE:C370(SD2_l_EmailChoiceProc; DOC_l_CallEvent; 1)
			POST OUTSIDE CALL:C329(SD2_l_EmailChoiceProc)
			
		End if 
		SD2_l_EmailChoiceProc:=0
		If (Size of array:C274(SD2_al_RecordID)>0)
			If (SD2_al_RecordID{1}=0)
				$_l_ArraySize:=Size of array:C274(SD2_at_InviteeEmailAddress)
				If ($_l_ArraySize>0)
					$_bo_DeleteRow1:=True:C214
					If (SD2_at_InviteeEmailAddress{1}#"")
						//here should validate the format
						
						Gen_Confirm("This email address is not a daybook contact. Do you want to send the email to a non Daybook contact?"; "No"; "Yes")
						If (OK=0)
							SD2_al_RecordID{1}:=-999
							$_bo_DeleteRow1:=False:C215
						End if 
						OK:=1
					End if 
					If ($_bo_DeleteRow1)
						LISTBOX DELETE ROWS:C914(SD_lb_EventInvites; 1)
					End if 
					
					If (False:C215)
						DELETE FROM ARRAY:C228(SD2_at_ContCompany; $_l_ArraySize)
						DELETE FROM ARRAY:C228(SD2_at_InviteeEmailAddress; $_l_ArraySize)
						DELETE FROM ARRAY:C228(SD2_at_Invitees; $_l_ArraySize)
						DELETE FROM ARRAY:C228(SD2_at_InviteeStatus; $_l_ArraySize)
						DELETE FROM ARRAY:C228(SD2_al_InviteeStatus; $_l_ArraySize)
						DELETE FROM ARRAY:C228(SD2_al_InviteeClass; $_l_ArraySize)
						DELETE FROM ARRAY:C228(SD2_at_inviteeClass; $_l_ArraySize)
						DELETE FROM ARRAY:C228(SD2_al_RecordID; $_l_ArraySize)
					End if 
				End if 
			End if 
		End if 
		
		
	: ($_l_event=On Deactivate:K2:10)  //added 29/07/08 -kmw (this is to mimic what happens in entourage window when email adress add window loses focus)
		If (Frontmost process:C327#SD2_l_EmailChoiceProc)  //changed back to how it was....| (True)  `changed to always do this if lose focus  -10/12/08 -v631b120k -kmw
			If (SD2_l_EmailChoiceProc>0)  //Tell the process to end
				
				
				
				
				
				
				SET PROCESS VARIABLE:C370(SD2_l_EmailChoiceProc; DOC_l_CallEvent; 1)
				POST OUTSIDE CALL:C329(SD2_l_EmailChoiceProc)
			End if 
			
			If (SD2_l_Searchprocess>0)
				SET PROCESS VARIABLE:C370(SD2_l_Searchprocess; SD2_l_StopSearch; 1)
			End if 
			CANCEL:C270
			//ACCEPT  `added 29/07/08 -kmw (this is to mimic what happens in entourage window when email adress add window loses focus)
			//NG this needs to also close the 'pop-up window
			
		Else 
			
		End if 
	: ($_l_event=On Outside Call:K2:11)
		
		
		
		
		If (SD2_l_EmailCalledback>0)
			Case of 
				: (SD2_l_EmailCalledback=1)
					//User selected in the sub processes
					If (SD2_l_EmailChoiceProc>0)
						SD2_al_CallBackReceived:=False:C215
						GET PROCESS VARIABLE:C371(SD2_l_EmailChoiceProc; SD2_l_LastSelected; SD2_l_SelectedInSubprocess)
						SET PROCESS VARIABLE:C370(SD2_l_EmailChoiceProc; DOC_l_CallEvent; 4)
						POST OUTSIDE CALL:C329(SD2_l_EmailChoiceProc)
						$_l_Retries:=0
						While (SD2_al_CallBackReceived=False:C215)
							$_l_Retries:=$_l_Retries+1
							DelayTicks(2*$_l_Retries)
						End while 
						
						If (SD2_l_SelectedInSubprocess>0)
							$_al_ContactTypeSelect:=SD2_al_ContactTypeSelect{SD2_l_SelectedInSubprocess}
							SD2_at_InviteeStatus{SD2_l_EditingRow}:="Not Sent"
							If (SD2_at_ContactEmailSelect{SD2_l_SelectedInSubprocess}="No EMAIL")
								Gen_Alert("There is no email address for "+SD2_at_ContactNamesSelect{SD2_l_SelectedInSubprocess}+", please enter an email address to send to."; "Continue")
								//```
								$_t_EmailAddress:=Gen_Request("Email address"; "")
								If (OK=1)
									
									//test the format of the address
									$_l_AtPosition:=(Position:C15(Char:C90(64); $_t_EmailAddress))
									If ($_l_AtPosition=0)
										Gen_Alert("Sorry that is not a valid email address")
										$_t_EmailAddress:=""
									Else 
										SD2_at_InviteeEmailAddress{SD2_l_EditingRow}:=$_t_EmailAddress
										Gen_Confirm("Would you like to save that email address for "+SD2_at_ContactNamesSelect{SD2_l_SelectedInSubprocess}; "Yes"; "No")
										If (OK=1)
											If ($_al_ContactTypeSelect=1)
												$_bo_ReadOnly:=Read only state:C362([CONTACTS:1])
												READ WRITE:C146([CONTACTS:1])
												QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_ContactsSelect{SD2_l_SelectedInSubprocess})
												LOAD RECORD:C52([CONTACTS:1])
												$_bo_OK:=False:C215
												$_l_Repeats:=0
												$_l_Delay:=1
												$_bo_GetOut:=False:C215
												Repeat 
													$_l_Repeats:=$_l_Repeats+1
													$_bo_OK:=Check_Locked(->[CONTACTS:1]; 1)
													If (Not:C34($_bo_OK))
														If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
															//only increase every 10 tries
															Gen_Alert("Record is locked and cannot be updated at the moment")
															$_bo_GetOut:=True:C214
															$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
															
															
														End if 
														DelayTicks(2*$_l_Delay)
													End if 
												Until ($_bo_OK=True:C214) | ($_bo_GetOut)
												If (Not:C34($_bo_GetOut))
													[CONTACTS:1]Email_Address:35:=$_t_EmailAddress
													DB_SaveRecord(->[CONTACTS:1])
													UNLOAD RECORD:C212([CONTACTS:1])
													If ($_bo_ReadOnly)  //table was in reead only return it to that
														
														
														READ ONLY:C145([CONTACTS:1])
													End if 
													LOAD RECORD:C52([CONTACTS:1])
												End if 
											Else 
												//personnel
												$_bo_ReadOnly:=Read only state:C362([PERSONNEL:11])
												READ WRITE:C146([PERSONNEL:11])
												QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=SD2_at_ContactNamesSelect{SD2_l_SelectedInSubprocess})
												LOAD RECORD:C52([PERSONNEL:11])
												$_bo_OK:=False:C215
												$_l_Repeats:=0
												$_l_Delay:=1
												$_bo_GetOut:=False:C215
												Repeat 
													$_l_Repeats:=$_l_Repeats+1
													$_bo_OK:=Check_Locked(->[PERSONNEL:11]; 1)
													If (Not:C34($_bo_OK))
														If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
															//only increase every 10 tries
															Gen_Alert("Record is locked and cannot be updated at the moment")
															$_bo_GetOut:=True:C214
															$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
															
															
														End if 
														DelayTicks(2*$_l_Delay)
													End if 
												Until ($_bo_OK=True:C214) | ($_bo_GetOut)
												If (Not:C34($_bo_GetOut))
													[PERSONNEL:11]Email_Address:36:=$_t_EmailAddress
													DB_SaveRecord(->[PERSONNEL:11])
													UNLOAD RECORD:C212([PERSONNEL:11])
													If ($_bo_ReadOnly)  //table was in reead only return it to that
														
														
														READ ONLY:C145([PERSONNEL:11])
													End if 
													LOAD RECORD:C52([PERSONNEL:11])
													
												End if 
												
											End if 
											
										End if 
									End if 
								Else 
									
								End if 
								//``
							Else 
								SD2_at_InviteeEmailAddress{SD2_l_EditingRow}:=SD2_at_ContactEmailSelect{SD2_l_SelectedInSubprocess}
							End if 
							SD2_al_InviteeClass{SD2_l_EditingRow}:=$_al_ContactTypeSelect
							Case of 
								: ($_al_ContactTypeSelect=1)
									SD2_at_inviteeClass{SD2_l_EditingRow}:="Contact"
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_ContactsSelect{SD2_l_SelectedInSubprocess})
									SD2_al_RecordID{SD2_l_EditingRow}:=[CONTACTS:1]x_ID:33
								Else 
									SD2_at_inviteeClass{SD2_l_EditingRow}:="Internal Contact"
									$_t_Name:=Replace string:C233(SD2_at_ContactNamesSelect{SD2_l_SelectedInSubprocess}; "(Internal)"; "")
									QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$_t_Name)
									SD2_al_RecordID{SD2_l_EditingRow}:=[PERSONNEL:11]Personnel_ID:48
							End case 
							SD2_at_Invitees{SD2_l_EditingRow}:=SD2_at_ContactNamesSelect{SD2_l_SelectedInSubprocess}
							
						Else 
							
							
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_ContactsSelect{SD2_l_SelectedInSubprocess})
							SD2_al_RecordID{SD2_l_EditingRow}:=[CONTACTS:1]x_ID:33
						End if 
						$_t_ContactCode:=SD2_at_ContactsSelect{SD2_l_SelectedInSubprocess}
						//SD2_al_RecordID{}  ````
						
						
						//DELETE ELEMENT(SD2_al_RecordID;$_l_ArraySize)
						ARRAY TEXT:C222(SD2_at_ContactsSelect; 0)
						ARRAY TEXT:C222(SD2_at_ContactNamesSelect; 0)
						ARRAY TEXT:C222(SD2_at_ContactEmailSelect; 0)
						ARRAY LONGINT:C221(SD2_al_ContactTypeSelect; 0)
						If (SD2_l_EmailChoiceProc>0)
							SET PROCESS VARIABLE:C370(SD2_l_EmailChoiceProc; DOC_l_CallEvent; 1)
							POST OUTSIDE CALL:C329(SD2_l_EmailChoiceProc)
						End if 
					End if 
				: (SD2_l_EmailCalledback=2)
					SD2_l_EmailCalledback:=0
					GOTO OBJECT:C206(SD_lb_EventInvites)
					EDIT ITEM:C870(SD2_at_InviteeEmailAddress; 1)
					//EDIT ITEM(SD_lb_EventInvites;1)
					
					//******** removed/moved to outside check for positive value (obviously it was never going to get called) 20/10/08 v631b120a -kmw ****
					//: (SD2_l_EmailCalledBack=-99)
					//LBI_Scrollonresize (->SD_lb_People)
					//SD2_l_EmailCalledBack:=0
					//SET TIMER(0)
					//*************************************************************************************************************************************
			End case 
			
		End if 
		//***************************************** added/moved to here  20/10/08 v631b120a -kmw *********************************************
		If (SD2_l_EmailCalledback<0)
			Case of 
				: (SD2_l_EmailCalledBack=-99)
					LBI_Scrollonresize(->SD_lb_People)
					SD2_l_EmailCalledBack:=0
					SET TIMER:C645(0)
				Else 
					
			End case 
		End if 
		//*******************************************************************************************************************************************
		SD2_l_EmailCalledback:=0
		
		
		BRING TO FRONT:C326(Current process:C322)  //trying to correct problem with "on deactivate" not always gettign triggered (this it seems to help it recognise an on deactivate) -10/12/08 -v631b120k -kmw
		
		
		
		
	: ($_l_event=On Timer:K2:25)
		
		
		
		
		
		
		
		
		
		
		
		If (Not:C34(SD2_bo_FindActive))
			If (SD2_l_Onetime=0)
				
				SET TIMER:C645(0)
			Else 
				BRING TO FRONT:C326(Current process:C322)
				SD2_l_Onetime:=SD2_l_Onetime-1
				
			End if 
			If (Current process:C322#Frontmost process:C327(*))
				$_bo_BringtoFront:=True:C214
				$_l_FirstRow:=Find in array:C230(<>PRC_al_ProcessNum; Frontmost process:C327(*))
				If ($_l_FirstRow>0)
					If (<>PRC_al_WindowReference{$_l_FirstRow}=0)
						$_bo_BringtoFront:=False:C215
					End if 
				Else 
					$_bo_BringtoFront:=False:C215
				End if 
				
				If (SD2_l_Searchprocess>0)
					If (SD2_l_Searchprocess=Frontmost process:C327(*))
						$_bo_BringtoFront:=False:C215
					End if 
				End if 
				If (SD2_l_EmailChoiceProc>0)
					If (Frontmost process:C327(*)=SD2_l_EmailChoiceProc)
						$_bo_BringtoFront:=False:C215
					End if 
				End if 
				If ($_bo_BringtoFront)
					BRING TO FRONT:C326(Current process:C322)
				End if 
			End if 
			
		Else 
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (SD2_l_winLeft#$_l_WindowLeft) | ($_l_windowTop#SD2_l_winTop)
				SD2_l_winLeft:=$_l_WindowLeft
				SD2_l_winTop:=$_l_windowTop
				
				If (SD2_l_EmailChoiceProc>0)  //Tell the process to end
					
					
					SET PROCESS VARIABLE:C370(SD2_l_EmailChoiceProc; DOC_l_CallEvent; 5)
					POST OUTSIDE CALL:C329(SD2_l_EmailChoiceProc)
					SD2_l_EmailChoiceProc:=0
				End if 
			End if 
			If (Current process:C322#Frontmost process:C327(*))
				
				$_bo_BringtoFront:=True:C214
				$_l_FirstRow:=Find in array:C230(<>PRC_al_ProcessNum; Frontmost process:C327(*))
				If ($_l_FirstRow>0)
					If (<>PRC_al_WindowReference{$_l_FirstRow}=0)
						$_bo_BringtoFront:=False:C215
					End if 
				Else 
					$_bo_BringtoFront:=False:C215
				End if 
				
				If (SD2_l_Searchprocess>0)
					If (SD2_l_Searchprocess=Frontmost process:C327(*))
						$_bo_BringtoFront:=False:C215
					End if 
				End if 
				If (SD2_l_EmailChoiceProc>0)
					If (Frontmost process:C327(*)=SD2_l_EmailChoiceProc)
						$_bo_BringtoFront:=False:C215
					End if 
				End if 
				If ($_bo_BringtoFront)
					BRING TO FRONT:C326(Current process:C322)
				End if 
			End if 
		End if 
		
		SRCH_r_Timer:=Current time:C178*1
		If (SRCH_r_TimerOLD>0)
			If (SRCH_r_Timer>(SRCH_r_TimerOLD+1)) & (SRCH_t_SearchValue=SRCH_t_SearchValueOLD)
				//SET TIMER(0)
				SD2_bo_FindActive:=False:C215
				
				If (SRCH_t_SearchValue#"")
					If (SRCH_T_ParamPassed#SRCH_t_SearchValue)
						If (SD2_l_Searchprocess>0)
							SET PROCESS VARIABLE:C370(SD2_l_Searchprocess; SD2_l_StopSearch; 1)
						End if 
						$_l_Retries:=0
						While (Test semaphore:C652("$SD2_SearchGettingAnswer"))
							$_l_Retries:=$_l_Retries+1
							DelayTicks(2*$_l_Retries)
						End while 
						ARRAY TEXT:C222(SD2_at_FoundNameCode; 0)
						ARRAY TEXT:C222(SD2_at_FoundNames; 0)
						ARRAY LONGINT:C221(SD2_al_FoundNameID; 0)
						ARRAY LONGINT:C221(SD2_al_FoundNameCLass; 0)
						ARRAY TEXT:C222(SD2_at_FoundDataInfo; 0)
						ARRAY LONGINT:C221(SD2_al_FoundNameCLass; 0)
						ARRAY TEXT:C222(Sd2_at_FoundNameCompany; 0)
						ARRAY LONGINT:C221(SD2_al_FoundNameCLass; 0)
						ARRAY BOOLEAN:C223(SD2_abo_FoundNameSelect; 0)
						SD2_l_Searchprocess:=New process:C317("SD2_PersonAddQueryProcess"; 128000; "Searching"; SRCH_t_SearchValue; SD2_t_SearchCriteria; Current process:C322)
						//SRCH_t_SearchValueOLD:=""
						SRCH_T_ParamPassed:=SRCH_t_SearchValue
						If (False:C215)
							
							SD2_PersonAddSearch(SRCH_t_SearchValue; ->SD2_at_FoundNameCode; ->SD2_at_FoundNames; ->SD2_al_FoundNameID; ->SD2_at_FoundDataInfo; ->Sd2_at_FoundNameCompany)
							
							//ARRAY LONGINT(SD2_al_FoundNameCLass;Size of array(SD2_at_FoundNameCode))
							//ARRAY BOOLEAN(SD2_abo_FoundNameSelect;Size of array(SD2_at_FoundNameCode))
							LBI_Scrollonresize(->SD_lb_People)
						End if 
						
						
						//NOTE TO SELF: kmw 17/10/08 scroll bars not being set....i can see its disabled above so add with caution but i need to do some kind of ... LBI_Scrollonresize (->SD_lb_EventInvites)
						//NOTE TO SELF: - eventually found (and corrected the problem with why it wasn't working) the functionality that does an outside call back into this process from the search process and tells this process to re-size/recheck the scroll bars (does it this way because it needs to wait until new search completed and arrays updated before updating scrollbars)
					End if 
				Else 
					
				End if 
				
			Else 
				
				
				If (SRCH_t_SearchValueOLD#SRCH_t_SearchValue)
					
					SRCH_r_TimerOLD:=SRCH_r_Timer
				End if 
			End if 
			SRCH_t_SearchValueOLD:=SRCH_t_SearchValue
		Else 
			SRCH_r_TimerOLD:=SRCH_r_Timer
			SRCH_t_SearchValueOLD:=SRCH_t_SearchValue
		End if 
		
		
		//BRING TO FRONT(Current process)  `trying to correct problem with "on deactivate" not always gettign triggered (this it seems to help it recognise an on deactivate) -10/12/08 -v631b120k -kmw
		
		
End case 
ERR_MethodTrackerReturn("FM:SD2_PersonAdd"; $_t_oldMethodName)  //added error tracker call 08/07/08 -kmw
