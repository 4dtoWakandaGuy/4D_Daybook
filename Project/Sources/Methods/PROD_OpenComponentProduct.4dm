//%attributes = {}

If (False:C215)
	//Project Method Name:      PROD_OpenComponentProduct
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CAT_al_CatalogueID;0)
	//ARRAY LONGINT(PROD_al_ViewableCatalogues;0)
	//ARRAY TEXT(CAT_at_CatalogueNames;0)
	//ARRAY TEXT(PROD_at_ViewableCatalogues;0)
	C_BOOLEAN:C305($_bo_noDefault)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_DefaultCatalogueRow; $1; CAT_l_DefaultCatalogue; PROD_l_DisplayedCatalogue; WS_ProcMainWIndow)
	C_TEXT:C284($_t_oldMethodName; $2; PROD_t_DisplayedCatalogue; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PROD_OpenComponentProduct")

//NG May 2004
//this method opens a product.
//It is called from the component area and opens a component product in a seperate screen
$_t_oldMethodName:=ERR_MethodTracker("PROD_OpenComponentProduct")
Start_Process

Products_File
CAT_LoadCats(<>PER_l_CurrentUserID; False:C215)
If (Size of array:C274(CAT_al_CatalogueID)>0)
	ARRAY TEXT:C222(PROD_at_ViewableCatalogues; 0)
	ARRAY LONGINT:C221(PROD_al_ViewableCatalogues; 0)
	COPY ARRAY:C226(CAT_al_CatalogueID; PROD_al_ViewableCatalogues)
	COPY ARRAY:C226(CAT_at_CatalogueNames; PROD_at_ViewableCatalogues)
	INSERT IN ARRAY:C227(PROD_al_ViewableCatalogues; Size of array:C274(PROD_al_ViewableCatalogues)+1; 2)
	INSERT IN ARRAY:C227(PROD_at_ViewableCatalogues; Size of array:C274(PROD_at_ViewableCatalogues)+1; 2)
	PROD_at_ViewableCatalogues{Size of array:C274(PROD_at_ViewableCatalogues)}:="All Catalogues"
	PROD_at_ViewableCatalogues{Size of array:C274(PROD_at_ViewableCatalogues)-1}:="-"
	
	$_bo_noDefault:=True:C214
	
	If (CAT_l_DefaultCatalogue>0)
		$_l_DefaultCatalogueRow:=Find in array:C230(CAT_al_CatalogueID; CAT_l_DefaultCatalogue)
		If ($_l_DefaultCatalogueRow>0)
			PROD_t_DisplayedCatalogue:=PROD_at_ViewableCatalogues{$_l_DefaultCatalogueRow}
			PROD_l_DisplayedCatalogue:=PROD_al_ViewableCatalogues{$_l_DefaultCatalogueRow}
			$_bo_noDefault:=False:C215
		End if 
	End if 
	If ($_bo_noDefault)
		PROD_t_DisplayedCatalogue:=PROD_at_ViewableCatalogues{1}
		PROD_l_DisplayedCatalogue:=PROD_al_ViewableCatalogues{1}
		
	End if 
	FORM SET INPUT:C55([PRODUCTS:9]; "Products_inCAT")
	FORM SET OUTPUT:C54([PRODUCTS:9]; "Products_OutCAT")
	WIN_t_CurrentOutputform:="Products_OutCAT"
	WIN_t_CurrentInputForm:="Products_inCAT"
End if 
QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$2)
Open_Pro_Window("View Products"; 0; 2; ->[PRODUCTS:9]; WIN_t_CurrentInputForm)
PROC_SetProcess(Current process:C322; WS_ProcMainWIndow)
MODIFY RECORD:C57([PRODUCTS:9]; *)
Process_End
ERR_MethodTrackerReturn("PROD_OpenComponentProduct"; $_t_oldMethodName)
