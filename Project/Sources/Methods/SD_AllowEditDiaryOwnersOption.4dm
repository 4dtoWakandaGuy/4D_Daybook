//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_AllowEditDiaryOwnersOption
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_DIOPersonnelid;0)
	//ARRAY LONGINT(SD_al_DIORelid;0)
	//ARRAY TEXT(SD_at_DIOPersonnelNAME;0)
	C_BOOLEAN:C305($_bo_AllowEditOption; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_AllowEditDiaryOwnersOption")

//SD_AllowEditDiaryOwnersOption
//Added 17/10/08 v621b120a -kmw (factor out from SD_LoadOtherPerson and slightly expand this funcitonality so can re-use elsewhere)

$_bo_AllowEditOption:=$1

If ($_bo_AllowEditOption)
	If (SD_at_DIOPersonnelNAME{Size of array:C274(SD_at_DIOPersonnelNAME)}#"Edit")
		INSERT IN ARRAY:C227(SD_al_DIOPersonnelid; 9999; 2)
		INSERT IN ARRAY:C227(SD_al_DIORelid; 9999; 2)
		INSERT IN ARRAY:C227(SD_at_DIOPersonnelNAME; 9999; 2)
		SD_at_DIOPersonnelNAME{Size of array:C274(SD_at_DIOPersonnelNAME)}:="Edit"
		SD_al_DIOPersonnelid{Size of array:C274(SD_at_DIOPersonnelNAME)}:=-1
		SD_at_DIOPersonnelNAME{Size of array:C274(SD_at_DIOPersonnelNAME)-1}:="-"
		SD_al_DIOPersonnelid{Size of array:C274(SD_at_DIOPersonnelNAME)-1}:=-1
	End if 
Else 
	If (SD_at_DIOPersonnelNAME{Size of array:C274(SD_at_DIOPersonnelNAME)}="Edit")
		DELETE FROM ARRAY:C228(SD_al_DIOPersonnelid; Size of array:C274(SD_at_DIOPersonnelNAME); 1)
		DELETE FROM ARRAY:C228(SD_al_DIORelid; Size of array:C274(SD_at_DIOPersonnelNAME); 1)
		DELETE FROM ARRAY:C228(SD_at_DIOPersonnelNAME; Size of array:C274(SD_at_DIOPersonnelNAME); 1)
	End if 
	If (SD_at_DIOPersonnelNAME{Size of array:C274(SD_at_DIOPersonnelNAME)}="-")
		DELETE FROM ARRAY:C228(SD_al_DIOPersonnelid; Size of array:C274(SD_at_DIOPersonnelNAME); 1)
		DELETE FROM ARRAY:C228(SD_al_DIORelid; Size of array:C274(SD_at_DIOPersonnelNAME); 1)
		DELETE FROM ARRAY:C228(SD_at_DIOPersonnelNAME; Size of array:C274(SD_at_DIOPersonnelNAME); 1)
	End if 
End if 
ERR_MethodTrackerReturn("SD_AllowEditDiaryOwnersOption"; $_t_oldMethodName)
