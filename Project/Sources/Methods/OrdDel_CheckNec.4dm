//%attributes = {}
If (False:C215)
	//Project Method Name:      OrdDel_CheckNec
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 00:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrdDel_CheckNec")
//OrdDel_CheckNec - check is necessary
//requires the correct Order Items to be in selection

$0:=False:C215
ARRAY TEXT:C222($_at_ProductCodes; 0)
SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Product_Code:2; $_at_ProductCodes)

If (Size of array:C274($_at_ProductCodes)>0)
	If (Size of array:C274($_at_ProductCodes)=1)
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_at_ProductCodes{1})
		$0:=[PRODUCTS:9]Maintain_Stock:14
	Else 
		QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
		If (Not:C34([PRODUCTS:9]Maintain_Stock:14))  //only need to to search the selection if the first record is not maintain stock
			QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]Maintain_Stock:14=True:C214)
			$0:=(Records in selection:C76([PRODUCTS:9])>0)
		Else 
			$0:=True:C214  //The first record has maintain stock set on it
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OrdDel_CheckNec"; $_t_oldMethodName)