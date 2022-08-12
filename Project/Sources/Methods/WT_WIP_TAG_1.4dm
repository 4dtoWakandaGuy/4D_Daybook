//%attributes = {}
If (False:C215)
	//Project Method Name:      WT_WIP_TAG_1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 09:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName; vMessage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WT_WIP_TAG_1")

ALL RECORDS:C47([ORDER_ITEMS:25])
For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
	//If ([ORDER ITEMS]Invoice No#"")  `Sales Invoice Number is not 'blank'
	//[ORDER ITEMS]WT_Tag1:=1
	//Else
	[ORDER_ITEMS:25]WT_Tag1:54:=0
	//End if
	If ([ORDER_ITEMS:25]Supplier_Invoice_Number:22#"")  //Suppliers Invoice Number is not 'blank'
		[ORDER_ITEMS:25]WT_Tag2:55:=1
	Else 
		[ORDER_ITEMS:25]WT_Tag2:55:=0
	End if 
	If ([ORDER_ITEMS:25]Delivery_Date:11#!00-00-00!)  // Order Delivery Date is not 'blank"
		[ORDER_ITEMS:25]WT_Tag3:56:=1
	Else 
		[ORDER_ITEMS:25]WT_Tag3:56:=0
	End if 
	[ORDER_ITEMS:25]WT_Tag4:57:=[ORDER_ITEMS:25]WT_Tag1:54+[ORDER_ITEMS:25]WT_Tag2:55+[ORDER_ITEMS:25]WT_Tag3:56
	vMessage:=("Please wait. Processing record #"+String:C10($_l_Index)+" of "+String:C10(Records in selection:C76([ORDER_ITEMS:25])))
	vMessage:=vMessage+(Char:C90(13)+String:C10([ORDER_ITEMS:25]WT_Tag1:54))
	vMessage:=vMessage+(Char:C90(13)+String:C10([ORDER_ITEMS:25]WT_Tag2:55))
	vMessage:=vMessage+(Char:C90(13)+String:C10([ORDER_ITEMS:25]WT_Tag3:56))
	vMessage:=vMessage+(Char:C90(13)+String:C10([ORDER_ITEMS:25]WT_Tag4:57))
	MESSAGE:C88(vMessage)
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
End for 
ERR_MethodTrackerReturn("WT_WIP_TAG_1"; $_t_oldMethodName)