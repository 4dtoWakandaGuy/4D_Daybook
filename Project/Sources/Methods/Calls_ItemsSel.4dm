//%attributes = {}
If (False:C215)
	//Project Method Name:      Calls_ItemsSel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>ProdCode; $_t_oldMethodName; vCompCode; vCompName; vContrCode; vContType; vItemCode; vProdCode; vProduct; vSerialNo; vStage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_ItemsSel")
//Calls_ItemsSel
If (vProdCode#"")
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=Num:C11(vItemCode))
	RELATE ONE:C42([ORDER_ITEMS:25]Contract_Code:29)
	RELATE ONE:C42([CONTRACTS:17]Contract_Type_Code:4)
	RELATE ONE:C42([CONTRACTS:17]Company_Code:1)
	vCompCode:=[CONTRACTS:17]Company_Code:1
	vCompName:=[COMPANIES:2]Company_Name:2
	vContType:=[CONTRACT_TYPES:19]Contract_Type_Name:2
	If (([CONTRACT_TYPES:19]Priority:5<[SERVICE_CALLS:20]Priority:10) | ([SERVICE_CALLS:20]Priority:10=""))
		[SERVICE_CALLS:20]Priority:10:=[CONTRACT_TYPES:19]Priority:5
	End if 
	vContrCode:=[CONTRACTS:17]Contract_Code:3
	Calls_ContCharg
	QUERY:C277([SERVICE_CALLS_PRODUCTS:152]; [SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8=[SERVICE_CALLS:20]Call_Code:4)
	If (vSerialNo="")
		QUERY SELECTION:C341([SERVICE_CALLS_PRODUCTS:152]; [SERVICE_CALLS_PRODUCTS:152]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2; *)
		QUERY SELECTION:C341([SERVICE_CALLS_PRODUCTS:152];  & ; [SERVICE_CALLS_PRODUCTS:152]Product_Name:5=[ORDER_ITEMS:25]Product_Name:13)
		
	Else 
		QUERY SELECTION:C341([SERVICE_CALLS_PRODUCTS:152]; [SERVICE_CALLS_PRODUCTS:152]Serial_Number:2=vSerialNo)
		
	End if 
	If (Records in selection:C76([SERVICE_CALLS_PRODUCTS:152])=0)
		CREATE RECORD:C68([SERVICE_CALLS_PRODUCTS:152])
		[SERVICE_CALLS_PRODUCTS:152]ID:7:=AA_GetNextID(->[SERVICE_CALLS_PRODUCTS:152]ID:7)
		[SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8:=[SERVICE_CALLS:20]Call_Code:4
		[SERVICE_CALLS_PRODUCTS:152]Product_Code:1:=[ORDER_ITEMS:25]Product_Code:2
		<>ProdCode:=[ORDER_ITEMS:25]Product_Code:2
		vProduct:=vProdCode
		[SERVICE_CALLS_PRODUCTS:152]Product_Name:5:=[ORDER_ITEMS:25]Product_Name:13
		[SERVICE_CALLS_PRODUCTS:152]Serial_Number:2:=vSerialNo
		[SERVICE_CALLS_PRODUCTS:152]System:4:=vStage
		[SERVICE_CALLS_PRODUCTS:152]Contract_Code:3:=[ORDER_ITEMS:25]Contract_Code:29
		DB_SaveRecord(->[SERVICE_CALLS_PRODUCTS:152])
		
	Else 
		//NG August 2009--this seems like a nonsense to me..
		If (Records in selection:C76([SERVICE_CALLS_PRODUCTS:152])=1)
			DELETE RECORD:C58([SERVICE_CALLS_PRODUCTS:152])
		End if 
	End if 
	QUERY:C277([SERVICE_CALLS_PRODUCTS:152]; [SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8=[SERVICE_CALLS:20]Call_Code:4)
	
End if 
ERR_MethodTrackerReturn("Calls_ItemsSel"; $_t_oldMethodName)