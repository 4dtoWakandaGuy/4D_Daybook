If (False:C215)
	//Table Form Method Name: [HEADINGS]P&L Heading12
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $_l_MaxStringLength; $_l_NumberLength)
	C_POINTER:C301($_ptr_Variable)
	C_REAL:C285(vAmountF; vAmountT; vPayment; vT1; vT10; vT11; vT12; vT2; vT3; vT4; vT5)
	C_REAL:C285(vT6; vT7; vT8; vT9; vTot)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [HEADINGS].P&L Heading12"; Form event code:C388)
$_l_MaxStringLength:=Length:C16("99,000,000,000")

// FONT SIZE(vHeading;6)
For ($_l_Index; 1; 12)
	$_ptr_Variable:=Get pointer:C304("vT"+String:C10($_l_Index))
	$_l_NumberLength:=Length:C16(String:C10($_ptr_Variable->))
	If ($_l_NumberLength>$_l_MaxStringLength)
		OBJECT SET FONT SIZE:C165($_ptr_Variable->; 6)
	End if 
End for 
$_l_NumberLength:=Length:C16(String:C10(vTot))
If ($_l_NumberLength>$_l_MaxStringLength)
	OBJECT SET FONT SIZE:C165(vTot; 6)
End if 
ERR_MethodTrackerReturn("FM [HEADINGS].P&L Heading12"; $_t_oldMethodName)
