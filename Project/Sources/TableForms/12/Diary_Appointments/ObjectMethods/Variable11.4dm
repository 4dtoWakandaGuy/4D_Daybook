If (False:C215)
	//object Name: [DIARY]Diary_Appointments.Variable11
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DIA_at_Access;0)
	C_BOOLEAN:C305(DIA_bo_AccessInited)
	C_LONGINT:C283($_l_PersonRow)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $User2; vUser2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_Appointments.Variable11"; Form event code:C388)
$User2:=vUser2
vUser2:=Substring:C12(Uppercase:C13(Gen_Request("Who:")); 1; 5)
If (OK=1)
	MESSAGES OFF:C175
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=vUser2; *)
	QUERY:C277([PERSONNEL:11];  | ; [PERSONNEL:11]Name:2=(vUser2+"@"))
	While ((Records in selection:C76([PERSONNEL:11])=0) & (OK=1))
		IDLE:C311  // 03/04/03 pb
		Gen_Confirm("That Person does not exist.  Try again?"; "Yes"; "No")
		If (OK=1)
			vUser2:=Substring:C12(Uppercase:C13(Gen_Request("Who:")); 1; 5)
			If (OK=1)
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=vUser2; *)
				QUERY:C277([PERSONNEL:11];  | ; [PERSONNEL:11]Name:2=(vUser2+"@"))
			End if 
		End if 
	End while 
	MESSAGES ON:C181
End if 
If (OK=1)
	vUser2:=[PERSONNEL:11]Initials:1
	If (Not:C34(DIA_bo_AccessInited))
		QUERY:C277([PERSONNEL_DIARY_ACCESS:149]; [PERSONNEL_DIARY_ACCESS:149]Person_Code:4=<>PER_t_CurrentUserInitials)
		ARRAY TEXT:C222(DIA_at_Access; 0)
		SELECTION TO ARRAY:C260([PERSONNEL_DIARY_ACCESS:149]Person:1; DIA_at_Access)
		DIA_bo_AccessInited:=True:C214
	End if 
	If ((Size of array:C274(DIA_bo_AccessInited)>0) & (vUser2#<>PER_t_CurrentUserInitials))
		$_l_PersonRow:=Find in array:C230(DIA_at_Access; vUser2)
	Else 
		$_l_PersonRow:=1
	End if 
	If ($_l_PersonRow>0)
		Diary_DateSrchR(0)
	Else 
		Gen_Alert("You do not have access to "+vUser2+"'s Diary"; "Cancel")
		vUser2:=$User2
	End if 
Else 
	vUser2:=$User2
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_Appointments.Variable11"; $_t_oldMethodName)
