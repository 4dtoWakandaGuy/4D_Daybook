//%attributes = {}
If (False:C215)
	//Project Method Name:      DS_PictureOrganizerDisplayProds
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/11/2009 16:26`Method: DS_PictureOrganizerDisplayProds
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DS_abo_PictureModify;0)
	//ARRAY LONGINT(DS_al_ProdIDs;0)
	//ARRAY PICTURE(DS_apic_ProductGraphics;0)
	//ARRAY PICTURE(DS_apic_ProductGraphicChange;0)
	//ARRAY TEXT(DS_at_aProductFileNameChange;0)
	//ARRAY TEXT(DS_at_ProductCodes;0)
	//ARRAY TEXT(DS_at_ProductCodesChange;0)
	//ARRAY TEXT(DS_at_ProductDocNames;0)
	//ARRAY TEXT(DS_at_ProductGraphics;0)
	//ARRAY TEXT(DS_at_ProductNames;0)
	//ARRAY TEXT(DS_at_ProductNamesChange;0)
	//ARRAY TEXT(DS_at_ProductShCodes;0)
	//ARRAY TEXT(DS_at_ProductShCodesChange;0)
	C_LONGINT:C283($_l_Index; $_l_ProductCodeRow; $_l_ToKeep; $_l_ToKeepStart; BnextPics; BPreviousPics; DS_l_CurrSelAll; DS_l_CurrSelEnd; DS_l_CurrSelStart; DS_l_ProdSortField)
	C_PICTURE:C286(PRD_Pic_Graphic)
	C_TEXT:C284($_t_DocumentName; $_t_oldMethodName; DS_T_Showing; PROD_t_GraphicPath)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DS_PictureOrganizerDisplayProds")
//NG March 2004
//This method displays a seleciton of products
//to avoid overload the system is limited to 250 prods per view this let you navigate from one selection to the next
//Actually we need to keep the ones we add pictures to
For ($_l_Index; 1; Size of array:C274(DS_abo_PictureModify))
	If (DS_abo_PictureModify{$_l_Index})
		$_l_ProductCodeRow:=Find in array:C230(DS_at_ProductCodesChange; DS_at_ProductCodes{$_l_Index})
		If ($_l_ProductCodeRow<0)
			$_l_ProductCodeRow:=Find in array:C230(DS_at_ProductCodesChange; "")
			If ($_l_ProductCodeRow<0)
				$_l_ProductCodeRow:=Size of array:C274(DS_at_ProductCodesChange)+1
				INSERT IN ARRAY:C227(DS_at_ProductCodesChange; Size of array:C274(DS_at_ProductCodesChange)+1; 100)
				INSERT IN ARRAY:C227(DS_at_ProductShCodesChange; Size of array:C274(DS_at_ProductShCodesChange)+1; 100)
				INSERT IN ARRAY:C227(DS_at_ProductNamesChange; Size of array:C274(DS_at_ProductNamesChange)+1; 100)
				INSERT IN ARRAY:C227(DS_apic_ProductGraphicChange; Size of array:C274(DS_apic_ProductGraphicChange)+1; 100)
				INSERT IN ARRAY:C227(DS_at_aProductFileNameChange; Size of array:C274(DS_at_aProductFileNameChange)+1; 100)
			End if 
		End if 
		DS_at_ProductCodesChange{$_l_ProductCodeRow}:=DS_at_ProductCodes{$_l_Index}
		DS_at_ProductShCodesChange{$_l_ProductCodeRow}:=DS_at_ProductShCodes{$_l_Index}
		DS_at_ProductNamesChange{$_l_ProductCodeRow}:=DS_at_ProductNames{$_l_Index}
		DS_apic_ProductGraphicChange{$_l_ProductCodeRow}:=DS_apic_ProductGraphics{$_l_Index}
		DS_at_aProductFileNameChange{$_l_ProductCodeRow}:=DS_at_ProductGraphics{$_l_Index}
	End if 
	
End for 


USE SET:C118("CurrentPictureSelection")
If (Records in selection:C76([PRODUCTS:9])>250)
	ORDER BY:C49([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1)
	//take the end off.
	$_l_ToKeep:=DS_l_CurrSelAll-(DS_l_CurrSelAll-DS_l_CurrSelEnd)
	REDUCE SELECTION:C351([PRODUCTS:9]; $_l_ToKeep)
	OBJECT SET VISIBLE:C603(*; "oCurrSel@"; True:C214)
	
	If (DS_l_CurrSelStart>1)
		//take the beginning off
		ORDER BY:C49([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1; <)
		$_l_ToKeepStart:=Records in selection:C76([PRODUCTS:9])-(DS_l_CurrSelStart-1)
		REDUCE SELECTION:C351([PRODUCTS:9]; $_l_ToKeepStart)
		OBJECT SET ENABLED:C1123(BPreviousPics; True:C214)
		
	Else 
		OBJECT SET ENABLED:C1123(BPreviousPics; False:C215)
	End if 
	If (DS_l_CurrSelEnd>=DS_l_CurrSelAll)
		OBJECT SET ENABLED:C1123(BnextPics; False:C215)
	Else 
		If ((DS_l_CurrSelAll-DS_l_CurrSelEnd)<250)
			OBJECT SET TITLE:C194(BnextPics; "Next "+String:C10(DS_l_CurrSelAll-DS_l_CurrSelEnd))
			
			OBJECT SET ENABLED:C1123(BnextPics; True:C214)
		End if 
	End if 
	DS_T_Showing:="Showing selection "+String:C10(DS_l_CurrSelStart)+" to "+String:C10(DS_l_CurrSelEnd)+" of "+String:C10(DS_l_CurrSelAll)
	
Else 
	OBJECT SET VISIBLE:C603(*; "oCurrSel@"; False:C215)
End if 

ARRAY LONGINT:C221(DS_al_ProdIDs; 0)
ARRAY TEXT:C222(DS_at_ProductCodes; 0)
ARRAY TEXT:C222(DS_at_ProductShCodes; 0)
ARRAY TEXT:C222(DS_at_ProductNames; 0)
ARRAY PICTURE:C279(DS_apic_ProductGraphics; 0)
ARRAY TEXT:C222(DS_at_ProductGraphics; 0)
ARRAY TEXT:C222(DS_at_ProductDocNames; 0)
ARRAY BOOLEAN:C223(DS_abo_PictureModify; 0)
SELECTION TO ARRAY:C260([PRODUCTS:9]X_ID:43; DS_al_ProdIDs; [PRODUCTS:9]Product_Code:1; DS_at_ProductCodes; [PRODUCTS:9]Short_Code:19; DS_at_ProductShCodes; [PRODUCTS:9]Product_Name:2; DS_at_ProductNames; [PRODUCTS:9]Picture_File_Name:44; DS_at_ProductGraphics)
ARRAY TEXT:C222(DS_at_ProductDocNames; Size of array:C274(DS_at_ProductGraphics))
ARRAY PICTURE:C279(DS_apic_ProductGraphics; Size of array:C274(DS_at_ProductGraphics))
ARRAY BOOLEAN:C223(DS_abo_PictureModify; Size of array:C274(DS_at_ProductGraphics))
CAT_LoadPrefs  //Load the cat prefs so we can find the picures.
//now we can load the existing picture for each of them
For ($_l_Index; 1; Size of array:C274(DS_al_ProdIDs))
	If (DS_at_ProductGraphics{$_l_Index}#"")
		If (DS_at_ProductGraphics{$_l_Index}[[1]]#"•")
			$_t_DocumentName:=FileNamefromPath(DS_at_ProductGraphics{$_l_Index})
		Else 
			$_t_DocumentName:=Substring:C12(DS_at_ProductGraphics{$_l_Index}; 2; Length:C16(DS_at_ProductGraphics{$_l_Index}))
			
		End if 
	Else 
		$_t_DocumentName:=""
	End if 
	
	DS_at_ProductDocNames{$_l_Index}:=$_t_DocumentName
	
	Prod_LoadGraphic([PRODUCTS:9]X_ID:43; 0; 72)
	DS_apic_ProductGraphics{$_l_Index}:=PRD_Pic_Graphic
	If (DS_at_ProductGraphics{$_l_Index}#"")
		
		PROD_t_GraphicPath:=DS_at_ProductGraphics{$_l_Index}
		
	End if 
	
End for 
ERR_MethodTrackerReturn("DS_PictureOrganizerDisplayProds"; $_t_oldMethodName)