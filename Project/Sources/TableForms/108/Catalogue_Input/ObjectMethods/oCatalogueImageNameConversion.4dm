//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CAT_at_ImageNameConvention;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; WS_t_CatImagenaming)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CATALOGUE].Catalogue_Input.Pop-up/Drop-down List1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (CAT_at_ImageNameConvention>0)
			WS_t_CatImagenaming:=CAT_at_ImageNameConvention{CAT_at_ImageNameConvention}
			[CATALOGUE:108]Image_NamePref:5:=CAT_at_ImageNameConvention
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [CATALOGUE].Catalogue_Input.Pop-up/Drop-down List1"; $_t_oldMethodName)
