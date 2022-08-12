If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.oLBDiaryAccess2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/10/2012 15:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PER_lb_4DUserGroups;0)
	//ARRAY LONGINT(<>PW_al_4DUserGroupsBinaries;0)
	//ARRAY LONGINT(<>PW_al_4DUserGroupsINC;0)
	C_BOOLEAN:C305($_bo_GroupSet)
	C_LONGINT:C283($_l_Binary; $_l_Column; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.oLBDiaryAccess2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			$_l_Column:=LB_GetColumn(->PER_lb_4DUserGroups; $_t_VariableName)
			
			If (Current user:C182="Designer") | (Current user:C182="Administrator")
				<>PW_al_4DUserGroupsINC{$_l_Row}:=Abs:C99(<>PW_al_4DUserGroupsINC{$_l_Row}-1)
				$_l_Binary:=<>PW_al_4DUserGroupsBinaries{$_l_Row}
				$_bo_GroupSet:=([PERSONNEL:11]UserGroupIDs:39 ?? $_l_Binary)
				Case of 
					: ($_bo_GroupSet) & (<>PW_al_4DUserGroupsINC{$_l_Row}=0)
						//group was set
						//Unset it
						[PERSONNEL:11]UserGroupIDs:39:=[PERSONNEL:11]UserGroupIDs:39 ?- <>PW_al_4DUserGroupsBinaries{$_l_Row}
					: (Not:C34($_bo_GroupSet)) & (<>PW_al_4DUserGroupsINC{$_l_Row}=1)
						//group was NOT set
						//set it
						[PERSONNEL:11]UserGroupIDs:39:=[PERSONNEL:11]UserGroupIDs:39 ?+ <>PW_al_4DUserGroupsBinaries{$_l_Row}
						
					Else 
						// NO CHANGE
				End case 
				
			Else 
				//  ALERT("Only the administrator can change access rights")
				Gen_Alert("Only the administrator can change access rights")
			End if 
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.oLBDiaryAccess2"; $_t_oldMethodName)
