//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_PPDelSel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 16:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName; vProdCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPDelSel")
If ([ORDER_ITEMS:25]Product_Code:2#"")
	If ([PRODUCTS:9]Product_Code:1#[ORDER_ITEMS:25]Product_Code:2)
		RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
	End if 
	If ([PRODUCTS:9]Serial_Numbered:17)
		If ([ORDER_ITEMS:25]Serial_Number:24#"")
			$0:=True:C214
		Else 
			$0:=False:C215
			vProdCode:=[PRODUCTS:9]Product_Code:1
		End if 
	Else 
		$0:=True:C214
	End if 
Else 
	$0:=True:C214
End if 
ERR_MethodTrackerReturn("Orders_PPDelSel"; $_t_oldMethodName)