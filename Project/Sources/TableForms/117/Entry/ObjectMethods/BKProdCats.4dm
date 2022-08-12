If (False:C215)
	//object Name: [EW_ExportProjects]Entry.BKProdCats
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(EW_al_CatalogueIDs;0)
	C_REAL:C285(iLoc)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.BKProdCats"; Form event code:C388)
Case of 
	: (Self:C308->=0)
		Self:C308->:=Find in array:C230(Self:C308->; [EW_ExportProjects:117]BKCatalogueID:37)
		
	: (Self:C308-><1)
		iLoc:=Find in array:C230(EW_al_CatalogueIDs; [EW_ExportSteps:118]BKModelName:8)
		If (iLoc>0)
			Self:C308->:=iLoc
		Else 
			Self:C308->:=1
			[EW_ExportProjects:117]BKCatalogueID:37:=EW_al_CatalogueIDs{1}
		End if 
		
	Else 
		[EW_ExportProjects:117]BKCatalogueID:37:=EW_al_CatalogueIDs{Self:C308->}
End case 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.BKProdCats"; $_t_oldMethodName)
