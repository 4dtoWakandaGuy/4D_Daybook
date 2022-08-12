If (False:C215)
	//object Method Name: Object Name:      [CATALOGUE].Catalogue_Input.oCAT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 16:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CAT_al_CatLinkFamilyID2;0)
	//ARRAY LONGINT(CAT_al_CatLinkFamilyID3;0)
	//ARRAY LONGINT(CAT_al_CatLinkFamilyID4;0)
	//ARRAY LONGINT(CAT_al_CatLinkFamilyID5;0)
	//ARRAY LONGINT(CAT_al_CatProductIDS;0)
	//ARRAY LONGINT(CAT_al_FamilyName2;0)
	//ARRAY LONGINT(CAT_al_FamilyName3;0)
	//ARRAY LONGINT(CAT_al_FamilyName4;0)
	//ARRAY LONGINT(CAT_al_FamilyName5;0)
	//ARRAY REAL(CAT_ar_PriceChange;0)
	//ARRAY REAL(CAT_ar_ProductPrice;0)
	//ARRAY TEXT(CAT_at_CatLinkFamilyName2;0)
	//ARRAY TEXT(CAT_at_CatLinkFamilyName3;0)
	//ARRAY TEXT(CAT_at_CatLinkFamilyName4;0)
	//ARRAY TEXT(CAT_at_CatLinkFamilyName5;0)
	//ARRAY TEXT(Cat_at_CatProductCode;0)
	//ARRAY TEXT(CAT_at_FAMILYNAME2;0)
	//ARRAY TEXT(CAT_at_FamilyName3;0)
	//ARRAY TEXT(CAT_at_FamilyName4;0)
	//ARRAY TEXT(CAT_at_FAMILYNAME5;0)
	//ARRAY TEXT(CAT_at_PriceChange;0)
	//ARRAY TEXT(CAT_at_PriceCurrencyCode;0)
	//ARRAY TEXT(CAT_at_PriceProduct;0)
	//ARRAY TEXT(WS_at_CatProductCode;0)
	C_LONGINT:C283($_l_event; $_l_FamilyID; $_l_FamilyRow; $_l_FieldNumber; $_l_ItemID; $_l_ListID; $_l_SelectedRow; $_l_TableNumber; SP_l_ExitCalled)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; CAT_t_CatViewCurrency)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CATALOGUE].Catalogue_Input.oCAT"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		$_l_SelectedRow:=Self:C308->
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		
		//this script runs when a cell is exited
		//this is the cell we are leaving
		If ($_t_VariableName#"") & ($_l_SelectedRow>0)
			Case of 
				: ($_t_VariableName="CAT_at_CatProductName")  //Code"
					
				: ($_t_VariableName="WS_at_CatProductCode")  //Short Code
					
				: ($_t_VariableName="CAT_at_CatProductCodeShort")
					//(pop-up) Type
					
					
					
				: ($_t_VariableName="CAT_at_CatProdDesc")  //Description
				: ($_t_VariableName="CAT_ar_ProductPrice")
					//exiting the price column
					If (CAT_ar_ProductPrice{$_l_SelectedRow}#CAT_ar_ProductPrice{0})
						//Price is changed
						$_l_FamilyRow:=Find in array:C230(CAT_at_PriceChange; String:C10(CAT_al_CatProductIDS{$_l_SelectedRow})+":"+CAT_t_CatViewCurrency)
						If ($_l_FamilyRow<0)
							INSERT IN ARRAY:C227(CAT_at_PriceChange; Size of array:C274(CAT_at_PriceChange)+1; 1)
							INSERT IN ARRAY:C227(CAT_ar_PriceChange; Size of array:C274(CAT_ar_PriceChange)+1; 1)
							INSERT IN ARRAY:C227(CAT_at_PriceCurrencyCode; Size of array:C274(CAT_at_PriceCurrencyCode)+1; 1)
							INSERT IN ARRAY:C227(CAT_at_PriceProduct; Size of array:C274(CAT_at_PriceProduct)+1; 1)
						End if 
						CAT_ar_PriceChange{Size of array:C274(CAT_ar_PriceChange)}:=CAT_ar_ProductPrice{$_l_SelectedRow}
						CAT_at_PriceChange{Size of array:C274(CAT_at_PriceChange)}:=String:C10(CAT_al_CatProductIDS{$_l_SelectedRow})+":"+CAT_t_CatViewCurrency
						CAT_at_PriceCurrencyCode{Size of array:C274(CAT_at_PriceCurrencyCode)}:=CAT_t_CatViewCurrency
						CAT_at_PriceProduct{Size of array:C274(CAT_at_PriceProduct)}:=Cat_at_CatProductCode{$_l_SelectedRow}
					End if 
					
					
					
				: ($_t_VariableName="CAT_at_CatLinkFamilyName2")  //Family 1
					//(pop-up) Type
					// CAT_al_FamilyName2
/*
If (SP_l_ExitCalled=0)
ARRAY TEXT(CAT_at_FAMILYNAME2;0)
If (CAT_at_CatLinkFamilyName2{$_l_SelectedRow}#"")
$_l_FamilyRow:=Find in array(CAT_at_FAMILYNAME2;CAT_at_CatLinkFamilyName2{$_l_SelectedRow})
If ($_l_FamilyRow>0)
$_l_FamilyID:=CAT_al_FamilyName2{$_l_FamilyRow}
If ($_l_FamilyID>0)
CAT_al_CatLinkFamilyID2{$_l_SelectedRow}:=CAT_al_FamilyName2{$_l_FamilyRow}
Else 
  //must have selected add item(designer only!!)
SP_l_ExitCalled:=1
$_l_ListID:=AA_GetListID (0;0;"E commerce Family 2")
$_l_ItemID:=AA_ListAddItembyID ($_l_ListID)
If ($_l_ItemID>0)
$_l_ListID:=AA_LoadListByName ("E commerce Family 2";->CAT_at_FAMILYNAME2;->CAT_al_FamilyName2;True)
LB_SetChoiceList ("CAT_LB_FAm2";->CAT_at_FAMILYNAME2;->CAT_at_CatLinkFamilyName2)
$_l_FamilyRow:=Find in array(CAT_al_FamilyName2;$_l_ItemID)
CAT_al_CatLinkFamilyID2{$_l_SelectedRow}:=CAT_al_FamilyName2{$_l_FamilyRow}
CAT_at_CatLinkFamilyName2{$_l_SelectedRow}:=CAT_at_FAMILYNAME2{$_l_FamilyRow}
Else 
CAT_at_CatLinkFamilyName2{$_l_SelectedRow}:=""
End if 
End if 
					
End if 
					
Else 
CAT_at_CatLinkFamilyName2{$_l_SelectedRow}:=""
  //must be an empty array
					
End if 
					
					
Else 
SP_l_ExitCalled:=0
End if 
*/
					
				: ($_t_VariableName="CAT_at_CatLinkFamilyName3")  //Family 2
					//(pop-up) Type
					// CAT_al_FamilyName2
/*
If (SP_l_ExitCalled=0)
					
If (CAT_at_CatLinkFamilyName3{$_l_SelectedRow}#"")
$_l_FamilyRow:=Find in array(CAT_at_FamilyName3;CAT_at_CatLinkFamilyName3{$_l_SelectedRow})
If ($_l_FamilyRow>0)
$_l_FamilyID:=CAT_al_FamilyName3{$_l_FamilyRow}
If ($_l_FamilyID>0)
CAT_al_CatLinkFamilyID3{$_l_SelectedRow}:=CAT_al_FamilyName3{$_l_FamilyRow}
Else 
  //must have selected add item(designer only!!)
SP_l_ExitCalled:=1
$_l_ListID:=AA_GetListID (0;0;"E commerce Family 3")
$_l_ItemID:=AA_ListAddItembyID ($_l_ListID)
If ($_l_ItemID>0)
$_l_ListID:=AA_LoadListByName ("E commerce Family 3";->CAT_at_FamilyName3;->CAT_al_FamilyName3;True)
LB_SetChoiceList ("CAT_LB_FAm3";->CAT_at_FamilyName3;->CAT_at_CatLinkFamilyName3)
					
$_l_FamilyRow:=Find in array(CAT_al_FamilyName3;$_l_ItemID)
CAT_al_CatLinkFamilyID3{$_l_SelectedRow}:=CAT_al_FamilyName3{$_l_FamilyRow}
CAT_at_CatLinkFamilyName3{$_l_SelectedRow}:=CAT_at_FamilyName3{$_l_FamilyRow}
Else 
CAT_at_CatLinkFamilyName3{$_l_SelectedRow}:=""
End if 
End if 
					
End if 
					
Else 
CAT_at_CatLinkFamilyName3{$_l_SelectedRow}:=""
  //must be an empty array
					
End if 
					
					
Else 
SP_l_ExitCalled:=0
End if 
					
*/
					
				: ($_t_VariableName="CAT_at_CatLinkFamilyName4")  //Family 3
					//(pop-up) Type
					// CAT_al_FamilyName4
/*
If (SP_l_ExitCalled=0)
//
If (CAT_at_CatLinkFamilyName4{$_l_SelectedRow}#"")
$_l_FamilyRow:=Find in array(CAT_at_FamilyName4;CAT_at_CatLinkFamilyName4{$_l_SelectedRow})
If ($_l_FamilyRow>0)
$_l_FamilyID:=CAT_al_FamilyName4{$_l_FamilyRow}
If ($_l_FamilyID>0)
CAT_al_CatLinkFamilyID4{$_l_SelectedRow}:=CAT_al_FamilyName4{$_l_FamilyRow}
Else 
  //must have selected add item(designer only!!)
SP_l_ExitCalled:=1
$_l_ListID:=AA_GetListID (0;0;"E commerce Family 4")
$_l_ItemID:=AA_ListAddItembyID ($_l_ListID)
If ($_l_ItemID>0)
$_l_ListID:=AA_LoadListByName ("E commerce Family 4";->CAT_at_FamilyName4;->CAT_al_FamilyName4;True)
LB_SetChoiceList ("CAT_LB_FAm4";->CAT_at_FamilyName4;->CAT_at_CatLinkFamilyName4)
					
$_l_FamilyRow:=Find in array(CAT_al_FamilyName4;$_l_ItemID)
CAT_al_CatLinkFamilyID4{$_l_SelectedRow}:=CAT_al_FamilyName4{$_l_FamilyRow}
CAT_at_CatLinkFamilyName4{$_l_SelectedRow}:=CAT_at_FamilyName4{$_l_FamilyRow}
Else 
CAT_at_CatLinkFamilyName4{$_l_SelectedRow}:=""
End if 
End if 
					
End if 
					
Else 
CAT_at_CatLinkFamilyName4{$_l_SelectedRow}:=""
  //must be an empty array
					
End if 
					
					
Else 
SP_l_ExitCalled:=0
End if 
*/
					
				: ($_t_VariableName="CAT_at_CatLinkFamilyName5")  //Family 5
					//(pop-up) Type
					// CAT_al_FamilyName2
/*
If (SP_l_ExitCalled=0)
					
If (CAT_at_CatLinkFamilyName5{$_l_SelectedRow}#"")
$_l_FamilyRow:=Find in array(CAT_at_FAMILYNAME5;CAT_at_CatLinkFamilyName5{$_l_SelectedRow})
If ($_l_FamilyRow>0)
$_l_FamilyID:=CAT_al_FamilyName5{$_l_FamilyRow}
If ($_l_FamilyID>0)
CAT_al_CatLinkFamilyID5{$_l_SelectedRow}:=CAT_al_FamilyName5{$_l_FamilyRow}
Else 
  //must have selected add item(designer only!!)
SP_l_ExitCalled:=1
$_l_ListID:=AA_GetListID (0;0;"E commerce Family 5")
$_l_ItemID:=AA_ListAddItembyID ($_l_ListID)
If ($_l_ItemID>0)
$_l_ListID:=AA_LoadListByName ("E commerce Family 5";->CAT_at_FAMILYNAME5;->CAT_al_FamilyName5;True)
LB_SetChoiceList ("CAT_LB_FAm5";->CAT_at_FAMILYNAME5;->CAT_at_CatLinkFamilyName5)
					
$_l_FamilyRow:=Find in array(CAT_al_FamilyName5;$_l_ItemID)
CAT_al_CatLinkFamilyID5{$_l_SelectedRow}:=CAT_al_FamilyName5{$_l_FamilyRow}
CAT_at_CatLinkFamilyName5{$_l_SelectedRow}:=CAT_at_FAMILYNAME5{$_l_FamilyRow}
Else 
CAT_at_CatLinkFamilyName5{$_l_SelectedRow}:=""
End if 
End if 
					
End if 
					
Else 
CAT_at_CatLinkFamilyName5{$_l_SelectedRow}:=""
  //must be an empty array
					
End if 
					
					
Else 
SP_l_ExitCalled:=0
End if 
					
*/
					
			End case 
		End if 
		
		
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ [CATALOGUE]Catalogue_Input.oCAT"; $_t_oldMethodName)
