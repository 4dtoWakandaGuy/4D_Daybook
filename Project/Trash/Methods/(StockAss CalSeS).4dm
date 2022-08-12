//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockAss CalSeS
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
	C_BOOLEAN:C305($_bo_Open)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss CalSeS")
$_l_Index:=2
While ($_l_Index<=Size of array:C274(SRSerial))
	IDLE:C311  // 7/04/03 pb
	If (SRSerial{$_l_Index}#"@   Qty @")
		If (Size of array:C274(SRSerial)=$_l_Index)
			$_bo_Open:=True:C214
		Else 
			If (SRSerial{$_l_Index+1}="@   Qty @")
				$_bo_Open:=False:C215
			Else 
				$_bo_Open:=True:C214
			End if 
		End if 
		If ($_bo_Open)
			StockAss_CalSe2($_l_Index)
		End if 
	End if 
	$_l_Index:=$_l_Index+1
End while 
SRSerial:=1
ERR_MethodTrackerReturn("StockAss CalSeS"; $_t_oldMethodName)
