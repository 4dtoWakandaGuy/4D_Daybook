//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockAss CalSer
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
	C_BOOLEAN:C305($OpenIt)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss CalSer")
//StockAss CalSer
If (SRSerial{SRSerial}#"@   Qty @")  //do nothing if is a detail line
	
	If (Size of array:C274(SRSerial)=SRSerial)
		$OpenIt:=True:C214
	Else 
		If (SRSerial{SRSerial+1}="@   Qty @")
			$OpenIt:=False:C215
		Else 
			$OpenIt:=True:C214
		End if 
	End if 
	
	If ($OpenIt)
		StockAss_CalSe2(SRSerial)
	Else 
		StockAss_CalSe3(SRSerial)
	End if 
End if 
ERR_MethodTrackerReturn("StockAss CalSer"; $_t_oldMethodName)