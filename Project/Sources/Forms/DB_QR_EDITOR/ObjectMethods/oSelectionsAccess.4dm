If (False:C215)
	//object Name: Object Name:      DB_QR_EDITOR.oSelectionsAccess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/06/2012 21:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(SEL_Accessselection)
	//ARRAY BOOLEAN(DB_lb_AvailableReports;0)
	//ARRAY LONGINT(DoC_al_DocumentAccess;0)
	//ARRAY LONGINT(DOC_al_GroupAccessLevel;0)
	//ARRAY LONGINT(DOC_Al_GroupsAccess;0)
	//ARRAY LONGINT(DOC_al_PersonAccessLevel;0)
	//ARRAY TEXT(DB_at_DocumentCodes;0)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_access; $_l_Access2; $_l_Column; $_l_GroupID; $_l_GroupRow; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_PersonRow)
	C_LONGINT:C283($_l_Row; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop)
	C_TEXT:C284(<>PER_t_UserGroup; $_t_oldMethodName; DOC_t_CurrentDocument)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_QR_EDITOR.oSelectionsAccess"; Form event code:C388)

LISTBOX GET CELL POSITION:C971(DB_lb_AvailableReports; $_l_Column; $_l_Row)
If ($_l_Row>0)
	//TRACE
	DOC_t_CurrentDocument:=DB_at_DocumentCodes{$_l_Row}
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	OBJECT GET COORDINATES:C663(SEL_Accessselection; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	Open window:C153($_l_WindowLeft+$_l_ObjectRight; $_l_windowTop+$_l_ObjectTop; $_l_WindowLeft+$_l_ObjectRight+587; $_l_windowTop+$_l_ObjectTop+220; Palette window:K34:3)
	DIALOG:C40("DOC_AccessRights")
	CLOSE WINDOW:C154
	//Update the preferences on display
	DOC_LoadAccess([DOCUMENTS:7]Document_Code:1)
	QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=<>PER_t_UserGroup)
	$_l_GroupID:=[PERSONNEL_GROUPS:92]x_ID:12
	$_l_GroupRow:=Find in array:C230(DOC_Al_GroupsAccess; $_l_GroupID)
	$_l_access:=0
	$_l_Access2:=0
	If ($_l_GroupRow>0)
		$_l_access:=DOC_al_GroupAccessLevel{$_l_GroupRow}
	End if 
	$_l_PersonRow:=Find in array:C230(DOC_al_PersonAccess; <>PER_l_CurrentUserID)
	If ($_l_PersonRow>0)
		$_l_Access2:=DOC_al_PersonAccessLevel{$_l_PersonRow}
	End if 
	If ($_l_Access2>0)
		If ($_l_Access2#$_l_access)
			$_l_access:=$_l_Access2
		End if 
	End if 
	If ($_l_access>1)
		DoC_al_DocumentAccess{$_l_Row}:=$_l_access
		
	Else 
		If ($_l_access=0)
			DoC_al_DocumentAccess{$_l_Row}:=$_l_access
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ DB_QR_EDITOR.oSelectionsAccess"; $_t_oldMethodName)
