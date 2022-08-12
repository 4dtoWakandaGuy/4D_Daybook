If (False:C215)
	//object Name: [CATALOGUE]Catalogue_Input.oCatClassesPopUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 16:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CAT_al_catalgoueclasses;0)
	//ARRAY TEXT(CAT_at_Catalogueclasses;0)
	C_LONGINT:C283(Badd_CatProd; BDel_CatProd)
	C_TEXT:C284($_t_oldMethodName; CAT_t_CatalogueType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CATALOGUE].Catalogue_Input.oCatClassesPopUp"; Form event code:C388)
If (CAT_at_Catalogueclasses>0)
	CAT_t_CatalogueType:=CAT_at_Catalogueclasses{CAT_at_Catalogueclasses}
	[CATALOGUE:108]xCatalogueClass:9:=CAT_al_catalgoueclasses{CAT_at_Catalogueclasses}
	If ([CATALOGUE:108]xCatalogueClass:9=1)
		OBJECT SET VISIBLE:C603(*; "oRulesReview"; True:C214)
		OBJECT SET VISIBLE:C603(Badd_CatProd; False:C215)
		OBJECT SET VISIBLE:C603(BDel_CatProd; False:C215)
		
	Else 
		OBJECT SET VISIBLE:C603(*; "oRulesReview"; False:C215)
		OBJECT SET VISIBLE:C603(Badd_CatProd; True:C214)
		OBJECT SET VISIBLE:C603(BDel_CatProd; True:C214)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [CATALOGUE].Catalogue_Input.oCatClassesPopUp"; $_t_oldMethodName)
