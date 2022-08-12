//%attributes = {}
If (False:C215)
	//Project Method Name:      PG_LoadPGoptions
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
	//ARRAY LONGINT(PG_al_PriceGroupClass;0)
	//ARRAY TEXT(PG_at_PriceGroupClass;0)
	//ARRAY TEXT(PG_at_PriceGroupClassShort;0)
	C_LONGINT:C283($_l_Index; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PG_LoadPGoptions")

Case of 
	: ($1=Table:C252(->[PURCHASE_ORDERS:57]))
		//related to Purchase Orders
		ARRAY TEXT:C222(PG_at_PriceGroupClass; 20)
		ARRAY LONGINT:C221(PG_al_PriceGroupClass; 20)
		For ($_l_Index; 1; 21)
			PG_al_PriceGroupClass{$_l_Index}:=100+$_l_Index
		End for 
		PG_at_PriceGroupClass{1}:="CostPrice to apply to a product"  //currency optional(no supplier
		PG_at_PriceGroupClass{2}:="Cost Price to apply to a product for a currency"
		PG_at_PriceGroupClass{3}:="CostPrice apply to a product for a quantity"+"(Default Currency, Default Supplier)"
		PG_at_PriceGroupClass{4}:="Discount off cost to apply to a product for a quantity"+"(Default Currency, DefaultSupplier)"
		PG_at_PriceGroupClass{5}:="Discount off cost to apply to a product for a quantity"+"(for a currency, Default Supplier)"
		PG_at_PriceGroupClass{6}:="Cost Price to apply to a product for  given supplier"
		PG_at_PriceGroupClass{7}:="Discount off cost to apply to a product for a given supplier"
		PG_at_PriceGroupClass{8}:="Cost Price to apply to a quantity of product for  given supplier"
		PG_at_PriceGroupClass{9}:="Discount off cost to apply to a quantity of product for a given supplier"
		PG_at_PriceGroupClass{10}:="Discount off cost to apply to a brand"+" (Default currency, Default Supplier)"
		PG_at_PriceGroupClass{11}:="Discount off cost to apply to a brand"+"  For a currnecy (Default Supplier)"
		PG_at_PriceGroupClass{12}:="Discount off cost to apply to a brand for a quantity of product"+"(Default Currency, Default Supplier)"
		PG_at_PriceGroupClass{13}:="Discount off cost to apply to a brand for a quantity of product"+" for a currency  (Default Supplier)"
		PG_at_PriceGroupClass{14}:="Discount off cost to apply to a brand for a given supplier"
		PG_at_PriceGroupClass{15}:="Discount off cost to apply to a brand"+"  for a currnecy  for a given supplier"
		PG_at_PriceGroupClass{16}:="Discount off cost to apply to a brand for a quantity of product"+"for a given suppier"
		PG_at_PriceGroupClass{17}:="Discount off cost to apply to a brand for a quantity of product"+" for a currency for a given supplier"
		PG_at_PriceGroupClass{18}:="Discount off cost to apply to a product Group for a given supplier"
		PG_at_PriceGroupClass{19}:="Discount off cost to apply to a product Group"+"  for a currnecy  for a given supplier"
		PG_at_PriceGroupClass{20}:="Discount off cost to apply to a product Group"+" for a quantity of product"+"for a given suppier"
		PG_at_PriceGroupClass{21}:="Discount off cost to apply to a product Group"+"  for a quantity of product"+" for a currency for a given supplier"
	: ($1=Table:C252(->[ORDERS:24]))
		ARRAY TEXT:C222(PG_at_PriceGroupClass; 29)
		ARRAY TEXT:C222(PG_at_PriceGroupClassShort; 29)
		ARRAY LONGINT:C221(PG_al_PriceGroupClass; 29)
		For ($_l_Index; 1; 22)
			PG_al_PriceGroupClass{$_l_Index}:=$_l_Index
		End for 
		PG_at_PriceGroupClass{1}:="Standard Pricing"
		PG_at_PriceGroupClassShort{1}:="Standard Pricing"
		//currency optionalproductmandatory(no company,quantity,catalogue,brand,group)
		PG_at_PriceGroupClass{2}:="Sales Price"
		PG_at_PriceGroupClassShort{2}:="Sales Price"
		//currency optionalProduct mandatory(no company,quantity,catalogue,brand,group)
		PG_at_PriceGroupClass{3}:="Catalogue sales Discount"
		PG_at_PriceGroupClassShort{3}:="Catalogue sales Discount"
		//currency mandatory(no company,quantity,product,brand,group)
		PG_at_PriceGroupClass{4}:="Catalogue sales Pricing"
		PG_at_PriceGroupClassShort{4}:="Catalogue sales Pricing"
		//currency mandatoryProduct mandatory(no company,quantity,brand,group)
		PG_at_PriceGroupClass{5}:="Sales Discount for a given currency"
		PG_at_PriceGroupClassShort{5}:="Currency Sales Discount"
		//currency mandatory(no product, company, brand,group,catalogue,quantity)
		PG_at_PriceGroupClass{6}:="Discount to apply to a product for a quantity "
		PG_at_PriceGroupClassShort{6}:="Prod Quantity Sales Discount"
		//currency optional,productmandatory,quantitymandatory
		// (no company,brand,group,catalogue)
		PG_at_PriceGroupClass{7}:="Price to apply to a product for a quantity"
		PG_at_PriceGroupClassShort{7}:="Prod Quantity Sales Price"
		//currency mandatory `Product mandatory(no company, brand,group,catalogue
		PG_at_PriceGroupClass{8}:="Discount to apply to a Brand"
		PG_at_PriceGroupClassShort{8}:="Brand Discount"
		
		//currency optional, brand mandatory(no product,quantity,company,catalogue,group)
		PG_at_PriceGroupClass{9}:="Discount to apply to a Product group "  //currency optional
		PG_at_PriceGroupClassShort{9}:="ProdGroup Discount"
		//currency optional, group mandatory(no product,quantity,company,catalogue,brand)
		PG_at_PriceGroupClass{10}:="Discount to apply to a Brand for a quantity "  //currency optional
		PG_at_PriceGroupClassShort{10}:="Quantity Brand Discount"
		//currency optional, brand mandatory,quantity mandatory
		// (no producty,company,company,catalogue,group)
		PG_at_PriceGroupClass{11}:="Discount to apply to a Prodgroup for a quantity"  //currency optional
		PG_at_PriceGroupClassShort{11}:="Quantity Product Group Discount"
		//currency optional, group mandatory,quantity mandatory
		// (no product,company,company,catalogue,brand)
		PG_at_PriceGroupClass{12}:="Discount to apply to a Brand for a Company"  //currency optional
		PG_at_PriceGroupClassShort{12}:="Company Brand Discount"
		//currency optional, brand mandatory,company mandatory
		// (no producty,quantity,catalogue,group)
		PG_at_PriceGroupClass{13}:="Discount to apply to a Product group for a company"  //currency optional
		PG_at_PriceGroupClassShort{13}:="Company Prodgroup Discount"
		//currency optional, group mandatory,company mandatory
		// (no product,quantity,catalogue,brand)
		PG_at_PriceGroupClass{14}:="Discount to apply to a Brand for a quantity for a company"  //currency optional
		PG_at_PriceGroupClassShort{14}:="Company Brand Qty Discount"
		//currency optional, brand mandatory,company mandatory,quantity mandatory
		// (no product,catalogue,Group)
		PG_at_PriceGroupClass{15}:="Discount to apply to a Product group for a quantity for a company"  //currency optional
		PG_at_PriceGroupClassShort{15}:="Company ProdGroup Qty Discount"
		//currency optional, Group mandatory,company mandatory,quantity mandatory
		// (no product,catalogue,brand)
		PG_at_PriceGroupClass{16}:="Discount off sales price to apply to a specific Product for a Company"  //currency optional
		PG_at_PriceGroupClassShort{16}:="Company Product  Discount"
		//currency optional, Product mandatory,company mandatory
		// (no catalogue,brand,group,quantity)
		PG_at_PriceGroupClass{17}:="Discount off sales price to apply to a quantity of  aProduct for a Company"  //currency optional
		PG_at_PriceGroupClassShort{17}:="Company Product Qty  Discount"
		//currency optional, Product mandatory,company mandatory,quantity mandatory
		// (no,catalogue,brand,group)
		PG_at_PriceGroupClass{18}:="Sales price to apply to a Product for a Company"  //currency optional
		PG_at_PriceGroupClassShort{18}:="Company Product Price"
		//currency optional, Product mandatory,company mandatory
		// (no catalogue,brand,group,quantity)
		PG_at_PriceGroupClass{19}:="Sales price to apply to a quantity of Product for a Company"  //currency optional
		PG_at_PriceGroupClassShort{19}:="Company Product  Qty Price"
		//currency optional, Product mandatory,company mandatory,quantity mandatoy
		// (no catalogue,brand,group)
		PG_at_PriceGroupClass{20}:="Discount to apply to a Brand for a Price Group"  //currency optional
		PG_at_PriceGroupClassShort{20}:="Price group Brand Discount"
		//currency optional, brand mandatory,
		// (no product,quantity,catalogue,group,company)
		PG_at_PriceGroupClass{21}:="Discount to apply to a Product group for a Price Group"  //currency optional
		PG_at_PriceGroupClassShort{21}:="Price Group Product Group Discount"
		//currency optional, group mandatory,
		// (no product,quantity,catalogue,brand,company)
		PG_at_PriceGroupClass{22}:="Discount to apply to a Brand for a quantity for a Price Group"  //currency optional
		PG_at_PriceGroupClassShort{22}:="Price Group Brand Quantity Discount"
		//currency optional, brand mandatory,quantity mandatory
		// (no product,catalogue,Group, no company)
		PG_at_PriceGroupClass{23}:="Discount to apply to a Product group for a quantity for a Price Group"  //currency optional
		PG_at_PriceGroupClassShort{23}:="Price Group Product Group Quantity Discount"
		//currency optional, Group mandatory,quantity mandatory
		// (no product,catalogue,brand,company)
		PG_at_PriceGroupClass{24}:="Discount off sales price to apply to a specific Product for a Price Group"  //currency optional
		PG_at_PriceGroupClassShort{24}:="Price Group Product  Discount"
		//currency optional, Product mandatory,
		// (no catalogue,brand,group,quantity,company)
		PG_at_PriceGroupClass{25}:="Discount off sales price to apply to a quantity of  aProduct for a Price Group"  //currency optional
		PG_at_PriceGroupClassShort{25}:="Price GroupProduct Quantity  Discount"
		//currency optional, Product mandatory,quantity mandatory
		// (no,catalogue,brand,group,company)
		PG_at_PriceGroupClass{26}:="Sales price to apply to a Product for a Price Group"  //currency optional
		PG_at_PriceGroupClassShort{26}:="Price Group Product Price"
		//currency optional, Product mandatory,
		// (no catalogue,brand,group,quantity,company)
		PG_at_PriceGroupClass{27}:="Sales price to apply to a quantity of Product for a Price Group"  //currency optional
		PG_at_PriceGroupClassShort{27}:="Price Group Product  Quantity Price"
		//currency optional, Product mandatory,company mandatory,quantity mandatoy
		// (no catalogue,brand,group)
		PG_at_PriceGroupClass{28}:="General Discount to apply to a Company"  //currency optional
		PG_at_PriceGroupClassShort{28}:="General Company Discount"
		//currency optional, company mandatory,quantity optional
		// (no product,catalogue,brand,group)
		PG_at_PriceGroupClass{29}:="General Discount to apply to a Price Group"  //currency optional
		PG_at_PriceGroupClassShort{29}:="General Price Group Discount "
		//currency optional, quantity optional
		// (no product,catalogue,brand,group,no company)
	Else 
		ARRAY TEXT:C222(PG_at_PriceGroupClass; 0)
		ARRAY LONGINT:C221(PG_al_PriceGroupClass; 0)
		
End case 
ERR_MethodTrackerReturn("PG_LoadPGoptions"; $_t_oldMethodName)
