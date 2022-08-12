If (False:C215)
	//object Name: [DIARY]SD2_DefScheduleEntry.oinviteButton
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
	//ARRAY PICTURE(SD2_apic_InfoPic;0)
	//ARRAY TEXT(SD2_at_InviteeComb;0)
	//ARRAY TEXT(SD2_at_InviteeEmailAddress;0)
	//ARRAY TEXT(SD2_at_Invitees;0)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_event; $_l_Index; $_l_SIzeofArray; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; SD_l_InviteeContext; SD2_l_InviteeMode; WIN_l_CurrentWinRef)
	C_LONGINT:C283(WIN_l_CurrentWinRefOLD)
	C_PICTURE:C286($_pic_PIcture)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_DefScheduleEntry.oinviteButton"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		SD2_l_InviteeMode:=1  //Shows only the names not the sea
		SD_l_InviteeContext:=0  //Meeting invites
		$_t_WindowTitle:=Get window title:C450
		SET WINDOW TITLE:C213("Edit Invitees(contacts and companies)")
		If (Is macOS:C1572)  //kmw 17/10/08 v631b120a  -added AND false (disable use of this type of window here because it causes issues when used in this way elsewhere so be consistent with window type used elsewhere (and possibly it would cause issues here as well))
			WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft+20; $_l_WindowTop+10; $_l_WindowRight-50; $_l_WindowTop+168; 34)
		Else 
			
			WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft+20; $_l_WindowTop+10; $_l_WindowRight-50; $_l_WindowTop+168; 1984)
		End if 
		
		DIALOG:C40([USER:15]; "SD2_PersonAdd")
		CLOSE WINDOW:C154
		SET WINDOW TITLE:C213($_t_WindowTitle)
		
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
		//GET PICTURE FROM LIBRARY(418; $_pic_PIcture)
		$_pic_Picture:=Get_Picture(418)
		For ($_l_Index; 1; Size of array:C274(SD2_at_InviteeComb))
			SD2_apic_InfoPic{$_l_Index}:=$_pic_PIcture
		End for 
		
		SD2_SetInterface("SD2_DefScheduleEntry")
		
		//ADD RECORD([USER])
		
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].SD2_DefScheduleEntry.oinviteButton"; $_t_oldMethodName)
