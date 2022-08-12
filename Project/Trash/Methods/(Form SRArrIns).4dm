//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Form SRArrIns
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
	//ARRAY TEXT(SRPricePerT;0)
	//ARRAY TEXT(SRProdCode;0)
	//ARRAY TEXT(SRQtyT;0)
	//ARRAY TEXT(SRSerial;0)
	//ARRAY TEXT(SRShortCode;0)
	//Array DATE(SRaDate;0)
	//Array REAL(SRAmount;0)
	//Array REAL(SRDisc;0)
	//Array REAL(SRPrice;0)
	//Array REAL(SRRate;0)
	//Array REAL(SRRetail;0)
	//ARRAY REAL(SREuroAmt;0)
	//Array TEXT(SRDesc;0)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Form SRArrIns")
ARRAY REAL:C219(SREuroAmt; Size of array:C274(SRDesc))

INSERT IN ARRAY:C227(SRDesc; 999999; $1)
INSERT IN ARRAY:C227(SRSerial; 999999; $1)
INSERT IN ARRAY:C227(SRProdCode; 999999; $1)
INSERT IN ARRAY:C227(SRShortCode; 99999; $1)
INSERT IN ARRAY:C227(SRQtyT; 999999; $1)
INSERT IN ARRAY:C227(SRPrice; 999999; $1)
INSERT IN ARRAY:C227(SRRate; 999999; $1)
INSERT IN ARRAY:C227(SRAmount; 999999; $1)
INSERT IN ARRAY:C227(SREuroAmt; 999999; $1)
INSERT IN ARRAY:C227(SRPricePerT; 999999; $1)
INSERT IN ARRAY:C227(SRRetail; 999999; $1)
INSERT IN ARRAY:C227(SRDisc; 999999; $1)
INSERT IN ARRAY:C227(SRaDate; 999999; $1)
ERR_MethodTrackerReturn("Form SRArrIns"; $_t_oldMethodName)