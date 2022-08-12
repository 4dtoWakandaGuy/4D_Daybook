//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI AllocSrc
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
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_GetAllocationProcess; ORD_l_SubAllocation)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI AllocSrc")
If ([ORDER_ITEMS:25]Allocated:28>0)
	$0:=True:C214
Else 
	
	If ([ORDER_ITEMS:25]Product_Code:2#[PRODUCTS:9]Product_Code:1)
		RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
	End if 
	If ([ORDER_ITEMS:25]Purchase_Order_Number:18="BUNDLE*") | ([ORDER_ITEMS:25]Purchase_Order_Number:18="ASSEMBLY*")
		//We need to get the allocatedstatus of the sub items not this one
		ORD_l_SubAllocation:=-1
		//because we are in a query by formula and need to test the status of each (SUB)order item this will need to be done in a seperate process
		$_l_GetAllocationProcess:=New process:C317("ORD_GetSubLevelAllocation"; 64000; "GetAllocations"; [ORDER_ITEMS:25]Order_Code:1; [ORDER_ITEMS:25]Item_Number:27; Current process:C322)
		Repeat 
			DelayTicks(2)
		Until (ORD_l_SubAllocation>=0)
		$0:=(ORD_l_SubAllocation=1)
		ORD_l_SubAllocation:=0
	Else 
		$0:=([PRODUCTS:9]Maintain_Stock:14=False:C215)
	End if 
	
End if 
ERR_MethodTrackerReturn("OrderI AllocSrc"; $_t_oldMethodName)
