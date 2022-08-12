If (False:C215)
	//object Name: [SALES_PROJECTION]SalesProjectionEntry.Variable24
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:42
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY LONGINT(QV_al_TableRestrictionIDs;0)
	//ARRAY LONGINT(SP_al_LinkedTable;0)
	//ARRAY LONGINT(SP_al_ListPipelineStatus;0)
	//ARRAY LONGINT(SP_al_RealTableNums;0)
	//ARRAY LONGINT(SP_al_SalesProjectionTYPEID;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(QV_at_TableRestrictionNMs;0)
	//ARRAY TEXT(SP_at_ListPipelineStatus;0)
	//ARRAY TEXT(SP_at_RealTableNames;0)
	//ARRAY TEXT(SP_at_SalesProjectionTYPE;0)
	C_BOOLEAN:C305($_bo_Stop; GEN_Bo_ShowCreate)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_FieldNumber; $_l_Index; $_l_ItemID; $_l_ListID; $_l_OK; $_l_ProjectionTypeRow; $_l_RestrictionListID; $_l_RestrictionRow; $_l_SalesProjectionTable; $_l_SelectedRow)
	C_LONGINT:C283($_l_SIzeofArray; $_l_StatusRow; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; SP_t_SalesCurrency; SP_t_SalesOrderNUM; SP_t_SalesOrderTitle; SP_t_SalesProjectionCompany; SP_t_SalesProjectionContact; SP_t_SalesProjectionState; SP_t_SalesProjectionType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].SalesProjectionEntry.Variable24"; Form event code:C388)
$_bo_Stop:=False:C215

If (SP_at_SalesProjectionTYPE>0)
	$_l_SelectedRow:=SP_at_SalesProjectionTYPE
	SP_LoadTableNames
	If (SP_al_LinkedTable{SP_at_SalesProjectionTYPE}=0)
		$_l_RestrictionListID:=AA_GetListbyName("Table Restriction"; True:C214)
		ARRAY LONGINT:C221(QV_al_TableRestrictionIDs; 0)
		ARRAY TEXT:C222(QV_at_TableRestrictionNMs; 0)
		AA_LoadListbyID($_l_RestrictionListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
		
		Gen_Alert("The Table for this type of sale is unknown. Please set it now")
		$_l_SIzeofArray:=Size of array:C274(SP_at_RealTableNames)
		ARRAY TEXT:C222(GEN_at_DropDownMenu; $_l_SIzeofArray)
		ARRAY LONGINT:C221(GEN_al_DropDownMenuID; $_l_SIzeofArray)
		For ($_l_Index; 1; $_l_SIzeofArray)
			GEN_at_DropDownMenu{$_l_Index}:=SP_at_RealTableNames{$_l_Index}
			GEN_al_DropDownMenuID{$_l_Index}:=SP_al_RealTableNums{$_l_Index}
		End for 
		Repeat 
			IDLE:C311
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1986)
			GEN_Bo_ShowCreate:=False:C215
			DIALOG:C40([USER:15]; "Gen_PopUpChoice")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			If (GEN_at_DropDownMenu>0)  //17
				$_l_OK:=1
			Else 
				$_l_OK:=0
				Gen_Confirm("Sorry You cannot continue without selecting the table. Do you wish to stop?"; "Try Again"; "Stop")
				If (OK=1)
					$_bo_Stop:=True:C214
				End if 
			End if 
			DelayTicks(10)
		Until ($_bo_Stop) | (GEN_at_DropDownMenu>0)
		
		If (GEN_at_DropDownMenu>0)
			//Put this onto the list item
			$_l_ItemID:=SP_al_SalesProjectionTYPEID{SP_at_SalesProjectionTYPE}
			$_l_RestrictionRow:=Find in array:C230(QV_at_TableRestrictionNMs; GEN_at_DropDownMenu{GEN_at_DropDownMenu})
			If ($_l_RestrictionRow<0)
				$_l_ItemID:=AA_ListAddItembyID($_l_RestrictionListID; GEN_at_DropDownMenu{GEN_at_DropDownMenu})
			Else 
				$_l_ItemID:=QV_al_TableRestrictionIDs{$_l_RestrictionRow}
			End if 
			//now we need to store that
			AA_ListItemAddProperty($_l_ItemID; $_l_RestrictionListID; $_l_ItemID; "Table Restriction")
			$_l_SalesProjectionTable:=Table:C252(->[SALES_PROJECTION:113]Class_ID:2)
			$_l_FieldNumber:=Field:C253(->[SALES_PROJECTION:113]Class_ID:2)
			$_l_ListID:=AA_GetListID($_l_SalesProjectionTable; $_l_FieldNumber; "Sales Projection Types")
			SP_LoadLinkTypes
			SP_at_SalesProjectionTYPE:=$_l_SelectedRow
			
		End if 
		
	End if 
	If (Not:C34($_bo_Stop))
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
				//now the screen values can be set
				SP_t_SalesProjectionCompany:=SP_LoadCompany([SALES_PROJECTION:113]CompanyID:6)
				SP_t_SalesProjectionContact:=SP_loadContact([SALES_PROJECTION:113]ContactID:7)
				SP_t_SalesCurrency:=SP_LoadCurrencyName([SALES_PROJECTION:113]CurrencyID:12)
				[SALES_PROJECTION:113]Class_ID:2:=SP_GetSaleType([SALES_PROJECTION:113]RelatedSaleTableID:8; [SALES_PROJECTION:113]RelatedSaleRecordID:9)
				If ([SALES_PROJECTION:113]Class_ID:2>0)
					$_l_ProjectionTypeRow:=Find in array:C230(SP_al_SalesProjectionTYPEID; [SALES_PROJECTION:113]Class_ID:2)
					If ($_l_ProjectionTypeRow>0)
						SP_t_SalesProjectionType:=SP_at_SalesProjectionTYPE{$_l_ProjectionTypeRow}
					End if 
				End if 
				[SALES_PROJECTION:113]Status:20:=SP_GetSalesOrderState([SALES_PROJECTION:113]RelatedSaleTableID:8; SP_t_SalesOrderNUM; [SALES_PROJECTION:113]Status:20)
				If ([SALES_PROJECTION:113]Status:20>0)
					$_l_StatusRow:=Find in array:C230(SP_al_ListPipelineStatus; [SALES_PROJECTION:113]Status:20)
					If ($_l_StatusRow>0)
						SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{1}
					End if 
				End if 
				If ([SALES_PROJECTION:113]GrossValue:13=0)
					[SALES_PROJECTION:113]GrossValue:13:=SP_GetSalesOrderValue([SALES_PROJECTION:113]RelatedSaleTableID:8; SP_t_SalesOrderNUM; ->[SALES_PROJECTION:113]ConvertedSaleValue:19; ->[SALES_PROJECTION:113]Probability:17; ->[SALES_PROJECTION:113]Expected_date:16)
					If ([SALES_PROJECTION:113]ConvertedSaleValue:19>0)
						OBJECT SET VISIBLE:C603([SALES_PROJECTION:113]ConvertedSaleValue:19; True:C214)
						OBJECT SET VISIBLE:C603(*; "Text_actual"; True:C214)
					Else 
						OBJECT SET ENTERABLE:C238([SALES_PROJECTION:113]ConvertedSaleValue:19; False:C215)
					End if 
					
				End if 
				
				[SALES_PROJECTION:113]Expected_date:16:=SP_GetSalesOrderDate([SALES_PROJECTION:113]RelatedSaleTableID:8; SP_t_SalesOrderNUM; [SALES_PROJECTION:113]ConvertedSaleValue:19)
			Else 
				//do something here???
				
				//make the fields visible etc
			End if 
		End if 
	End if 
	
	
	//````
End if 
ERR_MethodTrackerReturn("OBJ:SalesProjectionEntry,SP_at_SalesProjectionTYPE"; $_t_oldMethodName)
