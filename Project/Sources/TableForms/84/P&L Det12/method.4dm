If (False:C215)
	//Table Form Method Name: [HEADINGS]PL_Detail12
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
	//C_UNKNOWN(vHeading)
	//C_UNKNOWN(vT1)
	//C_UNKNOWN(vT10)
	//C_UNKNOWN(vT11)
	//C_UNKNOWN(vT12)
	//C_UNKNOWN(vT2)
	//C_UNKNOWN(vT3)
	//C_UNKNOWN(vT4)
	//C_UNKNOWN(vT5)
	//C_UNKNOWN(vT7)
	//C_UNKNOWN(vT8)
	//C_UNKNOWN(vT9)
	//C_UNKNOWN(vTot)
	C_BOOLEAN:C305(vMod3)
	C_LONGINT:C283($_l_MaxStringLength; $_l_NumberLength; $_l_Index; $_l_MaxStringLength; $_l_NumberLength)
	C_POINTER:C301($_ptr_Variable)
	C_REAL:C285(vAmountT; vPayment; vT1; vT10; vT11; vT12; vT2; vT3; vT4; vT5; vT7)
	C_REAL:C285(vT8; vT9; vTot; vAmountF; vT6)
	C_TEXT:C284(vHeading; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [HEADINGS].PL_Detail12"; Form event code:C388)
If (False:C215)
	If (vMod3)
		OBJECT SET FONT SIZE:C165(vHeading; 6)
		OBJECT SET FONT SIZE:C165(vT1; 6)
		OBJECT SET FONT SIZE:C165(vT2; 6)
		OBJECT SET FONT SIZE:C165(vT3; 6)
		OBJECT SET FONT SIZE:C165(vT4; 6)
		OBJECT SET FONT SIZE:C165(vT5; 6)
		OBJECT SET FONT SIZE:C165(vT6; 6)
		OBJECT SET FONT SIZE:C165(vT7; 6)
		OBJECT SET FONT SIZE:C165(vT8; 6)
		OBJECT SET FONT SIZE:C165(vT9; 6)
		OBJECT SET FONT SIZE:C165(vT10; 6)
		OBJECT SET FONT SIZE:C165(vT11; 6)
		OBJECT SET FONT SIZE:C165(vT12; 6)
		OBJECT SET FONT SIZE:C165(vTot; 6)
	End if 
End if 

$_l_MaxStringLength:=Length:C16("99,000,000,000")
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
ERR_MethodTrackerReturn("FM [HEADINGS].PL_Detail12"; $_t_oldMethodName)
