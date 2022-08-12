If (False:C215)
	//Table Form Method Name: [CONTACTS]Contact_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/11/2012 05:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CON_lb_FurtherAnalysis;0)
	//ARRAY TEXT(COM_at_CompanyNames;0)
	C_BOOLEAN:C305(DB_bo_hasScrollBars; DB_bo_NoLoad)
	C_LONGINT:C283($_l_Combottom; $_l_ComLeft; $_l_ComObjectBottom2; $_l_ComObjectLeft2; $_l_COmObjectRight2; $_l_ComObjectTop2; $_l_ComRight; $_l_ComTop; $_l_event; $_l_ExpBottom; $_l_ExpBottom2)
	C_LONGINT:C283($_l_ExpLeft; $_l_ExpLeft2; $_l_ExpRight; $_l_ExpRight2; $_l_ExpTop; $_l_ExpTop2; $_l_FAbottom; $_l_FALeft; $_l_FARight; $_l_FATop; $_l_Height1)
	C_LONGINT:C283($_l_Height2; $_l_MainPageTabBottom; $_l_MainPageTabLeft; $_l_MainPageTabRight; $_l_MainPageTabTop; $_l_Middle; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectBottom3; $_l_ObjectLeft2; $_l_ObjectLeft3)
	C_LONGINT:C283($_l_ObjectRight2; $_l_ObjectRight3; $_l_ObjectTop2; $_l_ObjectTop3; $_l_offset; $_l_SaveBottom; $_l_SaveLeft; $_l_SaveRight; $_l_SaveTop; $_l_WindowBottom; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRight; $_l_WindowTop; B_ClipboardButton; CON_l_SubInfoProcess; WS_l_Bdetail; WS_l_Bname)
	C_PICTURE:C286(COM_pic_ClipBoardPICT)
	C_TEXT:C284(<>Forename; <>Surname; $_t_oldMethodName; CON_t_DisplayType; WS_t_Label1; WS_t_Label2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS].Contact_In"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Resize:K2:27)
		If (True:C214) & (Current form window:C827=Frontmost window:C447)
			
			//This is not an applicant contact
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			If (DB_bo_hasScrollBars)
				$_l_WindowRight:=$_l_WindowRight-20
				$_l_WindowBottom:=$_l_WindowBottom-20
			End if 
			$_l_Middle:=Int:C8(($_l_WindowRight-$_l_WindowLeft)/2)
			OBJECT GET COORDINATES:C663(*; "aContactTabPages"; $_l_MainPageTabLeft; $_l_MainPageTabTop; $_l_MainPageTabRight; $_l_MainPageTabBottom)
			
			OBJECT GET COORDINATES:C663(*; "oOmitFromMailings"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
			
			OBJECT GET COORDINATES:C663(*; "oFAGroupBox"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			OBJECT GET COORDINATES:C663(*; "oLBFurtherAnalysis"; $_l_FALeft; $_l_FATop; $_l_FARight; $_l_FAbottom)
			
			OBJECT GET COORDINATES:C663(*; "oCommentGroupBox"; $_l_ComObjectLeft2; $_l_ComObjectTop2; $_l_COmObjectRight2; $_l_ComObjectBottom2)
			OBJECT GET COORDINATES:C663(*; "oComments"; $_l_ComLeft; $_l_ComTop; $_l_ComRight; $_l_Combottom)
			
			OBJECT GET COORDINATES:C663(*; "oSaveButton"; $_l_SaveLeft; $_l_SaveTop; $_l_SaveRight; $_l_SaveBottom)
			
			OBJECT SET COORDINATES:C1248(*; "aContactTabPages"; $_l_MainPageTabLeft; $_l_MainPageTabTop; ($_l_MainPageTabLeft+($_l_WindowRight-$_l_WindowLeft))-$_l_MainPageTabLeft; $_l_SaveTop-4)
			
			OBJECT SET COORDINATES:C1248(*; "oFurtherAnalButton"; $_l_ObjectLeft2+10; $_l_ObjectBottom3+10; $_l_ObjectLeft2+120; $_l_ObjectBottom3+25)
			OBJECT SET COORDINATES:C1248(*; "oFAGroupBox"; $_l_ObjectLeft2; $_l_ObjectBottom3+10; $_l_Middle-5; $_l_SaveTop-5)
			OBJECT SET COORDINATES:C1248(*; "oLBFurtherAnalysis"; $_l_FALeft; $_l_FATop; $_l_Middle-6; $_l_SaveTop-5)
			
			
			OBJECT SET COORDINATES:C1248(*; "oCommentGroupBox"; $_l_Middle+5; $_l_ObjectBottom3+10; (($_l_MainPageTabLeft+($_l_WindowRight-$_l_WindowLeft))-$_l_MainPageTabLeft)-10; $_l_SaveTop-5)
			OBJECT SET COORDINATES:C1248(*; "oComments"; $_l_Middle+10; $_l_ComTop; (($_l_MainPageTabLeft+($_l_WindowRight-$_l_WindowLeft))-$_l_MainPageTabLeft)-25; $_l_SaveTop-5)
			$_l_offset:=488-463
			OBJECT SET COORDINATES:C1248(*; "oContactViewTabs"; $_l_MainPageTabLeft; $_l_ObjectBottom3+10; ($_l_MainPageTabLeft+($_l_WindowRight-$_l_WindowLeft))-($_l_MainPageTabLeft+10); $_l_SaveTop-5)
			OBJECT SET COORDINATES:C1248(*; "oContactEditModeDropDown"; $_l_MainPageTabLeft+4; $_l_ObjectBottom3+10+$_l_offset; $_l_MainPageTabLeft+4+16; $_l_ObjectBottom3+10+$_l_offset+16)
			OBJECT SET COORDINATES:C1248(*; "oContactEditModePicture"; $_l_MainPageTabLeft+4; $_l_ObjectBottom3+10+$_l_offset; $_l_MainPageTabLeft+4+16; $_l_ObjectBottom3+10+$_l_offset+16)
			$_l_offset:=506-463
			
			OBJECT SET COORDINATES:C1248(*; "oContactsRelated"; $_l_MainPageTabLeft+5; $_l_ObjectBottom3+10+$_l_offset; ($_l_MainPageTabLeft+($_l_WindowRight-$_l_WindowLeft))-($_l_MainPageTabLeft+10); $_l_SaveTop-6)
			
			
			OBJECT GET COORDINATES:C663(*; "oShowExport"; $_l_ExpLeft; $_l_ExpTop; $_l_ExpRight; $_l_ExpBottom)
			$_l_Height1:=$_l_ExpBottom-$_l_ExpTop
			OBJECT GET COORDINATES:C663(*; "oContactexport"; $_l_ExpLeft2; $_l_ExpTop2; $_l_ExpRight2; $_l_ExpBottom2)
			$_l_Height2:=$_l_ExpBottom2-$_l_ExpTop2
			OBJECT SET COORDINATES:C1248(*; "oShowExport"; $_l_ExpLeft; $_l_SaveTop; $_l_ExpRight; $_l_SaveTop+$_l_Height1)
			OBJECT SET COORDINATES:C1248(*; "oContactexport"; $_l_ExpLeft2; $_l_SaveTop; $_l_ExpRight2; $_l_SaveTop+$_l_Height2)
			
			
			//$_l_ObjectBottom:=Gen_SetobjectPositionByname("oCommentGroupBox"; $_l_ObjectBottom3+7; 0; ($_l_WindowBottom-$_l_WindowTop)-85)
			//$_l_ObjectBottom:=Gen_SetObjectPosition(->[CONTACTS]Comments; $_l_ObjectBottom3+80; $_l_ObjectLeft2+7; $_l_ObjectBottom-8; $_l_ObjectRight2-28)
			
			
			
			
		End if 
		
	: ($_l_event=On Header:K2:17)  // | ($_l_event=On Resize )
		
		Case of 
				
			: (Is macOS:C1572)
				
				OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; True:C214)
				
		End case 
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		CREATE EMPTY SET:C140([CONTACTS:1]; "Rejected2")
		OpenHelp(Table:C252(->[CONTACTS:1]); "Contact_In")
		//GET PICTURE FROM LIBRARY(22566; COM_pic_ClipBoardPICT)
		COM_pic_ClipBoardPICT:=Get_Picture(22566)
		OBJECT SET VISIBLE:C603(COM_pic_ClipBoardPICT; True:C214)
		OBJECT SET VISIBLE:C603(B_ClipboardButton; True:C214)
		//_O_ENABLE BUTTON(B_ClipBoardButton)
		OBJECT SET ENABLED:C1123(B_ClipBoardButton; True:C214)
		//OBJECT SET VISIBLE(WS_t_Label1;True)
		//OBJECT SET TITLE(*;"oContactNameLabel";WS_t_Label1)
		//OBJECT SET VISIBLE(WS_t_Label2;False)
		//OBJECT SET VISIBLE(<>Forename;False)
		//OBJECT SET VISIBLE(<>Surname;False)
		OBJECT SET VISIBLE:C603([CONTACTS:1]Title:3; False:C215)
		OBJECT SET VISIBLE:C603([CONTACTS:1]Forename:4; False:C215)
		OBJECT SET VISIBLE:C603([CONTACTS:1]Surname:5; False:C215)
		//_O_DISABLE BUTTON(WS_l_Bname)
		
		OBJECT SET ENABLED:C1123(*; "oNameButton"; False:C215)
		OBJECT SET ENABLED:C1123(*; "odetailButton"; True:C214)
		WS_t_Label1:="Name"
		WS_t_Label2:="Title"
		OBJECT SET TITLE:C194(*; "oContactNameLabel"; WS_t_Label1+" :")
		OBJECT SET TITLE:C194(*; "oContactForenameLabel"; <>Forename+" :")
		OBJECT SET TITLE:C194(*; "oContactSurnamLabel"; <>Surname+" :")
		OBJECT SET VISIBLE:C603(*; "oContactForenameLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oContactSurnamLabel"; False:C215)
		
		//OBJECT SET ENTERABLE(WS_t_Label1;False)
		//OBJECT SET ENTERABLE(WS_t_Label2;False)
		
		WS_AutoscreenSize(1; 384; 650; Table name:C256(->[CONTACTS:1])+"_"+"Contact_In")
		INT_SetInput(Table:C252(->[CONTACTS:1]); "Contact_In")
		
		SD2_SetDiaryPopup
		
	: ($_l_event=On Display Detail:K2:22)
	: ($_l_event=On Deactivate:K2:10)
		If (Current form window:C827=Frontmost window:C447)
			If (CON_t_DisplayType#"ContactApplic")
				//This is not an applicant contact
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				OBJECT GET COORDINATES:C663([CONTACTS:1]Omit:20; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
				OBJECT GET COORDINATES:C663(*; "oFAGroupBox"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_ObjectBottom:=Gen_SetobjectPositionByname("oFAGroupBox"; $_l_ObjectBottom3+7; 0; ($_l_WindowBottom-$_l_WindowTop)-35)
				$_l_ObjectBottom:=Gen_SetObjectPosition(->CON_lb_FurtherAnalysis; $_l_ObjectBottom3+26; $_l_ObjectLeft2+3; $_l_ObjectBottom-3; $_l_ObjectRight2-3)
				OBJECT GET COORDINATES:C663(*; "oCommentGroupBox"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_ObjectBottom:=Gen_SetobjectPositionByname("oCommentGroupBox"; $_l_ObjectBottom3+7; 0; ($_l_WindowBottom-$_l_WindowTop)-35)
				$_l_ObjectBottom:=Gen_SetObjectPosition(->[CONTACTS:1]Comments:10; $_l_ObjectBottom3+30; $_l_ObjectLeft2+7; $_l_ObjectBottom-8; $_l_ObjectRight2-28)
				
			Else 
				FORM GOTO PAGE:C247(2)
				//This is not an applicant contact
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				OBJECT GET COORDINATES:C663(*; "oCON_ApplicLabBankOTH"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
				OBJECT GET COORDINATES:C663(*; "oFAGroupBox"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_ObjectBottom:=Gen_SetobjectPositionByname("oFAGroupBox"; $_l_ObjectBottom3+7; 0; ($_l_WindowBottom-$_l_WindowTop)-35)
				$_l_ObjectBottom:=Gen_SetObjectPosition(->CON_lb_FurtherAnalysis; $_l_ObjectBottom3+26; $_l_ObjectLeft2+3; $_l_ObjectBottom-3; $_l_ObjectRight2-3)
				OBJECT GET COORDINATES:C663(*; "oCommentGroupBox"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_ObjectBottom:=Gen_SetobjectPositionByname("oCommentGroupBox"; $_l_ObjectBottom3+7; 0; ($_l_WindowBottom-$_l_WindowTop)-35)
				$_l_ObjectBottom:=Gen_SetObjectPosition(->[CONTACTS:1]Comments:10; $_l_ObjectBottom3+30; $_l_ObjectLeft2+7; $_l_ObjectBottom-8; $_l_ObjectRight2-28)
				
			End if 
			
			
		End if 
		If (CON_l_SubInfoProcess>0)
			If (Frontmost process:C327#CON_l_SubInfoProcess)
				HIDE PROCESS:C324(CON_l_SubInfoProcess)
			End if 
		End if 
	: ($_l_event=On Activate:K2:9)
		If (CON_l_SubInfoProcess>0)
			SHOW PROCESS:C325(CON_l_SubInfoProcess)
		End if 
		OpenHelp(Table:C252(->[CONTACTS:1]); "Contact_In")
		SD2_SetDiaryPopup
		
End case 
Contacts_InLP
ERR_MethodTrackerReturn("FM:Contact_In"; $_t_oldMethodName)
