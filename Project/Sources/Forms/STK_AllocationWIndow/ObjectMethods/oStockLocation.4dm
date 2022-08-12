If (False:C215)
	//object Name: Object Name:      STK_AllocationWIndow.oStockLocation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/01/2012 17:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORDI_al_AllocStockRecordIDS;0;0)
	//ARRAY LONGINT(ORDI_al_AllocStockRecordIDSMAS;0)
	//ARRAY LONGINT(STK_al_LineIndex;0)
	//ARRAY LONGINT(STK_al_LineIndexMAS;0)
	//ARRAY REAL(ORDI_ar_AllocResidualStockQty;0)
	//ARRAY REAL(ORDI_ar_AllocResStockQtyMAS;0)
	//ARRAY REAL(ORDI_ar_AllocStockPrice;0)
	//ARRAY REAL(ORDI_ar_AllocStockPriceMAS;0)
	//ARRAY REAL(ORDI_ar_AllocStockQty;0)
	//ARRAY REAL(ORDI_ar_AllocStockQtyMAS;0)
	//ARRAY TEXT(ORD_at_AllocSerialNo;0)
	//ARRAY TEXT(ORD_at_AllocSerialNoMAS;0)
	//ARRAY TEXT(ORDI_AT_AllocCURRENCY;0)
	//ARRAY TEXT(ORDI_AT_AllocCURRENCYMAS;0)
	//ARRAY TEXT(ORDI_At_AllocLocationCodes;0)
	//ARRAY TEXT(ORDI_At_AllocLocationCodesMAS;0)
	//ARRAY TEXT(ORDI_at_AllocProductCodes;0)
	//ARRAY TEXT(ORDI_at_AllocProductCodesMAS;0)
	//ARRAY TEXT(ORDI_at_AlocStockTypes;0)
	//ARRAY TEXT(ORDI_at_AlocStockTypesMAS;0)
	//ARRAY TEXT(STK_at_DisProductNames;0)
	//ARRAY TEXT(STK_at_DisProductNamesMAS;0)
	//ARRAY TEXT(STK_at_DisStockTypeNames;0)
	//ARRAY TEXT(STK_at_DisStockTypeNamesMAS;0)
	//ARRAY TEXT(STK_at_LocationCodes;0)
	//ARRAY TEXT(STK_at_LocationNames;0)
	C_LONGINT:C283($_l_event; $_l_Index; $_l_Index2; $_l_SizeofArray)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ STK_AllocationWIndow.oStockLocation"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (STK_at_LocationNames>0)
			//First revert to the 'master copy' of the arrays for the current page then filter down to the ones at this location.
			COPY ARRAY:C226(ORDI_at_AlocStockTypesMAS; ORDI_at_AlocStockTypes)
			COPY ARRAY:C226(STK_at_DisStockTypeNamesMAS; STK_at_DisStockTypeNames)
			COPY ARRAY:C226(ORDI_at_AllocProductCodesMAS; ORDI_at_AllocProductCodes)
			COPY ARRAY:C226(STK_at_DisProductNamesMAS; STK_at_DisProductNames)
			COPY ARRAY:C226(ORDI_ar_AllocStockQtyMAS; ORDI_ar_AllocStockQty)
			COPY ARRAY:C226(ORDI_AT_AllocCURRENCYMAS; ORDI_AT_AllocCURRENCY)
			COPY ARRAY:C226(ORDI_ar_AllocStockPriceMAS; ORDI_ar_AllocStockPrice)
			COPY ARRAY:C226(ORD_at_AllocSerialNoMAS; ORD_at_AllocSerialNo)
			COPY ARRAY:C226(ORDI_At_AllocLocationCodesMAS; ORDI_At_AllocLocationCodes)
			COPY ARRAY:C226(ORDI_ar_AllocResStockQtyMAS; ORDI_ar_AllocResidualStockQty)
			COPY ARRAY:C226(STK_al_LineIndexMAS; STK_al_LineIndex)
			
			ARRAY LONGINT:C221(ORDI_al_AllocStockRecordIDS; 0; 0)
			$_l_SizeofArray:=Size of array:C274(ORDI_al_AllocStockRecordIDSMAS)
			ARRAY LONGINT:C221(ORDI_al_AllocStockRecordIDS; $_l_SizeofArray; 0)
			For ($_l_Index; 1; $_l_SizeofArray)
				For ($_l_Index2; 1; Size of array:C274(ORDI_al_AllocStockRecordIDSMAS{$_l_Index}))
					APPEND TO ARRAY:C911(ORDI_al_AllocStockRecordIDS{$_l_Index}; ORDI_al_AllocStockRecordIDSMAS{$_l_Index}{$_l_Index2})
				End for 
			End for 
			
			For ($_l_Index; Size of array:C274(ORDI_At_AllocLocationCodes); 1; -1)
				If (ORDI_At_AllocLocationCodes{$_l_Index}#STK_at_LocationCodes{STK_at_LocationNames})
					DELETE FROM ARRAY:C228(ORDI_at_AlocStockTypes; $_l_Index)
					DELETE FROM ARRAY:C228(STK_at_DisStockTypeNames; $_l_Index)
					DELETE FROM ARRAY:C228(ORDI_at_AllocProductCodes; $_l_Index)
					DELETE FROM ARRAY:C228(STK_at_DisProductNames; $_l_Index)
					DELETE FROM ARRAY:C228(ORDI_ar_AllocStockQty; $_l_Index)
					DELETE FROM ARRAY:C228(ORDI_AT_AllocCURRENCY; $_l_Index)
					DELETE FROM ARRAY:C228(ORDI_ar_AllocStockPrice; $_l_Index)
					DELETE FROM ARRAY:C228(ORD_at_AllocSerialNo; $_l_Index)
					DELETE FROM ARRAY:C228(ORDI_At_AllocLocationCodes; $_l_Index)
					DELETE FROM ARRAY:C228(STK_al_LineIndex; $_l_Index)
					//no need to delete from the 2D array
				End if 
			End for 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ STK_AllocationWIndow.oStockLocation"; $_t_oldMethodName)
