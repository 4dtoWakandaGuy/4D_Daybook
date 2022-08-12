//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_UpdateLIstLayoutFormulas
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/02/2010 17:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_UpdateLIstLayoutFormulas")
//Because the formula in a list layout can contain a field number it is like a macro.
//so we must apply the macro updaing routines to any forumlas
READ WRITE:C146([LIST_LAYOUTS:96])
QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Formula:9#"")
APPLY TO SELECTION:C70([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Formula:9:=Macro_translate([LIST_LAYOUTS:96]Formula:9))
UNLOAD RECORD:C212([LIST_LAYOUTS:96])
ERR_MethodTrackerReturn("DB_UpdateLIstLayoutFormulas"; $_t_oldMethodName)