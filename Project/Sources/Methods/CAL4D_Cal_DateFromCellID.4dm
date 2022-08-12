//%attributes = {}
If (False:C215)
	//Project Method Name:      CAL4D_Cal_DateFromCellID
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 17:03`Method: CAL4D_Cal_DateFromCellID
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_date; $0)
	C_TEXT:C284($_t_CellData; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAL4D_Cal_DateFromCellID")
If (Count parameters:C259>=1)
	$_t_CellData:=$1
	
	//========================    Method Actions    ==================================
	
	$_d_date:=SD_ORDINtoDate(Num:C11(Substring:C12($_t_CellData; 1; Position:C15("_"; $_t_CellData)-1)))
	
	
	//========================    Clean up and Exit    =================================
	
	$0:=$_d_date
	
End if 
ERR_MethodTrackerReturn("CAL4D_Cal_DateFromCellID"; $_t_oldMethodName)