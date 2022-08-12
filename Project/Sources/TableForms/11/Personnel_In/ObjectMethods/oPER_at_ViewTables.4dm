If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.oPER_at_ViewTables
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PER_al_ContextViews;0)
	//ARRAY TEXT(PER_at_ContextViews;0)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.oPER_at_ViewTables"; Form event code:C388)
If (PER_at_ContextViews>0)
	[PERSONNEL:11]HomeTable:52:=PER_al_ContextViews{PER_at_ContextViews}
End if 

DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.oPER_at_ViewTables"; $_t_oldMethodName)