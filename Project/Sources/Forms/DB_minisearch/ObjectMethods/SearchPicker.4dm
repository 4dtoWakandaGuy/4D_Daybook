
If (False:C215)
	//Object Name:      DB_minisearch.SearchPicker
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/12/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Customise)
	C_TEXT:C284($_t_oldMethodName; $_t_ObjectName; vSearch)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_minisearch/SearchPicker"; Form event code:C388)
//Searchpicker sample code

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		// Init the var itself
		// this can be done anywhere else in your code
		
		// the let's customise the SearchPicker (if needed)
		
		$_bo_Customise:=True:C214
		
		$_t_ObjectName:=OBJECT Get name:C1087(Object current:K67:2)
		
		// The exemple below shows how to set a label (ex : "name") inside the search zone
		
		If ($_bo_Customise)
			
			SearchPicker SET HELP TEXT($_t_ObjectName; "Name")
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [projectForm]/DB_minisearch/SearchPicker"; $_t_oldMethodName)
