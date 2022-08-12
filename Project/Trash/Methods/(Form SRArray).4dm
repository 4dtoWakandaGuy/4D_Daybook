//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Form SRArray
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/11/2009 11:35:21If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(SRaDate;0)
	//ARRAY REAL(SRAmount;0)
	//ARRAY REAL(SRDisc;0)
	//ARRAY REAL(SREuroAmt;0)
	//ARRAY REAL(SRPrice;0)
	//ARRAY REAL(SRRate;0)
	//ARRAY REAL(SRRetail;0)
	//ARRAY TEXT(SRDesc;0)
	//ARRAY TEXT(SRPricePerT;0)
	//ARRAY TEXT(SRProdCode;0)
	//ARRAY TEXT(SRQtyT;0)
	//ARRAY TEXT(SRSerial;0)
	//ARRAY TEXT(SRShortCode;0)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Form SRArray")
If (Count parameters:C259>=1)
	//ARRAY STRING(65;SRDesc;$1)  `bsw 7/7/04
	ARRAY TEXT:C222(SRDesc; $1)  //bsw 7/7/04
	
	ARRAY TEXT:C222(SRSerial; $1)
	ARRAY TEXT:C222(SRProdCode; $1)
	ARRAY TEXT:C222(SRShortCode; $1)
	ARRAY TEXT:C222(SRQtyT; $1)
	ARRAY REAL:C219(SRPrice; $1)
	ARRAY REAL:C219(SRRate; $1)
	ARRAY REAL:C219(SRAmount; $1)
	ARRAY REAL:C219(SREuroAmt; $1)
	ARRAY TEXT:C222(SRPricePerT; $1)
	ARRAY REAL:C219(SRRetail; $1)
	ARRAY REAL:C219(SRDisc; $1)
	ARRAY DATE:C224(SRaDate; $1)
End if 
ERR_MethodTrackerReturn("Form SRArray"; $_t_oldMethodName)