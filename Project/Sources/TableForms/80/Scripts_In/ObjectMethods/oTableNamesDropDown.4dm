If (False:C215)
	//object Name: [SCRIPTS]Scripts_in.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/10/2009 17:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(MCR_al_FieldNumbers;0)
	//ARRAY LONGINT(MCR_al_TableIDs;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	//ARRAY TEXT(<>SYS_at_CurrentTableFieldNames;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(MCR_at_FieldNames;0)
	//ARRAY TEXT(MCR_at_TableNames;0)
	C_LONGINT:C283($_l_event; $_l_TableNumber; $_l_TablePosition)
	C_OBJECT:C1216($_obj_FileData)
	C_TEXT:C284($_t_oldMethodName; SM_T_MacroText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SCRIPTS].Scripts_in.Variable2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (Field name:C257(Focus object:C278)="Script_Code") & ([SCRIPTS:80]Script_Code:1="")
			$_l_TableNumber:=MCR_al_TableIDs{MCR_at_TableNames}
			//$_l_TablePosition:=Find in array(<>DB_al_TableNums; MCR_al_TableIDs{MCR_at_TableNames})
			//If ($_l_TablePosition>0)
			//<>DB_at_TableNames:=$_l_TablePosition
			
			//If (<>DB_at_TableNames=0)
			//<>DB_at_TableNames:=1
			//End if 
			//COPY ARRAY(<>SYS_at_2DFieldNames{<>DB_at_TableNames}; <>SYS_at_CurrentTableFieldNames)
			//<>SYS_at_CurrentTableFieldNames:=1
			[SCRIPTS:80]Same_Process:6:=True:C214
			//GEN_at_Identity:=<>DB_al_TableNums{<>DB_at_TableNames}
			[SCRIPTS:80]Table_Number:8:=GEN_at_Identity
			If (Gen_Option)
				[SCRIPTS:80]Script_Code:1:="Enter "+String:C10($_l_TableNumber)
				[SCRIPTS:80]Script_Name:2:="Run before Entering a new ["+MCR_at_TableNames{MCR_at_TableNames}+"] record"
			Else 
				[SCRIPTS:80]Script_Code:1:="Accept "+String:C10($_l_TableNumber)
				[SCRIPTS:80]Script_Name:2:="Run on Accepting a ["+MCR_at_TableNames{MCR_at_TableNames}+"] record"
			End if 
			
		Else 
			
			
			//<>DB_at_TableNames:=$_l_TablePosition
			//RecText_File(->[SCRIPTS]Recording_Text)
			$_obj_FileData:=New object:C1471("tableName"; MCR_at_TableNames{MCR_at_TableNames}; "tableNumber"; $_l_TableNumber)
			RecText_File(->SM_T_MacroText; $_obj_FileData)
			If (Not:C34($_obj_FileData.fieldNames=Null:C1517))
				ARRAY TEXT:C222(MCR_at_FieldNames; 0)
				ARRAY LONGINT:C221(MCR_al_FieldNumbers; 0)
				COLLECTION TO ARRAY:C1562($_obj_FileData.fieldNames; MCR_at_FieldNames)
				COLLECTION TO ARRAY:C1562($_obj_FileData.fieldNumbers; MCR_al_FieldNumbers)
				
			End if 
			
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [SCRIPTS].Scripts_in.Variable2"; $_t_oldMethodName)
