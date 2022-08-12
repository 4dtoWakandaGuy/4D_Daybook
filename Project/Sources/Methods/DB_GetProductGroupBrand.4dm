//%attributes = {}

If (False:C215)
	//Database Method Name:      DB_GetProductGroupBrand
	//------------------ Method Notes ------------------
	//this tell us to build the product code using group brand model-replacing 
	//------------------ Revision Control ----------------
	//Date Created:  21/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0; DB_bo_ProductCodePrefInited; DM_bo_ProductUseGroupandBrand)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; DB_l_CurrentOwnerRequest)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_GetProductGroupBrand")
If (<>PER_l_CurLoggedinDataOwnerID>0) | (DB_l_CurrentOwnerRequest>0)
	If (Not:C34(DB_bo_ProductCodePrefInited))
		DB_LoadProductCodePreferences
		If (Application type:C494#4D Server:K5:6)
			DB_bo_ProductCodePrefInited:=True:C214
		End if 
	End if 
	$0:=DM_bo_ProductUseGroupandBrand
Else 
	ALL RECORDS:C47([USER:15])
	$0:=[USER:15]ProdGroupBrand:140
End if 
ERR_MethodTrackerReturn("DB_GetProductGroupBrand"; $_t_oldMethodName)