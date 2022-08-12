If (False:C215)
	//object Method Name: Object Name:      TEST_SVG.oGraphField
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/05/2011 20:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_GraphBreaks;0)
	//ARRAY LONGINT(DB_al_GraphFIeld;0)
	//ARRAY LONGINT(DB_al_GraphType;0)
	//ARRAY TEXT(DB_at_GraphBreaks;0)
	//ARRAY TEXT(DB_at_GraphFIeld;0)
	//ARRAY TEXT(DB_at_GraphType;0)
	C_LONGINT:C283($_l_Event)
	C_PICTURE:C286(DB_pi_GraphDisplay)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ TEST_SVG.oGraphField"; Form event code:C388)

$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		
		If (DB_at_GraphFIeld>0)
			DB_SetGraph(->DB_pi_GraphDisplay; DB_al_GraphType{DB_at_GraphType}; DB_al_GraphFIeld{DB_at_GraphFIeld}; DB_al_GraphBreaks{DB_at_GraphBreaks})
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ TEST_SVG.oGraphField"; $_t_oldMethodName)
