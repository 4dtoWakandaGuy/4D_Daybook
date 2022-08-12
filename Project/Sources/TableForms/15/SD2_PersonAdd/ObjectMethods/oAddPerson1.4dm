If (False:C215)
	//object Name: [USER]SD2_PersonAdd.oAddPerson1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_lb_EventInvites;0)
	//ARRAY LONGINT(SD2_al_InviteeStatus;0)
	//ARRAY LONGINT(SD2_al_InviteStati;0)
	//ARRAY LONGINT(SD2_al_RecordID;0)
	//ARRAY TEXT(SD2_at_InviteeEmailAddress;0)
	//ARRAY TEXT(SD2_at_InviteeEmailOption;0)
	//ARRAY TEXT(SD2_at_InviteeStatus;0)
	//ARRAY TEXT(SD2_at_InviteStati;0)
	C_LONGINT:C283($_l_event; $_l_InviteRow; $_l_SizeofArray; SD_l_InviteeContext; SD2_l_SelectedAdressee)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_PersonAdd.oAddPerson1"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (Size of array:C274(SD2_al_RecordID)>0)
			If (SD2_al_RecordID{1}=0)
				LISTBOX DELETE ROWS:C914(SD_lb_EventInvites; 1)
			End if 
			If (Size of array:C274(SD2_al_RecordID)>0)
				$_l_SizeofArray:=Size of array:C274(SD2_at_InviteeEmailAddress)
				If (SD2_al_RecordID{$_l_SizeofArray}=0)
					LISTBOX DELETE ROWS:C914(SD_lb_EventInvites; $_l_SizeofArray)
				End if 
			End if 
			
		End if 
		$_l_SizeofArray:=Size of array:C274(SD2_at_InviteeEmailAddress)
		LISTBOX INSERT ROWS:C913(SD_lb_EventInvites; $_l_SizeofArray+1)
		Case of 
			: (SD_l_InviteeContext=0)  //Diary_Invites
				
			: (SD_l_InviteeContext=1)  //email
				If ($_l_SizeofArray>1)
					SD2_at_InviteeEmailOption{$_l_SizeofArray+1}:=SD2_at_InviteeEmailOption{$_l_SizeofArray}
				Else 
					SD2_at_InviteeEmailOption{$_l_SizeofArray+1}:="To"
				End if 
		End case 
		Case of 
			: (SD_l_InviteeContext=0)
				//SD2_at_InviteeStatus;->SD2_al_InviteeStatus
				$_l_InviteRow:=Find in array:C230(SD2_al_InviteStati; 1)
				If ($_l_InviteRow>0)
					SD2_al_InviteeStatus{$_l_SizeofArray+1}:=1
					SD2_at_InviteeStatus{$_l_SizeofArray+1}:=SD2_at_InviteStati{$_l_InviteRow}
				End if 
			: (SD_l_InviteeContext=1)
				SD2_al_InviteeStatus{$_l_SizeofArray+1}:=0
				SD2_at_InviteeStatus{$_l_SizeofArray+1}:="Not Sent"
		End case 
		
		GOTO OBJECT:C206(SD_lb_EventInvites)
		EDIT ITEM:C870(SD2_at_InviteeEmailAddress; $_l_SizeofArray+1)
		SD2_l_SelectedAdressee:=$_l_SizeofArray+1
		
		LBI_Scrollonresize(->SD_lb_EventInvites)  //added 20/10/08 v631b120a -kmw
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_PersonAdd.oAddPerson1"; $_t_oldMethodName)
