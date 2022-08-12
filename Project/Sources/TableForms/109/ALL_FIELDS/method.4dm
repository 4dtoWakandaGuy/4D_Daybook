If (False:C215)
	//Table Form Method Name: [Catalogue_ProductLink]ALL_FIELDS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/12/2009 18:23
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

$_t_oldMethodName:=ERR_MethodTracker("FM [Catalogue_ProductLink].ALL_FIELDS"; Form event code:C388)
ERR_MethodTrackerReturn("FM [Catalogue_ProductLink].ALL_FIELDS"; $_t_oldMethodName)