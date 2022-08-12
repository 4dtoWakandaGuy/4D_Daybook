//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_PPDel5_2009
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/06/2012 14:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_OrderItemPartDelivery; $_bo_Reprint)
	C_DATE:C307($_d_DeliveredDate; $_d_DeliveryDateOLD; $1; vDelDate; vDoDateF)
	C_LONGINT:C283($_l_Index; $_l_OrderItemRow)
	C_POINTER:C301($2; $3)
	C_TEXT:C284($_t_oldMethodName; vNumber)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPDel5_2009")

If (Count parameters:C259>=1)
	$_d_DeliveredDate:=$1
Else 
	$_d_DeliveredDate:=vDelDate
End if 
//If (Count parameters>2)

If (Count parameters:C259>=2)
	//$_bo_Reprint:=$2
Else 
	$_bo_Reprint:=False:C215
End if 
If (OK=1)
	CUT NAMED SELECTION:C334([ORDERS:24]; "PPOrd")
	COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "PPDel5")
	If (vDoDateF#!00-00-00!) & (False:C215)  //this section was for reprinting  `the date we printed was is to be set on the order items with a date already.
		COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "PPDel5")
		If ($_d_DeliveryDateOLD#!2001-01-01!)  //This is only set to this when we are changing the delivery date on the items and there are multiple dates
			//QUERY SELECTION([ORDER ITEMS];[ORDER ITEMS]Delivery Date=$_d_DeliveryDateOLD)
			
			
		End if 
		
		If (<>SYS_bo_OrderItemPartDelivery)
			If (Not:C34(In transaction:C397))
				
				DB_lockFile(->[ORDER_ITEMS:25])
				
				APPLY TO SELECTION:C70([ORDER_ITEMS:25]; Orders_PartAppl("D"; $_d_DeliveredDate))
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
				
				
			End if 
		Else 
			
			FIRST RECORD:C50([ORDER_ITEMS:25])
			For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
				Orders_PartAppl("D"; $_d_DeliveredDate)
				DB_SaveRecord(->[ORDER_ITEMS:25])
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
				NEXT RECORD:C51([ORDER_ITEMS:25])
			End for 
			
		End if 
		
	Else 
		If (Not:C34(In transaction:C397))
			
			DB_lockFile(->[ORDER_ITEMS:25])
			APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11:=$_d_DeliveredDate)
			FIRST RECORD:C50([ORDER_ITEMS:25])
			APPLY TO SELECTION:C70([ORDER_ITEMS:25]; ORDI_setDelivered)  //NG This is a change to the current system
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
			
		Else 
			
			FIRST RECORD:C50([ORDER_ITEMS:25])
			For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
				[ORDER_ITEMS:25]Delivery_Date:11:=$_d_DeliveredDate
				ORDI_setDelivered  //this is a change to the current system
				DB_SaveRecord(->[ORDER_ITEMS:25])
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
				NEXT RECORD:C51([ORDER_ITEMS:25])
			End for 
		End if 
		
	End if 
	USE NAMED SELECTION:C332("PPDel5")
	CLEAR NAMED SELECTION:C333("PPDel5")
	
	If (Not:C34(In transaction:C397)) & (Count parameters:C259<3)
		DB_lockFile(->[ORDER_ITEMS:25])
		FIRST RECORD:C50([ORDER_ITEMS:25])
		APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Number:49:=vNumber)
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
	Else 
		FIRST RECORD:C50([ORDER_ITEMS:25])
		For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
			If (Count parameters:C259<3)
				[ORDER_ITEMS:25]Delivery_Number:49:=vNumber
			Else 
				$_l_OrderItemRow:=Find in array:C230($3->; [ORDER_ITEMS:25]Item_Number:27)
				If ($_l_OrderItemRow<0)
					[ORDER_ITEMS:25]Delivery_Number:49:=vNumber
				Else 
					If ($2->{$_l_OrderItemRow}="")
						[ORDER_ITEMS:25]Delivery_Number:49:=vNumber
					Else 
						[ORDER_ITEMS:25]Delivery_Number:49:=$2->{$_l_OrderItemRow}
					End if 
					
				End if 
			End if 
			
			DB_SaveRecord(->[ORDER_ITEMS:25])
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
			NEXT RECORD:C51([ORDER_ITEMS:25])
		End for 
	End if 
	
	USE NAMED SELECTION:C332("PPOrd")
End if 
ERR_MethodTrackerReturn("Orders_PPDel5_2009"; $_t_oldMethodName)
