If (False:C215)
	//object Name: [DIARY]SD2_DefScheduleEntry.oInvitees
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_lb_EventInvites;0)
	//ARRAY LONGINT(SD2_al_InviteeClass;0)
	//ARRAY LONGINT(SD2_al_RecordID;0)
	//ARRAY PICTURE(SD2_apic_InfoPic;0)
	//ARRAY TEXT(SD2_at_InviteeComb;0)
	//ARRAY TEXT(SD2_at_InviteeEmailAddress;0)
	//ARRAY TEXT(SD2_at_Invitees;0)
	C_LONGINT:C283($_l_ClickedColumn; $_l_CurrentWinRefOLD; $_l_event; $_l_FieldNumber; $_l_Index; $_l_Row; $_l_SIzeofArray; $_l_TableNumber; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_WindowTop; SD_l_InviteeContext; SD2_l_InviteeMode; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_PICTURE:C286($_pic_Picture)
	C_TEXT:C284($_t_ColumnVariable; $_t_oldMethodName; SD2_t_Minicompanycode; SD2_t_Minicontactcode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_DefScheduleEntry.oInvitees"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_ColumnVariable; $_l_TableNumber; $_l_FieldNumber)
		$_l_ClickedColumn:=LB_GetColumn(->SD_lb_EventInvites; $_t_ColumnVariable)
		Case of 
			: ($_l_ClickedColumn=1)
				$_l_Row:=Self:C308->
				If (SD2_al_RecordID{$_l_Row}#0)  //existing record
					Case of 
						: (SD2_al_InviteeClass{$_l_Row}=1)  // Contact
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=SD2_al_RecordID{$_l_Row})
							$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
							If (Is macOS:C1572)
								WIN_l_CurrentWinRef:=Open window:C153(40; 100; 100; 280+40; 34)
							Else 
								WIN_l_CurrentWinRef:=Open window:C153(40; 100; 100; 280+40; 32)
							End if 
							SD2_t_Minicontactcode:=[CONTACTS:1]Contact_Code:2
							
							DIALOG:C40([CONTACTS:1]; "CON_MiniInfo")
							WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
						: (SD2_al_InviteeClass{$_l_Row}=3)  // Company
							$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=SD2_al_RecordID{$_l_Row})
							If (Is macOS:C1572)
								
								WIN_l_CurrentWinRef:=Open window:C153(40; 100; 100; 280+40; 34)
							Else 
								WIN_l_CurrentWinRef:=Open window:C153(40; 100; 100; 280+40; 32)
								
							End if 
							SD2_t_Minicompanycode:=[COMPANIES:2]Company_Code:1
							
							DIALOG:C40([COMPANIES:2]; "COM_MiniView")
							WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
						: (SD2_al_InviteeClass{$_l_Row}=2)  //personnel
					End case 
				End if 
			: ($_l_ClickedColumn=3)
				$_l_Row:=Self:C308->
				//If (
				
		End case 
		//$ColumnClicked:=
	: ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_ColumnVariable; $_l_TableNumber; $_l_FieldNumber)
		$_l_ClickedColumn:=LB_GetColumn(->SD_lb_EventInvites; $_t_ColumnVariable)
		Case of 
			: ($_l_ClickedColumn#1)
				If (Not:C34([DIARY:12]Done:14))
					GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
					SD2_l_InviteeMode:=21  //Shows only the names not the sea
					SD_l_InviteeContext:=0  //Meeting invites
					$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
					If (Is macOS:C1572)  //kmw 17/10/08 v631b120a  -added AND false (disable use of this type of window here because it causes issues when used in this way elsewhere so be consistent with window type used elsewhere (and possibly it would cause issues here as well))
						WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft+20; $_l_WindowTop+10; $_l_WindowRight-50; $_l_WindowTop+10; 34)
					Else 
						
						WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft+20; $_l_WindowTop+10; $_l_WindowRight-50; $_l_WindowTop+10; 1984)
					End if 
					DIALOG:C40([USER:15]; "SD2_PersonAdd")
					CLOSE WINDOW:C154
					WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
					$_l_SIzeofArray:=Size of array:C274(SD2_at_Invitees)
					ARRAY TEXT:C222(SD2_at_InviteeComb; $_l_SIzeofArray)
					For ($_l_Index; 1; Size of array:C274(SD2_at_Invitees))
						If (SD2_at_InviteeEmailAddress{$_l_Index}#"")
							SD2_at_InviteeComb{$_l_Index}:=SD2_at_Invitees{$_l_Index}+"  <"+SD2_at_InviteeEmailAddress{$_l_Index}+">"
						Else 
							SD2_at_InviteeComb{$_l_Index}:=SD2_at_Invitees{$_l_Index}+"  <"+"(No Email)"+">"
						End if 
					End for 
					ARRAY PICTURE:C279(SD2_apic_InfoPic; Size of array:C274(SD2_at_InviteeComb))
					//GET PICTURE FROM LIBRARY(418; $_pic_Picture)
					$_pic_Picture:=Get_Picture(418)
					For ($_l_Index; 1; Size of array:C274(SD2_at_InviteeComb))
						SD2_apic_InfoPic{$_l_Index}:=$_pic_PIcture
					End for 
					SD2_SetInterface("SD2_DefScheduleEntry")
					
				End if 
				
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].SD2_DefScheduleEntry.oInvitees"; $_t_oldMethodName)
