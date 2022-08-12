//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_PPFullL2
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPFullL2")
RELATE ONE:C42([ORDERS:24]Company_Code:1)
RELATE ONE:C42([ORDERS:24]Contact_Code:2)
Letter_Details
Forms_Tit567Cur([ORDERS:24]Currency_Code:32)
Orders_FormRel
ERR_MethodTrackerReturn("Orders_PPFullL2"; $_t_oldMethodName)