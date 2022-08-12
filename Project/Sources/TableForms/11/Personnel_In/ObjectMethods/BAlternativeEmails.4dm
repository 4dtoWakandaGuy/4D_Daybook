If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.BAlternativeEmails
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_UniqueHostNames; 0)
	//ARRAY TEXT(PER_at_DefaultHostAddresses;0)
	//ARRAY TEXT(PER_at_EmailHostNames;0)
	C_BOOLEAN:C305($_bo_Appended)
	C_LONGINT:C283($_l_HostIndex; $_l_HostRow; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.BAlternativeEmails"; Form event code:C388)
//this button
//will allow additonal emails to be defined for this personnel
GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
OBJECT GET COORDINATES:C663([PERSONNEL:11]Email_Address:36; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
If ([PERSONNEL:11]Personnel_ID:48=0)
	[PERSONNEL:11]Personnel_ID:48:=AA_GetNextIDinMethod(->[PERSONNEL:11]Personnel_ID:48)
End if 
PER_EditEmails([PERSONNEL:11]Initials:1; [PERSONNEL:11]Personnel_ID:48; $_l_WindowLeft+$_l_ObjectLeft; $_l_WindowTop+$_l_ObjectBottom; $_l_WindowLeft+$_l_ObjectRight)
ARRAY TEXT:C222($_at_UniqueHostNames; 0)
If (Size of array:C274(PER_at_DefaultHostAddresses)>0)
	For ($_l_HostIndex; 1; Size of array:C274(PER_at_DefaultHostAddresses))
		If (PER_at_DefaultHostAddresses{$_l_HostIndex}#"")
			$_l_HostRow:=Find in array:C230($_at_UniqueHostNames; PER_at_DefaultHostAddresses{$_l_HostIndex})
			If ($_l_HostRow<0)
				APPEND TO ARRAY:C911($_at_UniqueHostNames; PER_at_DefaultHostAddresses{$_l_HostIndex})
			End if 
		End if 
	End for 
	If (Size of array:C274($_at_UniqueHostNames)>0)
		$_bo_Appended:=False:C215
		//there are some host names..check this agains stored host names
		PER_GetEmailHosts([PERSONNEL:11]Initials:1; [PERSONNEL:11]Personnel_ID:48)
		For ($_l_HostIndex; 1; Size of array:C274($_at_UniqueHostNames))
			
			$_l_HostRow:=Find in array:C230(PER_at_EmailHostNames; $_at_UniqueHostNames{$_l_HostIndex})
			If ($_l_HostRow<0)
				$_bo_Appended:=True:C214
				APPEND TO ARRAY:C911(PER_at_EmailHostNames; $_at_UniqueHostNames{$_l_HostIndex})
			End if 
			
		End for 
		If ($_bo_Appended)
			PER_SetEmailHosts([PERSONNEL:11]Initials:1; [PERSONNEL:11]Personnel_ID:48)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.BAlternativeEmails"; $_t_oldMethodName)
