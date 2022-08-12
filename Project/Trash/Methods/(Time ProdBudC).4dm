//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Time ProdBudC
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
	C_REAL:C285(vPrice)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Time ProdBudC")
//Time ProdBudC
If ([PERSONNEL:11]Adhoc_Budget:8=False:C215)
	Time_ProdBud2
Else 
	vPrice:=[TIME_BUDGETS:49]Budget_Units:4
End if 
ERR_MethodTrackerReturn("Time ProdBudC"; $_t_oldMethodName)