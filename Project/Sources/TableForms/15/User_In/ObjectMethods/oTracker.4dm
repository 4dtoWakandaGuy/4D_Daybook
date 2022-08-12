If (False:C215)
	//object Name: [USER]User_In.oTracker
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/10/2012 06:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(USR_lb_UserToTrack;0)
	//ARRAY INTEGER(DM_ai_UserTrackActive;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_SelectedColumn; $_l_SelectedRow; $_l_TableNumber; DB_l_TrackPath)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oTracker"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_SelectedRow:=Self:C308->
		If ($_l_SelectedRow>0)
			$_l_SelectedColumn:=LB_GetColumn(->USR_lb_UserToTrack; $_t_VariableName)
			Case of 
				: ($_l_SelectedColumn=1)
					DM_ai_UserTrackActive{$_l_SelectedRow}:=Abs:C99(DM_ai_UserTrackActive{$_l_SelectedRow}-1)
					If (DB_l_TrackPath=0) & (DM_ai_UserTrackActive{$_l_SelectedRow}=1)
						DB_l_TrackPath:=1
					End if 
				: ($_l_SelectedColumn=2)
					DM_ai_UserTrackActive{$_l_SelectedRow}:=Abs:C99(DM_ai_UserTrackActive{$_l_SelectedRow}-1)
					If (DB_l_TrackPath=0) & (DM_ai_UserTrackActive{$_l_SelectedRow}=1)
						DB_l_TrackPath:=1
					End if 
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oTracker"; $_t_oldMethodName)
