If (False:C215)
	//object Name: [USER]Prod_SelectionPallette.oCAT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2012 19:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CAT_lb_Products;0)
	//ARRAY BOOLEAN(PROD_abo_PVCopied;0)
	ARRAY LONGINT:C221($_al_DefaultWIdths; 0)
	ARRAY LONGINT:C221($_al_LBDraggedRows; 0)
	//ARRAY LONGINT(CAT_al_UserWidths;0)
	//ARRAY REAL(PROD_ar_ActualQty;0)
	//ARRAY REAL(PROD_ar_ActualSalesPrice;0)
	//ARRAY TEXT(PROD_at_ProductCodes;0)
	C_BLOB:C604(<>PROD_BL_DataBlob)
	C_BOOLEAN:C305($_bo_Expanded; PROD_bo_ViewExpand; QV_bo_Drop)
	C_LONGINT:C283($_l_Column1Width; $_l_Column2Width; $_l_Column3Width; $_l_Column4Width; $_l_Column5Width; $_l_Column6Width; $_l_Column7Width; $_l_CurrentRow; $_l_event; $_l_FieldNumber; $_l_LineIndex)
	C_LONGINT:C283($_l_offset; $_l_PersonCatRow; $_l_RecordNumber; $_l_Retries; $_l_SelectedRow; $_l_SublistID; $_l_TableNumber; DB_l_ButtonClickedFunction; PROD_l_CallBackMProcess; vrow)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_ColumnName2; $_t_DiaryRecordCode; $_t_FormName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Prod_SelectionPallette.oCAT"; Form event code:C388)
$_l_event:=Form event code:C388
PROD_bo_ViewExpand:=True:C214

Case of 
	: ($_l_event=On Selection Change:K2:29)
		vrow:=Self:C308->
		If (vrow>0)
			If (PROD_bo_ViewExpand)
				Prod_SetProductDetail(PROD_at_ProductCodes{vrow})
			End if 
		Else 
			Prod_SetProductDetail("")
			
		End if 
		
	: ($_l_event=On Drop:K2:12)  //| (ALProEvt=-1) row dragged
		ARRAY LONGINT:C221($_al_LBDraggedRows; 0)
		//vrow:=AL_GetLine (CAT_PowerViewProds)
		vrow:=Self:C308->
		LB_GetSelect(->CAT_lb_Products; ->$_al_LBDraggedRows)
		If (Size of array:C274($_al_LBDraggedRows)=0)
			INSERT IN ARRAY:C227($_al_LBDraggedRows; 99; 1)
			$_al_LBDraggedRows{1}:=vRow
		End if 
		$_l_Retries:=0
		While (Semaphore:C143("$DataBlobinUse"))  //about to write-stop everyone
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*$_l_Retries)
		End while 
		SET BLOB SIZE:C606(<>PROD_BL_DataBlob; 0)
		$_l_offset:=0
		For ($_l_LineIndex; 1; Size of array:C274($_al_LBDraggedRows))
			$_l_CurrentRow:=$_al_LBDraggedRows{$_l_LineIndex}
			VARIABLE TO BLOB:C532(PROD_at_ProductCodes{$_l_CurrentRow}; <>PROD_BL_DataBlob; $_l_offset)
			VARIABLE TO BLOB:C532(PROD_ar_ActualQty{$_l_CurrentRow}; <>PROD_BL_DataBlob; $_l_offset)
			VARIABLE TO BLOB:C532(PROD_ar_ActualSalesPrice{$_l_CurrentRow}; <>PROD_BL_DataBlob; $_l_offset)
			//PROD_abo_PVCopied{$_l_CurrentRow}:=1
			PROD_abo_PVCopied{$_l_CurrentRow}:=True:C214
		End for 
		CLEAR SEMAPHORE:C144("$DataBlobinUse")  //release everyone
		//the copied lines are now in a BLOB
		//AL_UpdateArrays (CAT_PowerviewPRODS;-2)
		If (PROD_l_CallBackMProcess>0)
			SET PROCESS VARIABLE:C370(PROD_l_CallBackMProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("CopyProduct"))
			POST OUTSIDE CALL:C329(PROD_l_CallBackMProcess)
		End if 
	: ($_l_event=On Clicked:K2:4)  // single click
		// there was also an ALP on entry callback (PROD_PVEntry) which seems to do the same thing as this
		//vrow:=AL_GetLine (CAT_PowerViewProds)
		vrow:=Self:C308->
		If (vrow>0)
			If (PROD_bo_ViewExpand)
				Prod_SetProductDetail(PROD_at_ProductCodes{vrow})
			End if 
		Else 
			Prod_SetProductDetail("")
			
		End if 
		
	: ($_l_event=On Data Change:K2:15)
		$_l_SelectedRow:=Self:C308->
		RESOLVE POINTER:C394(Self:C308; $_t_ColumnName2; $_l_TableNumber; $_l_FIeldNumber)
		If ($_t_ColumnName2="PROD_ar_ActualSalesPrice")
			If (PROD_ar_ActualSalesPrice{0}#PROD_ar_ActualSalesPrice{$_l_SelectedRow})
				If (PROD_ar_ActualQty{$_l_SelectedRow}=0)
					PROD_ar_ActualQty{$_l_SelectedRow}:=1
				End if 
			End if 
		End if 
End case 
//AL_GetWidths (CAT_PowerviewPRODS;1;7;$_l_Column1Width;$_l_Column2Width;$_l_Column3Width;$_l_Column4Width;$_l_Column5Width;$_l_Column6Width;$_l_Column7Width)
LB_GetWidths(->CAT_lb_Products; 1; ->$_l_Column1Width; ->$_l_Column2Width; ->$_l_Column3Width; ->$_l_Column4Width; ->$_l_Column5Width; ->$_l_Column6Width; ->$_l_Column7Width)
//The following array is loaded inPROD_SetupPallettearrays
$_l_PersonCatRow:=Find in array:C230(CAT_at_UserID; <>PER_t_CurrentUserInitials)

If ($_l_PersonCatRow>0)
	If ($_l_Column1Width#CAT_al_UserWidths{$_l_PersonCatRow}{1}) | ($_l_Column2Width#CAT_al_UserWidths{$_l_PersonCatRow}{2}) | ($_l_Column3Width#CAT_al_UserWidths{$_l_PersonCatRow}{3}) | ($_l_Column4Width#CAT_al_UserWidths{$_l_PersonCatRow}{4}) | ($_l_Column5Width#CAT_al_UserWidths{$_l_PersonCatRow}{5}) | ($_l_Column6Width#CAT_al_UserWidths{$_l_PersonCatRow}{6}) | ($_l_Column7Width#CAT_al_UserWidths{$_l_PersonCatRow}{7})
		CAT_SaveProdViewWidths  //Widths customised
	End if 
Else 
	ARRAY LONGINT:C221($_al_DefaultWIdths; 7)
	$_al_DefaultWIdths{1}:=80
	$_al_DefaultWIdths{2}:=170
	$_al_DefaultWIdths{3}:=80
	$_al_DefaultWIdths{4}:=80
	$_al_DefaultWIdths{5}:=50
	$_al_DefaultWIdths{6}:=50
	$_al_DefaultWIdths{7}:=40
	If ($_l_Column1Width#$_al_DefaultWIdths{1}) | ($_l_Column2Width#$_al_DefaultWIdths{2}) | ($_l_Column3Width#$_al_DefaultWIdths{3}) | ($_l_Column4Width#$_al_DefaultWIdths{4}) | ($_l_Column5Width#$_al_DefaultWIdths{5}) | ($_l_Column6Width#$_al_DefaultWIdths{6}) | ($_l_Column7Width#$_al_DefaultWIdths{7})
		CAT_SaveProdViewWidths  //customised
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:Prod_SelectionPallette,CAT_lb_Products"; $_t_oldMethodName)
