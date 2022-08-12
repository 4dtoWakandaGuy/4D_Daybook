//%attributes = {}
If (False:C215)
	//Project Method Name:      Prod_SetProductDetail
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PROD_bo_ViewExpand)
	C_LONGINT:C283(PROD_l_DisplayedCatalogue; PROD_PowerviewStock)
	C_PICTURE:C286($nulPic; PROD_Pi_Graphic)
	C_REAL:C285(PROD_R_ProdDetPricePer; PROD_R_ProdDetSalesPrice; PROD_R_ProdDetStandardPrice; PROD_R_ProdDetWheight; ROD_R_ProdDetPricePer)
	C_TEXT:C284($_t_oldMethodName; $1; PROD_S11_ProdDetComCode; Prod_S15_ProdDetSize; PROD_S20_ProdDetBRAND; PROD_S20_ProdDetGROUP; PROD_t_ProdDetmodelLabel; PROD_t_ProdDetTaxRateLabel; PROD_S5_ProdDetTaxRate; PROD_t_ProdDetMODEL; PROD_t_ProdDetNAME)
	C_TEXT:C284(PROD_t_ProdDetNAME; PROD_T_ProdDetDESCRIPTION)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod_SetProductDetail")
//Prod_SetProductDetail
Case of 
	: (Count parameters:C259=0)
		
		PROD_S20_ProdDetBRAND:=""
		PROD_S20_ProdDetGROUP:=""
		PROD_t_ProdDetmodelLabel:=""
		PROD_t_ProdDetMODEL:=""
		PROD_t_ProdDetNAME:=""
		PROD_T_ProdDetDESCRIPTION:=""
		PROD_R_ProdDetSalesPrice:=0
		PROD_R_ProdDetStandardPrice:=0
		PROD_Pi_Graphic:=$nulPic
		PROD_S11_ProdDetComCode:=""
		PROD_t_ProdDetTaxRateLabel:=""
		PROD_S5_ProdDetTaxRate:=""
		ROD_R_ProdDetPricePer:=0
		PROD_R_ProdDetWheight:=0
		Prod_S15_ProdDetSize:=""
		PROD_bo_ViewExpand:=False:C215
		Prod_LoadGraphic(0)
		PROD_LoadCurrentStock(0; ""; True:C214)
		OBJECT SET VISIBLE:C603(*; "oPROD_T_Detail"+"@"; True:C214)
	: (Count parameters:C259=1)
		//PRODUCT ID
		If ($1#"")
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$1)
		Else 
			REDUCE SELECTION:C351([PRODUCTS:9]; 0)
		End if 
		PROD_S20_ProdDetBRAND:=[PRODUCTS:9]Brand_Code:4
		PROD_S20_ProdDetGROUP:=[PRODUCTS:9]Group_Code:3
		PROD_t_ProdDetmodelLabel:=""
		PROD_t_ProdDetMODEL:=[PRODUCTS:9]Product_Code:1
		PROD_t_ProdDetNAME:=[PRODUCTS:9]Product_Name:2
		PROD_T_ProdDetDESCRIPTION:=[PRODUCTS:9]Description:6
		PROD_R_ProdDetSalesPrice:=[PRODUCTS:9]Sales_Price:9
		PROD_R_ProdDetStandardPrice:=[PRODUCTS:9]Standard_Price:16
		PROD_Pi_Graphic:=$nulPic
		PROD_S11_ProdDetComCode:=[PRODUCTS:9]Commodity_Code:38
		PROD_t_ProdDetTaxRateLabel:=""
		PROD_S5_ProdDetTaxRate:=[PRODUCTS:9]Default_Tax:23
		ROD_R_ProdDetPricePer:=[PRODUCTS:9]Price_Per:40
		PROD_R_ProdDetWheight:=[PRODUCTS:9]Weight:26
		Prod_S15_ProdDetSize:=[PRODUCTS:9]Size:39
		Prod_LoadGraphic([PRODUCTS:9]X_ID:43; PROD_l_DisplayedCatalogue)
		
		
		PROD_LoadCurrentStock([PRODUCTS:9]X_ID:43; [PRODUCTS:9]Product_Code:1)
		OBJECT SET VISIBLE:C603(*; "oPROD_T_Detail"+"@"; True:C214)
		
End case 
ERR_MethodTrackerReturn("Prod_SetProductDetail"; $_t_oldMethodName)