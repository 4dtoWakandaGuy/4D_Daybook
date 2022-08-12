If (False:C215)
	//Table Form Method Name: Object Name:      [USER].STK_LocationsEditor
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/03/2011 12:00
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(STK_abo_LocMod1;0)
	//ARRAY BOOLEAN(STK_abo_LocMod10;0)
	//ARRAY BOOLEAN(STK_abo_LocMod2;0)
	//ARRAY BOOLEAN(STK_abo_LocMod3;0)
	//ARRAY BOOLEAN(STK_abo_LocMod4;0)
	//ARRAY BOOLEAN(STK_abo_LocMod5;0)
	//ARRAY BOOLEAN(STK_abo_LocMod6;0)
	//ARRAY BOOLEAN(STK_abo_LocMod7;0)
	//ARRAY BOOLEAN(STK_abo_LocMod8;0)
	//ARRAY BOOLEAN(STK_abo_LocMod9;0)
	//ARRAY BOOLEAN(STK_aB_RowModified;0)
	//ARRAY BOOLEAN(STK_abo_SUBRECORDMODIFIED1;0)
	//ARRAY BOOLEAN(STK_abo_SUBRECORDMODIFIED10;0)
	//ARRAY BOOLEAN(STK_abo_SUBRECORDMODIFIED2;0)
	//ARRAY BOOLEAN(STK_abo_SUBRECORDMODIFIED3;0)
	//ARRAY BOOLEAN(STK_abo_SUBRECORDMODIFIED4;0)
	//ARRAY BOOLEAN(STK_abo_SUBRECORDMODIFIED5;0)
	//ARRAY BOOLEAN(STK_abo_SUBRECORDMODIFIED6;0)
	//ARRAY BOOLEAN(STK_abo_SUBRECORDMODIFIED7;0)
	//ARRAY BOOLEAN(STK_abo_SUBRECORDMODIFIED8;0)
	//ARRAY BOOLEAN(STK_abo_SUBRECORDMODIFIED9;0)
	//ARRAY BOOLEAN(STK_abo_ExpandedLevel;0)
	//ARRAY BOOLEAN(STK_abo_LocMod0;0)
	//ARRAY BOOLEAN(STK_lb_Level0;0)
	//ARRAY LONGINT(STK_al_aProductListID0;0)
	//ARRAY LONGINT(STK_al_aProductListID1;0)
	//ARRAY LONGINT(STK_al_aProductListID10;0)
	//ARRAY LONGINT(STK_al_aProductListID2;0)
	//ARRAY LONGINT(STK_al_aProductListID3;0)
	//ARRAY LONGINT(STK_al_aProductListID4;0)
	//ARRAY LONGINT(STK_al_aProductListID5;0)
	//ARRAY LONGINT(STK_al_aProductListID6;0)
	//ARRAY LONGINT(STK_al_aProductListID7;0)
	//ARRAY LONGINT(STK_al_aProductListID8;0)
	//ARRAY LONGINT(STK_al_aProductListID9;0)
	//ARRAY LONGINT(STK_al_CodingPref;0)
	//ARRAY LONGINT(STK_al_CodingPref0;0)
	//ARRAY LONGINT(STK_al_CodingPref1;0)
	//ARRAY LONGINT(STK_al_CodingPref10;0)
	//ARRAY LONGINT(STK_al_CodingPref2;0)
	//ARRAY LONGINT(STK_al_CodingPref3;0)
	//ARRAY LONGINT(STK_al_CodingPref4;0)
	//ARRAY LONGINT(STK_al_CodingPref5;0)
	//ARRAY LONGINT(STK_al_CodingPref6;0)
	//ARRAY LONGINT(STK_al_CodingPref7;0)
	//ARRAY LONGINT(STK_al_CodingPref8;0)
	//ARRAY LONGINT(STK_al_CodingPref9;0)
	//ARRAY LONGINT(STK_al_CodingPrefs;0)
	//ARRAY LONGINT(STK_al_DisLocCount;0)
	//ARRAY LONGINT(STK_al_DisLocIDs;0)
	//ARRAY LONGINT(STK_al_disLocLevel;0)
	//ARRAY LONGINT(STK_al_DisLocParentID;0)
	//ARRAY LONGINT(STK_al_DisSubCoding;0)
	//ARRAY LONGINT(STK_al_LocationsIDs0;0)
	//ARRAY LONGINT(STK_al_LocationsIDs1;0)
	//ARRAY LONGINT(STK_al_LocationsIDs10;0)
	//ARRAY LONGINT(STK_al_LocationsIDs2;0)
	//ARRAY LONGINT(STK_al_LocationsIDs3;0)
	//ARRAY LONGINT(STK_al_LocationsIDs4;0)
	//ARRAY LONGINT(STK_al_LocationsIDs5;0)
	//ARRAY LONGINT(STK_al_LocationsIDs6;0)
	//ARRAY LONGINT(STK_al_LocationsIDs7;0)
	//ARRAY LONGINT(STK_al_LocationsIDs8;0)
	//ARRAY LONGINT(STK_al_LocationsIDs9;0)
	//ARRAY LONGINT(STK_al_LOCParentLocation0;0)
	//ARRAY LONGINT(STK_al_ParentLocation0;0)
	//ARRAY LONGINT(STK_al_ParentLocation1;0)
	//ARRAY LONGINT(STK_al_ParentLocation10;0)
	//ARRAY LONGINT(STK_al_ParentLocation2;0)
	//ARRAY LONGINT(STK_al_ParentLocation3;0)
	//ARRAY LONGINT(STK_al_ParentLocation4;0)
	//ARRAY LONGINT(STK_al_ParentLocation5;0)
	//ARRAY LONGINT(STK_al_ParentLocation6;0)
	//ARRAY LONGINT(STK_al_ParentLocation7;0)
	//ARRAY LONGINT(STK_al_ParentLocation8;0)
	//ARRAY LONGINT(STK_al_ParentLocation9;0)
	//ARRAY LONGINT(STK_al_SubCodingPref1;0)
	//ARRAY LONGINT(STK_al_SubCodingPref10;0)
	//ARRAY LONGINT(STK_al_SubCodingPref2;0)
	//ARRAY LONGINT(STK_al_SubCodingPref3;0)
	//ARRAY LONGINT(STK_al_SubCodingPref4;0)
	//ARRAY LONGINT(STK_al_SubCodingPref5;0)
	//ARRAY LONGINT(STK_al_SubCodingPref6;0)
	//ARRAY LONGINT(STK_al_SubCodingPref7;0)
	//ARRAY LONGINT(STK_al_SubCodingPref8;0)
	//ARRAY LONGINT(STK_al_SubCodingPref9;0)
	//ARRAY LONGINT(STK_al_SubLocationsIDs1;0)
	//ARRAY LONGINT(STK_al_SubLocationsIDs10;0)
	//ARRAY LONGINT(STK_al_SubLocationsIDs2;0)
	//ARRAY LONGINT(STK_al_SubLocationsIDs3;0)
	//ARRAY LONGINT(STK_al_SubLocationsIDs4;0)
	//ARRAY LONGINT(STK_al_SubLocationsIDs5;0)
	//ARRAY LONGINT(STK_al_SubLocationsIDs6;0)
	//ARRAY LONGINT(STK_al_SubLocationsIDs7;0)
	//ARRAY LONGINT(STK_al_SubLocationsIDs8;0)
	//ARRAY LONGINT(STK_al_SubLocationsIDs9;0)
	//ARRAY LONGINT(STK_al_SubParentLocation1;0)
	//ARRAY LONGINT(STK_al_SubParentLocation10;0)
	//ARRAY LONGINT(STK_al_SubParentLocation2;0)
	//ARRAY LONGINT(STK_al_SubParentLocation3;0)
	//ARRAY LONGINT(STK_al_SubParentLocation4;0)
	//ARRAY LONGINT(STK_al_SubParentLocation5;0)
	//ARRAY LONGINT(STK_al_SubParentLocation6;0)
	//ARRAY LONGINT(STK_al_SubParentLocation7;0)
	//ARRAY LONGINT(STK_al_SubParentLocation8;0)
	//ARRAY LONGINT(STK_al_SubParentLocation9;0)
	//ARRAY LONGINT(STK_al_ToplevelLocations;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	//ARRAY REAL(STK_ar_ProductCount0;0)
	//ARRAY REAL(STK_ar_ProductCount1;0)
	//ARRAY REAL(STK_ar_ProductCount10;0)
	//ARRAY REAL(STK_ar_ProductCount2;0)
	//ARRAY REAL(STK_ar_ProductCount3;0)
	//ARRAY REAL(STK_ar_ProductCount4;0)
	//ARRAY REAL(STK_ar_ProductCount5;0)
	//ARRAY REAL(STK_ar_ProductCount6;0)
	//ARRAY REAL(STK_ar_ProductCount7;0)
	//ARRAY REAL(STK_ar_ProductCount8;0)
	//ARRAY REAL(STK_ar_ProductCount9;0)
	//ARRAY REAL(STK_ar_StockAtLocation0;0)
	//ARRAY REAL(STK_ar_StockAtLocation1;0)
	//ARRAY REAL(STK_ar_StockAtLocation10;0)
	//ARRAY REAL(STK_ar_StockAtLocation2;0)
	//ARRAY REAL(STK_ar_StockAtLocation3;0)
	//ARRAY REAL(STK_ar_StockAtLocation4;0)
	//ARRAY REAL(STK_ar_StockAtLocation5;0)
	//ARRAY REAL(STK_ar_StockAtLocation6;0)
	//ARRAY REAL(STK_ar_StockAtLocation7;0)
	//ARRAY REAL(STK_ar_StockAtLocation8;0)
	//ARRAY REAL(STK_ar_StockAtLocation9;0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(ST_at_disLocName;0)
	//ARRAY TEXT(STK_at_CodingPrefs;0)
	//ARRAY TEXT(STK_at_disLocCodes;0)
	//ARRAY TEXT(STK_at_disLocLabel;0)
	//ARRAY TEXT(STK_at_DisSubCoding;0)
	//ARRAY TEXT(STK_at_LevelLabel0;0)
	//ARRAY TEXT(STK_at_LevelLabel1;0)
	//ARRAY TEXT(STK_at_LevelLabel10;0)
	//ARRAY TEXT(STK_at_LevelLabel2;0)
	//ARRAY TEXT(STK_at_LevelLabel3;0)
	//ARRAY TEXT(STK_at_LevelLabel4;0)
	//ARRAY TEXT(STK_at_LevelLabel5;0)
	//ARRAY TEXT(STK_at_LevelLabel6;0)
	//ARRAY TEXT(STK_at_LevelLabel7;0)
	//ARRAY TEXT(STK_at_LevelLabel8;0)
	//ARRAY TEXT(STK_at_LevelLabel9;0)
	//ARRAY TEXT(STK_at_LocationCodes0;0)
	//ARRAY TEXT(STK_at_LocationCodes1;0)
	//ARRAY TEXT(STK_at_LocationCodes10;0)
	//ARRAY TEXT(STK_at_LocationCodes2;0)
	//ARRAY TEXT(STK_at_LocationCodes3;0)
	//ARRAY TEXT(STK_at_LocationCodes4;0)
	//ARRAY TEXT(STK_at_LocationCodes5;0)
	//ARRAY TEXT(STK_at_LocationCodes6;0)
	//ARRAY TEXT(STK_at_LocationCodes7;0)
	//ARRAY TEXT(STK_at_LocationCodes8;0)
	//ARRAY TEXT(STK_at_LocationCodes9;0)
	//ARRAY TEXT(STK_at_LocationHolds0;0)
	//ARRAY TEXT(STK_at_LocationHolds1;0)
	//ARRAY TEXT(STK_at_LocationHolds10;0)
	//ARRAY TEXT(STK_at_LocationHolds2;0)
	//ARRAY TEXT(STK_at_LocationHolds3;0)
	//ARRAY TEXT(STK_at_LocationHolds4;0)
	//ARRAY TEXT(STK_at_LocationHolds5;0)
	//ARRAY TEXT(STK_at_LocationHolds6;0)
	//ARRAY TEXT(STK_at_LocationHolds7;0)
	//ARRAY TEXT(STK_at_LocationHolds8;0)
	//ARRAY TEXT(STK_at_LocationHolds9;0)
	//ARRAY TEXT(STK_at_LocationNames0;0)
	//ARRAY TEXT(STK_at_LocationNames1;0)
	//ARRAY TEXT(STK_at_LocationNames10;0)
	//ARRAY TEXT(STK_at_LocationNames2;0)
	//ARRAY TEXT(STK_at_LocationNames3;0)
	//ARRAY TEXT(STK_at_LocationNames4;0)
	//ARRAY TEXT(STK_at_LocationNames5;0)
	//ARRAY TEXT(STK_at_LocationNames6;0)
	//ARRAY TEXT(STK_at_LocationNames7;0)
	//ARRAY TEXT(STK_at_LocationNames8;0)
	//ARRAY TEXT(STK_at_LocationNames9;0)
	//ARRAY TEXT(STK_at_LocProdCode0;0)
	//ARRAY TEXT(STK_at_LocProdCode1;0)
	//ARRAY TEXT(STK_at_LocProdCode10;0)
	//ARRAY TEXT(STK_at_LocProdCode2;0)
	//ARRAY TEXT(STK_at_LocProdCode3;0)
	//ARRAY TEXT(STK_at_LocProdCode4;0)
	//ARRAY TEXT(STK_at_LocProdCode5;0)
	//ARRAY TEXT(STK_at_LocProdCode6;0)
	//ARRAY TEXT(STK_at_LocProdCode7;0)
	//ARRAY TEXT(STK_at_LocProdCode8;0)
	//ARRAY TEXT(STK_at_LocProdCode9;0)
	//ARRAY TEXT(STK_at_LocProdName0;0)
	//ARRAY TEXT(STK_at_LocProdName1;0)
	//ARRAY TEXT(STK_at_LocProdName10;0)
	//ARRAY TEXT(STK_at_LocProdName2;0)
	//ARRAY TEXT(STK_at_LocProdName3;0)
	//ARRAY TEXT(STK_at_LocProdName4;0)
	//ARRAY TEXT(STK_at_LocProdName5;0)
	//ARRAY TEXT(STK_at_LocProdName6;0)
	//ARRAY TEXT(STK_at_LocProdName7;0)
	//ARRAY TEXT(STK_at_LocProdName8;0)
	//ARRAY TEXT(STK_at_LocProdName9;0)
	//ARRAY TEXT(STK_at_NextLevelLabel;0)
	//ARRAY TEXT(STK_at_PrimeLocations;0)
	//ARRAY TEXT(STK_at_ProductCode0;0)
	//ARRAY TEXT(STK_at_ProductCode1;0)
	//ARRAY TEXT(STK_at_ProductCode10;0)
	//ARRAY TEXT(STK_at_ProductCode2;0)
	//ARRAY TEXT(STK_at_ProductCode3;0)
	//ARRAY TEXT(STK_at_ProductCode4;0)
	//ARRAY TEXT(STK_at_ProductCode5;0)
	//ARRAY TEXT(STK_at_ProductCode6;0)
	//ARRAY TEXT(STK_at_ProductCode7;0)
	//ARRAY TEXT(STK_at_ProductCode8;0)
	//ARRAY TEXT(STK_at_ProductCode9;0)
	//ARRAY TEXT(STK_at_ProductName0;0)
	//ARRAY TEXT(STK_at_ProductName1;0)
	//ARRAY TEXT(STK_at_ProductName10;0)
	//ARRAY TEXT(STK_at_ProductName2;0)
	//ARRAY TEXT(STK_at_ProductName3;0)
	//ARRAY TEXT(STK_at_ProductName4;0)
	//ARRAY TEXT(STK_at_ProductName5;0)
	//ARRAY TEXT(STK_at_ProductName6;0)
	//ARRAY TEXT(STK_at_ProductName7;0)
	//ARRAY TEXT(STK_at_ProductName8;0)
	//ARRAY TEXT(STK_at_ProductName9;0)
	//ARRAY TEXT(STK_at_SessionDeletions;0)
	//ARRAY TEXT(STK_at_SubLevelLabel;0)
	//ARRAY TEXT(STK_at_SubLevelLabel1;0)
	//ARRAY TEXT(STK_at_SubLevelLabel10;0)
	//ARRAY TEXT(STK_at_SubLevelLabel2;0)
	//ARRAY TEXT(STK_at_SubLevelLabel3;0)
	//ARRAY TEXT(STK_at_SubLevelLabel4;0)
	//ARRAY TEXT(STK_at_SubLevelLabel5;0)
	//ARRAY TEXT(STK_at_SubLevelLabel6;0)
	//ARRAY TEXT(STK_at_SubLevelLabel7;0)
	//ARRAY TEXT(STK_at_SubLevelLabel8;0)
	//ARRAY TEXT(STK_at_SubLevelLabel9;0)
	//ARRAY TEXT(STK_at_SubLocationCodes1;0)
	//ARRAY TEXT(STK_at_SubLocationCodes10;0)
	//ARRAY TEXT(STK_at_SubLocationCodes2;0)
	//ARRAY TEXT(STK_at_SubLocationCodes3;0)
	//ARRAY TEXT(STK_at_SubLocationCodes4;0)
	//ARRAY TEXT(STK_at_SubLocationCodes5;0)
	//ARRAY TEXT(STK_at_SubLocationCodes6;0)
	//ARRAY TEXT(STK_at_SubLocationCodes7;0)
	//ARRAY TEXT(STK_at_SubLocationCodes8;0)
	//ARRAY TEXT(STK_at_SubLocationCodes9;0)
	//ARRAY TEXT(STK_at_SubLocationNames1;0)
	//ARRAY TEXT(STK_at_SubLocationNames10;0)
	//ARRAY TEXT(STK_at_SubLocationNames2;0)
	//ARRAY TEXT(STK_at_SubLocationNames3;0)
	//ARRAY TEXT(STK_at_SubLocationNames4;0)
	//ARRAY TEXT(STK_at_SubLocationNames5;0)
	//ARRAY TEXT(STK_at_SubLocationNames6;0)
	//ARRAY TEXT(STK_at_SubLocationNames7;0)
	//ARRAY TEXT(STK_at_SubLocationNames8;0)
	//ARRAY TEXT(STK_at_SubLocationNames9;0)
	//ARRAY TEXT(STK_at_SubLocHolds0;0)
	//ARRAY TEXT(STK_at_SubLocHolds1;0)
	//ARRAY TEXT(STK_at_SubLocHolds10;0)
	//ARRAY TEXT(STK_at_SubLocHolds2;0)
	//ARRAY TEXT(STK_at_SubLocHolds3;0)
	//ARRAY TEXT(STK_at_SubLocHolds4;0)
	//ARRAY TEXT(STK_at_SubLocHolds5;0)
	//ARRAY TEXT(STK_at_SubLocHolds6;0)
	//ARRAY TEXT(STK_at_SubLocHolds7;0)
	//ARRAY TEXT(STK_at_SubLocHolds8;0)
	//ARRAY TEXT(STK_at_SubLocHolds9;0)
	//ARRAY TEXT(STK_at_SubLocProdCode1;0)
	//ARRAY TEXT(STK_at_SubLocProdCode10;0)
	//ARRAY TEXT(STK_at_SubLocProdCode2;0)
	//ARRAY TEXT(STK_at_SubLocProdCode3;0)
	//ARRAY TEXT(STK_at_SubLocProdCode4;0)
	//ARRAY TEXT(STK_at_SubLocProdCode5;0)
	//ARRAY TEXT(STK_at_SubLocProdCode6;0)
	//ARRAY TEXT(STK_at_SubLocProdCode7;0)
	//ARRAY TEXT(STK_at_SubLocProdCode8;0)
	//ARRAY TEXT(STK_at_SubLocProdCode9;0)
	//ARRAY TEXT(STK_at_SubLocProdName1;0)
	//ARRAY TEXT(STK_at_SubLocProdName10;0)
	//ARRAY TEXT(STK_at_SubLocProdName2;0)
	//ARRAY TEXT(STK_at_SubLocProdName3;0)
	//ARRAY TEXT(STK_at_SubLocProdName4;0)
	//ARRAY TEXT(STK_at_SubLocProdName5;0)
	//ARRAY TEXT(STK_at_SubLocProdName6;0)
	//ARRAY TEXT(STK_at_SubLocProdName7;0)
	//ARRAY TEXT(STK_at_SubLocProdName8;0)
	//ARRAY TEXT(STK_at_SubLocProdName9;0)
	//ARRAY TEXT(STK_at_ToplevelLocations;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; STK_bo_ProductFound)
	C_LONGINT:C283($_l_AddRows; $_l_ArraySize; $_l_ButtonPressed; $_l_CodeLength; $_l_CurrentLevel; $_l_event; $_l_FieldNumber; $_l_HeaderLevel; $_l_Index; $_l_LastLocationNameCount; $_l_LastLocationNumber)
	C_LONGINT:C283($_l_LocationCodePosition; $_l_NumberToAdd; $_l_TableNumber; $_t_FirstSubLocation; $CurrentHeader; $_l_CountSublevel; $_l_RecordClashtest; BattachSub; DB_l_ButtonClickedFunction; iCancel; iOK)
	C_LONGINT:C283(SLOC0_l_BUT1; SLOC0_l_BUT2; SLOC0_l_BUT3; SLOC0_l_BUT4; SLOC0_l_BUT5; SLOC0_l_BUT6; SLOC0_l_BUT7; SLOC0_l_BUT8; SLOC0_l_BUT9; SLOC1_l_BUT1; SLOC1_l_BUT2)
	C_LONGINT:C283(SLOC1_l_BUT3; SLOC1_l_BUT4; SLOC1_l_BUT5; SLOC1_l_BUT6; SLOC1_l_BUT7; SLOC1_l_BUT8; SLOC1_l_BUT9; SLOC10_l_BUT1; SLOC10_l_BUT2; SLOC10_l_BUT3; SLOC10_l_BUT4)
	C_LONGINT:C283(SLOC10_l_BUT5; SLOC10_l_BUT6; SLOC10_l_BUT7; SLOC10_l_BUT8; SLOC10_l_BUT9; SLOC2_l_BUT1; SLOC2_l_BUT2; SLOC2_l_BUT3; SLOC2_l_BUT4; SLOC2_l_BUT5; SLOC2_l_BUT6)
	C_LONGINT:C283(SLOC2_l_BUT7; SLOC2_l_BUT8; SLOC2_l_BUT9; SLOC3_l_BUT1; SLOC3_l_BUT2; SLOC3_l_BUT3; SLOC3_l_BUT4; SLOC3_l_BUT5; SLOC3_l_BUT6; SLOC3_l_BUT7; SLOC3_l_BUT8)
	C_LONGINT:C283(SLOC3_l_BUT9; SLOC4_l_BUT1; SLOC4_l_BUT2; SLOC4_l_BUT3; SLOC4_l_BUT4; SLOC4_l_BUT5; SLOC4_l_BUT6; SLOC4_l_BUT7; SLOC4_l_BUT8; SLOC4_l_BUT9; SLOC5_l_BUT1)
	C_LONGINT:C283(SLOC5_l_BUT2; SLOC5_l_BUT3; SLOC5_l_BUT4; SLOC5_l_BUT5; SLOC5_l_BUT6; SLOC5_l_BUT7; SLOC5_l_BUT8; SLOC5_l_BUT9; SLOC6_l_BUT1; SLOC6_l_BUT2; SLOC6_l_BUT3)
	C_LONGINT:C283(SLOC6_l_BUT4; SLOC6_l_BUT5; SLOC6_l_BUT6; SLOC6_l_BUT7; SLOC6_l_BUT8; SLOC6_l_BUT9; SLOC7_l_BUT1; SLOC7_l_BUT2; SLOC7_l_BUT3; SLOC7_l_BUT4; SLOC7_l_BUT5)
	C_LONGINT:C283(SLOC7_l_BUT6; SLOC7_l_BUT7; SLOC7_l_BUT8; SLOC7_l_BUT9; SLOC8_l_BUT1; SLOC8_l_BUT2; SLOC8_l_BUT3; SLOC8_l_BUT4; SLOC8_l_BUT5; SLOC8_l_BUT6; SLOC8_l_BUT7)
	C_LONGINT:C283(SLOC8_l_BUT8; SLOC8_l_BUT9; SLOC9_l_BUT1; SLOC9_l_BUT2; SLOC9_l_BUT3; SLOC9_l_BUT4; SLOC9_l_BUT5; SLOC9_l_BUT6; SLOC9_l_BUT7; SLOC9_l_BUT8; SLOC9_l_BUT9)
	C_LONGINT:C283(STK_al_currentLocation; STK_but_AddFurther; STK_l_ButAddProd; STK_but_AddSub; STK_l_ButdelProd; STK_but_DeleteSub; STK_but_EditSub; STK_l_CountSublevel; STK_l_CountSubLevel0; STK_l_CountSubLevel1; STK_l_CountSubLevel10)
	C_LONGINT:C283(STK_l_CountSubLevel2; STK_l_CountSubLevel3; STK_l_CountSubLevel4; STK_l_CountSubLevel5; STK_l_CountSubLevel6; STK_l_CountSubLevel7; STK_l_CountSubLevel8; STK_l_CountSubLevel9; STK_l_CURRENTLOCATION; STK_l_currentLocation0; STK_l_currentLocation1)
	C_LONGINT:C283(STK_l_currentLocation10; STK_l_currentLocation2; STK_l_currentLocation3; STK_l_currentLocation4; STK_l_currentLocation5; STK_l_currentLocation6; STK_l_currentLocation7; STK_l_currentLocation8; STK_l_currentLocation9; STK_l_ProdatlocSelected0; STK_l_ProdatlocSelected1)
	C_LONGINT:C283(STK_l_ProdatlocSelected10; STK_l_ProdatlocSelected2; STK_l_ProdatlocSelected3; STK_l_ProdatlocSelected4; STK_l_ProdatlocSelected5; STK_l_ProdatlocSelected6; STK_l_ProdatlocSelected7; STK_l_ProdatlocSelected8; STK_l_ProdatlocSelected9; STK_l_ProductID0; STK_l_ProductID1)
	C_LONGINT:C283(STK_l_ProductID10; STK_l_ProductID2; STK_l_ProductID3; STK_l_ProductID4; STK_l_ProductID5; STK_l_ProductID6; STK_l_ProductID7; STK_l_ProductID8; STK_l_ProductID9; STK_l_Subid; STK_l_SubLevelSelected0)
	C_LONGINT:C283(STK_l_SubLevelSelected1; STK_l_SubLevelSelected10; STK_l_SubLevelSelected2; STK_l_SubLevelSelected3; STK_l_SubLevelSelected4; STK_l_SubLevelSelected5; STK_l_SubLevelSelected6; STK_l_SubLevelSelected7; STK_l_SubLevelSelected8; STK_l_SubLevelSelected9; STK_lB_Products)
	C_LONGINT:C283(STK_lb_Sublevels)
	C_POINTER:C301($_Ptr_addProductButton; $_Ptr_addSubLevelButton; $_ptr_Array1; $_ptr_Array10; $_ptr_Array2; $_ptr_Array3; $_ptr_Array4; $_ptr_Array5; $_ptr_Array6; $_ptr_Array7; $_ptr_Array8)
	C_POINTER:C301($_ptr_Array9; $_ptr_CurrentLocation; $_ptr_CurrentLocationCode; $_ptr_CurrentLocationCount; $_ptr_CurrentLocationID; $_ptr_CurrentLocationSubLevName; $_ptr_FocusObject; $_Ptr_HeaderLBArea; $_Ptr_LocationCode; $_Ptr_LocationHoldsArray; $_ptr_LocationIDSArray)
	C_POINTER:C301($_ptr_LocationNameArray; $_ptr_ParentLocationCode; $_ptr_ParentLocationID; $_ptr_ParentLocationName; $_Ptr_ProdCodeArray; $_Ptr_ProdNameArray; $_ptr_ProdSelected; $_ptr_ProductAdd; $_ptr_ProductCode; $_ptr_ProductCodes; $_ptr_ProductCount)
	C_POINTER:C301($_ptr_ProductCounts; $_ptr_ProductDelete; $_ptr_ProductID; $_ptr_ProductIDS; $_ptr_ProductList; $_ptr_ProductName; $_ptr_ProductNames; $_ptr_SubLevelAdd; $_ptr_SubLevelAddFurther; $_Ptr_SubLevelCount; $_ptr_SubLevelDelete)
	C_POINTER:C301($_ptr_SubLevelEdit; $_Ptr_SubLevelLBArea; $_ptr_SubLevelSelect; $_Ptr_SubLocationNamesArray)
	C_REAL:C285(STK_R_ProductCount; STK_R_ProductCount0; STK_R_ProductCount1; STK_R_ProductCount10; STK_R_ProductCount2; STK_R_ProductCount3; STK_R_ProductCount4; STK_R_ProductCount5; STK_R_ProductCount6; STK_R_ProductCount7; STK_R_ProductCount8)
	C_REAL:C285(STK_R_ProductCount9; STK_R_ProductCounter0; STK_R_ProductCounter1; STK_R_ProductCounter10; STK_R_ProductCounter2; STK_R_ProductCounter3; STK_R_ProductCounter4; STK_R_ProductCounter5; STK_R_ProductCounter6; STK_R_ProductCounter7; STK_R_ProductCounter8)
	C_REAL:C285(STK_R_ProductCounter9)
	C_TEXT:C284($_t_LastLocationCode; $_t_LastLocationName; $_t_LastLocationNameNumSTR; $_t_LastLocationNumberSTR; $_t_NextLocationCode; $_t_NextLocationName; $_t_NumberToAddSTR; $_t_oldMethodName; $_t_ProdCodeLabelName; $_t_ProdCountLabelName; $_t_ProdNameLabelName)
	C_TEXT:C284($_t_Singular; $_t_SublevelLabel; $_t_SubLevelLabelName; $_t_SubLocationCode; $_t_SubLocationDefault; $_t_VariableName; oLev0_COL1; oLev0_COL2; oLev0_COL3; oLev0_COL4; oLev0_COL5)
	C_TEXT:C284(oLev0_COL6; oLev0_COL7; oLev0_COL8; oLev0_COL9; oLev0_HED1; oLev0_HED2; oLev0_HED3; oLev0_HED4; oLev0_HED5; oLev0_HED6; oLev0_HED7)
	C_TEXT:C284(oLev0_HED8; oLev0_HED9; oLev1_COL1; oLev1_COL2; oLev1_COL3; oLev1_COL4; oLev1_COL5; oLev1_COL6; oLev1_COL7; oLev1_COL8; oLev1_COL9)
	C_TEXT:C284(oLev1_HED1; oLev1_HED2; oLev1_HED3; oLev1_HED4; oLev1_HED5; oLev1_HED6; oLev1_HED7; oLev1_HED8; oLev1_HED9; oLev10_COL1; oLev10_COL2)
	C_TEXT:C284(oLev10_COL3; oLev10_COL4; oLev10_COL5; oLev10_COL6; oLev10_COL7; oLev10_COL8; oLev10_COL9; oLev10_HED1; oLev10_HED2; oLev10_HED3; oLev10_HED4)
	C_TEXT:C284(oLev10_HED5; oLev10_HED6; oLev10_HED7; oLev10_HED8; oLev10_HED9; oLev2_COL1; oLev2_COL2; oLev2_COL3; oLev2_COL4; oLev2_COL5; oLev2_COL6)
	C_TEXT:C284(oLev2_COL7; oLev2_COL8; oLev2_COL9; oLev2_HED1; oLev2_HED2; oLev2_HED3; oLev2_HED4; oLev2_HED5; oLev2_HED6; oLev2_HED7; oLev2_HED8)
	C_TEXT:C284(oLev2_HED9; oLev3_COL1; oLev3_COL2; oLev3_COL3; oLev3_COL4; oLev3_COL5; oLev3_COL6; oLev3_COL7; oLev3_COL8; oLev3_COL9; oLev3_HED1)
	C_TEXT:C284(oLev3_HED2; oLev3_HED3; oLev3_HED4; oLev3_HED5; oLev3_HED6; oLev3_HED7; oLev3_HED8; oLev3_HED9; oLev4_COL1; oLev4_COL2; oLev4_COL3)
	C_TEXT:C284(oLev4_COL4; oLev4_COL5; oLev4_COL6; oLev4_COL7; oLev4_COL8; oLev4_COL9; oLev4_HED1; oLev4_HED2; oLev4_HED3; oLev4_HED4; oLev4_HED5)
	C_TEXT:C284(oLev4_HED6; oLev4_HED7; oLev4_HED8; oLev4_HED9; oLev5_COL1; oLev5_COL2; oLev5_COL3; oLev5_COL4; oLev5_COL5; oLev5_COL6; oLev5_COL7)
	C_TEXT:C284(oLev5_COL8; oLev5_COL9; oLev5_HED1; oLev5_HED2; oLev5_HED3; oLev5_HED4; oLev5_HED5; oLev5_HED6; oLev5_HED7; oLev5_HED8; oLev5_HED9)
	C_TEXT:C284(oLev6_COL1; oLev6_COL2; oLev6_COL3; oLev6_COL4; oLev6_COL5; oLev6_COL6; oLev6_COL7; oLev6_COL8; oLev6_COL9; oLev6_HED1; oLev6_HED2)
	C_TEXT:C284(oLev6_HED3; oLev6_HED4; oLev6_HED5; oLev6_HED6; oLev6_HED7; oLev6_HED8; oLev6_HED9; oLev7_COL1; oLev7_COL2; oLev7_COL3; oLev7_COL4)
	C_TEXT:C284(oLev7_COL5; oLev7_COL6; oLev7_COL7; oLev7_COL8; oLev7_COL9; oLev7_HED1; oLev7_HED2; oLev7_HED3; oLev7_HED4; oLev7_HED5; oLev7_HED6)
	C_TEXT:C284(oLev7_HED7; oLev7_HED8; oLev7_HED9; oLev8_COL1; oLev8_COL2; oLev8_COL3; oLev8_COL4; oLev8_COL5; oLev8_COL6; oLev8_COL7; oLev8_COL8)
	C_TEXT:C284(oLev8_COL9; oLev8_HED1; oLev8_HED2; oLev8_HED3; oLev8_HED4; oLev8_HED5; oLev8_HED6; oLev8_HED7; oLev8_HED8; oLev8_HED9; oLev9_COL1)
	C_TEXT:C284(oLev9_COL2; oLev9_COL3; oLev9_COL4; oLev9_COL5; oLev9_COL6; oLev9_COL7; oLev9_COL8; oLev9_COL9; oLev9_HED1; oLev9_HED2; oLev9_HED3)
	C_TEXT:C284(oLev9_HED4; oLev9_HED5; oLev9_HED6; oLev9_HED7; oLev9_HED8; oLev9_HED9; STK_t_CurrentLocation; STK_t_CurrentLocation0; STK_t_CurrentLocation1; STK_t_CurrentLocation10; STK_t_CurrentLocation2)
	C_TEXT:C284(STK_t_CurrentLocation3; STK_t_CurrentLocation4; STK_t_CurrentLocation5; STK_t_CurrentLocation6; STK_t_CurrentLocation7; STK_t_CurrentLocation8; STK_t_CurrentLocation9; STK_t_CurrentLocationCode; STK_t_CurrentLocationCode0; STK_t_CurrentLocationCode1; STK_t_CurrentLocationCode10)
	C_TEXT:C284(STK_t_CurrentLocationCode2; STK_t_CurrentLocationCode3; STK_t_CurrentLocationCode4; STK_t_CurrentLocationCode5; STK_t_CurrentLocationCode6; STK_t_CurrentLocationCode7; STK_t_CurrentLocationCode8; STK_t_CurrentLocationCode9; STK_t_ProductCode; STK_t_ProductCode0; STK_t_ProductCode1)
	C_TEXT:C284(STK_t_ProductCode10; STK_t_ProductCode2; STK_t_ProductCode3; STK_t_ProductCode4; STK_t_ProductCode5; STK_t_ProductCode6; STK_t_ProductCode7; STK_t_ProductCode8; STK_t_ProductCode9; STK_T_ProductName; STK_T_ProductName0)
	C_TEXT:C284(STK_T_ProductName1; STK_T_ProductName10; STK_T_ProductName2; STK_T_ProductName3; STK_T_ProductName4; STK_T_ProductName5; STK_T_ProductName6; STK_T_ProductName7; STK_T_ProductName8; STK_T_ProductName9; STK_t_SubLevelLabel0)
	C_TEXT:C284(STK_t_SubLevelLabel1; STK_t_SubLevelLabel10; STK_t_SubLevelLabel3; STK_t_SubLevelLabel4; STK_t_SubLevelLabel5; STK_t_SubLevelLabel6; STK_t_SubLevelLabel7; STK_t_SubLevelLabel8; STK_t_SubLevelLabel9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].STK_LocationsEditor"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY TEXT:C222(STK_at_SessionDeletions; 0)
		OBJECT SET ENTERABLE:C238(STK_t_CurrentLocation; False:C215)
		OBJECT SET ENTERABLE:C238(STK_t_CurrentLocationCode; False:C215)
		
		
		QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]LocationID:4=0)
		If (Records in selection:C76([LOCATIONS:61])>0)
			READ WRITE:C146([LOCATIONS:61])
			QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]LocationID:4=0)
			APPLY TO SELECTION:C70([LOCATIONS:61]; [LOCATIONS:61]LocationID:4:=AA_GetNextID(->[LOCATIONS:61]LocationID:4))
		End if 
		ARRAY LONGINT:C221(STK_al_CodingPrefs; 0)
		ARRAY TEXT:C222(STK_at_CodingPrefs; 0)
		ARRAY LONGINT:C221(STK_al_CodingPrefs; 3)
		ARRAY TEXT:C222(STK_at_CodingPrefs; 3)
		STK_al_CodingPrefs{1}:=1
		STK_al_CodingPrefs{2}:=2
		STK_al_CodingPrefs{3}:=3
		STK_at_CodingPrefs{1}:="Manual"
		STK_at_CodingPrefs{2}:="Numeric"
		STK_at_CodingPrefs{3}:="Alpha-Numeric"
		
		ARRAY TEXT:C222(STK_at_LocationNames0; 0)
		ARRAY LONGINT:C221(STK_al_LocationsIDs0; 0)
		ARRAY TEXT:C222(STK_at_LocationCodes0; 0)
		ARRAY TEXT:C222(STK_at_LevelLabel0; 0)
		ARRAY LONGINT:C221(STK_al_CodingPref0; 0)
		ARRAY LONGINT:C221(STK_al_LOCParentLocation0; 0)  //This will always be 0's
		ARRAY TEXT:C222(STK_at_LocProdCode0; 0)
		ARRAY TEXT:C222(STK_at_LocProdName0; 0)
		ARRAY TEXT:C222(STK_at_SubLocHolds0; 0)
		
		ARRAY TEXT:C222(STK_at_LocationNames10; 0)
		ARRAY LONGINT:C221(STK_al_LocationsIDs10; 0)
		ARRAY TEXT:C222(STK_at_LocationCodes10; 0)
		ARRAY TEXT:C222(STK_at_LevelLabel10; 0)
		ARRAY LONGINT:C221(STK_al_CodingPref10; 0)
		ARRAY LONGINT:C221(STK_al_ParentLocation10; 0)  //This will always be 0's
		ARRAY TEXT:C222(STK_at_LocProdCode10; 0)
		ARRAY TEXT:C222(STK_at_LocProdName10; 0)
		ARRAY BOOLEAN:C223(STK_abo_LocMod10; 0)
		ARRAY REAL:C219(STK_ar_StockAtLocation10; 0)
		ARRAY TEXT:C222(STK_at_LocationHolds10; 0)
		
		ARRAY TEXT:C222(STK_at_LocationNames9; 0)
		ARRAY LONGINT:C221(STK_al_LocationsIDs9; 0)
		ARRAY TEXT:C222(STK_at_LocationCodes9; 0)
		ARRAY TEXT:C222(STK_at_LevelLabel9; 0)
		ARRAY LONGINT:C221(STK_al_CodingPref9; 0)
		ARRAY LONGINT:C221(STK_al_ParentLocation9; 0)  //This will always be 0's
		ARRAY TEXT:C222(STK_at_LocProdCode9; 0)
		ARRAY TEXT:C222(STK_at_LocProdName9; 0)
		ARRAY BOOLEAN:C223(STK_abo_LocMod9; 0)
		ARRAY REAL:C219(STK_ar_StockAtLocation9; 0)
		ARRAY TEXT:C222(STK_at_LocationHolds9; 0)
		
		ARRAY TEXT:C222(STK_at_LocationNames8; 0)
		ARRAY LONGINT:C221(STK_al_LocationsIDs8; 0)
		ARRAY TEXT:C222(STK_at_LocationCodes8; 0)
		ARRAY TEXT:C222(STK_at_LevelLabel8; 0)
		ARRAY LONGINT:C221(STK_al_CodingPref8; 0)
		ARRAY LONGINT:C221(STK_al_ParentLocation8; 0)  //This will always be 0's
		ARRAY TEXT:C222(STK_at_LocProdCode8; 0)
		ARRAY TEXT:C222(STK_at_LocProdName8; 0)
		ARRAY BOOLEAN:C223(STK_abo_LocMod8; 0)
		ARRAY REAL:C219(STK_ar_StockAtLocation8; 0)
		ARRAY TEXT:C222(STK_at_LocationHolds8; 0)
		
		ARRAY TEXT:C222(STK_at_LocationNames7; 0)
		ARRAY LONGINT:C221(STK_al_LocationsIDs7; 0)
		ARRAY TEXT:C222(STK_at_LocationCodes7; 0)
		ARRAY TEXT:C222(STK_at_LevelLabel7; 0)
		ARRAY LONGINT:C221(STK_al_CodingPref7; 0)
		ARRAY LONGINT:C221(STK_al_ParentLocation7; 0)  //This will always be 0's
		ARRAY TEXT:C222(STK_at_LocProdCode7; 0)
		ARRAY TEXT:C222(STK_at_LocProdName7; 0)
		ARRAY BOOLEAN:C223(STK_abo_LocMod7; 0)
		ARRAY REAL:C219(STK_ar_StockAtLocation7; 0)
		ARRAY TEXT:C222(STK_at_LocationHolds7; 0)
		
		
		ARRAY TEXT:C222(STK_at_LocationNames6; 0)
		ARRAY LONGINT:C221(STK_al_LocationsIDs6; 0)
		ARRAY TEXT:C222(STK_at_LocationCodes6; 0)
		ARRAY TEXT:C222(STK_at_LevelLabel6; 0)
		ARRAY LONGINT:C221(STK_al_CodingPref6; 0)
		ARRAY LONGINT:C221(STK_al_ParentLocation6; 0)  //This will always be 0's
		ARRAY TEXT:C222(STK_at_LocProdCode6; 0)
		ARRAY TEXT:C222(STK_at_LocProdName6; 0)
		ARRAY BOOLEAN:C223(STK_abo_LocMod6; 0)
		ARRAY REAL:C219(STK_ar_StockAtLocation6; 0)
		ARRAY TEXT:C222(STK_at_LocationHolds6; 0)
		
		ARRAY TEXT:C222(STK_at_LocationNames5; 0)
		ARRAY LONGINT:C221(STK_al_LocationsIDs5; 0)
		ARRAY TEXT:C222(STK_at_LocationCodes5; 0)
		ARRAY TEXT:C222(STK_at_LevelLabel5; 0)
		ARRAY LONGINT:C221(STK_al_CodingPref5; 0)
		ARRAY LONGINT:C221(STK_al_ParentLocation5; 0)  //This will always be 0's
		ARRAY TEXT:C222(STK_at_LocProdCode5; 0)
		ARRAY TEXT:C222(STK_at_LocProdName5; 0)
		ARRAY BOOLEAN:C223(STK_abo_LocMod5; 0)
		ARRAY REAL:C219(STK_ar_StockAtLocation5; 0)
		ARRAY TEXT:C222(STK_at_LocationHolds5; 0)
		
		
		ARRAY TEXT:C222(STK_at_LocationNames4; 0)
		ARRAY LONGINT:C221(STK_al_LocationsIDs4; 0)
		ARRAY TEXT:C222(STK_at_LocationCodes4; 0)
		ARRAY TEXT:C222(STK_at_LevelLabel4; 0)
		ARRAY LONGINT:C221(STK_al_CodingPref4; 0)
		ARRAY LONGINT:C221(STK_al_ParentLocation4; 0)  //This will always be 0's
		ARRAY TEXT:C222(STK_at_LocProdCode4; 0)
		ARRAY TEXT:C222(STK_at_LocProdName4; 0)
		ARRAY BOOLEAN:C223(STK_abo_LocMod4; 0)
		ARRAY REAL:C219(STK_ar_StockAtLocation4; 0)
		ARRAY TEXT:C222(STK_at_LocationHolds4; 0)
		
		ARRAY TEXT:C222(STK_at_LocationNames3; 0)
		ARRAY LONGINT:C221(STK_al_LocationsIDs3; 0)
		ARRAY TEXT:C222(STK_at_LocationCodes3; 0)
		ARRAY TEXT:C222(STK_at_LevelLabel3; 0)
		ARRAY LONGINT:C221(STK_al_CodingPref3; 0)
		ARRAY LONGINT:C221(STK_al_ParentLocation3; 0)  //This will always be 0's
		ARRAY TEXT:C222(STK_at_LocProdCode3; 0)
		ARRAY TEXT:C222(STK_at_LocProdName3; 0)
		ARRAY BOOLEAN:C223(STK_abo_LocMod3; 0)
		ARRAY REAL:C219(STK_ar_StockAtLocation3; 0)
		ARRAY TEXT:C222(STK_at_LocationHolds3; 0)
		
		ARRAY TEXT:C222(STK_at_LocationNames2; 0)
		ARRAY LONGINT:C221(STK_al_LocationsIDs2; 0)
		ARRAY TEXT:C222(STK_at_LocationCodes2; 0)
		ARRAY TEXT:C222(STK_at_LevelLabel2; 0)
		ARRAY LONGINT:C221(STK_al_CodingPref2; 0)
		ARRAY LONGINT:C221(STK_al_ParentLocation2; 0)  //This will always be 0's
		ARRAY TEXT:C222(STK_at_LocProdCode2; 0)
		ARRAY TEXT:C222(STK_at_LocProdName2; 0)
		ARRAY BOOLEAN:C223(STK_abo_LocMod2; 0)
		ARRAY REAL:C219(STK_ar_StockAtLocation2; 0)
		ARRAY TEXT:C222(STK_at_LocationHolds2; 0)
		
		ARRAY TEXT:C222(STK_at_LocationNames1; 0)
		ARRAY LONGINT:C221(STK_al_LocationsIDs1; 0)
		ARRAY TEXT:C222(STK_at_LocationCodes1; 0)
		ARRAY TEXT:C222(STK_at_LevelLabel1; 0)
		ARRAY LONGINT:C221(STK_al_CodingPref1; 0)
		ARRAY LONGINT:C221(STK_al_ParentLocation1; 0)  //This will always be 0's
		ARRAY TEXT:C222(STK_at_LocProdCode1; 0)
		ARRAY TEXT:C222(STK_at_LocProdName1; 0)
		ARRAY BOOLEAN:C223(STK_abo_LocMod1; 0)
		ARRAY REAL:C219(STK_ar_StockAtLocation1; 0)
		ARRAY TEXT:C222(STK_at_LocationHolds1; 0)
		
		ARRAY LONGINT:C221(STK_al_aProductListID0; 0)
		ARRAY TEXT:C222(STK_at_ProductCode0; 0)
		ARRAY TEXT:C222(STK_at_ProductName0; 0)
		ARRAY REAL:C219(STK_ar_ProductCount0; 0)
		
		
		//``
		ARRAY TEXT:C222(STK_at_SubLocationNames1; 0)
		ARRAY LONGINT:C221(STK_al_SubLocationsIDs1; 0)
		ARRAY TEXT:C222(STK_at_SubLocationCodes1; 0)
		ARRAY TEXT:C222(STK_at_SubLevelLabel1; 0)
		ARRAY LONGINT:C221(STK_al_SubCodingPref1; 0)
		ARRAY LONGINT:C221(STK_al_SubParentLocation1; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdCode1; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdName1; 0)
		ARRAY TEXT:C222(STK_at_SubLocHolds1; 0)
		
		ARRAY LONGINT:C221(STK_al_aProductListID1; 0)
		ARRAY TEXT:C222(STK_at_ProductCode1; 0)
		ARRAY TEXT:C222(STK_at_ProductName1; 0)
		ARRAY REAL:C219(STK_ar_ProductCount1; 0)
		
		
		
		
		
		ARRAY TEXT:C222(STK_at_SubLocationNames2; 0)
		ARRAY LONGINT:C221(STK_al_SubLocationsIDs2; 0)
		ARRAY TEXT:C222(STK_at_SubLocationCodes2; 0)
		ARRAY TEXT:C222(STK_at_SubLevelLabel2; 0)
		ARRAY LONGINT:C221(STK_al_SubCodingPref2; 0)
		ARRAY LONGINT:C221(STK_al_SubParentLocation2; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdCode2; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdName2; 0)
		ARRAY TEXT:C222(STK_at_SubLocHolds2; 0)
		
		ARRAY LONGINT:C221(STK_al_aProductListID2; 0)
		ARRAY TEXT:C222(STK_at_ProductCode2; 0)
		ARRAY TEXT:C222(STK_at_ProductName2; 0)
		ARRAY REAL:C219(STK_ar_ProductCount2; 0)
		
		
		ARRAY TEXT:C222(STK_at_SubLocationNames3; 0)
		ARRAY LONGINT:C221(STK_al_SubLocationsIDs3; 0)
		ARRAY TEXT:C222(STK_at_SubLocationCodes3; 0)
		ARRAY TEXT:C222(STK_at_SubLevelLabel3; 0)
		ARRAY LONGINT:C221(STK_al_SubCodingPref3; 0)
		ARRAY LONGINT:C221(STK_al_SubParentLocation3; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdCode3; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdName3; 0)
		ARRAY TEXT:C222(STK_at_SubLocHolds3; 0)
		
		ARRAY LONGINT:C221(STK_al_aProductListID3; 0)
		ARRAY TEXT:C222(STK_at_ProductCode3; 0)
		ARRAY TEXT:C222(STK_at_ProductName3; 0)
		ARRAY REAL:C219(STK_ar_ProductCount3; 0)
		
		ARRAY TEXT:C222(STK_at_SubLocationNames4; 0)
		ARRAY LONGINT:C221(STK_al_SubLocationsIDs4; 0)
		ARRAY TEXT:C222(STK_at_SubLocationCodes4; 0)
		ARRAY TEXT:C222(STK_at_SubLevelLabel4; 0)
		ARRAY LONGINT:C221(STK_al_SubCodingPref4; 0)
		ARRAY LONGINT:C221(STK_al_SubParentLocation4; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdCode4; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdName4; 0)
		ARRAY TEXT:C222(STK_at_SubLocHolds4; 0)
		
		ARRAY LONGINT:C221(STK_al_aProductListID4; 0)
		ARRAY TEXT:C222(STK_at_ProductCode4; 0)
		ARRAY TEXT:C222(STK_at_ProductName4; 0)
		ARRAY REAL:C219(STK_ar_ProductCount4; 0)
		
		
		ARRAY TEXT:C222(STK_at_SubLocationNames5; 0)
		ARRAY LONGINT:C221(STK_al_SubLocationsIDs5; 0)
		ARRAY TEXT:C222(STK_at_SubLocationCodes5; 0)
		ARRAY TEXT:C222(STK_at_SubLevelLabel5; 0)
		ARRAY LONGINT:C221(STK_al_SubCodingPref5; 0)
		ARRAY LONGINT:C221(STK_al_SubParentLocation5; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdCode5; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdName5; 0)
		ARRAY TEXT:C222(STK_at_SubLocHolds5; 0)
		
		ARRAY LONGINT:C221(STK_al_aProductListID5; 0)
		ARRAY TEXT:C222(STK_at_ProductCode5; 0)
		ARRAY TEXT:C222(STK_at_ProductName5; 0)
		ARRAY REAL:C219(STK_ar_ProductCount5; 0)
		
		ARRAY TEXT:C222(STK_at_SubLocationNames6; 0)
		ARRAY LONGINT:C221(STK_al_SubLocationsIDs6; 0)
		ARRAY TEXT:C222(STK_at_SubLocationCodes6; 0)
		ARRAY TEXT:C222(STK_at_SubLevelLabel6; 0)
		ARRAY LONGINT:C221(STK_al_SubCodingPref6; 0)
		ARRAY LONGINT:C221(STK_al_SubParentLocation6; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdCode6; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdName6; 0)
		ARRAY TEXT:C222(STK_at_SubLocHolds6; 0)
		
		ARRAY LONGINT:C221(STK_al_aProductListID6; 0)
		ARRAY TEXT:C222(STK_at_ProductCode6; 0)
		ARRAY TEXT:C222(STK_at_ProductName6; 0)
		ARRAY REAL:C219(STK_ar_ProductCount6; 0)
		
		ARRAY TEXT:C222(STK_at_SubLocationNames7; 0)
		ARRAY LONGINT:C221(STK_al_SubLocationsIDs7; 0)
		ARRAY TEXT:C222(STK_at_SubLocationCodes7; 0)
		ARRAY TEXT:C222(STK_at_SubLevelLabel7; 0)
		ARRAY LONGINT:C221(STK_al_SubCodingPref7; 0)
		ARRAY LONGINT:C221(STK_al_SubParentLocation7; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdCode7; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdName7; 0)
		ARRAY TEXT:C222(STK_at_SubLocHolds7; 0)
		
		ARRAY LONGINT:C221(STK_al_aProductListID7; 0)
		ARRAY TEXT:C222(STK_at_ProductCode7; 0)
		ARRAY TEXT:C222(STK_at_ProductName7; 0)
		ARRAY REAL:C219(STK_ar_ProductCount7; 0)
		
		ARRAY TEXT:C222(STK_at_SubLocationNames8; 0)
		ARRAY LONGINT:C221(STK_al_SubLocationsIDs8; 0)
		ARRAY TEXT:C222(STK_at_SubLocationCodes8; 0)
		ARRAY TEXT:C222(STK_at_SubLevelLabel8; 0)
		ARRAY LONGINT:C221(STK_al_SubCodingPref8; 0)
		ARRAY LONGINT:C221(STK_al_SubParentLocation8; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdCode8; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdName8; 0)
		ARRAY TEXT:C222(STK_at_SubLocHolds8; 0)
		
		ARRAY LONGINT:C221(STK_al_aProductListID8; 0)
		ARRAY TEXT:C222(STK_at_ProductCode8; 0)
		ARRAY TEXT:C222(STK_at_ProductName8; 0)
		ARRAY REAL:C219(STK_ar_ProductCount8; 0)
		
		
		ARRAY TEXT:C222(STK_at_SubLocationNames9; 0)
		ARRAY LONGINT:C221(STK_al_SubLocationsIDs9; 0)
		ARRAY TEXT:C222(STK_at_SubLocationCodes9; 0)
		ARRAY TEXT:C222(STK_at_SubLevelLabel9; 0)
		ARRAY LONGINT:C221(STK_al_SubCodingPref9; 0)
		ARRAY LONGINT:C221(STK_al_SubParentLocation9; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdCode9; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdName9; 0)
		ARRAY TEXT:C222(STK_at_SubLocHolds9; 0)
		
		ARRAY LONGINT:C221(STK_al_aProductListID9; 0)
		ARRAY TEXT:C222(STK_at_ProductCode9; 0)
		ARRAY TEXT:C222(STK_at_ProductName9; 0)
		ARRAY REAL:C219(STK_ar_ProductCount9; 0)
		
		
		ARRAY TEXT:C222(STK_at_SubLocationNames10; 0)
		ARRAY LONGINT:C221(STK_al_SubLocationsIDs10; 0)
		ARRAY TEXT:C222(STK_at_SubLocationCodes10; 0)
		ARRAY TEXT:C222(STK_at_SubLevelLabel10; 0)
		ARRAY LONGINT:C221(STK_al_SubCodingPref10; 0)
		ARRAY LONGINT:C221(STK_al_SubParentLocation10; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdCode10; 0)
		ARRAY TEXT:C222(STK_at_SubLocProdName10; 0)
		ARRAY TEXT:C222(STK_at_SubLocHolds10; 0)
		
		ARRAY LONGINT:C221(STK_al_aProductListID10; 0)
		ARRAY TEXT:C222(STK_at_ProductCode10; 0)
		ARRAY TEXT:C222(STK_at_ProductName10; 0)
		ARRAY REAL:C219(STK_ar_ProductCount10; 0)
		
		ARRAY BOOLEAN:C223(STK_abo_SUBRECORDMODIFIED1; 0)
		ARRAY BOOLEAN:C223(STK_abo_SUBRECORDMODIFIED2; 0)
		
		ARRAY BOOLEAN:C223(STK_abo_SUBRECORDMODIFIED3; 0)
		ARRAY BOOLEAN:C223(STK_abo_SUBRECORDMODIFIED4; 0)
		ARRAY BOOLEAN:C223(STK_abo_SUBRECORDMODIFIED5; 0)
		ARRAY BOOLEAN:C223(STK_abo_SUBRECORDMODIFIED6; 0)
		ARRAY BOOLEAN:C223(STK_abo_SUBRECORDMODIFIED7; 0)
		ARRAY BOOLEAN:C223(STK_abo_SUBRECORDMODIFIED8; 0)
		ARRAY BOOLEAN:C223(STK_abo_SUBRECORDMODIFIED9; 0)
		ARRAY BOOLEAN:C223(STK_abo_SUBRECORDMODIFIED10; 0)
		
		ARRAY TEXT:C222(STK_at_ToplevelLocations; 0)
		ARRAY LONGINT:C221(STK_al_ToplevelLocations; 0)
		ARRAY TEXT:C222(STK_at_PrimeLocations; 0)
		ARRAY TEXT:C222(STK_at_SubLevelLabel; 0)
		ARRAY LONGINT:C221(STK_al_CodingPref; 0)
		If (True:C214)
			OBJECT SET VISIBLE:C603(*; "oButtonAddFirstSublocation@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oButtonAssignProduct@"; False:C215)
			
			OBJECT SET VISIBLE:C603(*; "oSubLocationCountLabel@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oProductCodeLabel@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oProductNameLabel@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oProductCountLabel@"; False:C215)
			
			
			
			OBJECT SET VISIBLE:C603(*; "oLocationCount@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oLocationPrdCode@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oLocationPrdName@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oLocationPrdCount@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oButtonAddFurtherSub@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oButtonEditSub@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oButtonDeleteSub@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oButtonAddSub@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oAddAnotherroduct@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "odelProd@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oattachlocations@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSubLevelInformation@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oProductInformation@"; False:C215)
			
		End if 
		
		OBJECT SET ENTERABLE:C238(*; "oLocationName@"; False:C215)
		OBJECT SET ENTERABLE:C238(*; "oLocationCode@"; False:C215)
		
		QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]ParentLocationID:3=0)
		ARRAY TEXT:C222(STK_at_LocationNames0; 0)
		ARRAY LONGINT:C221(STK_al_LocationsIDs0; 0)
		ARRAY TEXT:C222(STK_at_LocationCodes0; 0)
		ARRAY TEXT:C222(STK_at_LevelLabel0; 0)
		ARRAY LONGINT:C221(STK_al_CodingPref0; 0)
		ARRAY LONGINT:C221(STK_al_ParentLocation0; 0)  //This will always be 0's
		ARRAY TEXT:C222(STK_at_LocProdCode0; 0)
		ARRAY TEXT:C222(STK_at_LocProdName0; 0)
		ARRAY BOOLEAN:C223(STK_abo_LocMod0; 0)
		ARRAY REAL:C219(STK_ar_StockAtLocation0; 0)
		ARRAY TEXT:C222(STK_at_LocationHolds0; 0)
		SELECTION TO ARRAY:C260([LOCATIONS:61]Location_Code:1; STK_at_PrimeLocations; [LOCATIONS:61]Location_Name:2; STK_at_ToplevelLocations; [LOCATIONS:61]LocationID:4; STK_al_ToplevelLocations; [LOCATIONS:61]Sub_location_Labelled:6; STK_at_SubLevelLabel; [LOCATIONS:61]Sub_LocationCodingPref:7; STK_al_CodingPref)
		SELECTION TO ARRAY:C260([LOCATIONS:61]Location_Code:1; STK_at_LocationCodes0; [LOCATIONS:61]Location_Name:2; STK_at_LocationNames0; [LOCATIONS:61]LocationID:4; STK_al_LocationsIDs0; [LOCATIONS:61]Sub_location_Labelled:6; STK_at_LevelLabel0; [LOCATIONS:61]Sub_LocationCodingPref:7; STK_al_CodingPref0)
		$_l_ArraySize:=Size of array:C274(STK_at_LocationCodes0)
		ARRAY TEXT:C222(STK_at_LocProdCode0; $_l_ArraySize)
		ARRAY TEXT:C222(STK_at_LocProdName0; $_l_ArraySize)
		ARRAY BOOLEAN:C223(STK_abo_LocMod0; $_l_ArraySize)
		ARRAY REAL:C219(STK_ar_StockAtLocation0; $_l_ArraySize)
		ARRAY TEXT:C222(STK_at_LocationHolds0; $_l_ArraySize)
		For ($_l_Index; 1; Size of array:C274(STK_at_LocProdCode0))
			If (STK_at_SubLevelLabel{$_l_Index}="")
				//No sublevel maybe a product is stored there
				QUERY:C277([x_ProductLocations:185]; [x_ProductLocations:185]x_LocationCode:2=STK_at_LocationCodes0{$_l_Index})
				If (Records in selection:C76([x_ProductLocations:185])>0)
					If (Records in selection:C76([x_ProductLocations:185])=1)
						//There is product stored there..maybe more than one product
						QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]X_ID:43=[x_ProductLocations:185]x_ProductID:1)
						STK_at_LocProdCode0{$_l_Index}:=[PRODUCTS:9]Product_Code:1
						STK_at_LocProdName0{$_l_Index}:=[PRODUCTS:9]Product_Name:2
						STK_GetActiveThreads([PRODUCTS:9]X_ID:43; ""; 0; "ANY"; "ANY"; "ANY"; 0; 0; ""; 0; 0; ""; ""; STK_at_LocationCodes0{$_l_Index})
						STK_ar_StockAtLocation0{$_l_Index}:=Sum:C1([Stock_Thread:143]Quantity:13)
						STK_at_LocationHolds0{$_l_Index}:=STK_at_LocProdCode0{$_l_Index}+", "+STK_at_LocProdName0{$_l_Index}
					Else 
						//Mulltiple products
						STK_at_LocProdCode0{$_l_Index}:="Multiple Products"
						STK_at_LocProdName0{$_l_Index}:="Select Location to see product range"
						STK_ar_StockAtLocation0{$_l_Index}:=0
						STK_at_LocationHolds0{$_l_Index}:=STK_at_LocProdCode0{$_l_Index}+", "+STK_at_LocProdName0{$_l_Index}
					End if 
				End if 
			Else 
				STK_at_LocationHolds0{$_l_Index}:=STK_at_SubLevelLabel{$_l_Index}
			End if 
			If (STK_at_LocationHolds0{$_l_Index}="")
				STK_at_LocationHolds0{$_l_Index}:="Unknown"
			End if 
		End for 
		
		SORT ARRAY:C229(STK_at_ToplevelLocations; STK_al_ToplevelLocations; STK_at_PrimeLocations; STK_at_SubLevelLabel; STK_al_CodingPref)
		//````
		//`
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		LB_SetupListbox(->STK_lb_Level0; "oLev0"; "SLOC0_L"; 1; ->STK_at_LocationNames0; ->STK_at_LocationCodes0; ->STK_at_LocationHolds0; ->STK_at_LocProdCode0; ->STK_at_LocProdName0; ->STK_at_LevelLabel0; ->STK_al_LocationsIDs0; ->STK_abo_LocMod0)
		
		
		LB_SetColumnHeaders(->STK_lb_Level0; "SLOC0_L"; 1; "Location Point"; "Location Code"; "Location Content"; "Product At location"; "Product Name"; "SubLevel"; "Location ID"; "Modified")
		
		LB_SetColumnWidths(->STK_lb_Level0; "oLev0"; 1; 120; 70; 190; 0; 0; 0; 0; 0)
		
		LB_SetScroll(->STK_lb_Level0; -2; -3)
		LB_SETENTRYOPTIONS  // doesn't actually do anything ...
		LB_StyleSettings(->STK_lb_Level0; "blue"; 9; "oLev0"; ->[LOCATIONS:61])
		LB_SetScroll(->STK_lb_Level0; -2; -2)
		LB_SetEnterable(->STK_lb_Level0; False:C215; 0)
		
		//```
		STK_at_ToplevelLocations:=0
		ARRAY LONGINT:C221(STK_al_DisLocIDs; 0)  //The record ID for the row
		ARRAY TEXT:C222(STK_at_disLocLabel; 0)  //the name eg AISLE, BIN etc for the row
		ARRAY LONGINT:C221(STK_al_disLocLevel; 0)  // The level(so we can write back to the correct level arrays
		ARRAY TEXT:C222(STK_at_disLocCodes; 0)  //The row location code
		ARRAY TEXT:C222(ST_at_disLocName; 0)  // The row location name
		ARRAY LONGINT:C221(STK_al_DisLocCount; 0)  //The dynamic count of subrows(at one level down) displayed whether expanded or not...note that changing this adds rows to the next level arrays(displayed or not)
		ARRAY TEXT:C222(STK_at_NextLevelLabel; 0)  //the sub level label..note that if this is empty any entered value in the count will be rejected
		ARRAY BOOLEAN:C223(STK_abo_ExpandedLevel; 0)  // a check box to expand the row..rejects entry if there is no sub level label
		ARRAY LONGINT:C221(STK_al_DisLocParentID; 0)  // the parent ID so when we auto fill we can write back easy to the parent row
		ARRAY LONGINT:C221(STK_al_DisSubCoding; 0)
		ARRAY TEXT:C222(STK_at_DisSubCoding; 0)
		ARRAY BOOLEAN:C223(STK_aB_RowModified; 0)
	: ($_l_event=On Outside Call:K2:11)
		$_l_ButtonPressed:=DB_l_ButtonClickedFunction
		Case of 
			: (($_l_ButtonPressed=DB_GetButtonFunction("OK")) | (iOK=1))
				// if any re-sorting took place deal with it here
				
				Transact_End(True:C214)
				
				
				
				
				
				
				CANCEL:C270
				
			: (($_l_ButtonPressed=DB_GetButtonFunction("Cancel")) | (iCancel=1))
				OK:=0
				Gen_Confirm("This will save no changes made during edits on this form"; "Stop"; "Continue")
				If (OK=0)
					Transact_End(False:C215)
					CANCEL:C270
				End if 
				OK:=1
			: ($_l_ButtonPressed=DB_GetButtonFunction("Add"))
				
		End case 
		DB_l_ButtonClickedFunction:=0
		
	: ($_l_event=On Data Change:K2:15)
		$_ptr_FocusObject:=Focus object:C278
		$_l_CurrentLevel:=FORM Get current page:C276
		$_l_HeaderLevel:=$_l_CurrentLevel-1
		$_Ptr_addSubLevelButton:=Get pointer:C304("STK_but_AddSub"+String:C10($_l_HeaderLevel))  //Add the first sub level..hidden if a location or has already got a sublevel or product assigned"
		$_Ptr_addProductButton:=Get pointer:C304("STK_but_AddProd"+String:C10($_l_HeaderLevel))  //assign a  first Product..hidden if a location or has already got a sublevel or product assigned
		$_Ptr_SubLevelLBArea:=Get pointer:C304("STK_lb_Sublevels"+String:C10($_l_HeaderLevel))  //List of next level locations
		$_Ptr_SubLevelCount:=Get pointer:C304("STK_l_CountSublevel"+String:C10($_l_HeaderLevel))  //Count of next level locations
		
		
		$_t_SubLevelLabelName:="oSubLocationCountLabel"+String:C10($_l_HeaderLevel)
		$_t_ProdCodeLabelName:="oProductCodeLabel"+String:C10($_l_HeaderLevel)
		$_t_ProdNameLabelName:="oProductNameLabel"+String:C10($_l_HeaderLevel)
		$_t_ProdCountLabelName:="oProductCountLabel"+String:C10($_l_HeaderLevel)
		$_ptr_SubLevelAddFurther:=Get pointer:C304("STK_but_AddFurther"+String:C10($_l_HeaderLevel))  //Button to populate the next range of sublevels
		$_ptr_SubLevelEdit:=Get pointer:C304("STK_but_EditSub"+String:C10($_l_HeaderLevel))  //Button to edit a sublevel
		$_ptr_SubLevelDelete:=Get pointer:C304("STK_but_DeleteSub"+String:C10($_l_HeaderLevel))  //Button to delete a sublevel
		$_ptr_SubLevelAdd:=Get pointer:C304("STK_but_AddSub"+String:C10($_l_HeaderLevel))  //Button to add more sublevel records
		
		$_ptr_ProductDelete:=Get pointer:C304("STK_l_ButdelProd"+String:C10($_l_HeaderLevel))  //Button to remove the assigning of a product to a location
		$_ptr_ProductAdd:=Get pointer:C304("STK_l_ButAddProd"+String:C10($_l_HeaderLevel))  // Button to add another product to the location(changes from single to double if currently only one
		
		$_ptr_ProductList:=Get pointer:C304("STK_lB_Products"+String:C10($_l_HeaderLevel))  //Area showing list of products at this location..only displayed if multiple products at this one location
		$_ptr_ProductCodes:=Get pointer:C304("STK_at_ProductCode"+String:C10($_l_HeaderLevel))  //Array of Products(Codes) to display in list of products
		$_ptr_ProductIDS:=Get pointer:C304("STK_al_aProductListID"+String:C10($_l_HeaderLevel))  //Array of Products(IDS) to display in list of products
		$_ptr_ProductNames:=Get pointer:C304("STK_at_ProductName"+String:C10($_l_HeaderLevel))  //Array of Products(Names) to display in list of products
		$_ptr_ProductCounts:=Get pointer:C304("STK_ar_ProductCount"+String:C10($_l_HeaderLevel))  //Array of Products( stock count at location) to display in list of products
		
		$_ptr_ProductCode:=Get pointer:C304("STK_t_ProductCode"+String:C10($_l_HeaderLevel))  //`Single Product(Code) to display
		$_ptr_ProductID:=Get pointer:C304("STK_l_ProductID"+String:C10($_l_HeaderLevel))  //`Single Product(ID) to display
		$_ptr_ProductName:=Get pointer:C304("STK_T_ProductName"+String:C10($_l_HeaderLevel))  //`Single Product(Name) to display
		$_ptr_ProductCount:=Get pointer:C304("STK_R_ProductCount"+String:C10($_l_HeaderLevel))  //`Single Product(Stock Count at location) to display
		
		$_ptr_CurrentLocation:=Get pointer:C304("STK_t_CurrentLocation"+String:C10($_l_HeaderLevel))  //`Selected location name
		$_ptr_CurrentLocationSubLevName:=Get pointer:C304("STK_t_SubLevelLabel"+String:C10($_l_HeaderLevel))  //Name of the sublevels attached to this location
		$_ptr_CurrentLocationCode:=Get pointer:C304("STK_t_CurrentLocationCode"+String:C10($_l_HeaderLevel))  //Selected location code
		$_ptr_CurrentLocationID:=Get pointer:C304("STK_l_currentLocation"+String:C10($_l_HeaderLevel))  //Selected location ID
		$_ptr_CurrentLocationCount:=Get pointer:C304("STK_l_CountSublevel"+String:C10($_l_HeaderLevel))  //Count of the sublevels for this level
		//```
		//Pointers relating to the sublevels
		$_ptr_SubLevelSelect:=Get pointer:C304("STK_l_SubLevelSelected"+String:C10($_l_CurrentLevel))
		$_ptr_ProdSelected:=Get pointer:C304("STK_l_ProdatlocSelected"+String:C10($_l_CurrentLevel))
		
		
		
		RESOLVE POINTER:C394($_ptr_FocusObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		Case of 
				
			: ($_t_VariableName="STK_t_CurrentLocation@") | ($_t_VariableName="STK_t_CurrentLocationCode@")
				ARRAY TEXT:C222($_at_ColumnNames; 0)
				ARRAY TEXT:C222($_at_HeaderNames; 0)
				ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
				ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
				ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
				ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
				$_Ptr_HeaderLBArea:=Get pointer:C304("STK_lb_Level"+String:C10($_l_HeaderLevel))
				LISTBOX GET ARRAYS:C832($_Ptr_HeaderLBArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
				$_Ptr_LocationCode:=$_aptr_ColumnVariables{2}
				$_ptr_LocationNameArray:=$_aptr_ColumnVariables{1}
				$_ptr_LocationIDSArray:=$_aptr_ColumnVariables{7}
				$_Ptr_SubLocationNamesArray:=$_aptr_ColumnVariables{6}
				$_Ptr_ProdCodeArray:=$_aptr_ColumnVariables{4}
				$_ptr_LocationHoldsArray:=$_aptr_ColumnVariables{3}
				//Modifying the location name
				If ($_ptr_CurrentLocationID->>0)
					$_l_ArraySize:=Find in array:C230($_ptr_LocationIDSArray->; $_ptr_CurrentLocationID->)
					If ($_l_ArraySize>0)  //it should be
						
						$_ptr_LocationNameArray->{$_l_ArraySize}:=$_ptr_CurrentLocation->
						$_Ptr_LocationCode->{$_l_ArraySize}:=$_ptr_CurrentLocationCode->
						If ([LOCATIONS:61]LocationID:4#$_ptr_CurrentLocationID->)
							READ WRITE:C146([LOCATIONS:61])
							
							QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]LocationID:4=$_ptr_CurrentLocationID->)
						Else 
							READ WRITE:C146([LOCATIONS:61])
							LOAD RECORD:C52([LOCATIONS:61])
							
						End if 
						[LOCATIONS:61]Location_Name:2:=$_ptr_CurrentLocation->
						[LOCATIONS:61]Location_Code:1:=$_ptr_CurrentLocationCode->
						DB_SaveRecord(->[LOCATIONS:61])
						UNLOAD RECORD:C212([LOCATIONS:61])
						READ ONLY:C145([LOCATIONS:61])
						
					End if 
				Else 
					If ($_ptr_CurrentLocationID->=-1)  // we are adding a row..this is the last row in the array
						If ($_ptr_CurrentLocationCode->#"")  //Don't create the record till this is in
							//```
							If (FORM Get current page:C276>1)
								$_ptr_ParentLocationCode:=Get pointer:C304("STK_t_CurrentLocationCode"+String:C10($_l_HeaderLevel-1))  //Selected location code
								$_ptr_ParentLocationName:=Get pointer:C304("STK_at_LevelLabel"+String:C10($_l_HeaderLevel-1))
								$_t_Singular:=GenWordSingle($_ptr_ParentLocationName->)
								If (Size of array:C274($_Ptr_LocationCode->)=1)  //THis is the first sublocation...(highly unlikelty but still)
									Case of   // These default names are just so we can populate something into the request box that looks sensible
										: ($_t_SublevelLabel="Showrooms") | ($_t_SublevelLabel="Showrooms")
											$_t_SubLocationDefault:="SHOW"
										: ($_t_SublevelLabel="Rooms") | ($_t_SublevelLabel="Room") | ($_t_SublevelLabel="Store Room") | ($_t_SublevelLabel="Store Rooms")
											$_t_SubLocationDefault:="RM"
										: ($_t_SublevelLabel="Floors") | ($_t_SublevelLabel="Floor")
											$_t_SubLocationDefault:="FLR"
										: ($_t_SublevelLabel="Rows")
											$_t_SubLocationDefault:="ROW"
										: ($_t_SublevelLabel="Bins") | ($_t_SublevelLabel="Bin")
											$_t_SubLocationDefault:="BIN"
										: ($_t_SublevelLabel="Shelves") | ($_t_SublevelLabel="Shelf")
											$_t_SubLocationDefault:="SH"
										: ($_t_SublevelLabel="Tunnels") | ($_t_SublevelLabel="Tunnel")
											$_t_SubLocationDefault:="TUN"
										Else 
											If (Length:C16($_t_SublevelLabel)>1)
												$_t_SubLocationDefault:=Substring:C12($_t_SublevelLabel; 1; 2)
											Else 
												$_t_SubLocationDefault:=$_t_SublevelLabel
											End if 
									End case 
									
									Repeat 
										$_t_SubLocationCode:=Gen_Request("Enter "+$_t_Singular+" Coding prefix"; $_t_SubLocationDefault)
										If ($_t_SubLocationCode="")
											Gen_Alert("Sorry you must give this a coding, to cancel enter a code then do not save  the l"+"ocatio"+"n.")
										End if 
									Until ($_t_SubLocationCode#"")
								Else 
									$_t_FirstSubLocation:=$_ptr_LocationIDSArray->{1}
									QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]LocationID:4=$_t_FirstSubLocation)
									$_t_SubLocationCode:=[LOCATIONS:61]LocationCodePrefix:5
								End if 
							Else 
								$_t_SubLocationCode:=""
							End if 
							
							
							//```
							CREATE RECORD:C68([LOCATIONS:61])
							[LOCATIONS:61]Location_Code:1:=$_ptr_CurrentLocationCode->
							[LOCATIONS:61]Location_Name:2:=$_ptr_CurrentLocation->
							STK_l_Subid:=0
							[LOCATIONS:61]LocationID:4:=AA_GetNextID(->[LOCATIONS:61]LocationID:4)
							If (FORM Get current page:C276=1)
								[LOCATIONS:61]ParentLocationID:3:=0
								[LOCATIONS:61]LocationCodePrefix:5:=""
							Else 
								$_ptr_ParentLocationCode:=Get pointer:C304("STK_t_CurrentLocationCode"+String:C10($_l_HeaderLevel-1))  //Selected location code
								$_ptr_ParentLocationID:=Get pointer:C304("STK_l_currentLocation"+String:C10($_l_HeaderLevel-1))  //Selected location ID
								[LOCATIONS:61]LocationCodePrefix:5:=$_t_SubLocationCode
								[LOCATIONS:61]ParentLocationID:3:=$_ptr_ParentLocationID->
								
							End if 
							$_ptr_CurrentLocationSubLevName->:=""
							$_ptr_CurrentLocationCode->:=[LOCATIONS:61]Location_Code:1
							$_ptr_CurrentLocationID->:=[LOCATIONS:61]LocationID:4
							$_ptr_CurrentLocationCount->:=Size of array:C274($_ptr_LocationIDSArray->)
							DB_SaveRecord(->[LOCATIONS:61])
							$_l_ArraySize:=Size of array:C274($_ptr_LocationNameArray->)
							$_Ptr_LocationCode->{$_l_ArraySize}:=$_ptr_CurrentLocationCode->
							$_ptr_LocationNameArray->{$_l_ArraySize}:=$_ptr_CurrentLocation->
							$_ptr_LocationIDSArray->{$_l_ArraySize}:=$_ptr_CurrentLocationID->
							$_Ptr_ProdCodeArray->{$_l_ArraySize}:=""
							$_ptr_LocationHoldsArray->{$_l_ArraySize}:="Unknown"
							$_ptr_CurrentLocationCount->:=Size of array:C274($_ptr_LocationIDSArray->)
							
							
							
						End if 
					End if 
				End if 
			: ($_t_VariableName="STK_l_CountSublevel@")
				$_ptr_Array2:=Get pointer:C304("STK_al_SubLocationsIDs"+String:C10($_l_CurrentLevel))
				$_l_CountSublevel:=Size of array:C274($_ptr_Array2->)
				If ($_Ptr_SubLevelCount-><$_l_CountSublevel)
					//You cannot reduce the number of rows..unless they dont' really exist.
					Gen_Alert("Sorry you cannot reduce the number of sublocations in this way")
					
					$_Ptr_SubLevelCount->:=$_l_CountSublevel
				Else 
					If ($_Ptr_SubLevelCount->>$_l_CountSublevel)
						// we need to add some rows
						If ($_ptr_CurrentLocationCode->#"")
							If ($_ptr_CurrentLocationSubLevName->#"")
								//the sublevel does exist..
								$_t_NumberToAddSTR:=Gen_Request("Number of "+$_ptr_CurrentLocationSubLevName->+" to add"; "1")
								$_l_NumberToAdd:=Num:C11($_t_NumberToAddSTR)
								
								If (OK=1) & ($_l_NumberToAdd>0)
									ARRAY TEXT:C222($_at_ColumnNames; 0)
									ARRAY TEXT:C222($_at_HeaderNames; 0)
									ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
									ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
									ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
									ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
									LISTBOX GET ARRAYS:C832($_Ptr_SubLevelLBArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
									//LB_SetupListbox (->STK_lb_Sublevels0;"oLocations";"SLOC_L";1;$_ptr_Array1;$_ptr_Array3;$_ptr_Array8;$_ptr_Array9;$_ptr_Array2;$_ptr_Array4;$_ptr_Array5;$_ptr_Array6;$_ptr_Array7)
									$_ptr_Array1:=$_aptr_ColumnVariables{1}
									$_ptr_Array3:=$_aptr_ColumnVariables{2}
									$_ptr_Array10:=$_aptr_ColumnVariables{3}
									$_ptr_Array8:=$_aptr_ColumnVariables{4}
									$_ptr_Array9:=$_aptr_ColumnVariables{5}
									$_ptr_Array2:=$_aptr_ColumnVariables{6}
									$_ptr_Array4:=$_aptr_ColumnVariables{7}
									$_ptr_Array5:=$_aptr_ColumnVariables{8}
									$_ptr_Array6:=$_aptr_ColumnVariables{9}
									$_ptr_Array7:=$_aptr_ColumnVariables{10}
									For ($_l_AddRows; 1; $_l_NumberToAdd)
										$_l_ArraySize:=Size of array:C274($_ptr_Array3->)
										$_t_LastLocationCode:=$_ptr_Array3->{$_l_ArraySize}
										$_t_LastLocationName:=$_ptr_Array1->{$_l_ArraySize}
										$_t_LastLocationNumberSTR:=""
										$_t_LastLocationNameNumSTR:=""
										$_l_LastLocationNumber:=0
										$_l_LastLocationNameCount:=0
										For ($_l_Index; Length:C16($_t_LastLocationCode); 1; -1)
											If (Num:C11($_t_LastLocationCode[[$_l_Index]])>0) | ($_t_LastLocationCode[[$_l_Index]]="0")
												$_t_LastLocationNumberSTR:=$_t_LastLocationCode[[$_l_Index]]+$_t_LastLocationNumberSTR
											Else 
												$_l_CodeLength:=$_l_Index
												$_l_Index:=0
											End if 
										End for 
										$_l_LastLocationNumber:=Num:C11($_t_LastLocationNumberSTR)
										Repeat 
											$_t_NextLocationCode:=Substring:C12($_t_LastLocationCode; 1; $_l_CodeLength)+String:C10($_l_LastLocationNumber+1)
											$_l_RecordClashtest:=0
											SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_RecordClashtest)
											QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]Location_Code:1=$_t_NextLocationCode)
											SET QUERY DESTINATION:C396(Into current selection:K19:1)
											If ($_l_RecordClashtest>0)
												$_l_LastLocationNumber:=$_l_LastLocationNumber+1
											End if 
										Until ($_l_RecordClashtest=0)
										
										For ($_l_Index; Length:C16($_t_LastLocationName); 1; -1)
											If (Num:C11($_t_LastLocationName[[$_l_Index]])>0) | ($_t_LastLocationName[[$_l_Index]]="0")
												$_t_LastLocationNameNumSTR:=$_t_LastLocationName[[$_l_Index]]+$_t_LastLocationNameNumSTR
											Else 
												$_l_CodeLength:=$_l_Index
												$_l_Index:=0
											End if 
										End for 
										$_l_LastLocationNameCount:=Num:C11($_t_LastLocationNameNumSTR)
										Repeat 
											$_t_NextLocationName:=Substring:C12($_t_LastLocationName; 1; $_l_CodeLength)+String:C10($_l_LastLocationNameCount+1)
											$_l_RecordClashtest:=0
											SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_RecordClashtest)
											QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]Location_Name:2=$_t_NextLocationName)
											SET QUERY DESTINATION:C396(Into current selection:K19:1)
											If ($_l_RecordClashtest>0)
												$_l_LastLocationNameCount:=$_l_LastLocationNameCount+1
											End if 
										Until ($_l_RecordClashtest=0)
										APPEND TO ARRAY:C911($_ptr_Array1->; $_t_NextLocationName)
										APPEND TO ARRAY:C911($_ptr_Array3->; $_t_NextLocationCode)
										STK_l_Subid:=0
										APPEND TO ARRAY:C911($_ptr_Array2->; AA_GetNextID(->[LOCATIONS:61]LocationID:4))
										APPEND TO ARRAY:C911($_ptr_Array10->; "Unknown")
										APPEND TO ARRAY:C911($_ptr_Array8->; "")
										APPEND TO ARRAY:C911($_ptr_Array9->; "")
										APPEND TO ARRAY:C911($_ptr_Array4->; "")
										APPEND TO ARRAY:C911($_ptr_Array5->; 0)
										APPEND TO ARRAY:C911($_ptr_Array6->; STK_l_currentLocation)
										APPEND TO ARRAY:C911($_ptr_Array7->; True:C214)
										CREATE RECORD:C68([LOCATIONS:61])
										$_l_ArraySize:=Size of array:C274($_ptr_Array3->)
										[LOCATIONS:61]Location_Code:1:=$_ptr_Array3->{$_l_ArraySize}
										[LOCATIONS:61]Location_Name:2:=$_ptr_Array1->{$_l_ArraySize}
										[LOCATIONS:61]LocationCodePrefix:5:=$_ptr_CurrentLocationCode->
										[LOCATIONS:61]LocationID:4:=$_ptr_Array2->{$_l_ArraySize}
										[LOCATIONS:61]ParentLocationID:3:=$_ptr_CurrentLocationID->
										//[LOCATIONS]Sub_LocationNamingPref
										[LOCATIONS:61]Sub_location_Labelled:6:=""
										DB_SaveRecord(->[LOCATIONS:61])
									End for 
									$_ptr_CurrentLocationCount->:=Size of array:C274($_ptr_Array1->)
									LB_SetScroll($_Ptr_SubLevelLBArea; $_ptr_CurrentLocationCount->)
									$_ptr_SubLevelSelect->:=0
									EDIT ITEM:C870($_Ptr_SubLevelLBArea->; 0)
								End if 
							End if 
						End if 
						
						
					End if 
				End if 
			: ($_t_VariableName="STK_t_ProductCode@")
				//Edit product Code
				STK_bo_ProductFound:=False:C215
				Check_Product($_ptr_FocusObject; "Product"; ->STK_bo_ProductFound)
				If (STK_bo_ProductFound)
					$_ptr_ProductCode->:=[PRODUCTS:9]Product_Code:1
					$_ptr_ProductName->:=[PRODUCTS:9]Product_Name:2
					$_ptr_ProductID->:=[PRODUCTS:9]X_ID:43
					$_ptr_ProductCount->:=0
					CREATE RECORD:C68([x_ProductLocations:185])
					[x_ProductLocations:185]x_LocationCode:2:=$_ptr_CurrentLocationCode->
					[x_ProductLocations:185]x_ProductID:1:=[PRODUCTS:9]X_ID:43
					DB_SaveRecord(->[x_ProductLocations:185])
					OBJECT SET ENTERABLE:C238($_ptr_ProductCode->; False:C215)
					OBJECT SET VISIBLE:C603($_ptr_ProductAdd->; True:C214)
					$_Ptr_HeaderLBArea:=Get pointer:C304("STK_lb_Level"+String:C10($_l_HeaderLevel))
					ARRAY TEXT:C222($_at_ColumnNames; 0)
					ARRAY TEXT:C222($_at_HeaderNames; 0)
					ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
					ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
					ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
					ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
					LISTBOX GET ARRAYS:C832($_Ptr_HeaderLBArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
					//In the columns column
					$_Ptr_ProdCodeArray:=$_aptr_ColumnVariables{4}  //Pointer to array containing the product code
					$_Ptr_ProdNameArray:=$_aptr_ColumnVariables{5}  //Pointer to the array containing the product name
					$_Ptr_LocationHoldsArray:=$_aptr_ColumnVariables{3}  //Pointer to the array containing the Location holds
					$_ptr_LocationIDSArray:=$_aptr_ColumnVariables{7}  //Pointer to array containing the ids
					$_l_LocationCodePosition:=Find in array:C230($_ptr_LocationIDSArray->; $_ptr_CurrentLocationID->)
					$_Ptr_ProdCodeArray->{$_l_LocationCodePosition}:=[PRODUCTS:9]Product_Code:1
					$_Ptr_ProdNameArray->{$_l_LocationCodePosition}:=[PRODUCTS:9]Product_Name:2
					$_Ptr_LocationHoldsArray->{$_l_LocationCodePosition}:=[PRODUCTS:9]Product_Code:1+", "+[PRODUCTS:9]Product_Name:2
				Else 
					Gen_Alert("Product Not found")
					$_ptr_ProductCode->:=""
					$_ptr_ProductName->:=""
					$_ptr_ProductID->:=0
					$_ptr_ProductCount->:=0
				End if 
				
		End case 
		
End case 
ERR_MethodTrackerReturn("FM [USER].STK_LocationsEditor"; $_t_oldMethodName)
