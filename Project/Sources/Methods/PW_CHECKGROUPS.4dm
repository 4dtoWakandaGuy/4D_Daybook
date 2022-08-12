//%attributes = {}
If (False:C215)
	//Project Method Name:      PW_CHECKGROUPS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2012 16:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>PW_al_4DGroupIDs;0)
	//ARRAY LONGINT(<>PW_al_4DUserGroupsBinaries;0)
	//ARRAY LONGINT(PW_al_GroupBinaries;0)
	//ARRAY LONGINT(PW_al_GroupIDS;0)
	//ARRAY LONGINT(PW_al_UserID;0)
	//ARRAY LONGINT(PW_l_GROUPBINARIES;0)
	//ARRAY LONGINT(PW_l_GROUPIDS;0)
	//ARRAY TEXT(<>PW_at_4DUserGroups;0)
	//ARRAY TEXT(PW_at_GroupNames;0)
	//ARRAY TEXT(PW_at_ModGroupIDS;0)
	//ARRAY TEXT(PW_at_ModGroups;0)
	//ARRAY TEXT(PW_at_UsertNames;0)
	C_BOOLEAN:C305($_bo_4DWriteInstalled; $_bo_OK; $_bo_Reset)
	C_LONGINT:C283($_l_administratorRow; $_l_Element; $_l_GroupID; $_l_GroupRow; $_l_Index; $_l_Mod43; $_l_userRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PW_CHECKGROUPS")
//NG June 2000
//this method will test if all [GROUPS] exist in the password table


ARRAY TEXT:C222(PW_at_ModGroups; 0)
ARRAY TEXT:C222(PW_at_ModGroupIDS; 0)
ARRAY TEXT:C222(PW_at_GroupNames; 0)
ARRAY LONGINT:C221(PW_al_GroupIDS; 0)
ARRAY LONGINT:C221(PW_al_GroupBinaries; 0)

GET GROUP LIST:C610(PW_at_GroupNames; PW_al_GroupIDS)
If (Current user:C182="Designer") | (Current user:C182="ADMINISTRATOR")
	ARRAY TEXT:C222(PW_at_UsertNames; 0)
	ARRAY LONGINT:C221(PW_al_UserID; 0)
	GET USER LIST:C609(PW_at_UsertNames; PW_al_UserID)
	
	$_l_administratorRow:=Find in array:C230(PW_at_UsertNames; "Administrator")
	GET GROUP LIST:C610(PW_at_GroupNames; PW_al_GroupIDS)
	If (False:C215)  //i dont think we need to create 4D groups
		ALL RECORDS:C47([PERSONNEL_GROUPS:92])
		SELECTION TO ARRAY:C260([PERSONNEL_GROUPS:92]Group_Name:2; PW_at_ModGroups; [PERSONNEL_GROUPS:92]Group_Code:1; PW_at_ModGroupIDS)
		$_bo_Reset:=False:C215
		For ($_l_Index; 1; Size of array:C274(PW_at_ModGroups))
			$_l_GroupRow:=Find in array:C230(PW_at_GroupNames; PW_at_ModGroups{$_l_Index})
			If ($_l_GroupRow<0)
				$_bo_Reset:=True:C214
				$_l_GroupID:=Set group properties:C614(-2; PW_at_ModGroups{$_l_Index}; PW_al_UserID{$_l_administratorRow})
			End if 
		End for 
		If ($_bo_Reset)
			ARRAY TEXT:C222(PW_at_GroupNames; 0)
			ARRAY LONGINT:C221(PW_al_GroupIDS; 0)
			GET GROUP LIST:C610(PW_at_GroupNames; PW_al_GroupIDS)
		End if 
	End if 
	
End if 
//I need the IDS of the Modulus User Groups
//because these groups define whether the user
//These Groups are
//Designer-nobody can add to this
//Administrator-can add to this
//Manager-can add to this
//User
//4D Write Group
//DTK(4D remote/open)
ARRAY TEXT:C222(<>PW_at_4DUserGroups; 6)
ARRAY LONGINT:C221(<>PW_al_4DGroupIDs; 6)
ARRAY LONGINT:C221(<>PW_al_4DUserGroupsBinaries; 6)
$_l_userRow:=Find in array:C230(PW_at_GroupNames; "Administrator")
If ($_l_userRow>0)
	<>PW_at_4DUserGroups{1}:="Administrator"
	<>PW_al_4DGroupIDs{1}:=PW_al_GroupIDS{$_l_userRow}
	<>PW_al_4DUserGroupsBinaries{1}:=1
End if 
$_l_userRow:=Find in array:C230(PW_at_GroupNames; "Manager")
If ($_l_userRow>0)
	<>PW_at_4DUserGroups{2}:="Manager"
	<>PW_al_4DGroupIDs{2}:=PW_al_GroupIDS{$_l_userRow}
	<>PW_al_4DUserGroupsBinaries{2}:=2
End if 
$_l_userRow:=Find in array:C230(PW_at_GroupNames; "User")

If ($_l_userRow>0)
	<>PW_at_4DUserGroups{3}:="User"
	<>PW_al_4DGroupIDs{3}:=PW_al_GroupIDS{$_l_userRow}
	<>PW_al_4DUserGroupsBinaries{3}:=3
End if 
//only if they have 4D write
$_l_Element:=3
$_bo_OK:=False:C215

$_l_Mod43:=0
$_bo_OK:=True:C214



//NG this is a pain--if the user logs in as administrator-which they need to do the user is not licenced for 4D write
//so this test does not work
//$_bo_4DWriteInstalled:=Is license available(808464697)
$_bo_4DWriteInstalled:=True:C214
If ($_bo_OK)
	If ($_bo_4DWriteInstalled)
		
		$_l_userRow:=Find in array:C230(PW_at_GroupNames; "4D Write Group")
		If ($_l_userRow>0)
			$_l_Element:=$_l_Element+1
			<>PW_at_4DUserGroups{$_l_Element}:="Word Processor"
			<>PW_al_4DGroupIDs{$_l_Element}:=PW_al_GroupIDS{$_l_userRow}
			<>PW_al_4DUserGroupsBinaries{$_l_Element}:=4
		Else 
			
		End if 
	End if 
	If ($_l_Mod43>0)  //this is incorrect
		
		$_l_userRow:=Find in array:C230(PW_at_GroupNames; "DTK")
		If ($_l_userRow>0)
			$_l_Element:=$_l_Element+1
			<>PW_at_4DUserGroups{$_l_Element}:="Remote Connection. 4D open"
			<>PW_al_4DGroupIDs{$_l_Element}:=PW_al_GroupIDS{$_l_userRow}
			<>PW_al_4DUserGroupsBinaries{$_l_Element}:=5
		Else 
			
		End if 
	End if 
Else 
	//Daybook not loaded-assume they exist(user cant see anyway)
	If ($_bo_4DWriteInstalled)
		
		
		$_l_userRow:=Find in array:C230(PW_at_GroupNames; "4D Write Group")
		If ($_l_userRow>0)
			$_l_Element:=$_l_Element+1
			<>PW_at_4DUserGroups{$_l_Element}:="Word Processor"
			<>PW_al_4DGroupIDs{$_l_Element}:=PW_al_GroupIDS{$_l_userRow}
			<>PW_al_4DUserGroupsBinaries{$_l_Element}:=4
		Else 
			
		End if 
	End if 
	If (False:C215)
		
		$_l_userRow:=Find in array:C230(PW_at_GroupNames; "DTK")
		If ($_l_userRow>0)
			$_l_Element:=$_l_Element+1
			<>PW_at_4DUserGroups{$_l_Element}:="Remote Connection. 4D open"
			<>PW_al_4DGroupIDs{$_l_Element}:=PW_al_GroupIDS{$_l_userRow}
			<>PW_al_4DUserGroupsBinaries{$_l_Element}:=5
		Else 
			
		End if 
	End if 
	
End if 
If (Current user:C182="Designer")
	$_l_userRow:=Find in array:C230(PW_at_GroupNames; "Designer")
	If ($_l_userRow>0)
		$_l_Element:=$_l_Element+1
		<>PW_at_4DUserGroups{$_l_Element}:="Designer"
		<>PW_al_4DGroupIDs{$_l_Element}:=PW_al_GroupIDS{$_l_userRow}
		<>PW_al_4DUserGroupsBinaries{$_l_Element}:=6
	End if 
End if 

ARRAY TEXT:C222(<>PW_at_4DUserGroups; $_l_Element)
ARRAY LONGINT:C221(<>PW_al_4DGroupIDs; $_l_Element)
ARRAY LONGINT:C221(<>PW_al_4DUserGroupsBinaries; $_l_Element)
ERR_MethodTrackerReturn("PW_CHECKGROUPS"; $_t_oldMethodName)
