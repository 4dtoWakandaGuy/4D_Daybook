If (False:C215)
	//object Name: [USER]Prod_SelectionPallette.oCloseWindow
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
	//ARRAY BOOLEAN(PROD_abo_PVCopied;0)
	ARRAY LONGINT:C221($_al_UncopiedLines; 0)
	ARRAY REAL:C219($_ar_UncopiedPrices; 0)
	ARRAY REAL:C219($_ar_UncopiedQuantities; 0)
	//ARRAY REAL(PROD_ar_ActualQty;0)
	//ARRAY REAL(PROD_ar_ActualSalesPrice;0)
	ARRAY TEXT:C222($_at_UncopiedProdCodes; 0)
	//ARRAY TEXT(PROD_at_ProductCodes;0)
	C_BLOB:C604(<>PROD_BL_DataBlob)
	C_BOOLEAN:C305($_bo_NoRemainder)
	C_LONGINT:C283($_l_CurrentRow; $_l_Index; $_l_Retries; DB_l_ButtonClickedFunction; PROD_l_CallBackMProcess; PROD_l_SelectorPallette; xNext)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Prod_SelectionPallette.oCloseWindow"; Form event code:C388)
//PROD_l_SelectorPallette
If (PROD_l_CallBackMProcess>0)
	//````
	$_bo_NoRemainder:=True:C214
	//````
	//AL_ExitCell (CAT_PowerviewPRODS)
	ARRAY LONGINT:C221($_al_UncopiedLines; 100)
	ARRAY REAL:C219($_ar_UncopiedPrices; 100)
	ARRAY REAL:C219($_ar_UncopiedQuantities; 100)
	ARRAY TEXT:C222($_at_UncopiedProdCodes; 100)
	$_l_CurrentRow:=0
	For ($_l_Index; 1; Size of array:C274(PROD_ar_ActualSalesPrice))
		//If ((PROD_ar_ActualSalesPrice{$_l_Index}#0) & (PROD_ar_ActualQty{$_l_Index}#0)) & (PROD_abo_PVCopied{$_l_Index}=0)
		If ((PROD_ar_ActualSalesPrice{$_l_Index}#0) & (PROD_ar_ActualQty{$_l_Index}#0)) & (PROD_abo_PVCopied{$_l_Index}=False:C215)
			$_l_CurrentRow:=$_l_CurrentRow+1
			If ($_l_CurrentRow>(Size of array:C274($_al_UncopiedLines)))
				INSERT IN ARRAY:C227($_al_UncopiedLines; Size of array:C274($_al_UncopiedLines)+1; 100)
				INSERT IN ARRAY:C227($_ar_UncopiedPrices; Size of array:C274($_ar_UncopiedPrices)+1; 100)
				INSERT IN ARRAY:C227($_ar_UncopiedQuantities; Size of array:C274($_ar_UncopiedQuantities)+1; 100)
				INSERT IN ARRAY:C227($_at_UncopiedProdCodes; Size of array:C274($_ar_UncopiedQuantities)+1; 100)
				
			End if 
			$_al_UncopiedLines{$_l_CurrentRow}:=$_l_Index
			$_ar_UncopiedQuantities{$_l_CurrentRow}:=PROD_ar_ActualQty{$_l_Index}
			$_ar_UncopiedPrices{$_l_CurrentRow}:=PROD_ar_ActualSalesPrice{$_l_Index}
			$_at_UncopiedProdCodes{$_l_CurrentRow}:=PROD_at_ProductCodes{$_l_Index}
		Else 
			//If (PROD_ar_ActualQty{$_l_Index}#0) & (PROD_abo_PVCopied{$_l_Index}=0)
			If (PROD_ar_ActualQty{$_l_Index}#0) & (PROD_abo_PVCopied{$_l_Index}=False:C215)
				$_l_CurrentRow:=$_l_CurrentRow+1
				If ($_l_CurrentRow>(Size of array:C274($_al_UncopiedLines)))
					INSERT IN ARRAY:C227($_al_UncopiedLines; Size of array:C274($_al_UncopiedLines)+1; 100)
					INSERT IN ARRAY:C227($_ar_UncopiedPrices; Size of array:C274($_ar_UncopiedPrices)+1; 100)
					INSERT IN ARRAY:C227($_ar_UncopiedQuantities; Size of array:C274($_ar_UncopiedQuantities)+1; 100)
					INSERT IN ARRAY:C227($_at_UncopiedProdCodes; Size of array:C274($_ar_UncopiedQuantities)+1; 100)
					
				End if 
				$_al_UncopiedLines{$_l_CurrentRow}:=$_l_Index
				$_ar_UncopiedQuantities{$_l_CurrentRow}:=PROD_ar_ActualQty{$_l_Index}
				$_ar_UncopiedPrices{$_l_CurrentRow}:=PROD_ar_ActualSalesPrice{$_l_Index}
				$_at_UncopiedProdCodes{$_l_CurrentRow}:=PROD_at_ProductCodes{$_l_Index}
			End if 
		End if 
	End for 
	//```
	ARRAY LONGINT:C221($_al_UncopiedLines; $_l_CurrentRow)
	ARRAY REAL:C219($_ar_UncopiedPrices; $_l_CurrentRow)
	ARRAY REAL:C219($_ar_UncopiedQuantities; $_l_CurrentRow)
	ARRAY TEXT:C222($_at_UncopiedProdCodes; $_l_CurrentRow)
	//here ask the user if they want to keep them
	If (Size of array:C274($_al_UncopiedLines)>0)
		$_bo_NoRemainder:=False:C215
		Gen_Confirm("You have lines with quantities/prices that are not copied to the order ?"; "Forget"; "Copy")
		Case of 
			: (OK=0)
				PROD_CopyQuantitied
			Else 
				$_l_Retries:=0
				While (Semaphore:C143("$DataBlobinUse"))  //about to write-stop everyone
					$_l_Retries:=$_l_Retries+1
					DelayTicks(2*$_l_Retries)
				End while 
				
				SET BLOB SIZE:C606(<>PROD_BL_DataBlob; 0)
				CLEAR SEMAPHORE:C144("$DataBlobinUse")  //release everyone
				If (PROD_l_CallBackMProcess>0)
					SET PROCESS VARIABLE:C370(PROD_l_CallBackMProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("CopyProduct"))
					POST OUTSIDE CALL:C329(PROD_l_CallBackMProcess)
				End if 
		End case 
		xNext:=0
	End if 
	If ($_bo_NoRemainder)
		$_l_Retries:=0
		While (Semaphore:C143("$DataBlobinUse"))  //about to write-stop everyone
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*$_l_Retries)
		End while 
		SET BLOB SIZE:C606(<>PROD_BL_DataBlob; 0)
		CLEAR SEMAPHORE:C144("$DataBlobinUse")  //release everyone
		If (PROD_l_CallBackMProcess>0)
			SET PROCESS VARIABLE:C370(PROD_l_CallBackMProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("CopyProduct"))
			POST OUTSIDE CALL:C329(PROD_l_CallBackMProcess)
		End if 
	End if 
	SET PROCESS VARIABLE:C370(PROD_l_CallBackMProcess; PROD_l_SelectorPallette; 0)
	POST OUTSIDE CALL:C329(PROD_l_CallBackMProcess)
End if 



CANCEL:C270
ERR_MethodTrackerReturn("OBJ:Prod_SelectionPallette,BClose"; $_t_oldMethodName)
