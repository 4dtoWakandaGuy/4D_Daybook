//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetCollections
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   09/01/2011 15:26 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_CatalogueIDS; 0)
	//ARRAY LONGINT(DB_al_CollectionIDS;0)
	ARRAY TEXT:C222($_at_CatalogueNames; 0)
	//ARRAY TEXT(DB_at_CollectionNames;0)
	C_BOOLEAN:C305(DB_bo_CollectionsReady)
	C_LONGINT:C283($_l_BlankRow; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetCollections")
If (Count parameters:C259>=1)
	READ ONLY:C145([CATALOGUE:108])
	ALL RECORDS:C47([CATALOGUE:108])
	
	SELECTION TO ARRAY:C260([CATALOGUE:108]Catalogue_Name:2; $_at_CatalogueNames; [CATALOGUE:108]x_ID:1; $_al_CatalogueIDS)
	$_l_BlankRow:=Find in array:C230($_at_CatalogueNames; "")
	If ($_l_BlankRow>0)
		DELETE FROM ARRAY:C228($_at_CatalogueNames; $_l_BlankRow)
		DELETE FROM ARRAY:C228($_al_CatalogueIDS; $_l_BlankRow)
	End if 
	
	VARIABLE TO VARIABLE:C635($1; DB_at_CollectionNames; $_at_CatalogueNames; DB_al_CollectionIDS; $_al_CatalogueIDS)
	SET PROCESS VARIABLE:C370($1; DB_bo_CollectionsReady; True:C214)
End if 
ERR_MethodTrackerReturn("DB_GetCollections"; $_t_oldMethodName)