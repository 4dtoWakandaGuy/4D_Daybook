If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.oLBCatalogues
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CAT_abo_CatalogueEXC;0)
	//ARRAY BOOLEAN(CAT_abo_CatalogueINC;0)
	//ARRAY BOOLEAN(CAT_abo_IsAvailable;0)
	//ARRAY BOOLEAN(CAT_abo_ISDEFAULT;0)
	//ARRAY BOOLEAN(PROD_lb_Catalogues;0)
	//ARRAY INTEGER(CAT_aI_CatalogueDF;0)
	//ARRAY INTEGER(CAT_aI_CatalogueEXC;0)
	//ARRAY INTEGER(CAT_aI_CatalogueINC;0)
	//ARRAY LONGINT(CAT_al_CatalogueID;0)
	//ARRAY TEXT(CAT_at_CatalogueNames;0)
	C_BOOLEAN:C305(CAT_bo_ChangePrefs)
	C_LONGINT:C283($_l_CatalogueIndex; $_l_CurrentSortColumn; $_l_event; $_l_FieldNumber; $_l_Row; $_l_SizeofArray; $_l_TableNumber; $_l_Valid; CAT_l_DefaultCatalogue)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; $_t_VariableName; $_t_WindowTitle; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.oLBCatalogues"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Data Change:K2:15)
		$_l_Row:=Self:C308->
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_CurrentSortColumn:=LB_GetColumn(->PROD_lb_Catalogues; $_t_VariableName)
		Case of 
			: ($_l_CurrentSortColumn=1)  //Default
				$_l_Valid:=CAT_aI_CatalogueDF{$_l_Row}
				If ($_l_Valid=1)
					Gen_Alert("Change the default by selecting the new default")
					CAT_abo_ISDEFAULT{$_l_Row}:=True:C214
				Else 
					For ($_l_CatalogueIndex; 1; Size of array:C274(CAT_aI_CatalogueDF))
						CAT_aI_CatalogueDF{$_l_CatalogueIndex}:=0
						CAT_abo_ISDEFAULT{$_l_CatalogueIndex}:=False:C215
					End for 
					CAT_abo_ISDEFAULT{$_l_Row}:=True:C214
					CAT_aI_CatalogueDF{$_l_Row}:=1
					CAT_aI_CatalogueINC{$_l_Row}:=1
					CAT_abo_CatalogueINC{$_l_Row}:=True:C214
					CAT_l_DefaultCatalogue:=CAT_al_CatalogueID{$_l_Row}
					CAT_bo_ChangePrefs:=True:C214
					
				End if 
			: ($_l_CurrentSortColumn=2)  //Available
				CAT_aI_CatalogueINC{$_l_Row}:=Abs:C99(CAT_aI_CatalogueINC{$_l_Row}-1)
				If (CAT_abo_ISDEFAULT{$_l_Row}=True:C214) & (CAT_aI_CatalogueINC{$_l_Row}=0)
					Gen_Alert("The Default Catalogue must be available")
					CAT_aI_CatalogueINC{$_l_Row}:=1
					CAT_abo_CatalogueINC{$_l_Row}:=True:C214
				End if 
				
				If (CAT_aI_CatalogueINC{$_l_Row}=1)
					// make sure it is not Excluded as well
					CAT_aI_CatalogueEXC{$_l_Row}:=0
				End if 
				CAT_abo_CatalogueEXC{$_l_Row}:=(CAT_aI_CatalogueEXC{$_l_Row}=1)
				CAT_abo_CatalogueINC{$_l_Row}:=(CAT_aI_CatalogueINC{$_l_Row}=1)
				CAT_bo_ChangePrefs:=True:C214
				
			: ($_l_CurrentSortColumn=3)  //Exclude
				CAT_aI_CatalogueEXC{$_l_Row}:=Abs:C99(CAT_aI_CatalogueEXC{$_l_Row}-1)
				If (CAT_abo_ISDEFAULT{$_l_Row}=True:C214) & (CAT_aI_CatalogueINC{$_l_Row}=1)
					Gen_Alert("The Default Cataloguecannot be excluded")
					CAT_aI_CatalogueINC{$_l_Row}:=1
					CAT_abo_CatalogueINC{$_l_Row}:=True:C214
					CAT_aI_CatalogueEXC{$_l_Row}:=0
					CAT_abo_CatalogueINC{$_l_Row}:=False:C215
				End if 
				
				If (CAT_aI_CatalogueEXC{$_l_Row}=1)
					// make sure it is not Excluded as well
					CAT_aI_CatalogueINC{$_l_Row}:=0
				End if 
				CAT_abo_CatalogueEXC{$_l_Row}:=(CAT_aI_CatalogueEXC{$_l_Row}=1)
				CAT_abo_CatalogueINC{$_l_Row}:=(CAT_aI_CatalogueINC{$_l_Row}=1)
				CAT_bo_ChangePrefs:=True:C214
		End case 
	: ($_l_event=On Double Clicked:K2:5)
		$_l_Row:=Self:C308->
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_CurrentSortColumn:=LB_GetColumn(->PROD_lb_Catalogues; ""; $_t_VariableName)
		$_t_CurrentOutputform:=WIN_t_CurrentOutputform
		READ WRITE:C146([CATALOGUE:108])
		$_t_WindowTitle:=Get window title:C450
		QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]x_ID:1=CAT_al_CatalogueID{$_l_Row})
		SET WINDOW TITLE:C213("Catalogue:"+CAT_at_CatalogueNames{$_l_Row})
		DBI_DisplayRecord(Current process:C322; Table:C252(->[CATALOGUE:108]); ""; String:C10([CATALOGUE:108]x_ID:1))
		SET WINDOW TITLE:C213($_t_WindowTitle)
		
		UNLOAD RECORD:C212([CATALOGUE:108])
		READ ONLY:C145([CATALOGUE:108])
		CAT_LoadCats([PERSONNEL:11]Personnel_ID:48)
		ARRAY BOOLEAN:C223(CAT_abo_IsAvailable; 0)
		ARRAY BOOLEAN:C223(CAT_abo_ISDEFAULT; 0)
		$_l_SizeofArray:=Size of array:C274(CAT_aI_CatalogueDF)
		ARRAY BOOLEAN:C223(CAT_abo_IsAvailable; $_l_SizeofArray)
		ARRAY BOOLEAN:C223(CAT_abo_CatalogueINC; $_l_SizeofArray)
		ARRAY BOOLEAN:C223(CAT_abo_CatalogueEXC; $_l_SizeofArray)
		ARRAY BOOLEAN:C223(CAT_abo_ISDEFAULT; $_l_SizeofArray)
		For ($_l_CatalogueIndex; 1; Size of array:C274(CAT_abo_IsAvailable))
			CAT_abo_CatalogueEXC{$_l_CatalogueIndex}:=(CAT_aI_CatalogueEXC{$_l_CatalogueIndex}=1)
			CAT_abo_CatalogueINC{$_l_CatalogueIndex}:=(CAT_aI_CatalogueINC{$_l_CatalogueIndex}=1)
			CAT_abo_ISDEFAULT{$_l_CatalogueIndex}:=(CAT_aI_CatalogueDF{$_l_CatalogueIndex}=1)
		End for 
		
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.oLBCatalogues"; $_t_oldMethodName)
