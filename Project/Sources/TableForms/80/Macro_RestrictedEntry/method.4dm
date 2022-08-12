If (False:C215)
	//Table Form Method Name: [SCRIPTS]Macro_RestrictedEntry
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/12/2011 17:06
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; BFind; MAC_l_MacroEntryClass; MAC_l_MacroID)
	C_OBJECT:C1216($_obj_Fields)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [SCRIPTS].Macro_RestrictedEntry"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		Record_Array
		//Load_Fields
		
		$_obj_Fields:=New object:C1471("tableNames"; New collection:C1472; "tableNumbers"; New collection:C1472; "fieldNames"; New collection:C1472; "fieldNumbers"; New collection:C1472)
		Load_Fields($_obj_Fields)
		ARRAY TEXT:C222(MCR_at_TableNames; 0)
		ARRAY LONGINT:C221(MCR_al_TableIDs; 0)
		COLLECTION TO ARRAY:C1562($_obj_Fields.tableNames; MCR_at_TableNames)
		COLLECTION TO ARRAY:C1562($_obj_Fields.tableNumbers; MCR_al_TableIDs)
		
		//ARRAY TEXT(MCR_at_TableNames; 0)
		//ARRAY LONGINT(MCR_al_TableIDs; 0)
		//COPY ARRAY(<>DB_at_TableNames; MCR_at_TableNames)
		//COPY ARRAY(<>DB_al_TableNums; MCR_al_TableIDs)
		//SORT ARRAY(MCR_at_TableNames; MCR_al_TableIDs)
		//MCR_at_TableNames:=Find in array(MCR_al_TableIDs; <>DB_al_TableNums{<>DB_at_TableNames})
		
		WS_AutoscreenSize(1; 300; 280)
		INT_SetInput(Table:C252(->[SCRIPTS:80]); WIN_t_CurrentInputForm)
		If ([SCRIPTS:80]Recording_Text:4#"")
			OBJECT SET VISIBLE:C603(BFind; False:C215)
		End if 
		
		[SCRIPTS:80]Same_Process:6:=True:C214
		[SCRIPTS:80]Script_Class:11:=MAC_l_MacroEntryClass
		If ([SCRIPTS:80]Script_Code:1="")
			MAC_l_MacroID:=0
			[SCRIPTS:80]Script_Code:1:="FML"+String:C10(AA_GetNextID(->MAC_l_MacroID))
		End if 
		
End case 
Macros_InLP
ERR_MethodTrackerReturn("FM [SCRIPTS].Macro_RestrictedEntry"; $_t_oldMethodName)
