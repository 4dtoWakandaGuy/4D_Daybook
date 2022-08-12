If (False:C215)
	//object Name: [USER]User_In.Button15
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 13:23
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CAT_al_CatalogueID;0)
	//ARRAY TEXT(CAT_at_CatalogueNames;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Button15"; Form event code:C388)
If (CAT_at_CatalogueNames>0)
	Gen_Confirm("Are you sure you wish to delete "+CAT_at_CatalogueNames{CAT_at_CatalogueNames}+"?  This CANNOT be undone!"; "NO"; "YES")
	//  If (OK=1)
	If (OK=0)  // 20/11/03 pb
		READ WRITE:C146([CATALOGUE:108])
		READ WRITE:C146([Catalogue_Availability:110])
		READ WRITE:C146([Catalogue_ProductLink:109])
		
		QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]x_ID:1=CAT_al_CatalogueID{CAT_at_CatalogueNames})
		DB_DeletionControl(->[CATALOGUE:108])
		
		DELETE RECORD:C58([CATALOGUE:108])
		QUERY:C277([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]X_CatalogueID:2=CAT_al_CatalogueID{CAT_at_CatalogueNames})
		DELETE SELECTION:C66([Catalogue_ProductLink:109])
		QUERY:C277([Catalogue_Availability:110]; [Catalogue_Availability:110]Catalogue_ID:3=CAT_al_CatalogueID{CAT_at_CatalogueNames})
		DELETE SELECTION:C66([Catalogue_Availability:110])
		READ ONLY:C145([Catalogue_ProductLink:109])
		READ ONLY:C145([Catalogue_Availability:110])
		READ ONLY:C145([CATALOGUE:108])
		CAT_LoadCats(-1)
		
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Button15"; $_t_oldMethodName)
