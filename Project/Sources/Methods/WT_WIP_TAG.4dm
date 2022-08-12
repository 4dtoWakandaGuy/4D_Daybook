//%attributes = {}
If (False:C215)
	//Project Method Name:      WT_WIP_TAG
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WT_WIP_TAG")
//If ([ORDER ITEMS]Invoice No#"")  `Sales Invoice Number is not 'blank'
//[ORDER ITEMS]WT_Tag1:=1
//Else
//[ORDER ITEMS]WT_Tag1:=0
//End if
If ([ORDER_ITEMS:25]Supplier_Invoice_Number:22#"")  //Suppliers Invoice Number is not 'blank'
	[ORDER_ITEMS:25]WT_Tag2:55:=1
Else 
	[ORDER_ITEMS:25]WT_Tag2:55:=0
End if 
If ([ORDER_ITEMS:25]Delivery_Date:11#!00-00-00!)  //& Order Delivery Number is not 'blank"
	[ORDER_ITEMS:25]WT_Tag3:56:=1
Else 
	[ORDER_ITEMS:25]WT_Tag3:56:=0
End if 
[ORDER_ITEMS:25]WT_Tag4:57:=[ORDER_ITEMS:25]WT_Tag1:54+[ORDER_ITEMS:25]WT_Tag2:55+[ORDER_ITEMS:25]WT_Tag3:56
ERR_MethodTrackerReturn("WT_WIP_TAG"; $_t_oldMethodName)