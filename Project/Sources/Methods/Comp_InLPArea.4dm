//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_InLPArea
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vSales)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_InLPArea")
If ([AREAS:3]Person:5#"")
	[COMPANIES:2]Sales_Person:29:=[AREAS:3]Person:5
	RELATE ONE:C42([COMPANIES:2]Sales_Person:29)
	vSales:=[PERSONNEL:11]Name:2
End if 
ERR_MethodTrackerReturn("Comp_InLPArea"; $_t_oldMethodName)