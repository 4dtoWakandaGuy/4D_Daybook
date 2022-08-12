If (False:C215)
	//object Name: [SCRIPTS]Macro_RestrictedEntry.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2011 08:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_2DFieldNumbers;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>SYS_at_CurrentTableFieldNames;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SCRIPTS].Macro_RestrictedEntry.Variable3"; Form event code:C388)
If (Field name:C257(Focus object:C278)="Macro Code")
	If (<>SYS_at_CurrentTableFieldNames=0)
		<>SYS_at_CurrentTableFieldNames:=1
	End if 
	[SCRIPTS:80]Same_Process:6:=True:C214
	[SCRIPTS:80]Script_Code:1:="Modified "+String:C10(<>DB_al_TableNums{<>DB_at_TableNames})+"/"+String:C10(<>SYS_al_2DFieldNumbers{<>DB_at_TableNames}{<>SYS_at_CurrentTableFieldNames})
	[SCRIPTS:80]Script_Name:2:="Run when ["+<>DB_at_TableNames{<>DB_at_TableNames}+"]"+<>SYS_at_CurrentTableFieldNames{<>SYS_at_CurrentTableFieldNames}+" is modified"
	GEN_at_Identity:=<>DB_at_TableNames+1
	[SCRIPTS:80]Table_Number:8:=GEN_at_Identity-1
Else 
	RecText_Field(->[SCRIPTS:80]Recording_Text:4)
End if 
ERR_MethodTrackerReturn("OBJ [SCRIPTS].Macro_RestrictedEntry.Variable3"; $_t_oldMethodName)
