//%attributes = {}
If (False:C215)
	//Project Method Name:      STOCK_CLEANCODE
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
	C_BOOLEAN:C305($_bo_Exit)
	C_TEXT:C284($_t_oldMethodName; $_t_Return; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STOCK_CLEANCODE")
//this method ensures the value passed does not have trailing spaces
$_t_Return:=""
$_bo_Exit:=False:C215
If (Count parameters:C259>=1)
	If (Length:C16($1)>0)
		$_t_Return:=$1
		Repeat 
			If (Length:C16($_t_Return)>0)
				If ($_t_Return[[Length:C16($_t_Return)]]=" ") | ($_t_Return[[Length:C16($_t_Return)]]=Char:C90(9)) | ($_t_Return[[Length:C16($_t_Return)]]=Char:C90(13))
					$_t_Return:=Substring:C12($_t_Return; 1; Length:C16($_t_Return)-1)
					$_bo_Exit:=False:C215
				Else 
					$_bo_Exit:=True:C214
				End if 
			Else 
				$_bo_Exit:=True:C214
			End if 
		Until ($_bo_Exit)
		$0:=$_t_Return
		
	Else 
		$0:=$1
		
	End if 
Else 
	$0:=$_t_Return
End if 
ERR_MethodTrackerReturn("STOCK_CLEANCODE"; $_t_oldMethodName)
