//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel RemSets
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
	C_BOOLEAN:C305($_bo_Messages; $2)
	C_LONGINT:C283(cSetAdd; cSetMod; vAny)
	C_POINTER:C301($3)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel RemSets")
If (Count parameters:C259>=2)
	$_bo_Messages:=$2
Else 
	$_bo_Messages:=False:C215
End if 
If ((cSetAdd=1) | (cSetMod=1))
	
	
	READ ONLY:C145([PERSONNEL:11])
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
	If ([PERSONNEL:11]Import_Set_Path:14#"")
		If (cSetAdd=1)
			If ($_bo_Messages)
				ERASE WINDOW:C160
				MESSAGE:C88("Using Import set path-NEW")
			End if 
			If (Count parameters:C259>=3)
				CREATE EMPTY SET:C140($3->; "Master")
				LOAD SET:C185("Master"; [PERSONNEL:11]Import_Set_Path:14+":New "+$1)
			Else 
				CREATE EMPTY SET:C140("Master")
				LOAD SET:C185("Master"; [PERSONNEL:11]Import_Set_Path:14+":New "+$1)
				
			End if 
			
			vAny:=1
		End if 
		If (cSetMod=1)
			If ((cSetAdd=1) & (vAny=1))
				If ($_bo_Messages)
					ERASE WINDOW:C160
					MESSAGE:C88("Using Import set path-MOD")
				End if 
				If (Count parameters:C259>=3)
					CREATE EMPTY SET:C140($3->; "Extra")
					LOAD SET:C185("Extra"; [PERSONNEL:11]Import_Set_Path:14+":Mod "+$1)
				Else 
					CREATE EMPTY SET:C140("Extra")
					LOAD SET:C185("Extra"; [PERSONNEL:11]Import_Set_Path:14+":Mod "+$1)
				End if 
				
				UNION:C120("Master"; "Extra"; "Master")
			Else 
				If ($_bo_Messages)
					ERASE WINDOW:C160
					MESSAGE:C88("Using Import set path-MOD")
				End if 
				If (Count parameters:C259>=3)
					CREATE EMPTY SET:C140($3->; "Extra")
					LOAD SET:C185("Master"; [PERSONNEL:11]Import_Set_Path:14+":Mod "+$1)
				Else 
					CREATE EMPTY SET:C140("Extra")
					LOAD SET:C185("Master"; [PERSONNEL:11]Import_Set_Path:14+":Mod "+$1)
				End if 
				
				vAny:=1
			End if 
		End if 
	End if 
End if 
OK:=1
ERR_MethodTrackerReturn("Sel RemSets"; $_t_oldMethodName)
