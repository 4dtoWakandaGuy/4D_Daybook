//%attributes = {}
If (False:C215)
	//Project Method Name:      DS_PictureOrganiseSaver
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/11/2009 16:26`Method: DS_PictureOrganiseSaver
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DS_abo_PictureModify;0)
	//ARRAY PICTURE(DS_apic_ProductGraphicChange;0)
	//ARRAY PICTURE(DS_apic_ProductGraphics;0)
	//ARRAY TEXT(CAT_at_ImageNameConvention;0)
	//ARRAY TEXT(DS_at_aProductFileNameChange;0)
	//ARRAY TEXT(DS_at_ProductCodes;0)
	//ARRAY TEXT(DS_at_ProductCodesChange;0)
	//ARRAY TEXT(DS_at_ProductGraphicChange;0)
	//ARRAY TEXT(DS_at_ProductGraphics;0)
	//ARRAY TEXT(DS_at_ProductNames;0)
	//ARRAY TEXT(DS_at_ProductNamesChange;0)
	//ARRAY TEXT(DS_at_ProductShCodes;0)
	//ARRAY TEXT(DS_at_ProductShCodesChange;0)
	C_LONGINT:C283($_l_ChangeRow; $_l_PictureRow; $_l_ProductsIndex)
	C_TEXT:C284($_t_oldMethodName; CAT_t_PictureNaming)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DS_PictureOrganiseSaver")
For ($_l_ProductsIndex; 1; Size of array:C274(DS_abo_PictureModify))
	If (DS_abo_PictureModify{$_l_ProductsIndex})
		ARRAY TEXT:C222(DS_at_ProductCodesChange; 0)
		ARRAY TEXT:C222(DS_at_ProductShCodesChange; 0)
		ARRAY TEXT:C222(DS_at_ProductNamesChange; 0)
		ARRAY PICTURE:C279(DS_apic_ProductGraphicChange; 0)
		ARRAY TEXT:C222(DS_at_ProductGraphicChange; 0)
		
		ARRAY TEXT:C222(DS_at_aProductFileNameChange; 0)
		$_l_ChangeRow:=Find in array:C230(DS_at_ProductCodesChange; DS_at_ProductCodes{$_l_ProductsIndex})
		If ($_l_ChangeRow<0)
			$_l_ChangeRow:=Find in array:C230(DS_at_ProductCodesChange; "")
			If ($_l_ChangeRow<0)
				$_l_ChangeRow:=Size of array:C274(DS_at_ProductCodesChange)+1
				INSERT IN ARRAY:C227(DS_at_ProductCodesChange; Size of array:C274(DS_at_ProductCodesChange)+1; 100)
				INSERT IN ARRAY:C227(DS_at_ProductShCodesChange; Size of array:C274(DS_at_ProductShCodesChange)+1; 100)
				INSERT IN ARRAY:C227(DS_at_ProductNamesChange; Size of array:C274(DS_at_ProductNamesChange)+1; 100)
				INSERT IN ARRAY:C227(DS_apic_ProductGraphicChange; Size of array:C274(DS_apic_ProductGraphicChange)+1; 100)
				INSERT IN ARRAY:C227(DS_at_aProductFileNameChange; Size of array:C274(DS_at_aProductFileNameChange)+1; 100)
			End if 
		End if 
		DS_at_ProductCodesChange{$_l_ProductsIndex}:=DS_at_ProductCodes{$_l_ProductsIndex}
		DS_at_ProductShCodesChange{$_l_ProductsIndex}:=DS_at_ProductShCodes{$_l_ProductsIndex}
		DS_at_ProductNamesChange{$_l_ProductsIndex}:=DS_at_ProductNames{$_l_ProductsIndex}
		DS_apic_ProductGraphicChange{$_l_ProductsIndex}:=DS_apic_ProductGraphics{$_l_ProductsIndex}
		DS_at_aProductFileNameChange{$_l_ProductsIndex}:=DS_at_ProductGraphics{$_l_ProductsIndex}
	End if 
	
End for 
$_l_ChangeRow:=Find in array:C230(DS_at_ProductCodesChange; "")
ARRAY TEXT:C222(DS_at_ProductCodesChange; $_l_ChangeRow-1)
ARRAY TEXT:C222(DS_at_ProductShCodesChange; $_l_ChangeRow-1)
ARRAY TEXT:C222(DS_at_ProductNamesChange; $_l_ChangeRow-1)
ARRAY PICTURE:C279(DS_apic_ProductGraphicChange; $_l_ChangeRow-1)
ARRAY TEXT:C222(DS_at_ProductGraphicChange; $_l_ChangeRow-1)
ARRAY TEXT:C222(DS_at_aProductFileNameChange; $_l_ChangeRow-1)

//we now have an array of all the changes made during display of the form

//Now we need to decide what to do with them!
If (Size of array:C274(DS_at_aProductFileNameChange)>0)
	Gen_Confirm("Save updates to product images?"; "Yes"; "No")
	If (OK=1)
		ARRAY TEXT:C222(CAT_at_ImageNameConvention; 3)
		CAT_at_ImageNameConvention{1}:="Use Product Code"
		CAT_at_ImageNameConvention{2}:="Use Product Short Code"
		CAT_at_ImageNameConvention{3}:="Use Image Name on Product"
		$_l_PictureRow:=Find in array:C230(CAT_at_ImageNameConvention; CAT_t_PictureNaming)
		Case of 
				
			: ($_l_PictureRow=1)  //Product code
				Gen_Confirm("Do you wish to set the picture names to match the product codes?"; "Yes"; "No")
				If (OK=0)
					$_l_PictureRow:=3
				End if 
				
			: ($_l_PictureRow=2)  //Product short code
				Gen_Confirm("Do you wish to set the picture names to match the product short codes?"; "Yes"; "No")
				If (OK=0)
					$_l_PictureRow:=3
				End if 
		End case 
		
		If ($_l_PictureRow>0)
			
			For ($_l_ProductsIndex; 1; Size of array:C274(DS_at_ProductCodesChange))
				Case of 
						
					: ($_l_PictureRow=1)  //Product code
						DS_at_ProductCodesChange{$_l_ProductsIndex}:=DS_ResolvedPictureName(DS_at_ProductCodesChange{$_l_ProductsIndex})
						
						
						DS_SendPicturetoDrive(DS_at_ProductGraphicChange{$_l_ProductsIndex}; 0; DS_at_ProductCodesChange{$_l_ProductsIndex})
					: ($_l_PictureRow=2)  //Short
						DS_at_ProductShCodesChange{$_l_ProductsIndex}:=DS_ResolvedPictureName(DS_at_ProductShCodesChange{$_l_ProductsIndex})
						DS_SendPicturetoDrive(DS_at_ProductGraphicChange{$_l_ProductsIndex}; 0; DS_at_ProductShCodesChange{$_l_ProductsIndex})
					: ($_l_PictureRow=3)  //Name on product
						READ WRITE:C146([PRODUCTS:9])
						QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=DS_at_ProductCodesChange{$_l_ProductsIndex})
						[PRODUCTS:9]Picture_File_Name:44:=DocNameFromPath(DS_at_aProductFileNameChange{$_l_ProductsIndex})
						DS_SendPicturetoDrive(DS_at_ProductGraphicChange{$_l_ProductsIndex}; 0; [PRODUCTS:9]Picture_File_Name:44)
						//In this instance we have to save the current name of the file onto the product
						SAVE RECORD:C53([PRODUCTS:9])
						UNLOAD RECORD:C212([PRODUCTS:9])
						READ ONLY:C145([PRODUCTS:9])
						
				End case 
				
			End for 
		Else 
			Gen_Alert("The picture naming preference is invalid")
			
		End if 
		
		
		
	End if 
End if 
ERR_MethodTrackerReturn("DS_PictureOrganiseSaver"; $_t_oldMethodName)