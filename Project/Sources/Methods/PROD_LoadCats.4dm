//%attributes = {}
If (False:C215)
	//Project Method Name:      PROD_LoadCats
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PRD_al_CatalogueID;0)
	//ARRAY LONGINT(PRD_al_CatalogueSource;0)
	//ARRAY LONGINT(PRD_al_CatItemNamePREF;0)
	//ARRAY TEXT(PRD_at_CatalogueNames;0)
	//ARRAY TEXT(PRD_at_CataloguePath;0)
	C_LONGINT:C283($_l_CatalogueIndex; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PROD_LoadCats")
//this will find the prods cats that this prod is in
CAT_LoadPrefs

ARRAY TEXT:C222(PRD_at_CatalogueNames; 0)
ARRAY LONGINT:C221(PRD_al_CatalogueID; 0)
ARRAY LONGINT:C221(PRD_al_CatalogueSource; 0)
ARRAY TEXT:C222(PRD_at_CataloguePath; 0)
ARRAY LONGINT:C221(PRD_al_CatItemNamePREF; 0)

If ($1>0)
	QUERY:C277([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]x_ProductID:3=$1; *)
	QUERY:C277([Catalogue_ProductLink:109];  & ; [Catalogue_ProductLink:109]DateRemoved:5=!00-00-00!)
	If (Records in selection:C76([Catalogue_ProductLink:109])>0)
		SELECTION TO ARRAY:C260([Catalogue_ProductLink:109]X_CatalogueID:2; PRD_al_CatalogueID)
		ARRAY TEXT:C222(PRD_at_CatalogueNames; Size of array:C274(PRD_al_CatalogueID))
		ARRAY LONGINT:C221(PRD_al_CatalogueSource; Size of array:C274(PRD_al_CatalogueID))
		ARRAY TEXT:C222(PRD_at_CataloguePath; Size of array:C274(PRD_al_CatalogueID))
		ARRAY LONGINT:C221(PRD_al_CatItemNamePREF; Size of array:C274(PRD_al_CatalogueID))
		For ($_l_CatalogueIndex; 1; Size of array:C274(PRD_al_CatalogueID))
			QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]x_ID:1=PRD_al_CatalogueID{$_l_CatalogueIndex})
			PRD_at_CatalogueNames{$_l_CatalogueIndex}:=[CATALOGUE:108]Catalogue_Name:2
			PRD_al_CatalogueSource{$_l_CatalogueIndex}:=[CATALOGUE:108]Image_Source:3
			PRD_at_CataloguePath{$_l_CatalogueIndex}:=[CATALOGUE:108]Image_Path:4
			PRD_al_CatItemNamePREF{$_l_CatalogueIndex}:=[CATALOGUE:108]Image_NamePref:5
			
		End for 
	Else 
		
	End if 
	
	
	
End if 
ERR_MethodTrackerReturn("PROD_LoadCats"; $_t_oldMethodName)
