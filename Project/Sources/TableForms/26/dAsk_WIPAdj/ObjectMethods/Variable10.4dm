If (False:C215)
	//object Name: [JOBS]dAsk_WIPadj.Variable10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vDate)
	C_TEXT:C284($_t_oldMethodName; vPeriod)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].dAsk_WIPadj.Variable10"; Form event code:C388)
Check_MinorNC(->vPeriod; ""; ->[PERIODS:33]; ->[PERIODS:33]Period_Code:1; ->[PERIODS:33]Period_Name:2; "Period")
If (vDate=!00-00-00!)
	vDate:=[PERIODS:33]From_Date:3
End if 
Check_PerClose
vPeriod:=[PERIODS:33]Period_Code:1
ERR_MethodTrackerReturn("OBJ [JOBS].dAsk_WIPadj.Variable10"; $_t_oldMethodName)