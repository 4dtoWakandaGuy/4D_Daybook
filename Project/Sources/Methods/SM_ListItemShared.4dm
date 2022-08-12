//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_ListItemShared
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/01/2011 18:27 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_SetitemsID;0)
	//ARRAY LONGINT(SM_al_SetUNIitemsID;0)
	//ARRAY TEXT(SM_at_SetContextitemOwnerIDs;0)
	C_LONGINT:C283($_l_UniversalRow; $1; SM_MAKESETUNIVERSAL)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_Owner; $_t_Shared)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_ListItemShared")
OBJECT SET ENABLED:C1123(SM_MAKESETUNIVERSAL; False:C215)

$_l_UniversalRow:=Find in array:C230(SM_al_SetUNIitemsID; $1)  //this is a universal set
If ($_l_UniversalRow<0)
	
	$_l_UniversalRow:=Find in array:C230(SM_al_SetitemsID; $1)  //this is a universal set
	If ($_l_UniversalRow>0)  //it should be!!!!
		$_t_Shared:=SM_at_SetContextitemOwnerIDs{$_l_UniversalRow}
		Case of 
			: ($_t_Shared="UNI")
				//universal shared
				//can change as cant be saved yet
				OBJECT SET ENABLED:C1123(SM_MAKESETUNIVERSAL; True:C214)
			: (Position:C15("GRP_"; $_t_Shared)>0)
				//group shared
				//can change if owner=◊User
				$_t_Owner:=Replace string:C233($_t_Shared; "GRP_"; "")
				
				//    $owner:=Replace string($Owner;SM_PersonGroup;"")
				If ($_t_Owner=<>PER_t_CurrentUserInitials)
					OBJECT SET ENABLED:C1123(SM_MAKESETUNIVERSAL; True:C214)
				Else 
					$_l_UniversalRow:=-1
				End if 
				
			: ($_t_Shared#"")
				//personal -not shared
				$_l_UniversalRow:=-1
				OBJECT SET ENABLED:C1123(SM_MAKESETUNIVERSAL; True:C214)
			Else 
				//not shared
				$_l_UniversalRow:=-1
				OBJECT SET ENABLED:C1123(SM_MAKESETUNIVERSAL; True:C214)
		End case 
		
	End if 
	
	
Else 
	//universal shar
	If ((User in group:C338(Current user:C182; "Manager")) | (User in group:C338(Current user:C182; "Administrator")))
		OBJECT SET ENABLED:C1123(SM_MAKESETUNIVERSAL; True:C214)
		
	End if 
End if 


If ($_l_UniversalRow>0)
	SM_MAKESETUNIVERSAL:=1
	OBJECT SET TITLE:C194(SM_MAKESETUNIVERSAL; "List Shared")
Else 
	SM_MAKESETUNIVERSAL:=0
	OBJECT SET TITLE:C194(SM_MAKESETUNIVERSAL; "Share List")
End if 

//and can I change it
//if the set is universal then only the manager can change the share
//and if it is group then only the supervisor can change the share
ERR_MethodTrackerReturn("SM_ListItemShared"; $_t_oldMethodName)
