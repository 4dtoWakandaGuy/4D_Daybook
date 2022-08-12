//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockCurr Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/01/2012 08:51
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_AutoSearch)
	C_LONGINT:C283(vPu)
	C_TEXT:C284($_t_AutoSearchCode; $_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockCurr Mod")

Start_Process
If (StockCurr_File)
	While (vPu=1)
		If (Count parameters:C259>=2)
			$_bo_AutoSearch:=($2="TRUE")
			$_t_AutoSearchCode:=$1
			//note this finds current stock of a product not a given current stock record
			StockCurr_Sel($_t_AutoSearchCode; $_bo_AutoSearch)
			
		Else 
			
			StockCurr_Sel
		End if 
		
		Gen_ModMidAster(Term_StoWT("View Current Stock"); "Master"; ->[CURRENT_STOCK:62]; ->vPu; "StockCurr Out"; Term_StoWT("Current Stock"); "NoPlus")
	End while 
End if 

Process_End
ERR_MethodTrackerReturn("StockCurr Mod"; $_t_oldMethodName)