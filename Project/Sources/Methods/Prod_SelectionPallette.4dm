//%attributes = {}
If (False:C215)
	//Project Method Name:      Prod_SelectionPallette
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Prod_SelectionPallette
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
	C_BOOLEAN:C305($_bo_NoDefault; $_bo_UseCatalogues)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_CatalogueRow; $_l_CurrentWinRefOLD; $1; $3; CAT_l_DefaultCatalogue; Prod_l_CallBackItemID; PROD_l_CallBackMProcess; PROD_l_CallingItem; PROD_l_CallingProcess; PROD_l_DisplayedCatalogue)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; $2; $4; $5; $6; PROD_t_CallingCoCode; PROD_t_CallingPriceCode; PROD_t_DisplayedCatalogue; PROD_t_UseSetName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod_SelectionPallette")
//prod_SelectonPallette
Start_Process


If (Count parameters:C259>=3)
	PROD_t_UseSetName:=$2
	PROD_l_CallingProcess:=$1
	PROD_l_CallingItem:=$3
	PROD_t_CallingPriceCode:=$4
	PROD_t_CallingCoCode:=$5
	
	CAT_LoadCats(<>PER_l_CurrentUserID; False:C215)
	$_bo_UseCatalogues:=False:C215
	If (Size of array:C274(CAT_al_CatalogueID)>0)  //| (True)
		$_bo_UseCatalogues:=False:C215
		ARRAY TEXT:C222(PROD_at_ViewableCatalogues; 0)
		ARRAY LONGINT:C221(PROD_al_ViewableCatalogues; 0)
		COPY ARRAY:C226(CAT_al_CatalogueID; PROD_al_ViewableCatalogues)
		COPY ARRAY:C226(CAT_at_CatalogueNames; PROD_at_ViewableCatalogues)
		INSERT IN ARRAY:C227(PROD_al_ViewableCatalogues; Size of array:C274(PROD_al_ViewableCatalogues)+1; 2)
		INSERT IN ARRAY:C227(PROD_at_ViewableCatalogues; Size of array:C274(PROD_at_ViewableCatalogues)+1; 2)
		PROD_at_ViewableCatalogues{Size of array:C274(PROD_at_ViewableCatalogues)}:="All Catalogues"
		PROD_at_ViewableCatalogues{Size of array:C274(PROD_at_ViewableCatalogues)-1}:="-"
		$_bo_NoDefault:=True:C214
		If (CAT_l_DefaultCatalogue>0)
			$_l_CatalogueRow:=Find in array:C230(CAT_al_CatalogueID; CAT_l_DefaultCatalogue)
			If ($_l_CatalogueRow>0)
				PROD_t_DisplayedCatalogue:=PROD_at_ViewableCatalogues{$_l_CatalogueRow}
				PROD_l_DisplayedCatalogue:=PROD_al_ViewableCatalogues{$_l_CatalogueRow}
				$_bo_NoDefault:=True:C214
			End if 
		End if 
		If ($_bo_NoDefault)
			PROD_t_DisplayedCatalogue:=PROD_at_ViewableCatalogues{1}
			PROD_l_DisplayedCatalogue:=PROD_al_ViewableCatalogues{1}
		End if 
	End if 
	While (Semaphore:C143("$SelectorBusy"))
		DelayTicks(20)
	End while 
	USE SET:C118(PROD_t_UseSetName)
	CREATE SET:C116([PRODUCTS:9]; "CurrentSelection")
	PROD_l_CallBackMProcess:=PROD_l_CallingProcess
	PROD_l_CallingProcess:=0
	Prod_l_CallBackItemID:=PROD_l_CallingItem
	PROD_l_CallingItem:=0
	
	CLEAR SEMAPHORE:C144("SelectorBusy")
	REDUCE SELECTION:C351([USER:15]; 0)
	
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187; 40; Screen width:C187; 40; 1991)
	SET WINDOW TITLE:C213("Product Selector")
	
	DIALOG:C40([USER:15]; "PROD_SelectionPallette")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	CLEAR SEMAPHORE:C144("$SelectorBusy")
End if 
Process_End
ERR_MethodTrackerReturn("Prod_SelectionPallette"; $_t_oldMethodName)