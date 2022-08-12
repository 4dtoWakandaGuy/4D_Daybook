//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Vers37101
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
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283($_l_ModuleRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_Vers37101")

//If (Not(Semaphore("$Update")))

READ WRITE:C146([CODE_USES:91])
User_Message(Char:C90(13)+"    Creating Status Code Uses")
QUERY:C277([STATUS:4]; [STATUS:4]Status_Code:1#"")
FIRST RECORD:C50([STATUS:4])
While (Not:C34(End selection:C36([STATUS:4])))
	For ($_l_ModuleRow; 1; 5)
		CREATE RECORD:C68([CODE_USES:91])
		[CODE_USES:91]Code:1:="004"+[STATUS:4]Status_Code:1
		[CODE_USES:91]Use:2:=$_l_ModuleRow
		DB_SaveRecord(->[CODE_USES:91])
	End for 
	NEXT RECORD:C51([STATUS:4])
End while 
User_Message(Char:C90(13)+"    Creating Types Code Uses")
QUERY:C277([TYPES:5]; [TYPES:5]Type_Code:1#"")
FIRST RECORD:C50([TYPES:5])
While (Not:C34(End selection:C36([TYPES:5])))
	For ($_l_ModuleRow; 1; 4)
		CREATE RECORD:C68([CODE_USES:91])
		[CODE_USES:91]Code:1:="005"+[TYPES:5]Type_Code:1
		[CODE_USES:91]Use:2:=$_l_ModuleRow
		DB_SaveRecord(->[CODE_USES:91])
	End for 
	NEXT RECORD:C51([TYPES:5])
End while 
User_Message(Char:C90(13)+"    Creating Sources Code Uses")
QUERY:C277([SOURCES:6]; [SOURCES:6]Source_Code:1#"")
FIRST RECORD:C50([SOURCES:6])
While (Not:C34(End selection:C36([SOURCES:6])))
	For ($_l_ModuleRow; 1; 4)
		CREATE RECORD:C68([CODE_USES:91])
		[CODE_USES:91]Code:1:="006"+[SOURCES:6]Source_Code:1
		[CODE_USES:91]Use:2:=$_l_ModuleRow
		DB_SaveRecord(->[CODE_USES:91])
	End for 
	NEXT RECORD:C51([SOURCES:6])
End while 
READ ONLY:C145([CODE_USES:91])
UNLOAD RECORD:C212([CODE_USES:91])

User_Message(Char:C90(13)+"    Converting Personnel_Modules Access")
READ WRITE:C146([PERSONNEL:11])
ALL RECORDS:C47([PERSONNEL:11])
While (Not:C34(End selection:C36([PERSONNEL:11])))
	QUERY:C277([MODULES:63]; [MODULES:63]Code:1=[PERSONNEL:11]Initials:1)
	If (Records in selection:C76([MODULES:63])>0)
		$_l_ModuleRow:=Find in array:C230(<>Mod_at_ModuleName; [MODULES:63]Module:2)
		If ($_l_ModuleRow>0)
			If (<>Mod_at_ProcessFunction{$_l_ModuleRow}="")
				$_bo_Continue:=True:C214
				While (($_bo_Continue) & (Not:C34(End selection:C36([MODULES:63]))))
					NEXT RECORD:C51([MODULES:63])
					$_l_ModuleRow:=Find in array:C230(<>Mod_at_ModuleName; [MODULES:63]Module:2)
					If ($_l_ModuleRow>0)
						If (<>Mod_at_ProcessFunction{$_l_ModuleRow}#"")
							$_bo_Continue:=False:C215
						End if 
					Else 
						$_bo_Continue:=False:C215
					End if 
				End while 
			End if 
			[PERSONNEL:11]Start_Module:29:=[MODULES:63]Module:2
			DB_SaveRecord(->[PERSONNEL:11])
			AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
		End if 
	End if 
	NEXT RECORD:C51([PERSONNEL:11])
End while 
READ ONLY:C145([PERSONNEL:11])
UNLOAD RECORD:C212([PERSONNEL:11])

User_Vers37101B
//End if
//CLEAR SEMAPHORE("$Update")
FLUSH CACHE:C297
ERR_MethodTrackerReturn("User_Vers37101"; $_t_oldMethodName)
