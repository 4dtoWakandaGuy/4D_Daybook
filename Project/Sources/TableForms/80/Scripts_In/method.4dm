If (False:C215)
	//Table Form Method Name: [SCRIPTS]Scripts_in
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2011 09:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(MCR_al_TableIDs;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(MCR_at_TableNames;0)
	//ARRAY TEXT(SCPT_at_ScriptCommands;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_OBJECT:C1216($_obj_Fields)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [SCRIPTS].Scripts_in"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		If (Not:C34(Form:C1466=Null:C1517))
			
		End if 
		
		DB_SetnewToolBar
		Record_Array(->SCPT_at_ScriptCommands)
		
		//Load_Fields
		$_obj_Fields:=New object:C1471("tableNames"; New collection:C1472; "tableNumbers"; New collection:C1472; "fieldNames"; New collection:C1472; "fieldNumbers"; New collection:C1472)
		Load_Fields($_obj_Fields)
		
		ARRAY TEXT:C222(MCR_at_TableNames; 0)
		ARRAY LONGINT:C221(MCR_al_TableIDs; 0)
		COLLECTION TO ARRAY:C1562($_obj_Fields.tableNames; MCR_at_TableNames)
		COLLECTION TO ARRAY:C1562($_obj_Fields.tableNumbers; MCR_al_TableIDs)
		
		//COPY ARRAY(<>DB_at_TableNames; MCR_at_TableNames)
		//COPY ARRAY(<>DB_al_TableNums; MCR_al_TableIDs)
		//SORT ARRAY(MCR_at_TableNames; MCR_al_TableIDs)
		//MCR_at_TableNames:=Find in array(MCR_al_TableIDs; <>DB_al_TableNums{<>DB_at_TableNames})
		
		OpenHelp(Table:C252(->[SCRIPTS:80]); "Scripts_in")
		WS_AutoscreenSize(1; 620; 590)
		INT_SetInput(Table:C252(->[SCRIPTS:80]); WIN_t_CurrentInputForm)
		
End case 

Macros_InLP
ERR_MethodTrackerReturn("FM:Script_In"; $_t_oldMethodName)
