//%attributes = {}
If (False:C215)
	//Project Method Name:      Trans_SubLPPer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/09/2009 06:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($2; $3)
	C_TEXT:C284($_t_LayerCode; $_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_SubLPPer")
//NG modified May 2004
//For use with area list this now has parameteres
If (Count parameters:C259>=3)
	$_t_LayerCode:=$1
Else 
	$_t_LayerCode:=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20
End if 
If (Count parameters:C259=0)
	
	If ([LAYERS:76]Layer_Code:1#[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20)
		RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20)
	End if 
	If (([LAYERS:76]Layer_Code:1="") | ([LAYERS:76]Period_Controls:3))
		Check_PerClose
	End if 
Else 
	If ([LAYERS:76]Layer_Code:1#$1)
		QUERY:C277([LAYERS:76]; [LAYERS:76]Layer_Code:1=$1)
	End if 
	If (([LAYERS:76]Layer_Code:1="") | ([LAYERS:76]Period_Controls:3))
		
		Check_PerClose($2; $3)
		
	End if 
End if 
ERR_MethodTrackerReturn("Trans_SubLPPer"; $_t_oldMethodName)
