//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_4DtoJS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/03/2012 16:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DBWS_at_4DFunctionNames;0)
	//ARRAY TEXT(DBWS_at_WebPageFunction;0)
	C_BOOLEAN:C305(DBWS_bo_FunctionsInited)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_4DtoJS")
//This is not some clever method to run javascript. This method simply is a lookup.
//For menu items etc we have a 4D method that will get called. all this does is replace the method with the function the  web page is to call.
//this may be a call back to the database
ARRAY TEXT:C222(DBWS_at_4DFunctionNames; 0)
ARRAY TEXT:C222(DBWS_at_WebPageFunction; 0)
If (Not:C34(DBWS_bo_FunctionsInited))
	//Only menu items which have an associated function will appear
	APPEND TO ARRAY:C911(DBWS_at_4DFunctionNames; "Defaults Entry")
	APPEND TO ARRAY:C911(DBWS_at_WebPageFunction; "setDefaultsEntryOption")
	APPEND TO ARRAY:C911(DBWS_at_4DFunctionNames; "Defaults Find")
	APPEND TO ARRAY:C911(DBWS_at_WebPageFunction; "setDefaultsFindOption")
	APPEND TO ARRAY:C911(DBWS_at_4DFunctionNames; "Menu FindMy")
	APPEND TO ARRAY:C911(DBWS_at_WebPageFunction; "setDefaultsUserDataOption")
	
	APPEND TO ARRAY:C911(DBWS_at_4DFunctionNames; "DB_MenuNewRecord")
	APPEND TO ARRAY:C911(DBWS_at_WebPageFunction; "newDBrecord")
	APPEND TO ARRAY:C911(DBWS_at_4DFunctionNames; "DBI_MenuDisplayRecords")
	APPEND TO ARRAY:C911(DBWS_at_WebPageFunction; "viewDBrecords")
	//Just a note on these two above-and this will apply to others. note that this does not pass a table to enter the record for or view
	//when the request is received the current settings for the user are obtained this tells the system what records to return or what form to return
	//this is an interesting 'security' feature-a foreign system trying to get DB to display records has no way of setting the server side context for the current user
	//what is difficult is when we are selecting from the module menus though because there the current context does not exist
	//with those the id of the selected item has to be included in the call from the web page
	
	
End if 
ERR_MethodTrackerReturn("DBWS_4DtoJS"; $_t_oldMethodName)