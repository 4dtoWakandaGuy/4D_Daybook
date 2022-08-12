If (False:C215)
	//object Name: [DIARY]Diary_PDTEditor.oFeaturesList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_FeaturesList;0)
	//ARRAY LONGINT(SD2_al_RelatedRecordID;0)
	//ARRAY LONGINT(SD2_al_RelatedTableNum;0)
	//ARRAY TEXT(SD2_at_RelatedRecordCode;0)
	//ARRAY TEXT(SD2_at_RelatedRecordName;0)
	C_BOOLEAN:C305(PDT_bo_ProductIsFound)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_RelatedRecordCode; $_l_Row)
	C_TEXT:C284($_t_oldMethodName; $_t_RelatedRecordCode; $_t_RelatedRecordName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_PDTEditor.oFeaturesList"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(SD2_lb_FeaturesList; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=3)  //product code
				Case of 
					: (SD2_al_RelatedTableNum{$_l_Row}=9)
						$_t_RelatedRecordCode:=SD2_at_RelatedRecordCode{$_l_Row}
						$_t_RelatedRecordName:=SD2_at_RelatedRecordName{$_l_Row}
						$_l_RelatedRecordCode:=SD2_al_RelatedRecordID{$_l_Row}
						If ($_l_RelatedRecordCode>0)
							Gen_Alert("Sorry you may not alter the idendity of an already linked record, you must deleted the link")
						Else 
							Check_Product(->SD2_at_RelatedRecordCode{$_l_Row}; "Product"; ->PDT_bo_ProductIsFound; "PDT_FIlterProducts")
							
							
							If (PDT_bo_ProductisFound) & (Records in selection:C76([PRODUCTS:9])>0)
								SD2_at_RelatedRecordCode{$_l_Row}:=[PRODUCTS:9]Product_Code:1
								SD2_at_RelatedRecordName{$_l_Row}:=[PRODUCTS:9]Product_Name:2
								SD2_al_RelatedRecordID{$_l_Row}:=-([PRODUCTS:9]X_ID:43)
							Else 
								If ($_t_RelatedRecordCode#"") & ($_l_RelatedRecordCode#0)
									SD2_at_RelatedRecordCode{$_l_Row}:=$_t_RelatedRecordCode
									SD2_at_RelatedRecordName{$_l_Row}:=$_t_RelatedRecordName
									SD2_al_RelatedRecordID{$_l_Row}:=$_l_RelatedRecordCode
								Else 
									SD2_at_RelatedRecordCode{$_l_Row}:=""
									SD2_at_RelatedRecordName{$_l_Row}:=""
									SD2_al_RelatedRecordID{$_l_Row}:=0
								End if 
							End if 
						End if 
						
				End case 
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_PDTEditor.oFeaturesList"; $_t_oldMethodName)
