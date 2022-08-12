//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_allocationWindowLoad
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    03/11/2010 20:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_abo_AllocationAllowed;0)
	//ARRAY BOOLEAN(STK_abo_ProductISerialNumbered;0)
	//ARRAY LONGINT(STK_al_2DIndex;0)
	//ARRAY LONGINT(STK_al_AllocationCSIDs;0)
	//ARRAY LONGINT(STK_al_CurrentStockRecordID;0;0)
	//ARRAY LONGINT(STK_al_ExpandedIndex;0)
	//ARRAY LONGINT(STK_al_ExpandedLevel;0)
	//ARRAY LONGINT(STK_al_RootAnalID;0)
	//ARRAY LONGINT(STK_al_RootLayerID;0)
	//ARRAY LONGINT(STK_al_RootPriceID;0)
	//ARRAY LONGINT(STK_al_SortIndex;0)
	//ARRAY PICTURE(STK_apic_DisExpandAnal;0)
	//ARRAY PICTURE(STK_apic_DisExpandLayer;0)
	//ARRAY PICTURE(STK_apic_DisExpandPrices;0)
	//ARRAY PICTURE(STK_apic_DisExpandStatus;0)
	//ARRAY REAL(STK_ar_CostPrice;0)
	//ARRAY REAL(STK_ar_CurrentStockQty;0;0)
	//ARRAY REAL(STK_ar_DisCostPrices;0)
	//ARRAY REAL(STK_ar_DisCostValues;0;0)
	//ARRAY REAL(STK_ar_DisStockQuantities;0)
	//ARRAY REAL(STK_ar_Quantities;0)
	//ARRAY TEXT(STK_af_DisAnalCode;0)
	//ARRAY TEXT(STK_af_DisLocationCode;0)
	//ARRAY TEXT(STK_at_AnalysisCode;0)
	//ARRAY TEXT(STK_at_CurrentStockAnalCode;0;0)
	//ARRAY TEXT(STK_at_CurrentStockLayerCode;0;0)
	//ARRAY TEXT(STK_at_CurrentStockLocCodes;0;0)
	//ARRAY TEXT(STK_at_DisAnalCodes;0)
	//ARRAY TEXT(STK_at_DisLayerCode;0)
	//ARRAY TEXT(STK_at_DisLocationCodes;0)
	//ARRAY TEXT(STK_at_DispayledLocation;0)
	//ARRAY TEXT(STK_at_DisplayedLocation;0)
	//ARRAY TEXT(STK_at_DisProductCodes;0)
	//ARRAY TEXT(STK_at_DisProductNames;0)
	//ARRAY TEXT(STK_at_DisSerialNumbers;0)
	//ARRAY TEXT(STK_at_DisStockCurrencyCodes;0)
	//ARRAY TEXT(STK_at_DisStockTypeNames;0)
	//ARRAY TEXT(STK_at_DisStockTypes;0)
	//ARRAY TEXT(STK_at_LayerCode;0)
	//ARRAY TEXT(STK_at_LocationCodes;0)
	//ARRAY TEXT(STK_at_ProductCodes;0)
	//ARRAY TEXT(STK_at_ProductsNames;0)
	//ARRAY TEXT(STK_at_ProductsProductCodes;0)
	//ARRAY TEXT(STK_at_SerialNos;0)
	//ARRAY TEXT(STK_at_StockTypes;0)
	//ARRAY TEXT(STK_at_TypeName;0)
	//ARRAY TEXT(STK_at_TypeTypeCode;0)
	//ARRAY TEXT(STK_at_UseForAllocation;0)
	//ARRAY TEXT(STK_at_ValueCurrencyCodes;0)
	C_BOOLEAN:C305($_bo_ExpandAnalysis; $_bo_ExpandLayers; $_bo_ExpandLocations; $_bo_ExpandPrices; $_bo_isSerialNumbered; $_bo_LayersInUse; $_bo_NewRow; $_bo_SerialNumbers; STK_bo_Layersinuse; STK_bo_SerialNos)
	C_LONGINT:C283($_l_AllocationsIndex; $_l_CurrentStockIndex; $_l_ExpandRow; $_l_LocationRow; $_l_PriceRowNumber; $_l_ProductRow; $_l_StockTypeRow; $_l_TypeRow; STK_l_ShowLocations)
	C_PICTURE:C286($_pic_BlankPicture; $_pic_CollapsedPicture; $_pic_ExpandPicture)
	C_REAL:C285($_r_CostPrice; $_r_TotalCost; $_r_UnitCost)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AllocationAnalysis; $_t_AllocationLayer; $_t_CurrencyCode; $_t_LayerTest; $_t_oldMethodName; $_t_productCode; $_t_ProductName; $_t_SerialNumber; $_t_StockType; STK_t_DisplayCurrency)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_allocationWindowLoad")
/*
ARRAY PICTURE(STK_apic_DisExpandStatus;0)
ARRAY PICTURE(STK_apic_DisExpandPrices;0)
ARRAY PICTURE(STK_apic_DisExpandAnal;0)
ARRAY PICTURE(STK_apic_DisExpandLayer;0)
ARRAY LONGINT(STK_al_ExpandedLevel;0)

ARRAY TEXT(STK_at_DisStockTypes;0)
ARRAY TEXT(STK_at_DisSerialNumbers;0)
ARRAY TEXT(STK_at_DisStockTypes;0)
ARRAY TEXT(STK_at_DisStockTypeNames;0)
ARRAY TEXT(STK_at_DisProductCodes;0)
ARRAY TEXT(STK_at_DisProductNames;0)
ARRAY TEXT(STK_at_DisStockCurrencyCodes;0)
ARRAY REAL(STK_ar_DisCostPrices;0)
ARRAY REAL(STK_ar_DisStockQuantities;0)
ARRAY REAL(STK_ar_DisCostValues;0;0)  //NOTE TOTAL VALUE NOT UNIT VALUE`calculated converted and multiply by quantity so can calc average cost

ARRAY LONGINT(STK_al_CurrentStockRecordID;0;0)
ARRAY TEXT(STK_at_CurrentStockAnalCode;0;0)
ARRAY TEXT(STK_at_CurrentStockLayerCode;0;0)
ARRAY TEXT(STK_at_CurrentStockLocCodes;0;0)

ARRAY REAL(STK_ar_CurrentStockQty;0;0)
ARRAY TEXT(STK_at_DisLayerCode;0)
ARRAY TEXT(STK_at_DisAnalCodes;0)
ARRAY TEXT(STK_at_DisLocationCodes;0)
Get Picture FROM LIBRARY(403;$_pic_CollapsedPicture)
Get Picture FROM LIBRARY(410;$_pic_ExpandPicture)

Get Picture FROM LIBRARY(417;$_pic_BlankPicture)
$_t_SerialNumber:=""
$_t_productCode:=""
$_t_StockType:=""



For ($_l_AllocationsIndex;1;Size of array(STK_al_AllocationCSIDs))
If (Size of array(STK_at_DisplayedLocation)>0)
$_l_LocationRow:=Find in array(STK_at_DisplayedLocation;STK_at_LocationCodes{$_l_AllocationsIndex})
Else 
$_l_LocationRow:=1
End if 
$_l_StockTypeRow:=Find in array(STK_at_TypeTypeCode;STK_at_StockTypes{$_l_AllocationsIndex})
If (STK_abo_AllocationAllowed{$_l_StockTypeRow}) | (Find in array(STK_at_UseForAllocation;STK_at_StockTypes{$_l_AllocationsIndex})>0)
$_l_ExpandRow:=Find in array(STK_al_ExpandedIndex;STK_al_AllocationCSIDs{$_l_AllocationsIndex})
  //if this row is expanded at what level is it expanded

$_bo_ExpandPrices:=False
$_bo_ExpandLocations:=False
$_bo_ExpandAnalysis:=False
$_bo_ExpandLayers:=False

If ($_l_ExpandRow>0)  //it should be
Case of 
: (STK_al_ExpandedLevel{$_l_ExpandRow}=1)
$_bo_ExpandPrices:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=2)
$_bo_ExpandLocations:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=3)
$_bo_ExpandLocations:=True
$_bo_ExpandPrices:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=4)
$_bo_ExpandAnalysis:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=5)
$_bo_ExpandAnalysis:=True
$_bo_ExpandPrices:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=6)
$_bo_ExpandAnalysis:=True
$_bo_ExpandLocations:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=7)
$_bo_ExpandAnalysis:=True
$_bo_ExpandLocations:=True
$_bo_ExpandPrices:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=8)
$_bo_ExpandLayers:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=9)
$_bo_ExpandLayers:=True
$_bo_ExpandPrices:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=10)
$_bo_ExpandLayers:=True
$_bo_ExpandLocations:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=11)
$_bo_ExpandLayers:=True
$_bo_ExpandLocations:=True
$_bo_ExpandPrices:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=12)
$_bo_ExpandLayers:=True
$_bo_ExpandAnalysis:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=13)
$_bo_ExpandLayers:=True
$_bo_ExpandAnalysis:=True
$_bo_ExpandPrices:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=14)
$_bo_ExpandLayers:=True
$_bo_ExpandAnalysis:=True
$_bo_ExpandLocations:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=15)
$_bo_ExpandLayers:=True
$_bo_ExpandAnalysis:=True
$_bo_ExpandLocations:=True
$_bo_ExpandPrices:=True
End case 
End if 
If (STK_l_ShowLocations=1)
$_bo_ExpandLocations:=True
End if 
If ($_l_LocationRow>0)
$_bo_NewRow:=False
If ($_bo_ExpandLocations)
If (STK_at_LocationCodes{$_l_AllocationsIndex}#STK_at_LocationCodes{$_l_AllocationsIndex-1})
$_bo_NewRow:=True
End if 
End if 
If ($_bo_ExpandLayers)
  //If (STK_at_LayerCode{$_l_AllocationsIndex}#STK_at_LayerCode{$_l_AllocationsIndex-1})
  //$_bo_NewRow:=True
  //End if 
End if 
If ($_bo_ExpandAnalysis)
  //If (STK_at_AnalysisCode{$_l_AllocationsIndex}#STK_at_AnalysisCode{$_l_AllocationsIndex-1})
  //$_bo_NewRow:=True
  //End if 
End if 
If ($_bo_ExpandPrices)  //in the section below we dont need to deal with this because it will work anyway
If (STK_ar_CostPrice{$_l_AllocationsIndex}#STK_ar_CostPrice{$_l_AllocationsIndex-1})
$_bo_NewRow:=True
End if 
End if 
If ($_t_StockType#STK_at_StockTypes{$_l_AllocationsIndex}) | ($_bo_NewRow)

$_t_StockType:=STK_at_StockTypes{$_l_AllocationsIndex}
$_t_productCode:=STK_at_ProductCodes{$_l_AllocationsIndex}
$_t_SerialNumber:=STK_at_SerialNos{$_l_AllocationsIndex}
APPEND TO ARRAY(STK_apic_DisExpandStatus;$_pic_CollapsedPicture)
If ($_bo_ExpandPrices)
APPEND TO ARRAY(STK_apic_DisExpandPrices;$_pic_ExpandPicture)
Else 
APPEND TO ARRAY(STK_apic_DisExpandPrices;$_pic_CollapsedPicture)
End if 
APPEND TO ARRAY(STK_apic_DisExpandAnal;$_pic_CollapsedPicture)
APPEND TO ARRAY(STK_apic_DisExpandLayer;$_pic_CollapsedPicture)
APPEND TO ARRAY(STK_at_DisStockTypes;STK_at_StockTypes{$_l_AllocationsIndex})
$_l_TypeRow:=Find in array(STK_at_TypeTypeCode;STK_at_StockTypes{$_l_AllocationsIndex})
If ($_l_TypeRow>0)
APPEND TO ARRAY(STK_at_DisStockTypeNames;STK_at_TypeName{$_l_TypeRow})
Else 
APPEND TO ARRAY(STK_at_DisStockTypeNames;"")
End if 
APPEND TO ARRAY(STK_at_DisSerialNumbers;"")
APPEND TO ARRAY(STK_at_DisProductCodes;"")
APPEND TO ARRAY(STK_at_DisProductNames;"")
APPEND TO ARRAY(STK_at_DisStockCurrencyCodes;"")
APPEND TO ARRAY(STK_ar_DisCostPrices;0)
INSERT IN ARRAY(STK_ar_DisCostValues;Size of array(STK_ar_DisCostValues)+1;1)
APPEND TO ARRAY(STK_ar_DisStockQuantities;0)
INSERT IN ARRAY(STK_al_CurrentStockRecordID;Size of array(STK_al_CurrentStockRecordID)+1;1)
INSERT IN ARRAY(STK_at_CurrentStockAnalCode;Size of array(STK_at_CurrentStockAnalCode)+1;1)
INSERT IN ARRAY(STK_at_CurrentStockLayerCode;Size of array(STK_at_CurrentStockLayerCode)+1;1)
INSERT IN ARRAY(STK_ar_CurrentStockQty;Size of array(STK_ar_CurrentStockQty)+1;1)
INSERT IN ARRAY(STK_at_CurrentStockLocCodes;Size of array(STK_at_CurrentStockLocCodes)+1;1)

APPEND TO ARRAY(STK_at_DisLayerCode;"ALL")
APPEND TO ARRAY(STK_at_DisAnalCodes;"ALL")
APPEND TO ARRAY(STK_at_DisLocationCodes;"ALL")


End if 
$_bo_isSerialNumbered:=False
$_l_ProductRow:=Find in array(STK_at_ProductsProductCodes;STK_at_ProductCodes{$_l_AllocationsIndex})
If ($_l_ProductRow>0)
$_bo_isSerialNumbered:=STK_abo_ProductISerialNumbered{$_l_ProductRow}
End if 
If ($_t_productCode#STK_at_ProductCodes{$_l_AllocationsIndex}) | (STK_at_SerialNos{$_l_AllocationsIndex}#$_t_SerialNumber)
$_t_productCode:=STK_at_ProductCodes{$_l_AllocationsIndex}
APPEND TO ARRAY(STK_apic_DisExpandStatus;$_pic_CollapsedPicture)
If ($_bo_ExpandPrices)
APPEND TO ARRAY(STK_apic_DisExpandPrices;$_pic_ExpandPicture)
Else 
APPEND TO ARRAY(STK_apic_DisExpandPrices;$_pic_CollapsedPicture)
End if 
APPEND TO ARRAY(STK_apic_DisExpandAnal;$_pic_CollapsedPicture)
APPEND TO ARRAY(STK_apic_DisExpandLayer;$_pic_CollapsedPicture)

APPEND TO ARRAY(STK_at_DisStockTypes;STK_at_StockTypes{$_l_AllocationsIndex})
$_l_TypeRow:=Find in array(STK_at_TypeTypeCode;STK_at_StockTypes{$_l_AllocationsIndex})
If ($_l_TypeRow>0)
APPEND TO ARRAY(STK_at_DisStockTypeNames;STK_at_TypeName{$_l_TypeRow})
Else 
APPEND TO ARRAY(STK_at_DisStockTypeNames;"")
End if 
APPEND TO ARRAY(STK_at_DisSerialNumbers;STK_at_SerialNos{$_l_AllocationsIndex})
APPEND TO ARRAY(STK_at_DisProductCodes;STK_at_ProductCodes{$_l_AllocationsIndex})
$_l_ProductRow:=Find in array(STK_at_ProductsProductCodes;STK_at_ProductCodes{$_l_AllocationsIndex})
If ($_l_ProductRow>0)
$_t_ProductName:=STK_at_ProductsNames{$_l_ProductRow}
Else 
$_t_ProductName:="??"
End if 
APPEND TO ARRAY(STK_at_DisProductNames;$_t_ProductName)
APPEND TO ARRAY(STK_at_DisStockCurrencyCodes;STK_t_DisplayCurrency)
$_t_CurrencyCode:=STK_at_ValueCurrencyCodes{$_l_AllocationsIndex}
If ($_t_CurrencyCode="")
$_t_CurrencyCode:=<>SYS_t_BaseCurrency
End if 
If (STK_t_DisplayCurrency#$_t_CurrencyCode)
$_r_CostPrice:=Cat_ConvertValue (STK_ar_CostPrice{$_l_AllocationsIndex};$_t_CurrencyCode;STK_t_DisplayCurrency)
Else 
$_r_CostPrice:=STK_ar_CostPrice{$_l_AllocationsIndex}
End if 
  //Add rows to these 2D arrays
INSERT IN ARRAY(STK_ar_DisCostValues;Size of array(STK_ar_DisCostValues)+1;1)
INSERT IN ARRAY(STK_al_CurrentStockRecordID;Size of array(STK_al_CurrentStockRecordID)+1;1)
INSERT IN ARRAY(STK_at_CurrentStockAnalCode;Size of array(STK_at_CurrentStockAnalCode)+1;1)
INSERT IN ARRAY(STK_at_CurrentStockLayerCode;Size of array(STK_at_CurrentStockLayerCode)+1;1)
INSERT IN ARRAY(STK_ar_CurrentStockQty;Size of array(STK_ar_CurrentStockQty)+1;1)
INSERT IN ARRAY(STK_at_CurrentStockLocCodes;Size of array(STK_at_CurrentStockLocCodes)+1;1)
  //add columns to the 2D arrays
APPEND TO ARRAY(STK_ar_DisCostValues{Size of array(STK_ar_DisCostValues)};Gen_Round ($_r_CostPrice*STK_ar_Quantities{$_l_AllocationsIndex};3;1))
APPEND TO ARRAY(STK_al_CurrentStockRecordID{Size of array(STK_al_CurrentStockRecordID)};STK_al_AllocationCSIDs{$_l_AllocationsIndex})
APPEND TO ARRAY(STK_at_CurrentStockAnalCode{Size of array(STK_at_CurrentStockAnalCode)};STK_at_AnalysisCode{$_l_AllocationsIndex})
APPEND TO ARRAY(STK_at_CurrentStockLayerCode{Size of array(STK_at_CurrentStockLayerCode)};STK_at_LayerCode{$_l_AllocationsIndex})
APPEND TO ARRAY(STK_ar_CurrentStockQty{Size of array(STK_ar_CurrentStockQty)};STK_ar_Quantities{$_l_AllocationsIndex})
APPEND TO ARRAY(STK_at_CurrentStockLocCodes{Size of array(STK_at_CurrentStockLocCodes)};STK_at_LocationCodes{$_l_AllocationsIndex})


APPEND TO ARRAY(STK_ar_DisCostPrices;0)  //add this up at the end

APPEND TO ARRAY(STK_ar_DisStockQuantities;STK_ar_Quantities{$_l_AllocationsIndex})
If ($_bo_ExpandLayers)
APPEND TO ARRAY(STK_at_DisLayerCode;STK_at_LayerCode{$_l_AllocationsIndex})
Else 
APPEND TO ARRAY(STK_at_DisLayerCode;"ALL")
End if 
If ($_bo_ExpandAnalysis)
APPEND TO ARRAY(STK_at_DisAnalCodes;STK_at_AnalysisCode{$_l_AllocationsIndex})
Else 
APPEND TO ARRAY(STK_at_DisAnalCodes;"ALL")
End if 
If ($_bo_ExpandLocations)
APPEND TO ARRAY(STK_at_DisLocationCodes;STK_at_LocationCodes{$_l_AllocationsIndex})
Else 
APPEND TO ARRAY(STK_at_DisLocationCodes;"ALL")
End if 

Else 
$_l_PriceRowNumber:=Size of array(STK_ar_DisCostPrices)
$_t_productCode:=STK_at_ProductCodes{$_l_AllocationsIndex}
STK_apic_DisExpandStatus{$_l_PriceRowNumber}:=$_pic_CollapsedPicture
If ($_bo_ExpandPrices)
APPEND TO ARRAY(STK_apic_DisExpandPrices;$_pic_ExpandPicture)
Else 
APPEND TO ARRAY(STK_apic_DisExpandPrices;$_pic_CollapsedPicture)
End if 
STK_apic_DisExpandAnal{$_l_PriceRowNumber}:=$_pic_CollapsedPicture
STK_apic_DisExpandLayer{$_l_PriceRowNumber}:=$_pic_CollapsedPicture
STK_at_DisStockTypes{$_l_PriceRowNumber}:=STK_at_StockTypes{$_l_AllocationsIndex}
$_l_TypeRow:=Find in array(STK_at_TypeTypeCode;STK_at_StockTypes{$_l_AllocationsIndex})
If ($_l_TypeRow>0)
STK_at_DisStockTypeNames{$_l_PriceRowNumber}:=STK_at_TypeName{$_l_TypeRow}
Else 
STK_at_DisStockTypeNames{$_l_PriceRowNumber}:=""
End if 
STK_at_DisSerialNumbers{$_l_PriceRowNumber}:=STK_at_SerialNos{$_l_AllocationsIndex}
STK_at_DisProductCodes{$_l_PriceRowNumber}:=STK_at_ProductCodes{$_l_AllocationsIndex}
$_l_ProductRow:=Find in array(STK_at_ProductsProductCodes;STK_at_ProductCodes{$_l_AllocationsIndex})
If ($_l_ProductRow>0)
$_t_ProductName:=STK_at_ProductsNames{$_l_ProductRow}
Else 
$_t_ProductName:="??"
End if 
STK_at_DisProductNames{$_l_PriceRowNumber}:=$_t_ProductName
STK_at_DisStockCurrencyCodes{$_l_PriceRowNumber}:=STK_t_DisplayCurrency
$_t_CurrencyCode:=STK_at_ValueCurrencyCodes{$_l_AllocationsIndex}
If ($_t_CurrencyCode="")
$_t_CurrencyCode:=<>SYS_t_BaseCurrency
End if 

If (STK_t_DisplayCurrency#$_t_CurrencyCode)
$_r_CostPrice:=Cat_ConvertValue (STK_ar_CostPrice{$_l_AllocationsIndex};$_t_CurrencyCode;STK_t_DisplayCurrency)
Else 
$_r_CostPrice:=STK_ar_CostPrice{$_l_AllocationsIndex}
End if 
  //Add rows to these 2D arrays
  //INSERT IN ARRAY(STK_ar_DisCostValues;Size of array(STK_ar_DisCostValues)+1;1)
  //INSERT IN ARRAY(STK_al_CurrentStockRecordID;Size of array(STK_al_CurrentStockRecordID)+1;1)
  //INSERT IN ARRAY(STK_at_CurrentStockAnalCode;Size of array(STK_at_CurrentStockAnalCode)+1;1)
  //INSERT IN ARRAY(STK_at_CurrentStockLayerCode;Size of array(STK_at_CurrentStockLayerCode)+1;1)
  //INSERT IN ARRAY(STK_ar_CurrentStockQty;Size of array(STK_ar_CurrentStockQty)+1;1)
  //INSERT IN ARRAY(STK_at_CurrentStockLocCodes;Size of array(STK_at_CurrentStockLocCodes)+1;1)
  //add columns to the 2D arrays
APPEND TO ARRAY(STK_ar_DisCostValues{$_l_PriceRowNumber};Gen_Round ($_r_CostPrice*STK_ar_Quantities{$_l_AllocationsIndex};3;1))
APPEND TO ARRAY(STK_al_CurrentStockRecordID{$_l_PriceRowNumber};STK_al_AllocationCSIDs{$_l_AllocationsIndex})
APPEND TO ARRAY(STK_at_CurrentStockAnalCode{$_l_PriceRowNumber};STK_at_AnalysisCode{$_l_AllocationsIndex})
APPEND TO ARRAY(STK_at_CurrentStockLayerCode{$_l_PriceRowNumber};STK_at_LayerCode{$_l_AllocationsIndex})
APPEND TO ARRAY(STK_ar_CurrentStockQty{$_l_PriceRowNumber};STK_ar_Quantities{$_l_AllocationsIndex})
APPEND TO ARRAY(STK_at_CurrentStockLocCodes{$_l_PriceRowNumber};STK_at_LocationCodes{$_l_AllocationsIndex})
STK_ar_DisCostPrices{$_l_PriceRowNumber}:=0  //add this up at the end
STK_ar_DisStockQuantities{$_l_PriceRowNumber}:=STK_ar_DisStockQuantities{$_l_PriceRowNumber}+STK_ar_Quantities{$_l_AllocationsIndex}
If ($_bo_ExpandLayers)
STK_at_DisLayerCode{$_l_PriceRowNumber}:=STK_at_LayerCode{$_l_AllocationsIndex}
Else 
STK_at_DisLayerCode{$_l_PriceRowNumber}:="ALL"
End if 
If ($_bo_ExpandAnalysis)
STK_at_DisAnalCodes{$_l_PriceRowNumber}:=STK_at_AnalysisCode{$_l_AllocationsIndex}
Else 
STK_at_DisAnalCodes{$_l_PriceRowNumber}:="ALL"
End if 
If ($_bo_ExpandLocations)
STK_at_DisLocationCodes{$_l_PriceRowNumber}:=STK_at_LocationCodes{$_l_AllocationsIndex}
Else 
STK_at_DisLocationCodes{$_l_PriceRowNumber}:="ALL"
End if 

End if 
End if 
End if 
End for 
ARRAY LONGINT(STK_al_SortIndex;0)
ARRAY LONGINT(STK_al_2DIndex;0)
ARRAY LONGINT(STK_al_SortIndex;Size of array(STK_at_DisStockTypes))
ARRAY LONGINT(STK_al_2DIndex;Size of array(STK_at_DisStockTypes))
$_bo_SerialNumbers:=False
$_bo_LayersInUse:=False
$_t_LayerTest:=""
For ($_l_AllocationsIndex;1;Size of array(STK_at_DisStockTypes))
If ($_l_AllocationsIndex=1)
$_t_LayerTest:=STK_at_DisLayerCode{$_l_AllocationsIndex}
End if 
If ($_t_LayerTest#"") & ($_t_LayerTest#"ALL")
$_bo_LayersInUse:=True
End if 
STK_al_SortIndex{$_l_AllocationsIndex}:=$_l_AllocationsIndex  //sorts with the list box
STK_al_2DIndex{$_l_AllocationsIndex}:=$_l_AllocationsIndex  //stays with the order of the 2D arrays
$_r_TotalCost:=0
$_t_AllocationLayer:=""
$_t_AllocationAnalysis:=""
For ($_l_CurrentStockIndex;1;Size of array(STK_al_CurrentStockRecordID{$_l_AllocationsIndex}))
If ($_l_CurrentStockIndex=1)
$_t_LayerTest:=STK_at_CurrentStockLayerCode{$_l_AllocationsIndex}{$_l_CurrentStockIndex}
$_t_AllocationLayer:=STK_at_CurrentStockLayerCode{$_l_AllocationsIndex}{$_l_CurrentStockIndex}
$_t_AllocationAnalysis:=STK_at_CurrentStockAnalCode{$_l_AllocationsIndex}{$_l_CurrentStockIndex}
End if 
If ($_t_LayerTest#STK_at_CurrentStockLayerCode{$_l_AllocationsIndex}{$_l_CurrentStockIndex})
$_bo_LayersInUse:=True
$_t_AllocationLayer:=""
End if 
If ($_t_AllocationAnalysis#STK_at_CurrentStockAnalCode{$_l_AllocationsIndex}{$_l_CurrentStockIndex})
$_t_AllocationAnalysis:=""
End if 
$_r_TotalCost:=$_r_TotalCost+STK_ar_DisCostValues{$_l_AllocationsIndex}{$_l_CurrentStockIndex}

End for 
If ($_t_AllocationLayer#"")
STK_at_DisLayerCode{$_l_AllocationsIndex}:=$_t_AllocationLayer
STK_apic_DisExpandLayer{$_l_AllocationsIndex}:=$_pic_BlankPicture
End if 
If ($_t_AllocationAnalysis#"")
STK_at_DisAnalCodes{$_l_AllocationsIndex}:=$_t_AllocationAnalysis
STK_apic_DisExpandAnal{$_l_AllocationsIndex}:=$_pic_BlankPicture
End if 
$_r_UnitCost:=$_r_TotalCost/(STK_ar_DisStockQuantities{$_l_AllocationsIndex})
$_r_UnitCost:=Gen_Round ($_r_UnitCost;3;1)
STK_ar_DisCostPrices{$_l_AllocationsIndex}:=$_r_UnitCost

If (STK_at_DisSerialNumbers{$_l_AllocationsIndex}#"")
$_bo_SerialNumbers:=True
End if 

If (Size of array(STK_al_CurrentStockRecordID{$_l_AllocationsIndex})=1)  //there is only one current stock record
$_bo_ExpandLayers:=False
$_bo_ExpandAnalysis:=False
$_bo_ExpandLocations:=False
$_bo_ExpandPrices:=False
$_l_ExpandRow:=Find in array(STK_al_ExpandedIndex;STK_al_CurrentStockRecordID{$_l_AllocationsIndex}{1})
If ($_l_ExpandRow>0)
Case of 
: (STK_al_ExpandedLevel{$_l_ExpandRow}=1)
$_bo_ExpandPrices:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=2)
$_bo_ExpandLocations:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=3)
$_bo_ExpandLocations:=True
$_bo_ExpandPrices:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=4)
$_bo_ExpandAnalysis:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=5)
$_bo_ExpandAnalysis:=True
$_bo_ExpandPrices:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=6)
$_bo_ExpandAnalysis:=True
$_bo_ExpandLocations:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=7)
$_bo_ExpandAnalysis:=True
$_bo_ExpandLocations:=True
$_bo_ExpandPrices:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=8)
$_bo_ExpandLayers:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=9)
$_bo_ExpandLayers:=True
$_bo_ExpandPrices:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=10)
$_bo_ExpandLayers:=True
$_bo_ExpandLocations:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=11)
$_bo_ExpandLayers:=True
$_bo_ExpandLocations:=True
$_bo_ExpandPrices:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=12)
$_bo_ExpandLayers:=True
$_bo_ExpandAnalysis:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=13)
$_bo_ExpandLayers:=True
$_bo_ExpandAnalysis:=True
$_bo_ExpandPrices:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=14)
$_bo_ExpandLayers:=True
$_bo_ExpandAnalysis:=True
$_bo_ExpandLocations:=True
: (STK_al_ExpandedLevel{$_l_ExpandRow}=15)
$_bo_ExpandLayers:=True
$_bo_ExpandAnalysis:=True
$_bo_ExpandLocations:=True
$_bo_ExpandPrices:=True
End case 
End if 
If (Not($_bo_ExpandPrices))
STK_apic_DisExpandPrices{$_l_AllocationsIndex}:=$_pic_BlankPicture
Else 
If (STK_al_RootPriceID{$_l_ExpandRow}=STK_al_ExpandedIndex{$_l_ExpandRow})
STK_apic_DisExpandPrices{$_l_AllocationsIndex}:=$_pic_ExpandPicture  //only show the expansion on the first row
Else 
STK_apic_DisExpandPrices{$_l_AllocationsIndex}:=$_pic_BlankPicture
End if 
End if 
If (Not($_bo_ExpandLayers))
STK_apic_DisExpandLayer{$_l_AllocationsIndex}:=$_pic_BlankPicture
Else 
If (STK_al_RootLayerID{$_l_ExpandRow}=STK_al_ExpandedIndex{$_l_ExpandRow})
STK_apic_DisExpandLayer{$_l_AllocationsIndex}:=$_pic_ExpandPicture  //only show the expansion on the first row
Else 
STK_apic_DisExpandLayer{$_l_AllocationsIndex}:=$_pic_BlankPicture
End if 
End if 
If (Not($_bo_ExpandAnalysis))
STK_apic_DisExpandAnal{$_l_AllocationsIndex}:=$_pic_BlankPicture
Else 
If (STK_al_RootAnalID{$_l_ExpandRow}=STK_al_ExpandedIndex{$_l_ExpandRow})
STK_apic_DisExpandAnal{$_l_AllocationsIndex}:=$_pic_ExpandPicture  //only show the expansion on the first row
Else 
STK_apic_DisExpandAnal{$_l_AllocationsIndex}:=$_pic_BlankPicture
End if 
End if 
End if 
End for 
STK_bo_SerialNos:=$_bo_SerialNumbers
STK_bo_Layersinuse:=$_bo_LayersInUse
*/
ERR_MethodTrackerReturn("STK_allocationWindowLoad"; $_t_oldMethodName)
