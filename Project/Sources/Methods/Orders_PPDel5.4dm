//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_PPDel5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/06/2012 14:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>DB_bo_NewStockActive; <>SYS_bo_OrderItemPartDelivery)
	C_DATE:C307($_d_DeliveryDateOLD; $1; vDelDate; vDoDateF)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName; vNumber)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPDel5")
If (<>DB_bo_NewStockActive)
	If (Count parameters:C259>=1)
		Orders_PPDel5_2009($1)
	Else 
		Orders_PPDel5_2009
	End if 
	
Else 
	If (Count parameters:C259>=1)
		$_d_DeliveryDateOLD:=$1
	Else 
		$_d_DeliveryDateOLD:=vDoDateF
	End if 
	
	If (OK=1)
		CUT NAMED SELECTION:C334([ORDERS:24]; "PPOrd")
		If ($_d_DeliveryDateOLD=!00-00-00!)
			COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "PPDel5")
			If ($_d_DeliveryDateOLD>!00-00-00!)
				QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11=!00-00-00!)
			Else   //the items wont be !00/00/00! anymo
			End if 
			
			If (<>SYS_bo_OrderItemPartDelivery)
				If (Not:C34(In transaction:C397))
					DB_lockFile(->[ORDER_ITEMS:25])
					APPLY TO SELECTION:C70([ORDER_ITEMS:25]; Orders_PartAppl("D"))
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
				Else 
					FIRST RECORD:C50([ORDER_ITEMS:25])
					For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
						Orders_PartAppl("D")
						DB_SaveRecord(->[ORDER_ITEMS:25])
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
						NEXT RECORD:C51([ORDER_ITEMS:25])
					End for 
				End if 
				
			Else 
				If (Not:C34(In transaction:C397))
					DB_lockFile(->[ORDER_ITEMS:25])
					APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11:=vDelDate)
					APPLY TO SELECTION:C70([ORDER_ITEMS:25]; ORDI_setDelivered)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
				Else 
					FIRST RECORD:C50([ORDER_ITEMS:25])
					For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
						[ORDER_ITEMS:25]Delivery_Date:11:=VDelDate
						ORDI_setDelivered
						DB_SaveRecord(->[ORDER_ITEMS:25])
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
						NEXT RECORD:C51([ORDER_ITEMS:25])
					End for 
				End if 
			End if 
			USE NAMED SELECTION:C332("PPDel5")
			CLEAR NAMED SELECTION:C333("PPDel5")
		End if 
		If (Not:C34(In transaction:C397))
			DB_lockFile(->[ORDER_ITEMS:25])
			APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Number:49:=vNumber)
			APPLY TO SELECTION:C70([ORDER_ITEMS:25]; ORDI_setDelivered)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
		Else 
			FIRST RECORD:C50([ORDER_ITEMS:25])
			For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
				[ORDER_ITEMS:25]Delivery_Number:49:=vNumber
				ORDI_setDelivered
				DB_SaveRecord(->[ORDER_ITEMS:25])
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
				NEXT RECORD:C51([ORDER_ITEMS:25])
			End for 
		End if 
		
		USE NAMED SELECTION:C332("PPOrd")
	End if 
	
End if 
ERR_MethodTrackerReturn("Orders_PPDel5"; $_t_oldMethodName)
