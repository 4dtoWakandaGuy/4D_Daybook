//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_UPDATEPRODUCTSERVER
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:      01/08/2011 17:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ProductManagerProcessed; 0)
	ARRAY DATE:C224($_ad_Dates; 0)
	ARRAY REAL:C219($_ar_SalesAmount; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	//ARRAY TEXT(STK_at_SendProductCodes;0)
	C_BOOLEAN:C305($_bo_Complete; $_bo_UnprocessedProducts; $_bo_UnprocessedProducts2; $_bo_UnprocessedProducts3; STK_bo_DataReading; STK_bo_ProductserverIdle)
	C_LONGINT:C283($_l_Finish; $_l_Index; $_l_MessageCounter; $_l_ProductRow; $_l_Retries; STK_l_MaxElements; STK_l_ProdCallBackProcess)
	C_REAL:C285($_r_Quantity)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_UPDATEPRODUCTSERVER")
//Open window(10;Screen height-200;300;Screen height-100;-Palette window )
$_l_Retries:=0
While (Semaphore:C143("◊ServerControl"))
	//GOTO XY(0;0)
	//MESSAGE("Waiting for semaphore  "+"◊ServerControl"+String($_l_Retries))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(30+$_l_Retries)
End while 
READ ONLY:C145(*)

ALL RECORDS:C47([PRODUCTS:9])
CREATE SET:C116([PRODUCTS:9]; "$s1")
QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59=False:C215; *)
QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Product_Code:1#""; *)
QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Stock_Account:42="13010")
CREATE SET:C116([PRODUCTS:9]; "$s2")
$_bo_UnprocessedProducts:=(Records in selection:C76([PRODUCTS:9])>0)
QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59=False:C215; *)
QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Product_Code:1#""; *)
QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Stock_Account:42="13011")
CREATE SET:C116([PRODUCTS:9]; "$s3")
$_bo_UnprocessedProducts2:=(Records in selection:C76([PRODUCTS:9])>0)
QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59=False:C215; *)
QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Product_Code:1#""; *)
QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Stock_Account:42="13014")
CREATE SET:C116([PRODUCTS:9]; "$s4")
$_bo_UnprocessedProducts3:=(Records in selection:C76([PRODUCTS:9])>0)
If (Not:C34($_bo_UnprocessedProducts)) & (Not:C34($_bo_UnprocessedProducts2)) & (Not:C34($_bo_UnprocessedProducts3))
	
	READ WRITE:C146([PRODUCTS:9])
	QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59=False:C215)
	APPLY TO SELECTION:C70([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59:=True:C214)
	UNLOAD RECORD:C212([PRODUCTS:9])
	READ ONLY:C145([PRODUCTS:9])
	
End if 
STK_bo_ProductserverIdle:=True:C214
CLEAR SEMAPHORE:C144("◊ServerControl")
DelayTicks(2)
STK_bo_DataReading:=True:C214
Repeat 
	QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59=False:C215; *)
	QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Product_Code:1#""; *)
	QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Stock_Account:42="13010")
	If (Records in selection:C76([PRODUCTS:9])=0)
		If ($_bo_UnprocessedProducts)
			//ALERT("13010 completed")
			$_bo_UnprocessedProducts:=False:C215
		End if 
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59=False:C215; *)
		QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Product_Code:1#""; *)
		QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Stock_Account:42="13011")
		If (Records in selection:C76([PRODUCTS:9])=0)
			If ($_bo_UnprocessedProducts2)
				//ALERT("13011 completed")
				$_bo_UnprocessedProducts2:=False:C215
			End if 
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59=False:C215; *)
			QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Product_Code:1#""; *)
			QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Stock_Account:42="13014")
			If (Records in selection:C76([PRODUCTS:9])=0)
				If ($_bo_UnprocessedProducts3)
					//ALERT("13014 completed")
					$_bo_UnprocessedProducts3:=False:C215
				End if 
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59=False:C215; *)
				QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Product_Code:1#"")
			End if 
		End if 
	End if 
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	ARRAY REAL:C219($_ar_SalesAmount; 0)
	ARRAY DATE:C224($_ad_Dates; 0)
	
	If (Records in selection:C76([PRODUCTS:9])>0)
		DISTINCT VALUES:C339([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
		
		If (Size of array:C274($_at_ProductCodes)>1000)
			ARRAY TEXT:C222($_at_ProductCodes; 100)
		End if 
		ARRAY REAL:C219($_ar_SalesAmount; Size of array:C274($_at_ProductCodes))
		ARRAY DATE:C224($_ad_Dates; Size of array:C274($_at_ProductCodes))
		READ ONLY:C145([ORDERS:24])
		READ ONLY:C145([ORDER_ITEMS:25])
		QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Product_Code:2; $_at_ProductCodes)
		ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2; >)
		$_l_MessageCounter:=0
		For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
			$_l_MessageCounter:=$_l_MessageCounter+1
			If (Application type:C494=4D Server:K5:6) & ($_l_MessageCounter=100)
				//GOTO XY(0;0)
				//MESSAGE("GATHERING DATA ON SALES "+String($_l_Index)+" OF "+(String(Records in selection([ORDER ITEMS])))+" ORDERS")
				$_l_MessageCounter:=0
			End if 
			$_r_Quantity:=[ORDER_ITEMS:25]Quantity:3
			$_l_ProductRow:=Find in array:C230($_at_ProductCodes; [ORDER_ITEMS:25]Product_Code:2)
			If ($_l_ProductRow>0)  //it should be
				$_ar_SalesAmount{$_l_ProductRow}:=$_ar_SalesAmount{$_l_ProductRow}+$_r_Quantity
				QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
				
				If ($_ad_Dates{$_l_ProductRow}<[ORDERS:24]SORT_Date:57)
					$_ad_Dates{$_l_ProductRow}:=[ORDERS:24]SORT_Date:57
				End if 
			End if 
			NEXT RECORD:C51([ORDER_ITEMS:25])
		End for 
		$_bo_Complete:=False:C215
	Else 
		$_bo_Complete:=True:C214
	End if 
	SORT ARRAY:C229($_ad_Dates; $_ar_SalesAmount; $_at_ProductCodes; <)
	If (Application type:C494=4D Server:K5:6)
		If (Size of array:C274($_at_ProductCodes)>600)
			ARRAY TEXT:C222($_at_ProductCodes; 600)
			ARRAY REAL:C219($_ar_SalesAmount; 600)
			ARRAY DATE:C224($_ad_Dates; 600)
		End if 
	Else 
		If (Size of array:C274($_at_ProductCodes)>300)
			ARRAY TEXT:C222($_at_ProductCodes; 300)
			ARRAY REAL:C219($_ar_SalesAmount; 300)
			ARRAY DATE:C224($_ad_Dates; 300)
		End if 
	End if 
	SORT ARRAY:C229($_ar_SalesAmount; $_ad_Dates; $_at_ProductCodes; <)
	ARRAY BOOLEAN:C223($_abo_ProductManagerProcessed; 0)
	ARRAY BOOLEAN:C223($_abo_ProductManagerProcessed; Size of array:C274($_at_ProductCodes))
	$_l_ProductRow:=0
	Repeat 
		
		If (Not:C34($_bo_Complete))
			
			STK_bo_DataReading:=True:C214
			While (STK_bo_ProductserverIdle)
				DelayTicks(30*60)
			End while 
			
			$_l_ProductRow:=Find in array:C230($_abo_ProductManagerProcessed; False:C215)
			If ($_l_ProductRow<(Size of array:C274($_abo_ProductManagerProcessed)-10)) & ($_l_ProductRow>0)
				
				$_l_Finish:=$_l_ProductRow+10
			Else 
				
				$_l_Finish:=Size of array:C274($_abo_ProductManagerProcessed)
			End if 
			ARRAY TEXT:C222(STK_at_SendProductCodes; 0)
			For ($_l_Index; $_l_ProductRow; $_l_Finish)
				APPEND TO ARRAY:C911(STK_at_SendProductCodes; $_at_ProductCodes{$_l_Index})
				$_abo_ProductManagerProcessed{$_l_Index}:=True:C214
			End for 
			If (STK_l_ProdCallBackProcess>0)
				STK_l_MaxElements:=Size of array:C274(STK_at_SendProductCodes)
				STK_bo_DataReading:=False:C215
				//Open window(10;Screen height-200;300;Screen height-100;-Palette window )
				$_l_Retries:=0
				While (Test semaphore:C652("◊ClientControl"))
					//GOTO XY(0;0)
					//MESSAGE("Waiting for semaphore  "+"◊ClientControl"+String($_l_Retries))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(2+$_l_Retries)
				End while 
				//We cannot use the following to pass the array to a client
				
				//VARIABLE TO VARIABLE(STK_l_ProdCallBackProcess;STK_at_ProductCodes;STK_at_SendProductCodes)
				
			End if 
			STK_l_ProdCallBackProcess:=0
			STK_bo_ProductserverIdle:=True:C214
			$_l_ProductRow:=Find in array:C230($_abo_ProductManagerProcessed; False:C215)
		End if 
	Until ($_l_ProductRow<0) | ($_bo_Complete)
	
	
Until (Size of array:C274($_at_ProductCodes)=0) | ($_bo_Complete)
ERR_MethodTrackerReturn("STK_UPDATEPRODUCTSERVER"; $_t_oldMethodName)
