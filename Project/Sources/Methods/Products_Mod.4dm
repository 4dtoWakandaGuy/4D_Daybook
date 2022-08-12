//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2009`Method: Products_Mod`Description
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CAT_al_CatalogueID;0)
	//ARRAY LONGINT(PROD_al_ViewableCatalogues;0)
	//ARRAY TEXT(CAT_at_CatalogueNames;0)
	//ARRAY TEXT(PROD_at_ViewableCatalogues;0)
	C_BOOLEAN:C305($_bo_AutoSearch; $_bo_noDefault; vMod2)
	C_LONGINT:C283(<>AutoProc; <>PER_l_CurrentUserID; $_l_CatalogueRow; $_l_TestRecordCount; CAT_l_DefaultCatalogue; PROD_l_DisplayedCatalogue; vItemNum; vP)
	C_TEXT:C284(<>CompCode; <>ProdCode; $_t_AutoSearchCode; $_t_oldMethodName; $_t_Title; $1; $2; PROD_t_DisplayedCatalogue; PROD_t_SelectedCatalogues; PROD_t_ViewProductCode; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_Mod")
//Products_Mod
//ALERT("2")  `4/1/2010
If (Count parameters:C259>=2)
	$_bo_AutoSearch:=($2="TRUE")
	$_t_AutoSearchCode:=$1
	
End if 
If (Count parameters:C259>=1)
	PROD_t_ViewProductCode:=$1
	
End if 


vItemNum:=0
vMod2:=False:C215
If (<>CompCode="*Compo")
	$_t_Title:="View Components for "+<>ProdCode
Else 
	$_t_Title:="View Products"
End if 
Start_Process
//ALERT("3")  `4/1/2010
CAT_LoadCats(<>PER_l_CurrentUserID; False:C215)
//If (Size of array(CAT_al_CatalogueID)>0)
//ALERT("4")  `4/1/2010
If (Size of array:C274(CAT_al_CatalogueID)>0)  //| (True)
	//ALERT("5")  `4/1/2010
	ARRAY TEXT:C222(PROD_at_ViewableCatalogues; 0)
	ARRAY LONGINT:C221(PROD_al_ViewableCatalogues; 0)
	COPY ARRAY:C226(CAT_al_CatalogueID; PROD_al_ViewableCatalogues)
	COPY ARRAY:C226(CAT_at_CatalogueNames; PROD_at_ViewableCatalogues)
	INSERT IN ARRAY:C227(PROD_al_ViewableCatalogues; Size of array:C274(PROD_al_ViewableCatalogues)+1; 2)
	INSERT IN ARRAY:C227(PROD_at_ViewableCatalogues; Size of array:C274(PROD_at_ViewableCatalogues)+1; 2)
	PROD_at_ViewableCatalogues{Size of array:C274(PROD_at_ViewableCatalogues)}:="All Catalogues"
	PROD_at_ViewableCatalogues{Size of array:C274(PROD_at_ViewableCatalogues)-1}:="-"
	
	$_bo_noDefault:=True:C214
	
	If (CAT_l_DefaultCatalogue#0)
		$_l_CatalogueRow:=Find in array:C230(CAT_al_CatalogueID; CAT_l_DefaultCatalogue)
		If ($_l_CatalogueRow>0)
			PROD_t_DisplayedCatalogue:=PROD_at_ViewableCatalogues{$_l_CatalogueRow}
			PROD_l_DisplayedCatalogue:=PROD_al_ViewableCatalogues{$_l_CatalogueRow}
			$_bo_noDefault:=False:C215
		End if 
	End if 
	If ($_bo_noDefault)
		PROD_t_DisplayedCatalogue:=PROD_at_ViewableCatalogues{1}
		PROD_l_DisplayedCatalogue:=PROD_al_ViewableCatalogues{1}
		
	End if 
	Catalogue_Prices(PROD_l_DisplayedCatalogue)
	PROD_t_SelectedCatalogues:=PROD_t_DisplayedCatalogue
	Products_File
	//INPUT FORM([PRODUCTS];"Products_inCAT")
	WIN_t_CurrentInputForm:="Products_inCAT"
	//OUTPUT FORM([PRODUCTS];"Products_OutCAT")
	//WIN_t_CurrentOutputform:="Products_OutCAT"
	While (vP=1)
		Prod_Sel
		If (False:C215)  //NG Modified before it hit the streets!...now done as a filter so catalogues can be swapped on the fly
			CREATE SET:C116([PRODUCTS:9]; "QueryResult")
			If (PROD_l_DisplayedCatalogue>0)
				QUERY:C277([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]X_CatalogueID:2=PROD_l_DisplayedCatalogue; *)
				QUERY:C277([Catalogue_ProductLink:109];  & ; [Catalogue_ProductLink:109]Status:6=1)
				If (Records in selection:C76([PRODUCTS:9])>0)
					RELATE ONE SELECTION:C349([Catalogue_ProductLink:109]; [PRODUCTS:9])
				Else 
					REDUCE SELECTION:C351([PRODUCTS:9]; 0)
				End if 
				CREATE SET:C116([PRODUCTS:9]; "CatalogueResult")
				INTERSECTION:C121("CatalogueResult"; "QueryResult"; "CatalogueResult")
				USE SET:C118("CatalogueResult")
			End if 
		End if 
		Gen_ModMid($_t_Title; "Master"; ->[PRODUCTS:9]; ->vP; "Products by catalogue"; "")
		If ((vItemNum>0) & (vMod2))  //Call the process that asked for Components
			<>AutoProc:=8888
			RESUME PROCESS:C320(vItemNum)
			POST OUTSIDE CALL:C329(vItemNum)
		End if 
	End while 
	Process_End
Else 
	//ALERT("6")  `4/1/2010
	//just check  here if there are catalogues at all
	$_l_TestRecordCount:=Records in table:C83([CATALOGUE:108])
	If ($_l_TestRecordCount=0) | (True:C214)
		//ALERT("7")  `4/1/2010
		Products_File
		While (vP=1)
			//ALERT("8")  `4/1/2010
			Prod_Sel
			//ALERT("9")  `4/1/2010
			Gen_ModMid($_t_Title; "Master"; ->[PRODUCTS:9]; ->vP; "Products"; "")
			If ((vItemNum>0) & (vMod2))  //Call the process that asked for Components
				<>AutoProc:=8888
				RESUME PROCESS:C320(vItemNum)
				POST OUTSIDE CALL:C329(vItemNum)
			End if 
		End while 
		Process_End
	Else 
		//there are catalogues but this person has no access
		Gen_Alert("Sorry, you do not have access to Products, check with you administrator")
	End if 
End if 
ERR_MethodTrackerReturn("Products_Mod"; $_t_oldMethodName)