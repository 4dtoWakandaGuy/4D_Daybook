//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calc_ItemCost
	Calc_ItemCost
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>MargCP; <>StandMA)
	C_REAL:C285($_r_Price)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calc_ItemCost")
//NG August 2003 this is fine for the currency conversion of stock
$_r_Price:=DivideBy([ORDER_ITEMS:25]Quantity:3; [ORDER_ITEMS:25]Price_Per:50)
[ORDER_ITEMS:25]Cost_Amount:15:=Gen_Round((($_r_Price)*[ORDER_ITEMS:25]Cost_Price:5); 2; 2)
If (<>MargCP)
	If ([ORDER_ITEMS:25]Cost_Price:5=0)
		[ORDER_ITEMS:25]Margin:6:=100
	Else 
		$_r_Price:=DivideBy(([ORDER_ITEMS:25]Sales_Price:4-[ORDER_ITEMS:25]Cost_Price:5); [ORDER_ITEMS:25]Sales_Price:4)
		[ORDER_ITEMS:25]Margin:6:=Gen_Round((($_r_Price)*100); 2; 4)
	End if 
	
	If ([ORDER_ITEMS:25]Standard_Cost:41=0)
		[ORDER_ITEMS:25]Standard_Margin:43:=100
	Else 
		If (<>StandMA)
			$_r_Price:=DivideBy(([ORDER_ITEMS:25]Sales_Price:4-[ORDER_ITEMS:25]Standard_Cost:41); [ORDER_ITEMS:25]Standard_Cost:41)
			[ORDER_ITEMS:25]Standard_Margin:43:=Gen_Round((($_r_Price)*100); 2; 4)
		Else 
			$_r_Price:=DivideBy(([ORDER_ITEMS:25]Standard_Price:39-[ORDER_ITEMS:25]Standard_Cost:41); [ORDER_ITEMS:25]Standard_Cost:41)
			[ORDER_ITEMS:25]Standard_Margin:43:=Gen_Round((($_r_Price)*100); 2; 4)
		End if 
	End if 
Else 
	If ([ORDER_ITEMS:25]Sales_Price:4=0)
		[ORDER_ITEMS:25]Margin:6:=0
	Else 
		If ([ORDER_ITEMS:25]Cost_Price:5>0)
			$_r_Price:=DivideBy([ORDER_ITEMS:25]Cost_Price:5; [ORDER_ITEMS:25]Sales_Price:4)
			[ORDER_ITEMS:25]Margin:6:=Gen_Round((100-($_r_Price*100)); 2; 4)
		Else 
			[ORDER_ITEMS:25]Margin:6:=100
		End if 
	End if 
	If ([ORDER_ITEMS:25]Sales_Price:4=0)
		[ORDER_ITEMS:25]Standard_Margin:43:=0
	Else 
		If (<>StandMA)
			$_r_Price:=DivideBy([ORDER_ITEMS:25]Standard_Cost:41; [ORDER_ITEMS:25]Sales_Price:4)
			[ORDER_ITEMS:25]Standard_Margin:43:=Gen_Round((100-($_r_Price*100)); 2; 4)
		Else 
			$_r_Price:=DivideBy([ORDER_ITEMS:25]Standard_Cost:41; [ORDER_ITEMS:25]Standard_Price:39)
			[ORDER_ITEMS:25]Standard_Margin:43:=Gen_Round((100-($_r_Price*100)); 2; 4)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Calc_ItemCost"; $_t_oldMethodName)