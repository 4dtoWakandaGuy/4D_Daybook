If (False:C215)
	//object Name: Object Name:      DOC_AccessRights.oExit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/06/2012 10:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DOC_abo_GroupDeleteReport;0)
	//ARRAY BOOLEAN(DOC_abo_GroupEditReport;0)
	//ARRAY BOOLEAN(DOC_abo_GroupNoAccess;0)
	//ARRAY BOOLEAN(DOC_abo_GroupRunReport;0)
	//ARRAY BOOLEAN(DOC_abo_PersonDeleteReport;0)
	//ARRAY BOOLEAN(DOC_abo_PersonEditReport;0)
	//ARRAY BOOLEAN(DOC_abo_PersonNoAccess;0)
	//ARRAY BOOLEAN(DOC_abo_PersonRunReport;0)
	//ARRAY LONGINT(DOC_al_GroupAccessLevel;0)
	//ARRAY LONGINT(DOC_al_GroupIDS;0)
	//ARRAY LONGINT(DOC_Al_GroupsAccess;0)
	//ARRAY LONGINT(DOC_al_PersonAccess;0)
	//ARRAY LONGINT(DOC_al_PersonAccessLevel;0)
	//ARRAY LONGINT(DOC_al_PersonIDS;0)
	C_BOOLEAN:C305(Doc_bo_RightsEdit)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_access; $_l_Index; DOC_l_DOCUMENTOWNER)
	C_TEXT:C284($_t_oldMethodName; DOC_t_CurrentDocument)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DOC_AccessRights.oExit"; Form event code:C388)
If (Doc_bo_RightsEdit)
	Gen_Confirm("Save changes to access rights?"; "Yes"; "No")
	If (OK=1)
		If (DOC_l_DOCUMENTOWNER=0)
			Gen_Confirm("Do you want to set yourself as the owner of this document? (The Document owner and administrators always have rights to delete documents)"; "Yes"; "No")
			If (OK=1)
				DOC_l_DOCUMENTOWNER:=<>PER_l_CurrentUserID
			End if 
		End if 
		ARRAY LONGINT:C221(DOC_Al_GroupsAccess; 0)
		ARRAY LONGINT:C221(DOC_al_GroupAccessLevel; 0)
		ARRAY LONGINT:C221(DOC_al_PersonAccess; 0)
		ARRAY LONGINT:C221(DOC_al_PersonAccessLevel; 0)
		For ($_l_Index; 1; Size of array:C274(DOC_al_GroupIDS))
			$_l_access:=0
			If (DOC_abo_GroupNoAccess{$_l_Index})
				$_l_access:=$_l_access+1
			End if 
			If (DOC_abo_GroupRunReport{$_l_Index})
				$_l_access:=$_l_access+2
			End if 
			If (DOC_abo_GroupEditReport{$_l_Index})
				$_l_access:=$_l_access+4
			End if 
			If (DOC_abo_GroupDeleteReport{$_l_Index})
				$_l_access:=$_l_access+8
			End if 
			APPEND TO ARRAY:C911(DOC_Al_GroupsAccess; DOC_al_GroupIDS{$_l_Index})
			APPEND TO ARRAY:C911(DOC_al_GroupAccessLevel; $_l_access)
			
			
		End for 
		For ($_l_Index; 1; Size of array:C274(DOC_al_PersonIDS))
			$_l_access:=0
			If (DOC_abo_PersonNoAccess{$_l_Index})
				$_l_access:=$_l_access+1
			End if 
			If (DOC_abo_PersonRunReport{$_l_Index})
				$_l_access:=$_l_access+2
			End if 
			If (DOC_abo_PersonEditReport{$_l_Index})
				$_l_access:=$_l_access+4
			End if 
			If (DOC_abo_PersonDeleteReport{$_l_Index})
				$_l_access:=$_l_access+8
			End if 
			APPEND TO ARRAY:C911(DOC_al_PersonAccess; DOC_al_PersonIDS{$_l_Index})
			APPEND TO ARRAY:C911(DOC_al_PersonAccessLevel; $_l_access)
			
			
		End for 
		If (DOC_t_CurrentDocument#"")
			DOC_SaveAccess(DOC_t_CurrentDocument)
			
		Else 
			DOC_SaveAccess([DOCUMENTS:7]Document_Code:1)
			
		End if 
		CANCEL:C270
	Else 
		CANCEL:C270
	End if 
	
	
	
Else 
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("OBJ DOC_AccessRights.oExit"; $_t_oldMethodName)
