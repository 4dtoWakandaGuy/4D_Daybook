//%attributes = {}
If (False:C215)
	//Project Method Name:      StockAss_CalSeH
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
	//ARRAY TEXT(SRSerial;0)
	C_LONGINT:C283($i)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss_CalSeH")
$i:=1
While ($i<=Size of array:C274(SRSerial))
	IDLE:C311  // 7/04/03 pb
	If (SRSerial{$i}#"@   Qty @")
		StockAss_CalSe3($i)
	End if 
	$i:=$i+1
End while 
SRSerial:=1
ERR_MethodTrackerReturn("StockAss_CalSeH"; $_t_oldMethodName)