//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Time ProdBud2
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
	C_LONGINT:C283(vItemNum)
	C_REAL:C285(vPrice)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Time ProdBud2")
//Time ProdBud2
If ([TIME_BUDGETS:49]Total_Weeks:6>0)
	vPrice:=Round:C94((([TIME_BUDGETS:49]Budget_Units:4/52)*[TIME_BUDGETS:49]Total_Weeks:6); 2)
Else 
	If ([TIME_BUDGETS:49]Start_Week:5>0)
		vPrice:=Round:C94((([TIME_BUDGETS:49]Budget_Units:4/52)*(vItemNum-[TIME_BUDGETS:49]Start_Week:5+1)); 2)
	Else 
		vPrice:=Round:C94((([TIME_BUDGETS:49]Budget_Units:4/52)*vItemNum); 2)
	End if 
End if 
ERR_MethodTrackerReturn("Time ProdBud2"; $_t_oldMethodName)