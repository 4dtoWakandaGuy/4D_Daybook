//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_PostTracker
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:59
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $_t_Tab; $1)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_PostTracker")

If (Count parameters:C259>=1)
	If (Test path name:C476("StockPostingtrac.txt")#Is a document:K24:1)
		$_ti_DocumentRef:=DB_CreateDocument("StockPostingtrac.txt")
		$_t_Tab:=Char:C90(9)
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	Else 
		
	End if 
	
	If (Is macOS:C1572)
		//_O_SET DOCUMENT CREATOR("StockPostingtrac.txt";"ttxt")
	End if 
	$_ti_DocumentRef:=Append document:C265("StockPostingtrac.txt")
	SEND PACKET:C103(Char:C90(13)+$1+Char:C90(13))
	
End if 
ERR_MethodTrackerReturn("STK_PostTracker"; $_t_oldMethodName)
