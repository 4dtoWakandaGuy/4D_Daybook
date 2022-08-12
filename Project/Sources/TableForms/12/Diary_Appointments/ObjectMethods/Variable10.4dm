If (False:C215)
	//object Name: [DIARY]Diary_Appointments.Variable10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; vDate)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_Appointments.Variable10"; Form event code:C388)
$_d_Date:=vDate
vDate:=Date:C102(Gen_Request("Date:"))
If (OK=1)
	Diary_DateSrchR(0)
Else 
	vDate:=$_d_Date
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_Appointments.Variable10"; $_t_oldMethodName)
