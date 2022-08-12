//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Prod_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2009`Method: Prod_Sel2`Description
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	C_BOOLEAN:C305(<>AutoFind; <>ProdGrpBrd; <>SelOr; <>SYS_bo_PRDFurtherAnalSearch; $_bo_Retry; $3; PRD_bo_FilterLoaded)
	C_LONGINT:C283($_l_GetFieldNames; $_l_LastField; $_l_position; $_l_RecordsInSelection; $_l_SearchFieldNumber; $_l_StringLength; $_l_TableNumber; PRD_l_FilterNLA)
	C_POINTER:C301($_Ptr_Field; $_Ptr_Table)
	C_TEXT:C284($_t_After; $_t_Before; $_t_FieldName; $_t_FieldName2; $_t_oldMethodName; $_t_SearchwithAt; $_t_SearchWithWIldCard; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod_Sel2")
vAutoFind:=<>AutoFind
If (Not:C34(PRD_bo_FilterLoaded))
	PRD_l_FilterNLA:=ProductDeletionPreferences
	PRD_bo_FilterLoaded:=True:C214
End if 

If (((Length:C16($1)=1) & (Character code:C91($1)=64)) | ($1=""))
	ALL RECORDS:C47([PRODUCTS:9])
	COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
	$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
	If (PRD_l_FilterNLA=1)
		QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
	Else 
		QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
	End if 
	
Else 
	$_l_position:=Position:C15(":"; $1)
	If ($_l_Position>0)
		$_t_Before:=Substring:C12($1; 1; $_l_position-1)
		$_t_After:=Substring:C12($1; $_l_position+1)
		$_l_TableNumber:=Table:C252(->[PRODUCTS:9])
		$_l_LastField:=Get last field number:C255(Table:C252(->[PRODUCTS:9]))
		For ($_l_GetFieldNames; 1; $_l_LastField)
			If (Is field number valid:C1000($_l_TableNumber; $_l_GetFieldNames))
				$_t_FieldName:=Field name:C257($_l_TableNumber; $_l_GetFieldNames)
				$_t_FieldName2:=Replace string:C233($_t_FieldName; "_"; " ")
				If ($_t_FieldName=$_t_Before) | ($_t_FieldName2=$_t_Before)
					$_l_SearchFieldNumber:=$_l_GetFieldNames
					$_l_GetFieldNames:=$_l_LastField
				End if 
			End if 
		End for 
	End if 
	
	
	Case of 
		: ($1="Product: @") | ($1="Product Code: @")
			If ($1="Product: @")
				$_l_StringLength:=Length:C16("Product: ")
			Else 
				$_l_StringLength:=Length:C16("Product Code: ")
			End if 
			$1:=Substring:C12($1; $_l_StringLength+1; 32000)
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$1)
			COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
			$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
			If (PRD_l_FilterNLA=1)
				QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
			Else 
				QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
			End if 
		: ($1="Company: @") | ($1="Company(supplier): @")
			
			
			If ($1="Company: @")
				$_l_StringLength:=Length:C16("Company: ")
			Else 
				$_l_StringLength:=Length:C16("Company(supplier): ")
			End if 
			$1:=Substring:C12($1; $_l_StringLength+1; 32000)
			QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=$1)
			SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
			QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
			COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
			$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
			If (PRD_l_FilterNLA=1)
				QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
			Else 
				QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
			End if 
		: ($_l_SearchFieldNumber>0)
			
			$_t_SearchWithWIldCard:=Sel_AtSign($_t_after)
			$_Ptr_Table:=Table:C252($_l_TableNumber)
			$_Ptr_Field:=Field:C253($_l_TableNumber; $_l_SearchFieldNumber)
			QUERY:C277($_Ptr_Table->; $_Ptr_Field->=$_t_after)
			If (Records in selection:C76($_Ptr_Table->)=0)
				QUERY:C277($_Ptr_Table->; $_Ptr_Field->=$_t_SearchWithWIldCard)
			End if 
			
			
		: ($1="Components of: @")
			$1:=Substring:C12($1; 16; 32000)
			QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=$1)
			Join_SelFast(->[COMPONENTS:86]; ->[COMPONENTS:86]Component_Code:2; ->[PRODUCTS:9]; ->[PRODUCTS:9]Product_Code:1)
			COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
			$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
			If (PRD_l_FilterNLA=1)
				QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
			Else 
				QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
			End if 
		Else 
			$_t_SearchwithAt:=Sel_AtSign($1)
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Short_Code:19=$_t_SearchwithAt)
			COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
			$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
			
			If (PRD_l_FilterNLA=1)
				QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
			Else 
				QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
			End if 
			SelOr_1(->[PRODUCTS:9])
			If ((Records in selection:C76([PRODUCTS:9])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
				Sel_NoAtAt(->[PRODUCTS:9]; ->[PRODUCTS:9]Product_Code:1; $1; $_t_SearchwithAt)
				$_bo_Retry:=False:C215
				COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
				$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
				If ($_l_RecordsInSelection=1) & ([PRODUCTS:9]Product_Code:1=$1)
					$_bo_Retry:=True:C214
				End if 
				If (PRD_l_FilterNLA=1)
					QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
				Else 
					QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
				End if 
				If ($_bo_Retry) & (Records in selection:C76([PRODUCTS:9])=0)
					Sel_NoAtAt(->[PRODUCTS:9]; ->[PRODUCTS:9]Product_Code:1; $1; $_t_SearchwithAt; False:C215)
					COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
					$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
					If (PRD_l_FilterNLA=1)
						QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
					Else 
						QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
					End if 
				End if 
				SelOr_2(->[PRODUCTS:9])
				If (((Records in selection:C76([PRODUCTS:9])=0) | ((<>SelOr) & (vAutoFind=False:C215))) & ((DB_GetProductGroupBrand) | (DB_Get_ProductBrandPref)))
					
					Sel_NoAtAt(->[PRODUCTS:9]; ->[PRODUCTS:9]Model_Code:5; $1; $_t_SearchwithAt)
					$_bo_Retry:=False:C215
					$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
					COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
					
					If ($_l_RecordsInSelection=1) & ([PRODUCTS:9]Model_Code:5=$1)
						$_bo_Retry:=True:C214
					End if 
					If (PRD_l_FilterNLA=1)
						QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
					Else 
						QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
					End if 
					If ($_bo_Retry) & (Records in selection:C76([PRODUCTS:9])=0)
						Sel_NoAtAt(->[PRODUCTS:9]; ->[PRODUCTS:9]Model_Code:5; $1; $_t_SearchwithAt; False:C215)
						
						
						$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
						COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
						If (PRD_l_FilterNLA=1)
							QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
						Else 
							QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
						End if 
					End if 
					SelOr_2(->[PRODUCTS:9])
				End if 
				If ((Records in selection:C76([PRODUCTS:9])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
					
					QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Name:2=$_t_SearchwithAt)
					$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
					COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
					If (PRD_l_FilterNLA=1)
						QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
					Else 
						QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
					End if 
					If (Records in selection:C76([PRODUCTS:9])=0)
						If (Count parameters:C259>1)
							QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Name:2=$2+$_t_SearchwithAt)
							COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
							
							If (PRD_l_FilterNLA=1)
								QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
							Else 
								QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
							End if 
							If (Records in selection:C76([PRODUCTS:9])=0) & (Count parameters:C259>1)
								QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Name:2="@"+$2+$_t_SearchwithAt)
								COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
								
								If (PRD_l_FilterNLA=1)
									QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
								Else 
									QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
								End if 
							End if 
						Else 
							//QUERY([PRODUCTS];[PRODUCTS]Product Name="@"+$_t_SearchwithAt)
						End if 
					End if 
					COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
					
					If (PRD_l_FilterNLA=1)
						QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
					Else 
						QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
					End if 
					SelOr_2(->[PRODUCTS:9])
					If ((Records in selection:C76([PRODUCTS:9])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
						If (Count parameters:C259>=3)
							If ($3)
								Sel_NoAtAt(->[PRODUCTS_SUPPLIERS:148]; ->[PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4; $1; $_t_SearchwithAt)
								SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
								QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
								$_bo_Retry:=False:C215
								$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
								COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
								
								If ($_l_RecordsInSelection=1) & ([PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4=$1)
									$_bo_Retry:=True:C214
								End if 
								If (PRD_l_FilterNLA=1)
									QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
								Else 
									QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
								End if 
								If ($_bo_Retry) & (Records in selection:C76([PRODUCTS:9])=0)
									Sel_NoAtAt(->[PRODUCTS_SUPPLIERS:148]; ->[PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4; $1; $_t_SearchwithAt; False:C215)
									SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
									QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
									$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
									COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
									If (PRD_l_FilterNLA=1)
										QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
									Else 
										QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
									End if 
								End if 
								
								SelOr_2(->[PRODUCTS:9])
								
							End if 
						Else 
							Sel_NoAtAt(->[PRODUCTS_SUPPLIERS:148]; ->[PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4; $1; $_t_SearchwithAt)
							SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
							QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
							$_bo_Retry:=False:C215
							$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
							COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
							
							If ($_l_RecordsInSelection=1) & ([PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4=$1)
								$_bo_Retry:=True:C214
							End if 
							If (PRD_l_FilterNLA=1)
								QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
							Else 
								QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
							End if 
							If ($_bo_Retry) & (Records in selection:C76([PRODUCTS:9])=0)
								Sel_NoAtAt(->[PRODUCTS_SUPPLIERS:148]; ->[PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4; $1; $_t_SearchwithAt; False:C215)
								SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
								QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
								$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
								COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
								If (PRD_l_FilterNLA=1)
									QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
								Else 
									QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
								End if 
							End if 
							
							SelOr_2(->[PRODUCTS:9])
						End if 
						
						If ((Records in selection:C76([PRODUCTS:9])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
							If (Count parameters:C259>=3)
								If ($3)
									Sel_NoAtAt(->[PRODUCTS_SUPPLIERS:148]; ->[PRODUCTS_SUPPLIERS:148]Company_Code:1; $1; $_t_SearchwithAt)
									SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
									QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
									$_bo_Retry:=False:C215
									$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
									COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
									
									If ($_l_RecordsInSelection=1) & ([PRODUCTS_SUPPLIERS:148]Company_Code:1=$1)
										$_bo_Retry:=True:C214
									End if 
									
									If (PRD_l_FilterNLA=1)
										QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
									Else 
										QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
									End if 
									If ($_bo_Retry) & (Records in selection:C76([PRODUCTS:9])=0)
										Sel_NoAtAt(->[PRODUCTS_SUPPLIERS:148]; ->[PRODUCTS_SUPPLIERS:148]Company_Code:1; $1; $_t_SearchwithAt; False:C215)
										SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
										QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
										$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
										COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
										If (PRD_l_FilterNLA=1)
											QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
										Else 
											QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
										End if 
									End if 
									If (<>SYS_bo_PRDFurtherAnalSearch)
										SelOr_2(->[PRODUCTS:9])
										If ((Records in selection:C76([PRODUCTS:9])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
											QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2=$_t_SearchwithAt)
											Join_SelFast(->[CONTRACT_RECORD_ANALYSIS:88]; ->[CONTRACT_RECORD_ANALYSIS:88]Unique_code:1; ->[PRODUCTS:9]; ->[PRODUCTS:9]Product_Code:1; 2)
											$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
											COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
											If (PRD_l_FilterNLA=1)
												QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
											Else 
												QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
											End if 
											SelOr_3(->[PRODUCTS:9])
										End if 
									Else 
										SelOr_3(->[PRODUCTS:9])
									End if 
								Else 
									SelOr_3(->[PRODUCTS:9])
								End if 
							Else 
								Sel_NoAtAt(->[PRODUCTS_SUPPLIERS:148]; ->[PRODUCTS_SUPPLIERS:148]Company_Code:1; $1; $_t_SearchwithAt)
								SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
								QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
								$_bo_Retry:=False:C215
								$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
								COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
								
								If ($_l_RecordsInSelection=1) & ([PRODUCTS_SUPPLIERS:148]Company_Code:1=$1)
									$_bo_Retry:=True:C214
								End if 
								If (PRD_l_FilterNLA=1)
									QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
								Else 
									QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
								End if 
								If ($_bo_Retry) & (Records in selection:C76([PRODUCTS:9])=0)
									Sel_NoAtAt(->[PRODUCTS_SUPPLIERS:148]; ->[PRODUCTS_SUPPLIERS:148]Company_Code:1; $1; $_t_SearchwithAt; False:C215)
									SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
									QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
									$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
									COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
									If (PRD_l_FilterNLA=1)
										QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
									Else 
										QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
									End if 
								End if 
								If (<>SYS_bo_PRDFurtherAnalSearch)
									SelOr_2(->[PRODUCTS:9])
									If ((Records in selection:C76([PRODUCTS:9])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
										QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2=$_t_SearchwithAt)
										Join_SelFast(->[CONTRACT_RECORD_ANALYSIS:88]; ->[CONTRACT_RECORD_ANALYSIS:88]Unique_code:1; ->[PRODUCTS:9]; ->[PRODUCTS:9]Product_Code:1; 2)
										
										COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
										If (PRD_l_FilterNLA=1)
											QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
										Else 
											QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
										End if 
										SelOr_3(->[PRODUCTS:9])
									End if 
								Else 
									SelOr_3(->[PRODUCTS:9])
								End if 
								
							End if 
							
						End if 
					End if 
				End if 
			End if 
			
	End case 
End if 
ERR_MethodTrackerReturn("Prod_Sel2"; $_t_oldMethodName)
