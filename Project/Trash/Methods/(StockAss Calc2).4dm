//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockAss_Calc2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2010 14:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(aApptO;0)
	ARRAY REAL:C219($_ar_Quantities; 0)
	//ARRAY REAL(SRAmount;0)
	//ARRAY REAL(SRPrice;0)
	//ARRAY REAL(SRRate;0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	//ARRAY TEXT(SRDesc;0)
	//ARRAY TEXT(SRQtyT;0)
	//ARRAY TEXT(SRSerial;0)
	C_LONGINT:C283($_l_ComponentIndex; $_l_CountRecordsComponents; $_l_Level; $_l_SizeofArray; $_l_SizeofArraySerials; $_r_Number; $_r_SumFreeLevel; $0; vStockLevel)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss_Calc2")
$0:=99999999
$_l_CountRecordsComponents:=Records in selection:C76([COMPONENTS:86])
ARRAY TEXT:C222($_at_ProductCodes; $_l_CountRecordsComponents)
ARRAY REAL:C219($_ar_Quantities; $_l_CountRecordsComponents)
SELECTION TO ARRAY:C260([COMPONENTS:86]Component_Code:2; $_at_ProductCodes; [COMPONENTS:86]Quantity:3; $_ar_Quantities)
If (DB_t_CurrentFormUsage="Display")
	$_l_SizeofArraySerials:=Size of array:C274(SRSerial)
End if 
$_l_ComponentIndex:=1

While (($_l_ComponentIndex<=$_l_CountRecordsComponents) & (($0>0) | (DB_t_CurrentFormUsage="Display")))
	
	QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_at_ProductCodes{$_l_ComponentIndex}; *)
	QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=[MOVEMENT_TYPES:60]Stock_Minus:4; *)
	StockLev_ACLSr
	$_r_SumFreeLevel:=Sum:C1([STOCK_LEVELS:58]Free_Level:3)
	If (($_ar_Quantities{$_l_ComponentIndex}#0) & ($_r_SumFreeLevel#0))
		$_l_Level:=Int:C8($_r_SumFreeLevel/$_ar_Quantities{$_l_ComponentIndex})
	Else 
		$_l_Level:=0
	End if 
	
	If (DB_t_CurrentFormUsage="Display")  //see also StockAss_CalSer
		$_l_SizeofArray:=Size of array:C274(SRSerial)+1
		INSERT IN ARRAY:C227(SRSerial; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227(SRDesc; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227(SRQtyT; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227(SRPrice; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227(SRRate; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227(SRAmount; $_l_SizeofArray; 1)
		
		INSERT IN ARRAY:C227(aApptO; $_l_SizeofArray; 1)
		SRSerial{$_l_SizeofArray}:=Substring:C12(("  "*vStockLevel)+$_at_ProductCodes{$_l_ComponentIndex}; 1; 41)
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_at_ProductCodes{$_l_ComponentIndex})
		SRDesc{$_l_SizeofArray}:=Substring:C12([PRODUCTS:9]Product_Name:2; 1; 65)
		SRQtyT{$_l_SizeofArray}:=String:C10(vStockLevel)
		SRPrice{$_l_SizeofArray}:=$_ar_Quantities{$_l_ComponentIndex}
		SRRate{$_l_SizeofArray}:=$_r_SumFreeLevel
	End if 
	
	If ((vStockLevel<[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13) & (vStockLevel<10))
		QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=$_at_ProductCodes{$_l_ComponentIndex})
		If (Records in selection:C76([COMPONENTS:86])>0)
			vStockLevel:=vStockLevel+1
			$_r_Number:=StockAss_Calc2
			$_r_Number:=Int:C8($_r_Number/$_ar_Quantities{$_l_ComponentIndex})
			$_l_Level:=$_l_Level+$_r_Number
			vStockLevel:=vStockLevel-1
		Else 
			If (DB_t_CurrentFormUsage="Display")
				SRAmount{$_l_SizeofArray}:=0
				aApptO{$_l_SizeofArray}:=SRRate{$_l_SizeofArray}
			End if 
		End if 
	Else 
		If (DB_t_CurrentFormUsage="Display")
			SRAmount{$_l_SizeofArray}:=0
			aApptO{$_l_SizeofArray}:=SRRate{$_l_SizeofArray}
		End if 
	End if 
	
	If ($_l_Level<$0)
		$0:=$_l_Level
	End if 
	
	$_l_ComponentIndex:=$_l_ComponentIndex+1
End while 

If ($0=99999999)
	$0:=0
End if 
If (DB_t_CurrentFormUsage="Display")
	SRAmount{$_l_SizeofArraySerials}:=$0
	aApptO{$_l_SizeofArraySerials}:=SRRate{$_l_SizeofArraySerials}+SRAmount{$_l_SizeofArraySerials}
End if 
ERR_MethodTrackerReturn("StockAss_Calc2"; $_t_oldMethodName)
