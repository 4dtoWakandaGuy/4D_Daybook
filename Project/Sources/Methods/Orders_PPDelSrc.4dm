//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_PPDelSrc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 15:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_OrderItemPartDelivery)
	C_DATE:C307($_d_DeliveryDate; $2; vDoDateF)
	C_TEXT:C284($_t_CurrentFormUsage2; $_t_oldMethodName; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPDelSrc")
If (Count parameters:C259>=1)
	$_t_CurrentFormUsage2:=$1
Else 
	$_t_CurrentFormUsage2:=DB_t_CurrentFormUsage2
End if 
If (Count parameters:C259>=2)
	$_d_DeliveryDate:=$2
Else 
	$_d_DeliveryDate:=vDoDateF
End if 

QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11=$_d_DeliveryDate)
If ($_t_CurrentFormUsage2="Alloc")
	// SEARCH SELECTION([ORDER ITEMS];[ORDER ITEMS]Allocated>0)
	QUERY SELECTION BY FORMULA:C207([ORDER_ITEMS:25]; OrderI_AllocSrc)
End if 
If ((<>SYS_bo_OrderItemPartDelivery) & ($_d_DeliveryDate=!00-00-00!))
	QUERY SELECTION BY FORMULA:C207([ORDER_ITEMS:25]; Orders_PartSrc("D"))
End if 
OrderI_Level0
ERR_MethodTrackerReturn("Orders_PPDelSrc"; $_t_oldMethodName)
