//%attributes = {}
If (False:C215)
	//Project Method Name:      StockCurr_Fmula
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
	C_REAL:C285($0)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4; $5; $6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockCurr_Fmula")
//StockCurr Formula - for use in Included Formulae

Case of 
	: (Count parameters:C259>5)
		$0:=StockCurr_Fmul2($1; $2; $3; $4; $5; $6)
	: (Count parameters:C259>2)
		$0:=StockCurr_Fmul2($1; $2; $3)
	Else 
		If (Count parameters:C259>=2)
			$0:=StockCurr_Fmul2($1; $2)
		Else 
			$0:=0
		End if 
End case 
ERR_MethodTrackerReturn("StockCurr_Fmula"; $_t_oldMethodName)