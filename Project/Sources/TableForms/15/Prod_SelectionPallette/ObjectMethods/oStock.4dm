If (False:C215)
	//object Name: [USER]Prod_SelectionPallette.oStock
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
	ARRAY LONGINT:C221($_al_LBDraggedRows; 0)
	//ARRAY TEXT(PROD_at_ProductCodes;0)
	C_BLOB:C604(<>PROD_BL_DataBlob)
	C_BOOLEAN:C305($_bo_Expanded; PROD_bo_ViewExpand; QV_bo_Drop)
	C_LONGINT:C283($_l_CurrentLine; $_l_DraggedLineIndex; $_l_event; $_l_FieldNumber; $_l_offset; $_l_RecordNumber; $_l_Retries; $_l_SublistID; $_l_TableNumber; DB_l_ButtonClickedFunction; PROD_l_CallBackMProcess)
	C_LONGINT:C283(vrow)
	C_TEXT:C284($_t_DiaryRecordCode; $_t_FormName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Prod_SelectionPallette.oStock"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
		//: (ALProEvt=-5)  `| (ALProEvt=-1)
	: ($_l_event=On Drop:K2:12)
		ARRAY LONGINT:C221($_al_LBDraggedRows; 0)
		//vrow:=AL_GetLine (CAT_PowerViewProds)
		vrow:=CAT_lb_Products
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
		For ($_l_DraggedLineIndex; 1; Size of array:C274($_al_LBDraggedRows))
			$_l_CurrentLine:=$_al_LBDraggedRows{$_l_DraggedLineIndex}
			VARIABLE TO BLOB:C532(PROD_at_ProductCodes{$_l_CurrentLine}; <>PROD_BL_DataBlob; $_l_offset)
			VARIABLE TO BLOB:C532(PROD_ar_ActualQty{$_l_CurrentLine}; <>PROD_BL_DataBlob; $_l_offset)
			VARIABLE TO BLOB:C532(PROD_ar_ActualSalesPrice{$_l_CurrentLine}; <>PROD_BL_DataBlob; $_l_offset)
			//PROD_abo_PVCopied{$_l_CurrentLine}:=1
			PROD_abo_PVCopied{$_l_CurrentLine}:=True:C214
		End for 
		CLEAR SEMAPHORE:C144("$DataBlobinUse")  //release everyone
		//the copied lines are now in a BLOB
		//AL_UpdateArrays (CAT_PowerviewPRODS;-2)
		If (PROD_l_CallBackMProcess>0)
			SET PROCESS VARIABLE:C370(PROD_l_CallBackMProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("CopyProduct"))
			POST OUTSIDE CALL:C329(PROD_l_CallBackMProcess)
		End if 
		
	: ($_l_event=On Clicked:K2:4)
		vrow:=Self:C308->
		If (vrow>0)
			If (PROD_bo_ViewExpand)
				Prod_SetProductDetail(PROD_at_ProductCodes{vrow})
			End if 
		Else 
			Prod_SetProductDetail("")
		End if 
End case 
ERR_MethodTrackerReturn("OBJ:Prod_SelectionPallette,Prod_LB_Stock"; $_t_oldMethodName)
