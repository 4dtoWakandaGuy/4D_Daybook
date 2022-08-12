//%attributes = {}
If (False:C215)
	//Project Method Name:      SUB_CalcIssueNumber
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:      19/05/2011 12:29 v7.0.0/B45
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

$_t_oldMethodName:=ERR_MethodTracker("SUB_CalcIssueNumber")
//QUERY([PRODUCTS];[PRODUCTS]Product Code=$1)
Case of 
	: ([PRODUCTS:9]x_Product_Entry_Class:55=4)
		QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=[PRODUCTS:9]Product_Code:1)
		//SELECTION TO ARRAY([COMPONENTS]Component Code)
		
		//QUERY([DIARY];[DIARY]Product Code=
		
End case 
ERR_MethodTrackerReturn("SUB_CalcIssueNumber"; $_t_oldMethodName)