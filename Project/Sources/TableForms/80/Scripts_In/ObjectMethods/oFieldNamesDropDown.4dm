If (False:C215)
	//object Name: [SCRIPTS]Scripts_in.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_2DFieldNumbers;0)
	//ARRAY LONGINT(MCR_al_FieldNumbers;0)
	//ARRAY LONGINT(MCR_al_TableIDs;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>SYS_at_CurrentTableFieldNames;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(MCR_at_FieldNames;0)
	//ARRAY TEXT(MCR_at_TableNames;0)
	C_LONGINT:C283($_l_event; $_l_TableNumber)
	C_OBJECT:C1216($_obj_FileData)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SCRIPTS].Scripts_in.Variable3"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		//TRACE
		If (Field name:C257(Focus object:C278)="Macro_Code")
			If (MCR_at_TableNames=0)
				MCR_at_TableNames:=1
			End if 
			$_l_TableNumber:=MCR_al_TableIDs{MCR_at_TableNames}
			
			[SCRIPTS:80]Same_Process:6:=True:C214
			[SCRIPTS:80]Script_Code:1:="Modified "+String:C10($_l_TableNumber)+"/"+String:C10(MCR_al_FieldNumbers)
			[SCRIPTS:80]Script_Name:2:="Run when ["+MCR_at_TableNames{MCR_at_TableNames}+"]"+MCR_at_FieldNames{MCR_at_FieldNames}+" is modified"
			[SCRIPTS:80]Table_Number:8:=$_l_TableNumber
		Else 
			//RecText_Field(->[SCRIPTS]Recording_Text)
			$_obj_FileData:=New object:C1471("tableName"; MCR_at_TableNames{MCR_at_TableNames}; "tableNumber"; MCR_al_TableIDs{MCR_at_TableNames}; "fieldName"; MCR_at_FieldNames{MCR_at_FieldNames}; "fieldNumber"; MCR_al_FieldNumbers{MCR_at_FieldNames})
			RecText_Field(->[SCRIPTS:80]Recording_Text:4; $_obj_FileData)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [SCRIPTS].Scripts_in.Variable3"; $_t_oldMethodName)
