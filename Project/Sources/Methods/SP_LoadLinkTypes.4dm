//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_LoadLinkTypes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 20:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(QV_al_TableRestrictionIDs;0)
	//ARRAY LONGINT(SP_al_aSalesProjProps;0;0)
	//ARRAY LONGINT(SP_al_LinkedTable;0)
	//ARRAY LONGINT(SP_al_ListPipelineStatus;0)
	//ARRAY LONGINT(SP_al_RealTableNums;0)
	//ARRAY LONGINT(SP_al_SalesProjectionTYPEID;0)
	//ARRAY TEXT(QV_at_TableRestrictionNMs;0)
	//ARRAY TEXT(SP_at_aSalesProjProps;0;0)
	//ARRAY TEXT(SP_at_aSalesProjPropsNM;0;0)
	//ARRAY TEXT(SP_at_ListPipelineStatus;0)
	//ARRAY TEXT(SP_at_RealTableNames;0)
	//ARRAY TEXT(SP_at_SalesProjectionPROPS;0)
	//ARRAY TEXT(SP_at_SalesProjectionTYPE;0)
	C_BOOLEAN:C305($_bo_OK; $1)
	C_LONGINT:C283($_l_FieldNumber; $_l_Index; $_l_ItemID; $_l_ListID; $_l_ListItemID; $_l_PipelineStatusRow; $_l_ProjectionTypeRow; $_l_RestrictionListID; $_l_RestrictionRow; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; SP_t_SalesOrderNUM; SP_t_SalesOrderTitle; SP_t_SalesProjectionState; SP_t_SalesProjectionType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_LoadLinkTypes")
$_l_RestrictionListID:=AA_GetListbyName("Table Restriction"; True:C214)
ARRAY LONGINT:C221(QV_al_TableRestrictionIDs; 0)
ARRAY TEXT:C222(QV_at_TableRestrictionNMs; 0)
AA_LoadListbyID($_l_RestrictionListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)



//```````

ARRAY TEXT:C222(SP_at_SalesProjectionTYPE; 0)
ARRAY LONGINT:C221(SP_al_SalesProjectionTYPEID; 0)
$_l_TableNumber:=Table:C252(->[SALES_PROJECTION:113]Class_ID:2)
$_l_FieldNumber:=Field:C253(->[SALES_PROJECTION:113]Class_ID:2)
$_l_ListID:=AA_GetListID($_l_TableNumber; $_l_FieldNumber; "Sales Projection Types")
AA_LoadListbyID($_l_ListID; ->SP_at_SalesProjectionTYPE; ->SP_al_SalesProjectionTYPEID)
//15/17=sales
//12=agency
//10=events
//19=ad booking

If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>1)
	$_l_ProjectionTypeRow:=Find in array:C230(SP_at_SalesProjectionTYPE; "Sales Orders")
	If ($_l_ProjectionTypeRow<0)
		$_l_ItemID:=AA_ListAddItembyID($_l_ListID; "Sales Orders")
		$_l_RestrictionRow:=Find in array:C230(QV_at_TableRestrictionNMs; Table name:C256(Table:C252(->[ORDERS:24])))
		If ($_l_RestrictionRow<0)
			$_l_ListItemID:=AA_ListAddItembyID($_l_RestrictionListID; Table name:C256(Table:C252(->[ORDERS:24])))
		Else 
			$_l_ListItemID:=QV_al_TableRestrictionIDs{$_l_RestrictionRow}
		End if 
		//now we need to store that
		AA_ListItemAddProperty($_l_ItemID; $_l_RestrictionListID; $_l_ListItemID; "Table Restriction")
		AA_LoadListbyID($_l_ListID; ->SP_at_SalesProjectionTYPE; ->SP_al_SalesProjectionTYPEID)
		
		
	End if 
End if 

If ((DB_GetModuleSettingByNUM(19))>1)
	$_l_ProjectionTypeRow:=Find in array:C230(SP_at_SalesProjectionTYPE; "Ad Booking")
	If ($_l_ProjectionTypeRow<0)
		$_l_ItemID:=AA_ListAddItembyID($_l_ListID; "Ad Booking")
		$_l_RestrictionRow:=Find in array:C230(QV_at_TableRestrictionNMs; Table name:C256(Table:C252(->[ORDERS:24])))
		If ($_l_RestrictionRow<0)
			$_l_ListItemID:=AA_ListAddItembyID($_l_RestrictionListID; Table name:C256(Table:C252(->[ORDERS:24])))
		Else 
			$_l_ListItemID:=QV_al_TableRestrictionIDs{$_l_RestrictionRow}
		End if 
		//now we need to store that
		AA_ListItemAddProperty($_l_ItemID; $_l_RestrictionListID; $_l_ListItemID; "Table Restriction")
		AA_LoadListbyID($_l_ListID; ->SP_at_SalesProjectionTYPE; ->SP_al_SalesProjectionTYPEID)
	End if 
End if 

ARRAY TEXT:C222(SP_at_SalesProjectionPROPS; 0)
ARRAY TEXT:C222(SP_at_aSalesProjProps; 0; 0)
ARRAY LONGINT:C221(SP_al_aSalesProjProps; 0; 0)
ARRAY TEXT:C222(SP_at_aSalesProjPropsNM; 0; 0)
AA_LoadListbyID($_l_ListID; ->SP_at_SalesProjectionTYPE; ->SP_al_SalesProjectionTYPEID; False:C215; ->SP_at_SalesProjectionPROPS; ->SP_at_aSalesProjProps; ->SP_al_aSalesProjProps; ->SP_at_aSalesProjPropsNM)
ARRAY LONGINT:C221(SP_al_LinkedTable; Size of array:C274(SP_at_SalesProjectionTYPE))
ARRAY LONGINT:C221(SP_al_LinkedTable; Size of array:C274(SP_at_SalesProjectionTYPE))
For ($_l_Index; 1; Size of array:C274(SP_at_aSalesProjProps))
	$_l_RestrictionRow:=Find in array:C230(SP_at_aSalesProjProps{$_l_Index}; "Table Restriction")
	If ($_l_RestrictionRow>0)
		SP_al_LinkedTable{$_l_Index}:=SP_al_aSalesProjProps{$_l_Index}{$_l_RestrictionRow}
	End if 
End for 
//now take out this any modules the user does not have access to
If ((DB_GetModuleSettingByNUM(Module_SalesOrders))<2)
	$_l_ProjectionTypeRow:=Find in array:C230(SP_at_SalesProjectionTYPE; "Sales Orders")
	If ($_l_ProjectionTypeRow>0)
		DELETE FROM ARRAY:C228(SP_at_SalesProjectionTYPE; $_l_ProjectionTypeRow; 1)
		DELETE FROM ARRAY:C228(SP_al_SalesProjectionTYPEID; $_l_ProjectionTypeRow; 1)
		DELETE FROM ARRAY:C228(SP_at_SalesProjectionPROPS; $_l_ProjectionTypeRow; 1)
		DELETE FROM ARRAY:C228(SP_al_LinkedTable; $_l_ProjectionTypeRow; 1)
	End if 
End if 
If ((DB_GetModuleSettingByNUM(Module_SalesOrders))<2)
	$_l_ProjectionTypeRow:=Find in array:C230(SP_at_SalesProjectionTYPE; "Sales Projection Types")
	If ($_l_ProjectionTypeRow>0)
		DELETE FROM ARRAY:C228(SP_at_SalesProjectionTYPE; $_l_ProjectionTypeRow; 1)
		DELETE FROM ARRAY:C228(SP_al_SalesProjectionTYPEID; $_l_ProjectionTypeRow; 1)
		DELETE FROM ARRAY:C228(SP_at_SalesProjectionPROPS; $_l_ProjectionTypeRow; 1)
		DELETE FROM ARRAY:C228(SP_al_LinkedTable; $_l_ProjectionTypeRow; 1)
	End if 
End if 
If (Count parameters:C259>0)
	$_bo_OK:=$1
Else 
	$_bo_OK:=True:C214
End if 
If ($_bo_OK)
	If (Size of array:C274(SP_at_SalesProjectionTYPE)=1)
		//no point in displaying it then!
		SP_at_SalesProjectionTYPE:=1
		SP_LoadTableNames
		[SALES_PROJECTION:113]RelatedSaleTableID:8:=SP_al_RealTableNums{Find in array:C230(SP_at_RealTableNames; QV_at_TableRestrictionNMs{Find in array:C230(QV_al_TableRestrictionIDs; SP_al_LinkedTable{SP_at_SalesProjectionTYPE})})}
		[SALES_PROJECTION:113]Class_ID:2:=SP_al_SalesProjectionTYPEID{SP_at_SalesProjectionTYPE}
		If ([SALES_PROJECTION:113]RelatedSaleTableID:8>0)
			OBJECT SET VISIBLE:C603(SP_t_SalesProjectionType; False:C215)
			OBJECT SET VISIBLE:C603(SP_t_SalesOrderNUM; True:C214)
			OBJECT SET VISIBLE:C603(*; "Text_ProjectionType"; False:C215)
			OBJECT SET VISIBLE:C603(SP_t_SalesOrderTitle; True:C214)
			OBJECT SET ENTERABLE:C238(SP_t_SalesOrderNUM; True:C214)
			SP_t_SalesOrderTitle:="Related "+SP_at_SalesProjectionTYPE{Find in array:C230(SP_al_SalesProjectionTYPEID; [SALES_PROJECTION:113]Class_ID:2)}
			If ([SALES_PROJECTION:113]RelatedSaleRecordID:9>0)
				SP_LoadRelated(->[SALES_PROJECTION:113]RelatedSaleTableID:8; ->[SALES_PROJECTION:113]RelatedSaleRecordID:9; ->SP_t_SalesOrderNUM)
				SP_GetOtherrelated(->[SALES_PROJECTION:113]RelatedSaleTableID:8; ->[SALES_PROJECTION:113]RelatedSaleRecordID:9; ->[SALES_PROJECTION:113]CurrencyID:12; ->[SALES_PROJECTION:113]CompanyID:6; ->[SALES_PROJECTION:113]ContactID:7)
				[SALES_PROJECTION:113]Status:20:=SP_GetSalesOrderState([SALES_PROJECTION:113]RelatedSaleTableID:8; SP_t_SalesOrderNUM; [SALES_PROJECTION:113]Status:20)
				If ([SALES_PROJECTION:113]Status:20>0)
					$_l_PipelineStatusRow:=Find in array:C230(SP_al_ListPipelineStatus; [SALES_PROJECTION:113]Status:20)
					If ($_l_PipelineStatusRow>0)
						SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{1}
					End if 
				End if 
				If ([SALES_PROJECTION:113]GrossValue:13=0)
					[SALES_PROJECTION:113]GrossValue:13:=SP_GetSalesOrderValue([SALES_PROJECTION:113]RelatedSaleTableID:8; SP_t_SalesOrderNUM; ->[SALES_PROJECTION:113]ConvertedSaleValue:19; ->[SALES_PROJECTION:113]Probability:17; ->[SALES_PROJECTION:113]Expected_date:16; ->[SALES_PROJECTION:113]ConvertedSaleCosts:28)
					
				End if 
				[SALES_PROJECTION:113]Expected_date:16:=SP_GetSalesOrderDate([SALES_PROJECTION:113]RelatedSaleTableID:8; SP_t_SalesOrderNUM; [SALES_PROJECTION:113]ConvertedSaleValue:19)
			Else 
				//do something here???
				
				//make the fields visible etc
			End if 
		End if 
		
		
		
	End if 
End if 
ERR_MethodTrackerReturn("SP_LoadLinkTypes"; $_t_oldMethodName)