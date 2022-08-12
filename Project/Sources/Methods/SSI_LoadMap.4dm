//%attributes = {}
If (False:C215)
	//Project Method Name:      SSI_LoadMap
	//------------------ Method Notes ------------------
	//this method will load an SSI map.
	//this is into several arrays plus some  variables
	//The primary table. The table we are sending a 'record' from
	//Array one the 'internal' name(these are fixed names)
	//Array two the 'external' name(these are flexible)
	//The table number for the field in Daybook
	//The Field Number for the field in Daybook
	//The variable name(if the field and table are empty) to send from daybook
	//The interance of values...mandatory, Lookup(translate value), Optional, Multiple.
	//If the Table is not the PRIMARY table then
	//The relationship reference
	//Relationship references are then stored thus
	//these can be stored in a seperate preference and of course we must cope with them being deleted.
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("SSI_LoadMap")
SSI_LoadRelationships
//Primary Table FIELD
//The following are two dimensional and work in sequence.
//The relationship reference
//The Related table num
//The related table field
//The relationship type(ONE OR MANY)
ERR_MethodTrackerReturn("SSI_LoadMap"; $_t_oldMethodName)
