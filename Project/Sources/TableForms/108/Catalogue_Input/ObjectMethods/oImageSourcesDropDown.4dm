If (False:C215)
	//object Name: [CATALOGUE]Catalogue_Input.Variable11
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
	//ARRAY LONGINT(CAT_al_ImageSources;0)
	//ARRAY TEXT(CAT_at_ImageNameConvention;0)
	//ARRAY TEXT(CAT_at_ImageSources;0)
	C_LONGINT:C283($_l_event; B_ModPath)
	C_TEXT:C284($_t_oldMethodName; WS_t_CatImagenaming; WS_t_CatImageSource)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CATALOGUE].Catalogue_Input.Variable11"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (CAT_at_ImageSources>0)
			WS_t_CatImageSource:=CAT_at_ImageSources{CAT_at_ImageSources}
			[CATALOGUE:108]Image_Source:3:=CAT_al_ImageSources{CAT_at_ImageSources}
			If ([CATALOGUE:108]Image_Source:3=1)  //images on disk
				OBJECT SET VISIBLE:C603(*; "Text3"; True:C214)
				OBJECT SET VISIBLE:C603([CATALOGUE:108]Image_Path:4; True:C214)
				OBJECT SET VISIBLE:C603(B_ModPath; True:C214)
				OBJECT SET VISIBLE:C603(*; "Text5"; True:C214)
				OBJECT SET VISIBLE:C603(*; "Library Picture3"; True:C214)
				OBJECT SET VISIBLE:C603(CAT_at_ImageNameConvention; True:C214)
				OBJECT SET VISIBLE:C603(WS_t_CatImagenaming; True:C214)
				OBJECT SET VISIBLE:C603(WS_t_CatImagenaming; True:C214)
			Else 
				OBJECT SET VISIBLE:C603(*; "Text3"; False:C215)
				OBJECT SET VISIBLE:C603([CATALOGUE:108]Image_Path:4; False:C215)
				OBJECT SET VISIBLE:C603(B_ModPath; False:C215)
				OBJECT SET VISIBLE:C603(*; "Text5"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Library Picture3"; False:C215)
				OBJECT SET VISIBLE:C603(CAT_at_ImageNameConvention; False:C215)
				OBJECT SET VISIBLE:C603(WS_t_CatImagenaming; False:C215)
				OBJECT SET VISIBLE:C603(WS_t_CatImagenaming; False:C215)
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [CATALOGUE].Catalogue_Input.Variable11"; $_t_oldMethodName)
