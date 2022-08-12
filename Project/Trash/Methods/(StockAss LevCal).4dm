//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockAss LevCal
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
	C_LONGINT:C283($_l_RecordsIndex; $_l_RecordsinSelection; vStockLevel)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss LevCal")
$_l_RecordsinSelection:=Records in selection:C76([COMPONENTS:86])
ARRAY TEXT:C222(SRProdCode; $_l_RecordsinSelection)
SELECTION TO ARRAY:C260([COMPONENTS:86]Component_Code:2; SRProdCode)
QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=SRProdCode{1}; *)
If (($_l_RecordsinSelection>1) & ($_l_RecordsinSelection<256))
	For ($_l_RecordsIndex; 2; $_l_RecordsinSelection)
		QUERY:C277([COMPONENTS:86];  | ; [COMPONENTS:86]Product_Code:1=SRProdCode{$_l_RecordsIndex}; *)
	End for 
Else 
	If ($_l_RecordsinSelection>255)
		Gen_Alert("Error: There is a limit of 255 Components per Product"; "Cancel")
		OK:=0
		CANCEL:C270
	End if 
End if 
QUERY:C277([COMPONENTS:86])
If ((Records in selection:C76([COMPONENTS:86])>0) & (vStockLevel<10))
	vStockLevel:=vStockLevel+1
	StockAss LevCal
End if 
ERR_MethodTrackerReturn("StockAss LevCal"; $_t_oldMethodName)
