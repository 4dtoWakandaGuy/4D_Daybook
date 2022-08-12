//%attributes = {}

If (False:C215)
	//Database Method Name:      TREND_Sql_Builder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/09/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_SetSQLLOgin; $_bo_SetSQLSOurce)
	C_POINTER:C301($_Ptr_ColumnCounter; $_ptr_ColumnTypes; $_Ptr_SQL_PW; $_ptr_SQLDSN; $_Ptr_SQLSOurce; $_Ptr_SQLUser; $2; $3; $4; $5; $6)
	C_POINTER:C301($7)
	C_TEXT:C284($_t_oldMethodName; $_t_ScriptCode; $_t_SQL_Collection; $_t_SQLSOurce; $_t_SQLSOurcesjp; $_t_SQLStatement; $0; $1)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("TREND_Sql_Builder")

$0:=$_t_SQLStatement

If (Count parameters:C259>=2)
	$_t_SQL_Collection:=$1
	$_Ptr_ColumnCounter:=$2
	If (Count parameters:C259>=3)
		$_Ptr_SQLSOurce:=$3
		$_bo_SetSQLSOurce:=True:C214
		If (Count parameters:C259>=6)
			$_ptr_SQLDSN:=$4
			$_Ptr_SQLUser:=$5
			$_Ptr_SQL_PW:=$6
			$_bo_SetSQLLOgin:=True:C214
		End if 
		If (Count parameters:C259>=7)
			$_ptr_ColumnTypes:=$7
		End if 
	End if 
	$_t_SQLStatement:=""
	
	Case of 
		: ($_t_SQL_Collection="GetSalesregions")
			$_Ptr_COlumnCounter->:=4
			
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="SELECT "
			$_t_SQLStatement:=$_t_SQLStatement+"RTRIM(customer) as customer,"
			$_t_SQLStatement:=$_t_SQLStatement+"RTRIM(territory) as territory, "
			$_t_SQLStatement:=$_t_SQLStatement+"RTRIM(region) as region "
			$_t_SQLStatement:=$_t_SQLStatement+"FROM scheme.slcustm with (nolock)"
			$0:=$_t_SQLStatement
			
		: ($_t_SQL_Collection="GetSalesByRSM")
			$_Ptr_COlumnCounter->:=2
			
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="select "
			$_t_SQLStatement:=$_t_SQLStatement+"territory,"
			//g(nett_value) AS 'Order Value' from scheme.opheadm where status between '1' and '6'
			//$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(255),SUM(nett_value) AS 'Order Value')"
			$_t_SQLStatement:=$_t_SQLStatement+"SUM(nett_value) AS 'Order Value'"
			
			$_t_SQLStatement:=$_t_SQLStatement+" from scheme.opheadm with (nolock)"
			
			$_t_SQLStatement:=$_t_SQLStatement+" where status between '1' and '6'"
			$_t_SQLStatement:=$_t_SQLStatement+" group by territory"
			
			
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="GetStockEM")
			$_Ptr_COlumnCounter->:=4
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="select "
			$_t_SQLStatement:=$_t_SQLStatement+"warehouse,"
			$_t_SQLStatement:=$_t_SQLStatement+"RTRIM(product) as product,"
			$_t_SQLStatement:=$_t_SQLStatement+"RTRIM(commodity) as commodity,"
			$_t_SQLStatement:=$_t_SQLStatement+"RTRIM(country_orig) as country_orig"
			$_t_SQLStatement:=$_t_SQLStatement+" from scheme.stockem with (nolock)"
			
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="GetProductDescription")
			$_Ptr_COlumnCounter->:=3
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="select "
			$_t_SQLStatement:=$_t_SQLStatement+"warehouse,"
			$_t_SQLStatement:=$_t_SQLStatement+"product,"
			//$_t_SQLStatement:=$_t_SQLStatement+"REPLACE(long_description,'=',' ')"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(255),long_description)"
			//$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),date_required,103) as [DD/MM/YYYY] "
			
			$_t_SQLStatement:=$_t_SQLStatement+" from scheme.stockm with (nolock)"
			
			$_t_SQLStatement:=$_t_SQLStatement+" where warehouse like 'TOPSWH_REFERENCE'"
			
			$_t_SQLStatement:=$_t_SQLStatement+" and product ='TOPSPRD_REFERENCE'"
			$0:=$_t_SQLStatement
			
		: ($_t_SQL_Collection="GetAllProducts")
			$_Ptr_COlumnCounter->:=42
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="select "
			$_t_SQLStatement:=$_t_SQLStatement+"despatch_units,"  //aS_dodW
			$_t_SQLStatement:=$_t_SQLStatement+"warehouse,"  //aS_dodA
			$_t_SQLStatement:=$_t_SQLStatement+"product,"  //aS_dodB
			$_t_SQLStatement:=$_t_SQLStatement+"long_description,"  //aS_dodC
			
			$_t_SQLStatement:=$_t_SQLStatement+"analysis_a,"  //aS_dodD
			$_t_SQLStatement:=$_t_SQLStatement+"description,"  //aS_dodE
			
			$_t_SQLStatement:=$_t_SQLStatement+"Cast(price as varchar),"  //aR_dodF
			
			$_t_SQLStatement:=$_t_SQLStatement+"discount,"  //aS_dodG
			
			$_t_SQLStatement:=$_t_SQLStatement+"unit_height,"  //aS_dodH
			
			$_t_SQLStatement:=$_t_SQLStatement+"stock_vat_type,"  //aS_dodI;
			
			$_t_SQLStatement:=$_t_SQLStatement+"drawing_number,"  // /;aS_dodJ
			
			$_t_SQLStatement:=$_t_SQLStatement+"unit_length,"  //  //aS_dodAR;aR_dodL;aR_dodM;aS_dodMN;aS_dodP;aS_dodQ;aI_dodPH;aI_dodAL;aI_dodBO;aR_dodS;aR_dodSS;aBuf;aLead;aShelf;aMOQ;aMB;aR_dodX;aS_dodY;aR_dodAF;aR_dodAG;aR_dodAH;aR_dodAI;aR_dodAJ;aR_dodAK;aR_dodAL;aR_dodAM;aR_dodAN;aR_dodAO;aR_dodAP;aR_dodAQ;aSub3;PRD_at_AbcCat)
			
			$_t_SQLStatement:=$_t_SQLStatement+"Cast(average_sales_valu as varchar),"  //aS_dodAR
			
			$_t_SQLStatement:=$_t_SQLStatement+"Cast(weight,"  //aR_dodL
			
			$_t_SQLStatement:=$_t_SQLStatement+"catalogue_number,"  //aaR_dodM
			
			$_t_SQLStatement:=$_t_SQLStatement+"analysis_b,"  //aS_dodMN
			
			$_t_SQLStatement:=$_t_SQLStatement+"analysis_c,"  //aS_dodP
			
			$_t_SQLStatement:=$_t_SQLStatement+"physical_qty,"  //aS_dodQ
			
			$_t_SQLStatement:=$_t_SQLStatement+"allocated_qty,"  //aI_dodPH
			
			$_t_SQLStatement:=$_t_SQLStatement+"back_order_qty,"  //aI_dodAL
			
			$_t_SQLStatement:=$_t_SQLStatement+"current_cost,"  //-->aR_dodS
			$_t_SQLStatement:=$_t_SQLStatement+"standard_cost,"  //-->aR_dodSS
			$_t_SQLStatement:=$_t_SQLStatement+"min_stock_level,"
			$_t_SQLStatement:=$_t_SQLStatement+"lead_time,"
			$_t_SQLStatement:=$_t_SQLStatement+"shelf_life,"
			$_t_SQLStatement:=$_t_SQLStatement+"economic_reorder_q,"
			$_t_SQLStatement:=$_t_SQLStatement+"make_or_buy,"
			$_t_SQLStatement:=$_t_SQLStatement+"on_order_qty,"
			$_t_SQLStatement:=$_t_SQLStatement+"supplier,"
			$_t_SQLStatement:=$_t_SQLStatement+"period_issue_qty01,"
			$_t_SQLStatement:=$_t_SQLStatement+"period_issue_qty02,"
			$_t_SQLStatement:=$_t_SQLStatement+"period_issue_qty03,"
			$_t_SQLStatement:=$_t_SQLStatement+"period_issue_qty04,"
			$_t_SQLStatement:=$_t_SQLStatement+"period_issue_qty05,"
			$_t_SQLStatement:=$_t_SQLStatement+"period_issue_qty06,"
			$_t_SQLStatement:=$_t_SQLStatement+"period_issue_qty07,"
			$_t_SQLStatement:=$_t_SQLStatement+"period_issue_qty08,"  //aR_dodANaR_dodAN
			$_t_SQLStatement:=$_t_SQLStatement+"period_issue_qty09,"  //aR_dodAO
			$_t_SQLStatement:=$_t_SQLStatement+"period_issue_qty10,"  //aR_dodAP
			$_t_SQLStatement:=$_t_SQLStatement+"period_issue_qty11,"  //aR_dodAQ
			$_t_SQLStatement:=$_t_SQLStatement+"period_issue_qty12,"  //aSub3
			$_t_SQLStatement:=$_t_SQLStatement+"alpha"  //PRD_at_AbcCat
			$_t_SQLStatement:=$_t_SQLStatement+" from scheme.stockm with (nolock)"
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="GetServices")
			$_Ptr_COlumnCounter->:=3
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			
			
			$_t_SQLStatement:=" Select product, description, long_description from scheme.opservm with (nolock) where product IS NOT NULL"
			
			$0:=$_t_SQLStatement
			
			
		: ($_t_SQL_Collection="GetCurrentStockOneProduct")
			$_Ptr_COlumnCounter->:=6
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="select "
			$_t_SQLStatement:=$_t_SQLStatement+"warehouse,"
			$_t_SQLStatement:=$_t_SQLStatement+"product,"
			$_t_SQLStatement:=$_t_SQLStatement+"analysis_a,"
			$_t_SQLStatement:=$_t_SQLStatement+"Cast(physical_qty as varchar),"
			$_t_SQLStatement:=$_t_SQLStatement+"Cast(allocated_qty as varchar),"
			$_t_SQLStatement:=$_t_SQLStatement+"Cast(back_order_qty as varchar)"
			$_t_SQLStatement:=$_t_SQLStatement+" from scheme.stockm with (nolock)"
			$_t_SQLStatement:=$_t_SQLStatement+" where warehouse like '**'"
			$_t_SQLStatement:=$_t_SQLStatement+" and product = 'TOPSPRD_REFERENCE'"
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="GetCurrentStock")
			$_Ptr_COlumnCounter->:=6
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="select "
			$_t_SQLStatement:=$_t_SQLStatement+"warehouse,"
			$_t_SQLStatement:=$_t_SQLStatement+"product,"
			$_t_SQLStatement:=$_t_SQLStatement+"analysis_a,"
			$_t_SQLStatement:=$_t_SQLStatement+"Cast(physical_qty as varchar),"
			$_t_SQLStatement:=$_t_SQLStatement+"Cast(allocated_qty as varchar),"
			$_t_SQLStatement:=$_t_SQLStatement+"Cast(back_order_qty as varchar)"
			$_t_SQLStatement:=$_t_SQLStatement+" from scheme.stockm with (nolock)"
			$_t_SQLStatement:=$_t_SQLStatement+" where warehouse like '**'"
			$0:=$_t_SQLStatement
			
		: ($_t_SQL_Collection="GetAssData")
			$_Ptr_COlumnCounter->:=7
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="select "
			$_t_SQLStatement:=$_t_SQLStatement+"assembly_warehouse,"  //------>  aASS_ProdWH
			$_t_SQLStatement:=$_t_SQLStatement+"product_code,"  //------> aASS_ProdPN
			$_t_SQLStatement:=$_t_SQLStatement+"component_whouse,"  //------> aASS_CompWH
			$_t_SQLStatement:=$_t_SQLStatement+"component_code,"  //------> aASS_CompPN
			//$_t_SQLStatement:=$_t_SQLStatement+"usage_quantity,"  //------> aASS_CompQty
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),usage_quantity),"
			$_t_SQLStatement:=$_t_SQLStatement+"description,"  //------> aASS_Desc
			$_t_SQLStatement:=$_t_SQLStatement+"sequence_number"  //------> aASS_SEQT
			$_t_SQLStatement:=$_t_SQLStatement+" from scheme.bmassdm with (nolock)"
			
			$_t_SQLStatement:=$_t_SQLStatement+" where product_code TOPSPRD_NOTLIKE 'IT/%'"  //added for now see also delet selection
			
			
			$0:=$_t_SQLStatement
			
			
		: ($_t_SQL_Collection="GetRequiredDate")
			$_Ptr_COlumnCounter->:=2
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			
			$_t_SQLStatement:="select "
			$_t_SQLStatement:=$_t_SQLStatement+"order_no,"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),date_required,103) as [DD/MM/YYYY] "
			$_t_SQLStatement:=$_t_SQLStatement+"from scheme.opheadm with (nolock)"
			$0:=$_t_SQLStatement
			
		: ($_t_SQL_Collection="GetDNByStatus")
			$_Ptr_COlumnCounter->:=1
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			
			$_t_SQLStatement:="select order_no from opheadm with (nolock) where status = 'TOPSDN_STATUS'"
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="GetConfirmationData")
			$_Ptr_COlumnCounter->:=11
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			
			$_t_SQLStatement:="select product,"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(20),allocated_qty),"
			$_t_SQLStatement:=$_t_SQLStatement+"long_description,"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),order_qty),"
			
			
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),value,list_price),"
			$_t_SQLStatement:=$_t_SQLStatement+"product_group_c,"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),net_price),"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),discount),"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),vat_rate,)"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),vat_amount,)"
			$_t_SQLStatement:=$_t_SQLStatement+"vat_code_new"  //291208
			$_t_SQLStatement:=$_t_SQLStatement+" from order_details with (nolock) where order_no = 'TOPSDN_REFERENCE'"
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="Salesbyproduct")
			
			$_Ptr_COlumnCounter->:=6
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="select "
			$_t_SQLStatement:=$_t_SQLStatement+"TOPS_YearRef"+", "
			$_t_SQLStatement:=$_t_SQLStatement+"RTRIM(customer) as customer,"
			$_t_SQLStatement:=$_t_SQLStatement+"RTRIM(product) as product,"
			$_t_SQLStatement:=$_t_SQLStatement+"Cast(sum(quantity) as varchar),"
			$_t_SQLStatement:=$_t_SQLStatement+"RTRIM(product_group_a) as product_group_a,"
			//$_t_SQLStatement:=$_t_SQLStatement+"territory,"
			$_t_SQLStatement:=$_t_SQLStatement+"cast (sum(val) as varchar)"
			$_t_SQLStatement:=$_t_SQLStatement+" from "+"TOPS_TableName"+" with (nolock)"
			$_t_SQLStatement:=$_t_SQLStatement+" group by customer,product,product_group_a"  //,territory"
			$_t_SQLStatement:=$_t_SQLStatement+" order by customer,product"
			
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="SalesbyGroup")
			$_Ptr_COlumnCounter->:=3
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="SELECT "
			$_t_SQLStatement:=$_t_SQLStatement+"RTRIM(customer) as customer,"
			$_t_SQLStatement:=$_t_SQLStatement+"RTRIM(product_group_a) as product_group_a,"
			$_t_SQLStatement:=$_t_SQLStatement+"Cast (sum(val) as varchar) "
			$_t_SQLStatement:=$_t_SQLStatement+"FROM "+"TOPS_TableName"+" "+"with (nolock) "
			$_t_SQLStatement:=$_t_SQLStatement+"GROUP BY customer,product_group_a "
			$_t_SQLStatement:=$_t_SQLStatement+"ORDER BY customer,product_group_a"
			
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="SalesTotals")
			$_Ptr_COlumnCounter->:=3
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			//$Label:="'xTOTALa'"
			$_t_SQLStatement:="SELECT "
			$_t_SQLStatement:=$_t_SQLStatement+"RTRIM(customer) as customer,"
			$_t_SQLStatement:=$_t_SQLStatement+"Cast(sum(val)as varchar)"+","
			$_t_SQLStatement:=$_t_SQLStatement+"TOPS_TotalLabel "
			$_t_SQLStatement:=$_t_SQLStatement+"from "+"TOPS_TableName "+"with (nolock) "
			$_t_SQLStatement:=$_t_SQLStatement+"GROUP BY customer "
			$_t_SQLStatement:=$_t_SQLStatement+"ORDER BY customer"
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="SalesTotalsB")
			$_Ptr_COlumnCounter->:=3
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			//$Label:="'xTOTALb'"
			$_t_SQLStatement:="SELECT "
			$_t_SQLStatement:=$_t_SQLStatement+"RTRIM(customer) as customer,"
			$_t_SQLStatement:=$_t_SQLStatement+"Cast(sum(val) as varchar),"
			$_t_SQLStatement:=$_t_SQLStatement+"TOPS_TotalLabel "
			$_t_SQLStatement:=$_t_SQLStatement+"FROM "+"TOPS_TableName "+"with (nolock) "
			$_t_SQLStatement:=$_t_SQLStatement+"WHERE product_group_a not like 'CARRIAGE' "
			$_t_SQLStatement:=$_t_SQLStatement+"AND product_group_a not like 'MARKETING' "
			$_t_SQLStatement:=$_t_SQLStatement+"AND product_group_a not like 'TED' "
			$_t_SQLStatement:=$_t_SQLStatement+"AND product_group_a not like 'LIC' "  //Early years we have TED entries loaded as LICENSE FEE or LICENCE FEE
			$_t_SQLStatement:=$_t_SQLStatement+"AND product_group_a not like 'PRODUCT' "
			$_t_SQLStatement:=$_t_SQLStatement+"AND product_group_a not like 'VOUCHER' "
			$_t_SQLStatement:=$_t_SQLStatement+"AND product_group_a not like 'CNC' "
			$_t_SQLStatement:=$_t_SQLStatement+"GROUP BY customer "
			$_t_SQLStatement:=$_t_SQLStatement+"ORDER BY customer"
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="GetMPNUpdate")
			$_Ptr_COlumnCounter->:=5
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="select supplier, "
			$_t_SQLStatement:=$_t_SQLStatement+" warehouse,"
			$_t_SQLStatement:=$_t_SQLStatement+" product, "
			$_t_SQLStatement:=$_t_SQLStatement+"part_no,"
			$_t_SQLStatement:=$_t_SQLStatement+"cost"
			
			$_t_SQLStatement:=$_t_SQLStatement+" from scheme.posinfm with (nolock)"
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="GetOrderState")
			$_Ptr_COlumnCounter->:=3
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			
			$_t_SQLStatement:="select "
			$_t_SQLStatement:=$_t_SQLStatement+"status,"
			$_t_SQLStatement:=$_t_SQLStatement+"invoice_no,"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),invoice_date,103) as [DD/MM/YYYY] "
			$_t_SQLStatement:=$_t_SQLStatement+"from scheme.opheadm with (nolock)"
			$_t_SQLStatement:=$_t_SQLStatement+"where order_no = 'TOPSDN_REFERENCE'"
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="GetDNPostcode")
			$_Ptr_COlumnCounter->:=1
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="select post_code from scheme.ophdrpcm with (nolock) where order_no = 'TOPSDN_REFERENCE'"
			
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="ORDERS_STATE")
			$_Ptr_COlumnCounter->:=1
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="select order_no from opheadm with (nolock) where status = 'TOPSSQL_STATUS'"
			//$_t_SQLStatement:=$_t_SQLStatement+"where order_no = 'TOPSDN_REFERENCE'"
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="ORDERS_STATE_ByDN")
			$_Ptr_COlumnCounter->:=1
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="select order_no from opheadm with (nolock) where status = 'TOPSSQL_STATUS'"
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="BackOrders")
			
			$_Ptr_COlumnCounter->:=7
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="select"
			$_t_SQLStatement:=$_t_SQLStatement+" part,"
			$_t_SQLStatement:=$_t_SQLStatement+" descr,"
			$_t_SQLStatement:=$_t_SQLStatement+"(convert (varchar(10),ph)),"
			$_t_SQLStatement:=$_t_SQLStatement+"(convert (varchar(10),al)),"
			$_t_SQLStatement:=$_t_SQLStatement+"(convert (varchar(10),bk)),"
			$_t_SQLStatement:=$_t_SQLStatement+"(convert (varchar(10),sp)),"
			$_t_SQLStatement:=$_t_SQLStatement+" gp"
			$_t_SQLStatement:=$_t_SQLStatement+" from pds_stock with (nolock)"
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="PurchaseOrders")
			$_Ptr_COlumnCounter->:=11
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			//columns 4 5(numbers) and 7(date) convert
			$_t_SQLStatement:="select"
			$_t_SQLStatement:=$_t_SQLStatement+" a,"
			$_t_SQLStatement:=$_t_SQLStatement+"b,"
			$_t_SQLStatement:=$_t_SQLStatement+"RTRIM(poview.c) AS c,"
			$_t_SQLStatement:=$_t_SQLStatement+"(convert (varchar(10), d)),"  //Convert
			$_t_SQLStatement:=$_t_SQLStatement+"(convert (varchar(10), e)),"  //convert"
			
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),f,103) as [DD/MM/YYYY],"
			$_t_SQLStatement:=$_t_SQLStatement+"g,h,i,RTRIM(poview.j) AS j"
			$_t_SQLStatement:=$_t_SQLStatement+",k"
			$_t_SQLStatement:=$_t_SQLStatement+" from poview with (nolock)"
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="Suppliers")
			$_Ptr_COlumnCounter->:=10
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="select supplier, alpha, name, address1, address2, address3, address4, address5,"
			$_t_SQLStatement:=$_t_SQLStatement+"pay_terms,fax from scheme.plsuppm with (nolock)"  //was  purchase_supplier
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="Discounts")
			$_Ptr_COlumnCounter->:=13
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="select "
			$_t_SQLStatement:=$_t_SQLStatement+"RTRIM(cust_disc_code) as cust_disc_code,"
			$_t_SQLStatement:=$_t_SQLStatement+"RTRIM(prod_disc_code) as prod_disc_code,"
			$_t_SQLStatement:=$_t_SQLStatement+"discount_type,"
			$_t_SQLStatement:=$_t_SQLStatement+"(convert (varchar(10),quantity_break1)),"
			$_t_SQLStatement:=$_t_SQLStatement+"(convert (varchar(10),quantity_break2)),"
			$_t_SQLStatement:=$_t_SQLStatement+"(convert (varchar(10),quantity_break3)),"
			$_t_SQLStatement:=$_t_SQLStatement+"(convert (varchar(10),quantity_break4)),"
			$_t_SQLStatement:=$_t_SQLStatement+"(convert (varchar(10),quantity_break5)),"
			$_t_SQLStatement:=$_t_SQLStatement+"(convert (varchar(10),discount1)),"
			$_t_SQLStatement:=$_t_SQLStatement+"(convert (varchar(10),discount2)),"
			$_t_SQLStatement:=$_t_SQLStatement+"(convert (varchar(10),discount3)),"
			$_t_SQLStatement:=$_t_SQLStatement+"(convert (varchar(10),discount4)),"
			$_t_SQLStatement:=$_t_SQLStatement+"(convert (varchar(10),discount5))"
			$_t_SQLStatement:=$_t_SQLStatement+" from scheme.opdscntm with (nolock)"
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="PriceList")
			$_Ptr_COlumnCounter->:=4
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="select"
			//$_t_SQLStatement:="
			$_t_SQLStatement:=$_t_SQLStatement+" price_list,"
			$_t_SQLStatement:=$_t_SQLStatement+" customer_code,"
			$_t_SQLStatement:=$_t_SQLStatement+" product_code,"
			$_t_SQLStatement:=$_t_SQLStatement+" (convert (varchar(10),price))"
			$_t_SQLStatement:=$_t_SQLStatement+" from scheme.oplistm with (nolock)"
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="DNLines")
			$_Ptr_COlumnCounter->:=18
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="select"
			$_t_SQLStatement:=$_t_SQLStatement+" order_no,"
			$_t_SQLStatement:=$_t_SQLStatement+"order_line_no,"  //order_line NOW chaged to order_line_no
			$_t_SQLStatement:=$_t_SQLStatement+"product,"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(20),allocated_qty),"  //<-COnvert to string
			$_t_SQLStatement:=$_t_SQLStatement+"description,"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),cost_of_sale),"  //<_Convert
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(25),weight),"  //<_Convert
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),val),"  //<_Convert //,value NOW changed to val
			$_t_SQLStatement:=$_t_SQLStatement+"product_group_a,"
			$_t_SQLStatement:=$_t_SQLStatement+"long_description,"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),list_price),"  //<_Convert
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),discount),"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),net_price),"  //<_Convert
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),vat_rate),"  //<_Convert
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),vat_amount),"  //<_Convert
			$_t_SQLStatement:=$_t_SQLStatement+"vat_code_new,"
			$_t_SQLStatement:=$_t_SQLStatement+"warehouse,"
			$_t_SQLStatement:=$_t_SQLStatement+"bin_number"  //Added warehouse,bin no  160210"
			
			$_t_SQLStatement:=$_t_SQLStatement+" from scheme.opdetm with (nolock) where order_no = "+Char:C90(Quote:K15:44)+"TOPSDN_REFERENCE"+Char:C90(Quote:K15:44)
			
			$0:=$_t_SQLStatement
			
			
		: ($_t_SQL_Collection="DNLinesWithBundles")
			$_Ptr_COlumnCounter->:=20
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			$_t_SQLStatement:="select"
			$_t_SQLStatement:=$_t_SQLStatement+" order_no,"
			$_t_SQLStatement:=$_t_SQLStatement+"order_line_no,"  //order_line NOW chaged to order_line_no
			$_t_SQLStatement:=$_t_SQLStatement+"product,"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(20),allocated_qty),"  //<-COnvert to string
			$_t_SQLStatement:=$_t_SQLStatement+"description,"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),cost_of_sale),"  //<_Convert
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(25),weight),"  //<_Convert
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),val),"  //<_Convert //,value NOW changed to val
			$_t_SQLStatement:=$_t_SQLStatement+"product_group_a,"
			$_t_SQLStatement:=$_t_SQLStatement+"long_description,"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),list_price),"  //<_Convert
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),discount),"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),net_price),"  //<_Convert
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),vat_rate),"  //<_Convert
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),vat_amount),"  //<_Convert
			$_t_SQLStatement:=$_t_SQLStatement+"vat_code_new,"
			$_t_SQLStatement:=$_t_SQLStatement+"warehouse,"
			$_t_SQLStatement:=$_t_SQLStatement+"bin_number,"  //Added warehouse,bin no  160210"
			$_t_SQLStatement:=$_t_SQLStatement+"line_type,"
			$_t_SQLStatement:=$_t_SQLStatement+"bundle_line_ref"
			$_t_SQLStatement:=$_t_SQLStatement+" from scheme.opdetm with (nolock) where order_no = "+Char:C90(Quote:K15:44)+"TOPSDN_REFERENCE"+Char:C90(Quote:K15:44)
			
			$0:=$_t_SQLStatement
			
		: ($_t_SQL_Collection="DNNumber")
			$_Ptr_COlumnCounter->:=18
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurcesjp
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			
			$_t_SQLStatement:="select "
			$_t_SQLStatement:=$_t_SQLStatement+"address1,"
			$_t_SQLStatement:=$_t_SQLStatement+"address2,"
			$_t_SQLStatement:=$_t_SQLStatement+"address3,"
			$_t_SQLStatement:=$_t_SQLStatement+"address4,"
			$_t_SQLStatement:=$_t_SQLStatement+"address5,"
			$_t_SQLStatement:=$_t_SQLStatement+"delivery_method,"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(25),total_ship_weight),"
			$_t_SQLStatement:=$_t_SQLStatement+"shipping_text,"
			$_t_SQLStatement:=$_t_SQLStatement+"order_no,"
			$_t_SQLStatement:=$_t_SQLStatement+"customer,"
			$_t_SQLStatement:=$_t_SQLStatement+"status,"
			$_t_SQLStatement:=$_t_SQLStatement+"customer_order_no,"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),date_entered,103) as [DD/MM/YYYY],"
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),date_required,103) as [DD/MM/YYYY],"
			$_t_SQLStatement:=$_t_SQLStatement+"carrier_code,"
			$_t_SQLStatement:=$_t_SQLStatement+"territory,"
			$_t_SQLStatement:=$_t_SQLStatement+"region,"
			$_t_SQLStatement:=$_t_SQLStatement+"lang "  //,language NOW changed to lang
			$_t_SQLStatement:=$_t_SQLStatement+"from scheme.opheadm with (nolock)"
			$_t_SQLStatement:=$_t_SQLStatement+"where order_no ="+Char:C90(Quote:K15:44)+"TOPSDN_REFERENCE"+Char:C90(Quote:K15:44)
			
			
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="stockistCreditLimit")
			$_Ptr_COlumnCounter->:=3
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
				
			End if 
			$_t_SQLStatement:="select customer, STR(credit_limit), despatch_held"
			$_t_SQLStatement:=$_t_SQLStatement+" from scheme.slcustm with (nolock) where slcustm.customer in "+"TOPSSQL_ARRAY"
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="stockistsStatement")
			$_Ptr_COlumnCounter->:=10
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
				
			End if 
			$_t_SQLStatement:=""
			$_t_SQLStatement:=$_t_SQLStatement+"SELECT customer"
			$_t_SQLStatement:=$_t_SQLStatement+",item_no"
			$_t_SQLStatement:=$_t_SQLStatement+",convert(varchar(10),dated,103) as [DD/MM/YYYY]"
			$_t_SQLStatement:=$_t_SQLStatement+",kind"  //was type changed for Sage 1000
			$_t_SQLStatement:=$_t_SQLStatement+",refernce"  //was reference changed for Sage 1000
			$_t_SQLStatement:=$_t_SQLStatement+",Cast (amount as varchar)"
			$_t_SQLStatement:=$_t_SQLStatement+",Cast(unall_amount as varchar)"
			$_t_SQLStatement:=$_t_SQLStatement+",convert(varchar(10),due_date,103) as [DD/MM/YYYY]"
			$_t_SQLStatement:=$_t_SQLStatement+",Cast(currency_amount as varchar)"
			$_t_SQLStatement:=$_t_SQLStatement+",Cast(unall_curr_amount as varchar)"  //added 160108
			$_t_SQLStatement:=$_t_SQLStatement+" FROM scheme.slitemm with (nolock)"
			$_t_SQLStatement:=$_t_SQLStatement+" WHERE unall_amount <> 0"
			$_t_SQLStatement:=$_t_SQLStatement+" ORDER BY customer, dated, refernce"  //was reference changed for Sage 1000
			$0:=$_t_SQLStatement
			
		: ($_t_SQL_Collection="stockists")
			$_Ptr_COlumnCounter->:=42
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
				
			End if 
			$_t_SQLStatement:="SELECT "
			$_t_SQLStatement:=$_t_SQLStatement+"customer,"  ////aA [STOCKISTS]Account_Number//1
			$_t_SQLStatement:=$_t_SQLStatement+"name,"  //;aB;;aB;[STOCKISTS]Company_Name//2
			$_t_SQLStatement:=$_t_SQLStatement+"address1,"  //aC;;aC;[STOCKISTS]Address_Line1//3
			$_t_SQLStatement:=$_t_SQLStatement+"address2,"  //aD;aD;[STOCKISTS]Address_Line2//4
			$_t_SQLStatement:=$_t_SQLStatement+"address3,"  //;aE ;aE;[STOCKISTS]Address_Line3//5
			$_t_SQLStatement:=$_t_SQLStatement+"address4,"  //aF;aF;[STOCKISTS]Address_line4;aG//6
			$_t_SQLStatement:=$_t_SQLStatement+"address5,"  //;aG;[STOCKISTS]Telephone;aH//7
			$_t_SQLStatement:=$_t_SQLStatement+"fax,"  //;aH ;[STOCKISTS]Fax//8
			$_t_SQLStatement:=$_t_SQLStatement+"telex,"  //ai [STOCKISTS]Address_Town//addrees 5 was address 6  Data has been moved//9
			$_t_SQLStatement:=$_t_SQLStatement+"bank_name,"  //;aJ [STOCKISTS]Address_County//10
			//;aW;[STOCKISTS]RecordLoadedDate
			//aAC;aADD;[STOCKISTS]East;aAEE;[STOCKISTS]North;aN;[STOCKISTS]Representitive;aDO;[STOCKISTS]DaysOver;aLVD;
			//[STOCKISTS]Last_Visit_Date;aAG;[STOCKISTS]SEQ_Name;aAGG;[STOCKISTS]SEQ_Address1;;aAX;[STOCKISTS]Type_INV;aAK;[STOCKISTS]Type_STA;aAL;[STOCKISTS]Currency_Code;aAM;[STOCKISTS]Price_List;aAN;[STOCKISTS]Credit_Limit;aAO;[STOCKISTS]SETT_Code;aAP;[STOCKISTS]VAT;aAQ;[STOCKISTS]CREDIT;aAR;[STOCKISTS]Address_Country;aAS;[STOCKISTS]Special_price;aAZ;[STOCKISTS]Website;aAZZ;[STOCKISTS]Email)
			
			$_t_SQLStatement:=$_t_SQLStatement+"invoice_customer,"  //;/aK [STOCKISTS]Invoice//11
			$_t_SQLStatement:=$_t_SQLStatement+"statement_customer,"  //;aL; [STOCKISTS]Statement//12
			$_t_SQLStatement:=$_t_SQLStatement+"analysis_codes1,"  //aM [STOCKISTS]Stockist_Type//13
			$_t_SQLStatement:=$_t_SQLStatement+"territory,"  //;aN //14
			$_t_SQLStatement:=$_t_SQLStatement+"cust_disc_code,"  //;aO; [STOCKISTS]Discount/15
			$_t_SQLStatement:=$_t_SQLStatement+"delivery_reason,"  //aP; [STOCKISTS]Rebate16
			$_t_SQLStatement:=$_t_SQLStatement+"despatch_held,"  //aR [STOCKISTS]On_Stop/17
			$_t_SQLStatement:=$_t_SQLStatement+"payer,"  //;aS [STOCKISTS]Comment/18
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),date_last_issue,103) as [DD/MM/YYYY],"  //aT [STOCKISTS]Last_Invoice//19
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),date_created,103) as [DD/MM/YYYY],"  //aV//20
			$_t_SQLStatement:=$_t_SQLStatement+"analysis_codes3,"  //aAB [STOCKISTS]Credit_Insurance1/21
			$_t_SQLStatement:=$_t_SQLStatement+"analysis_codes4,"  //aAC [STOCKISTS]Facilities12//22
			$_t_SQLStatement:=$_t_SQLStatement+"analysis_codes5,"  //aAD //2
			$_t_SQLStatement:=$_t_SQLStatement+"analysis_code_6,"  //aAE/25
			$_t_SQLStatement:=$_t_SQLStatement+"bank_account_no,"  //aAF [STOCKISTS]Type_DN//26
			$_t_SQLStatement:=$_t_SQLStatement+"bank_address1,"  //aAG [STOCKISTS]SEQ_Name//27
			$_t_SQLStatement:=$_t_SQLStatement+"bank_address2,"  //aAH [STOCKISTS]Xmas_Flags//28
			$_t_SQLStatement:=$_t_SQLStatement+"bank_address3,"  //aAI [STOCKISTS]Competitor//29
			$_t_SQLStatement:=$_t_SQLStatement+"account_type,"  //aAJ [STOCKISTS]Call/30
			$_t_SQLStatement:=$_t_SQLStatement+"bank_branch_code,"  //aAK//31
			$_t_SQLStatement:=$_t_SQLStatement+"currency,"  //aAL//32
			$_t_SQLStatement:=$_t_SQLStatement+"price_list,"  //aAM//33
			$_t_SQLStatement:=$_t_SQLStatement+"Cast( credit_limit as varchar),"  //aAN -[STOCKISTS]Representitive----->    [CAMDATA]CREDIT_LIMIT//34
			$_t_SQLStatement:=$_t_SQLStatement+"settlement_code,"  //aAO [STOCKISTS]DaysOver------>  [CAMDATA]SETT_CODE/35
			$_t_SQLStatement:=$_t_SQLStatement+"vat_type,"  //aAP ------>  [CAMDATA]VAT//36
			$_t_SQLStatement:=$_t_SQLStatement+"credit_category,"  //aAQ ------>  [CAMDATA]CREDIT37
			$_t_SQLStatement:=$_t_SQLStatement+"region,"  //aAR ------>   [CAMDATA]COUNTRY/38
			$_t_SQLStatement:=$_t_SQLStatement+"special_price,"  //aAS------>   [CAMDATA]Special_price
			$_t_SQLStatement:=$_t_SQLStatement+"bank_address4,"  //aAX ------> [STOCKISTS]Type_INV [CAMDATA]SEQAdd3
			$_t_SQLStatement:=$_t_SQLStatement+"bank_sort_code,"  //aAGG  [STOCKISTS]SEQ_Address1------>  [CAMDATA]SEQAdd1
			$_t_SQLStatement:=$_t_SQLStatement+"email,"  //aZ ------>  [CAMDATA]Website
			$_t_SQLStatement:=$_t_SQLStatement+"iban "  //aZZ ------>  [CAMDATA]Email
			$_t_SQLStatement:=$_t_SQLStatement+"FROM scheme.slcustm with (nolock)"
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="stockistCredit")
			$_Ptr_COlumnCounter->:=2
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
				
			End if 
			$_t_SQLStatement:="select customer, STR(SUM(unall_amount))"
			
			$_t_SQLStatement:=$_t_SQLStatement+" from scheme.slitemm with (nolock)"
			//$_t_SQLStatement:=$_t_SQLStatement+" inner join slcustm with (nolock) on scheme.opheadm.order_no=scheme.opdetm.order_no"
			
			$_t_SQLStatement:=$_t_SQLStatement+" where open_indicator='O' and due_date<"+Char:C90(39)+"TOPSSQL_SearchDate1"+Char:C90(39)
			$_t_SQLStatement:=$_t_SQLStatement+" GROUP BY customer"
			$0:=$_t_SQLStatement
			
		: ($_t_SQL_Collection="OHeaderstatus")
			$_Ptr_COlumnCounter->:=5
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
				
			End if 
			//`Remember this brings back all fields as text
			$_t_SQLStatement:="select opheadm.order_no"
			$_t_SQLStatement:=$_t_SQLStatement+", convert(varchar(10),opheadm.date_entered,103) as [DD/MM/YYYY]"
			$_t_SQLStatement:=$_t_SQLStatement+", opaudm.character_value,convert(varchar(10),opaudm.audit_date,103) as [DD/MM/YYYY]"
			$_t_SQLStatement:=$_t_SQLStatement+", STR(opaudm.audit_time)"
			$_t_SQLStatement:=$_t_SQLStatement+" FROM scheme.opaudm"
			$_t_SQLStatement:=$_t_SQLStatement+" inner join scheme.opheadm with (nolock) on scheme.opaudm.audit_key=scheme.opheadm.order_no"
			$_t_SQLStatement:=$_t_SQLStatement+" and opheadm.date_entered ="+Char:C90(Quote:K15:44)+"TOPSSQL_DATE"+Char:C90(Quote:K15:44)
			$_t_SQLStatement:=$_t_SQLStatement+" and opaudm.character_value in "+"TOPSSQL_ARRAY"
			$0:=$_t_SQLStatement
			
		: ($_t_SQL_Collection="opaudmStatus")
			$_Ptr_COlumnCounter->:=2
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			//`Remember this brings back all fields as text
			$_t_SQLStatement:="select audit_key,character_value from opaudm with (nolock)"
			$_t_SQLStatement:=$_t_SQLStatement+" where opaudm.audit_date ="+Char:C90(Quote:K15:44)+"TOPSSQL_DATE"+Char:C90(Quote:K15:44)
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="boview")
			$_Ptr_COlumnCounter->:=12
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			
			//`Remember this brings back all values as text
			$_t_SQLStatement:="select"
			$_t_SQLStatement:=$_t_SQLStatement+" opheadm"+"."+"order_no"
			$_t_SQLStatement:=$_t_SQLStatement+", opheadm"+"."+"customer"
			$_t_SQLStatement:=$_t_SQLStatement+", opheadm"+"."+"customer_order_no"
			$_t_SQLStatement:=$_t_SQLStatement+", opheadm"+"."+"status"
			$_t_SQLStatement:=$_t_SQLStatement+", convert(varchar(10),opheadm"+"."+"date_entered"+",103) as [DD/MM/YYYY]"
			$_t_SQLStatement:=$_t_SQLStatement+", convert(varchar(10),opheadm"+"."+"date_required"+",103) as [DD/MM/YYYY]"
			$_t_SQLStatement:=$_t_SQLStatement+", opheadm"+"."+"address1"
			$_t_SQLStatement:=$_t_SQLStatement+", opheadm"+"."+"invoice_customer"
			$_t_SQLStatement:=$_t_SQLStatement+", opdetm"+"."+"product"
			$_t_SQLStatement:=$_t_SQLStatement+", opdetm"+"."+"long_description"
			$_t_SQLStatement:=$_t_SQLStatement+",STR(opdetm"+"."+"order_qty"+")"
			$_t_SQLStatement:=$_t_SQLStatement+",STR( opdetm"+"."+"val"+")"
			$_t_SQLStatement:=$_t_SQLStatement+" FROM scheme.opheadm with (nolock)"
			$_t_SQLStatement:=$_t_SQLStatement+" inner join scheme.opdetm with (nolock) on scheme.opheadm.order_no=scheme.opdetm.order_no"
			$_t_SQLStatement:=$_t_SQLStatement+" where opheadm.status in "+"TOPSSQL_ARRAY"  //NOTE HERE THIS A WORD_-it get replaced 
			$_t_SQLStatement:=$_t_SQLStatement+"and opdetm.order_qty > 0 "  //To get rid of description lines.  
			$_t_SQLStatement:=$_t_SQLStatement+"and opdetm.product NOT LIKE 'PST' "  //To get rid of Postage lines.  
			$_t_SQLStatement:=$_t_SQLStatement+"and opdetm.product NOT LIKE 'DPD' "
			$_t_SQLStatement:=$_t_SQLStatement+"and opdetm.product NOT LIKE '1ST' "
			$_t_SQLStatement:=$_t_SQLStatement+"and opdetm.product NOT LIKE 'PDI' "
			$0:=$_t_SQLStatement
		: ($_t_SQL_Collection="StockUpdate")
			$_Ptr_COlumnCounter->:=43
			$_t_SQLSOurce:="SAGE"
			If ($_bo_SetSQLSOurce)
				$_Ptr_SQLSOurce->:=$_t_SQLSOurce
			End if 
			If ($_bo_SetSQLLOgin)
				Trend_GetSQLlogin($_t_SQLSOurce; $_ptr_SQLDSN; $_Ptr_SQLUser; $_Ptr_SQL_PW)
			End if 
			
			$_t_SQLStatement:="select "
			$_t_SQLStatement:=$_t_SQLStatement+"despatch_units,"  //"despatch_units,"aS_dodW
			//If (False)
			$_t_SQLStatement:=$_t_SQLStatement+"warehouse,"  //"warehouse,"aS_dodA
			$_t_SQLStatement:=$_t_SQLStatement+"product,"  //"product,"aS_dodB
			$_t_SQLStatement:=$_t_SQLStatement+"long_description,"  //"long_description,"aS_dodC
			$_t_SQLStatement:=$_t_SQLStatement+"analysis_a,"  //"analysis_a,"aS_dodD
			$_t_SQLStatement:=$_t_SQLStatement+"description,"  //"description,"aS_dodE
			$_t_SQLStatement:=$_t_SQLStatement+"Cast(price as varchar),"  //"price,"aR_dodF(Real)
			$_t_SQLStatement:=$_t_SQLStatement+"discount,"  //"discount,"aS_dodG
			$_t_SQLStatement:=$_t_SQLStatement+"unit_height,"  //"unit_height,"aS_dodH
			$_t_SQLStatement:=$_t_SQLStatement+"stock_vat_type,"  //"stock_vat_type,"aS_dodI
			$_t_SQLStatement:=$_t_SQLStatement+"drawing_number,"  //"drawing_number,"aS_dodJ
			$_t_SQLStatement:=$_t_SQLStatement+"unit_length,"  //"unit_length,"aS_dodAR
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),average_sales_valu),"  //"average_sales_valu,"aR_dodL(real)
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),weight),"  //"weight,"aR_dodM(eal)
			$_t_SQLStatement:=$_t_SQLStatement+"catalogue_number,"  //"catalogue_number,"aS_dodMN
			$_t_SQLStatement:=$_t_SQLStatement+"analysis_b,"  //"analysis_b,"aS_dodP
			$_t_SQLStatement:=$_t_SQLStatement+"analysis_c,"  //"analysis_c,"aS_dodQ
			
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),physical_qty),"  //"physical_qty,"aI_dodPH(Longint)
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(20),allocated_qty),"  //"allocated_qty,"aI_dodAL(Longint)
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),back_order_qty),"  //"back_order_qty,"aI_dodBO(Longint)
			//20
			$_t_SQLStatement:=$_t_SQLStatement+"cast(current_cost  as char(10)),"  //-->aR_dodSS//"standard_cost,"  //-->aR_dodSSaR_dodSS(real)
			$_t_SQLStatement:=$_t_SQLStatement+"cast(standard_cost as varchar(10)),"  //-->aR_dodSS//"standard_cost,"  //-->aR_dodSSaR_dodSS(real)
			
			//$_t_SQLStatement:=$_t_SQLStatement+"cast(current_cost as varchar(10)),"  //-->aR_dodS//"current_cost,"  //-->aR_dodSaR_dodS(real)
			//$_t_SQLStatement:=$_t_SQLStatement+"cast(standard_cost as varchar(10)),"  //-->aR_dodSS//"standard_cost,"  //-->aR_dodSSaR_dodSS(real)
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),min_stock_level),"  //"min_stock_level,"aBuf)real
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),lead_time),"  //"lead_time,"aLead(real)
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),shelf_life),"  //"shelf_life,"aShelf(real)
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),economic_reorder_q),"  //"economic_reorder_q,"aMOQ(Real)
			$_t_SQLStatement:=$_t_SQLStatement+"make_or_buy,"  //"make_or_buy,"aMB
			//27
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),on_order_qty),"  //"on_order_qty,"aR_dodX
			$_t_SQLStatement:=$_t_SQLStatement+"supplier,"  //"supplier,"aS_dodY
			
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),period_issue_qty01),"  //"period_issue_qty01,"aR_dodAF
			//30
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),period_issue_qty02),"  //"period_issue_qty02,"aR_dodAG
			
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),period_issue_qty03),"  //"period_issue_qty03,"aR_dodAH
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),period_issue_qty04),"  //"period_issue_qty04,"aR_dodAI
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),period_issue_qty05),"  //"period_issue_qty05,"aR_dodAJ
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),period_issue_qty06),"  //"period_issue_qty06,"aR_dodAK
			
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),period_issue_qty07),"  //"period_issue_qty07,"aR_dodAL
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),period_issue_qty08),"  //"period_issue_qty08,"aR_dodAM
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),period_issue_qty09),"  //"period_issue_qty09,"aR_dodAN
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),period_issue_qty10),"  //"period_issue_qty10,"aR_dodAO
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),period_issue_qty11),"  //"period_issue_qty11,"aR_dodAP //40
			
			$_t_SQLStatement:=$_t_SQLStatement+"convert(varchar(10),period_issue_qty12),"  //"period_issue_qty12,"aR_dodAQ
			
			$_t_SQLStatement:=$_t_SQLStatement+"alpha,"  //"alpha,"aSub3
			
			$_t_SQLStatement:=$_t_SQLStatement+"abc_category"  //"abc_category"PRD_at_AbcCat
			
			
			$_t_SQLStatement:=$_t_SQLStatement+" from scheme.stockm with (nolock)"
			$0:=$_t_SQLStatement
		Else 
			//Here we could look up the name in a table and return a stored SQL query
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Class:11=4; *)
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Name:2=$_t_SQL_Collection)
			$_t_ScriptCode:=[SCRIPTS:80]Script_Code:1
			//extract from the script code the number of columns and the script source
			
			
			
			
			
	End case 
End if 
ERR_MethodTrackerReturn("TREND_Sql_Builder"; $_t_oldMethodName)
