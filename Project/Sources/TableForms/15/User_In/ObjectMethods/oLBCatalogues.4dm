If (False:C215)
	//object Name: [USER]User_In.oLBCatalogues
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
	//ARRAY BOOLEAN(CAT_abo_IsAvailable;0)
	//ARRAY BOOLEAN(PROD_lb_Catalogues;0)
	//ARRAY INTEGER(CAT_aI_CatalogueDF;0)
	//ARRAY INTEGER(CAT_aI_CatalogueINC;0)
	//ARRAY LONGINT(CAT_al_CatalogueID;0)
	//ARRAY TEXT(CAT_at_CatalogueNames;0)
	C_BOOLEAN:C305(CAT_bo_ChangePrefs)
	C_LONGINT:C283($_l_CatalogueCount; $_l_CatalogueDefault; $_l_CurrentSortColumn; $_l_event; $_l_FieldNumber; $_l_Index; $_l_SelectedRow; $_l_TableNumber; CAT_l_DefaultCatalogue)
	C_TEXT:C284($_t_CurrentOutputForm; $_t_oldMethodName; $_t_VariableName; $_t_WindowTitle; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oLBCatalogues"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_l_SelectedRow:=Self:C308->
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_CurrentSortColumn:=LB_GetColumn(->PROD_lb_Catalogues; $_t_VariableName)
		Case of 
			: ($_l_CurrentSortColumn=1)
				$_l_CatalogueDefault:=CAT_aI_CatalogueDF{$_l_SelectedRow}
				If ($_l_CatalogueDefault=1)
					Gen_Alert("Change the default by selecting the new default")
				Else 
					For ($_l_Index; 1; Size of array:C274(CAT_aI_CatalogueDF))
						CAT_aI_CatalogueDF{$_l_Index}:=0
					End for 
					CAT_aI_CatalogueDF{$_l_SelectedRow}:=1
					CAT_l_DefaultCatalogue:=CAT_al_CatalogueID{$_l_SelectedRow}
					CAT_bo_ChangePrefs:=True:C214
				End if 
		End case 
	: ($_l_event=On Double Clicked:K2:5)
		$_l_SelectedRow:=Self:C308->
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_CurrentSortColumn:=LB_GetColumn(->PROD_lb_Catalogues; ""; $_t_VariableName)
		$_t_CurrentOutputForm:=WIN_t_CurrentOutputform
		READ WRITE:C146([CATALOGUE:108])
		$_t_WindowTitle:=Get window title:C450
		QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]x_ID:1=CAT_al_CatalogueID{$_l_SelectedRow})
		SET WINDOW TITLE:C213("Catalogue:"+CAT_at_CatalogueNames{$_l_SelectedRow})
		
		MODIFY RECORD:C57([CATALOGUE:108]; *)
		CAT_at_CatalogueNames{$_l_SelectedRow}:=[CATALOGUE:108]Catalogue_Name:2
		UNLOAD RECORD:C212([CATALOGUE:108])
		READ ONLY:C145([CATALOGUE:108])
		CAT_LoadCats(-1)
		ARRAY BOOLEAN:C223(CAT_abo_IsAvailable; 0)
		$_l_CatalogueCount:=Size of array:C274(CAT_aI_CatalogueDF)
		ARRAY BOOLEAN:C223(CAT_abo_IsAvailable; $_l_CatalogueCount)
		
		For ($_l_Index; 1; Size of array:C274(CAT_abo_IsAvailable))
			CAT_abo_IsAvailable{$_l_Index}:=(CAT_aI_CatalogueINC{$_l_Index}=1)
		End for 
		SET WINDOW TITLE:C213($_t_WindowTitle)
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oLBCatalogues"; $_t_oldMethodName)
