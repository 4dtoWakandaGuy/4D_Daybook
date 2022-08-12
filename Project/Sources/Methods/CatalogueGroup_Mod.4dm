//%attributes = {}
If (False:C215)
	//Project Method Name:      CatalogueGroup_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/07/2010 08:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CAT_al_catalgoueclasses;0)
	//ARRAY TEXT(CAT_at_Catalogueclasses;0)
	C_TEXT:C284(<>SYS_t_FormSizeName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CatalogueGroup_Mod")
ARRAY TEXT:C222(CAT_at_Catalogueclasses; 2)
ARRAY LONGINT:C221(CAT_al_catalgoueclasses; 2)
CAT_at_Catalogueclasses{1}:="Static"
CAT_al_catalgoueclasses{1}:=-1
CAT_at_Catalogueclasses{2}:="Dynamic"
CAT_al_catalgoueclasses{2}:=1
If (Count parameters:C259>=1)
	CREATE SET:C116([CATALOGUE:108]; "CurrentCollection")
	Minor_ModName(->[CATALOGUE:108]; "Catalogue_"; <>SYS_t_FormSizeName; "Collections"; True:C214; "CurrentCollection")
Else 
	Minor_ModName(->[CATALOGUE:108]; "Catalogue_"; <>SYS_t_FormSizeName; "Collections")
End if 
ERR_MethodTrackerReturn("CatalogueGroup_Mod"; $_t_oldMethodName)