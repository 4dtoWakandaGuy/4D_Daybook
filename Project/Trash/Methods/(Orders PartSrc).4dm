//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders PartSrc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 06:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders PartSrc")
If (Count parameters:C259>=1)
	
	If ([ORDER_ITEMS:25]Product_Code:2#[PRODUCTS:9]Product_Code:1)
		RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
	End if 
	If ([PRODUCTS:9]Maintain_Stock:14)
		Case of 
			: ($1="D")
				$0:=(Gen_Round(([ORDER_ITEMS:25]Allocated:28-[ORDER_ITEMS:25]Delivered:51); 2; 6)#0)
				
				
		End case 
	Else 
		$0:=True:C214
	End if 
Else   //Cant test it
	$0:=True:C214
End if 
ERR_MethodTrackerReturn("Orders PartSrc"; $_t_oldMethodName)