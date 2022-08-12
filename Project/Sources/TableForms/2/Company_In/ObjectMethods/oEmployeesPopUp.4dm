If (False:C215)
	//object Name: [COMPANIES]Company_In.oEmployeesPopUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(COM_al_EmployeeRange;0)
	//ARRAY TEXT(CO_at_EmployeeRange;0)
	C_TEXT:C284($_t_oldMethodName; CO_t_Employees)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.oEmployeesPopUp"; Form event code:C388)

If (CO_at_EmployeeRange>0)
	CO_t_Employees:=CO_at_EmployeeRange{CO_at_EmployeeRange}
	[COMPANIES:2]x_Employees:73:=COM_al_EmployeeRange{CO_at_EmployeeRange}
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].Company_In.oEmployeesPopUp"; $_t_oldMethodName)
