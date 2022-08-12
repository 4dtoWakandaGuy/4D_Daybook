//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Movt FormItLP
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
	C_LONGINT:C283($_l_ProductCodeLength)
	C_REAL:C285(vAmount; vPrice; vQuantity)
	C_TEXT:C284($_t_oldMethodName; vLocation; vProdCode; vProduct; vSerialNo)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Movt FormItLP")
RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
vProdCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
vQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
If ([MOVEMENT_TYPES:60]Form_No_Amount:21)
	vAmount:=0
Else 
	vAmount:=[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13
End if 
If ([MOVEMENT_TYPES:60]Location_Form:14)
	vLocation:=[STOCK_MOVEMENT_ITEMS:27]Location:7
	$_l_ProductCodeLength:=Length:C16([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)+Length:C16([PRODUCTS:9]Product_Name:2)+3
	If ($_l_ProductCodeLength>65)  //too long
		vProduct:=Substring:C12([STOCK_MOVEMENT_ITEMS:27]Product_Code:1+"   "+[PRODUCTS:9]Product_Name:2; 1; 64)
	Else 
		
		vProduct:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+"   "+[PRODUCTS:9]Product_Name:2
	End if 
Else 
	vLocation:=""
	vProduct:=[PRODUCTS:9]Product_Name:2
End if 
vSerialNo:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
vPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
If (([STOCK_MOVEMENT_ITEMS:27]Company_To:2="*PLUS") | ([STOCK_MOVEMENT_ITEMS:27]Company_To:2="-PLUS"))
	$_l_ProductCodeLength:=Length:C16("+ "+vProduct)
	If ($_l_ProductCodeLength>65)  //too long
		vProduct:=Substring:C12("+ "+vProduct; 1; 64)
	Else 
		vProduct:="+ "+vProduct
	End if 
	
Else 
	If (([STOCK_MOVEMENT_ITEMS:27]Company_To:2="*MINUS") | ([STOCK_MOVEMENT_ITEMS:27]Company_To:2="-MINUS"))
		$_l_ProductCodeLength:=Length:C16("- "+vProduct)
		If ($_l_ProductCodeLength>65)  //too long
			vProduct:=Substring:C12("- "+vProduct; 1; 64)
		Else 
			vProduct:="- "+vProduct
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Movt FormItLP"; $_t_oldMethodName)