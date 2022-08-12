//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote ImSetSav
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
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_LONGINT:C283($_l_CharPosition; $_l_PersonRow)
	C_POINTER:C301($5)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote ImSetSav")

If (([PERSONNEL:11]Import_Set_Path:14#"") & ((Records in set:C195("Extra")>0) | (Records in set:C195("Master")>0) | (Records in set:C195("Not")>0)))
	$_l_PersonRow:=Find in array:C230(GEN_at_RecordCode; [PERSONNEL:11]Initials:1)
	If ($_l_PersonRow>0)
		$_l_CharPosition:=Position:C15($4; GEN_at_Name{$_l_PersonRow})
		If ($_l_CharPosition=0)
			GEN_at_Name{$_l_PersonRow}:=GEN_at_Name{$_l_PersonRow}+$4
			SAVE SET:C184("Extra"; [PERSONNEL:11]Import_Set_Path:14+":"+$1)
			SAVE SET:C184("Master"; [PERSONNEL:11]Import_Set_Path:14+":"+$2)
			SAVE SET:C184("Not"; [PERSONNEL:11]Import_Set_Path:14+":"+$3)
		Else 
			LOAD SET:C185($5->; "Extra2"; [PERSONNEL:11]Import_Set_Path:14+":"+$1)
			UNION:C120("Extra"; "Extra2"; "Extra")
			LOAD SET:C185($5->; "Extra2"; [PERSONNEL:11]Import_Set_Path:14+":"+$2)
			UNION:C120("Master"; "Extra2"; "Master")
			LOAD SET:C185($5->; "Extra2"; [PERSONNEL:11]Import_Set_Path:14+":"+$3)
			UNION:C120("Not"; "Extra2"; "Not")
			SAVE SET:C184("Extra"; [PERSONNEL:11]Import_Set_Path:14+":"+$1)
			SAVE SET:C184("Master"; [PERSONNEL:11]Import_Set_Path:14+":"+$2)
			SAVE SET:C184("Not"; [PERSONNEL:11]Import_Set_Path:14+":"+$3)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Remote ImSetSav"; $_t_oldMethodName)
