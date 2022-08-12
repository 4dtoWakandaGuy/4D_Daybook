//%attributes = {}
If (False:C215)
	//Project Method Name:      StockAss_DisIns
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
	//ARRAY TEXT(SRProdCode;0)
	//ARRAY TEXT(SRQtyT;0)
	//ARRAY TEXT(SRSerial;0)
	//Array REAL(SRAmount;0)
	//Array REAL(SRPrice;0)
	//Array REAL(SRRate;0)
	//Array TEXT(SRDesc;0)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss_DisIns")
INSERT IN ARRAY:C227(SRProdCode; $1; 1)
INSERT IN ARRAY:C227(SRSerial; $1; 1)
INSERT IN ARRAY:C227(SRDesc; $1; 1)
INSERT IN ARRAY:C227(SRQtyT; $1; 1)
INSERT IN ARRAY:C227(SRPrice; $1; 1)
INSERT IN ARRAY:C227(SRRate; $1; 1)
INSERT IN ARRAY:C227(SRAmount; $1; 1)
ERR_MethodTrackerReturn("StockAss_DisIns"; $_t_oldMethodName)