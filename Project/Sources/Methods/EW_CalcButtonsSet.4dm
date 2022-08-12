//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_CalcButtonsSet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(r1; r2; r3; r4)
	C_REAL:C285(EW_r_DiscountPercentage; EW_r_DisplayedDiscountPercent; EW_r_MarkupPercentage; EW_r_PricePercentage; EW_r_StartNum)
	C_TEXT:C284($_t_oldMethodName; EW_t_PricingAction)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_CalcButtonsSet")
// EW_CalcButtonsSet
// 16/07/02 pb

OBJECT SET ENTERABLE:C238(EW_r_DiscountPercentage; False:C215)
OBJECT SET ENTERABLE:C238(EW_r_MarkupPercentage; False:C215)
OBJECT SET ENTERABLE:C238(EW_r_StartNum; False:C215)
OBJECT SET ENTERABLE:C238(EW_r_DisplayedDiscountPercent; False:C215)
EW_r_StartNum:=0
Case of 
	: (r1=1)  // discount
		EW_t_PricingAction:="Discount"
		GOTO OBJECT:C206(EW_r_DiscountPercentage)
		OBJECT SET ENTERABLE:C238(EW_r_DiscountPercentage; True:C214)
		
	: (r2=1)  // markup
		EW_t_PricingAction:="Markup"
		GOTO OBJECT:C206(EW_r_MarkupPercentage)
		OBJECT SET ENTERABLE:C238(EW_r_MarkupPercentage; True:C214)
		
	: (r3=1)  // record no.
		EW_t_PricingAction:="Record No."
		GOTO OBJECT:C206(EW_r_StartNum)
		OBJECT SET ENTERABLE:C238(EW_r_StartNum; True:C214)
		EW_r_StartNum:=1
		
	: (r4=1)  // percentage
		EW_t_PricingAction:="Percentage"
		GOTO OBJECT:C206(EW_r_PricePercentage)
		OBJECT SET ENTERABLE:C238(EW_r_PricePercentage; True:C214)
End case 
ERR_MethodTrackerReturn("EW_CalcButtonsSet"; $_t_oldMethodName)