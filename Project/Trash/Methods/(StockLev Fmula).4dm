//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockLev Fmula
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     22/11/2010 13:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Selected)
	C_REAL:C285($0)
	C_TEXT:C284($_t_oldMethodName; $_t_Product; $1; $2; $3; $4; $5; $6)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockLev Fmula")
//StockLev Formula - for use in Included Formulae
//COPY NAMED SELECTION([ORDER ITEMS];"$Sel")
//$_l_Selected:=Selected record number([ORDER ITEMS])
$_l_Selected:=0
$0:=0
If ($1="")
	$_t_Product:=[ORDER_ITEMS:25]Product_Code:2
Else 
	$_t_Product:=$1
End if 

Case of 
	: (Count parameters:C259>5)
		$0:=StockLev_Fmul2($_t_Product; $2; $3; $4; $5; $6)
	: (Count parameters:C259>2)
		$0:=StockLev_Fmul2($_t_Product; $2; $3)
	Else 
		If (Count parameters:C259>=2)
			$0:=StockLev_Fmul2($_t_Product; $2)
		End if 
End case 
//USE NAMED SELECTION("$sel")
If ($_l_Selected>0)
	//GOTO SELECTED RECORD([ORDER ITEMS];$_l_Selected)
End if 
ERR_MethodTrackerReturn("StockLev Fmula"; $_t_oldMethodName)
