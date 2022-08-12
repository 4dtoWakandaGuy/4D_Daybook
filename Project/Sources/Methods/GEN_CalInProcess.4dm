//%attributes = {}
If (False:C215)
	//Project Method Name:      GEN_CalInProcess
	//------------------ Method Notes ------------------
	//this method displays a calendar
	//this is similar to SD_Diary_CalM
	//but can be used to show a calender for use with any process
	//NOTE THAT ALTHOUGH WE ARE USING SET PROCESS VALUE AND A CALL BACK
	//BECAUSE THE VALUE TO SET HAS TO BE PASSED AS A NAME
	//THE VARIABLES MUST BE DECLARED HERE Too
	//AND WE CANNOT DIRECTLY SET A FIELD
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:12
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>FloatingCALDisplayed; CAL_bo_isFloating)
	C_DATE:C307($2; CAL_D_CurrentViewDate; CAL_D_RETURNDate; SP_D_FilterFromDate; SP_D_FiltertoDate)
	C_LONGINT:C283(<>FloatingCalender; $_l_CurrentWinRefOLD; $_l_ProcessState; $_l_ProcessTime; $1; $5; CAL_l_CallBackEventNo; Cal_l_CallBackProcess; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $3; $4; Cal_t_VariableName; Cal_t_VariableName2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GEN_CalInProcess")
CAL_bo_isFloating:=False:C215
If (Count parameters:C259>=1)
	Cal_l_CallBackProcess:=$1
End if 
If (Count parameters:C259>=3)
	Cal_t_VariableName:=$3
	
End if 
If (Count parameters:C259>=5)
	Cal_t_VariableName2:=$4  //name of call back event variable
	CAL_l_CallBackEventNo:=$5  //number to call with
	CAL_bo_isFloating:=True:C214
End if 
//we need that to call the process back
Start_Process
If (Count parameters:C259>=2)
	CAL_D_CurrentViewDate:=$2
Else 
	CAL_D_CurrentViewDate:=Current date:C33(*)
End if 
CAL_D_RETURNDate:=!00-00-00!
<>FloatingCALDisplayed:=True:C214

$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(0; Screen height:C188-170; 170; Screen height:C188; -1986; "Calendar"; "CAL_CloseWindow")
DIALOG:C40([USER:15]; "GEN_Calender")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
//NOTE THE CALLING PROCESS MUST BE CAPABLE OF RECEIVEING THE ANSWER IN AN OUTSIDE
If (CAL_D_RETURNDate#!00-00-00!) & (Count parameters:C259>=3)
	If (CAL_l_CallBackProcess>0)
		$_ptr_Variable:=Get pointer:C304(Cal_t_VariableName)
		PROCESS PROPERTIES:C336(CAL_l_CallBackProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
		If ($_l_ProcessState>=0)  // 30/05/02 pb
			SET PROCESS VARIABLE:C370(CAL_l_CallBackProcess; $_ptr_Variable->; CAL_D_RETURNDate)
			If (Cal_t_VariableName2#"")
				$_ptr_Variable:=Get pointer:C304(Cal_t_VariableName2)
				SET PROCESS VARIABLE:C370(CAL_l_CallBackProcess; $_ptr_Variable->; CAL_l_CallBackEventNo)
			End if 
			POST OUTSIDE CALL:C329(CAL_l_CallBackProcess)
		End if 
	Else 
		//not called in a seperate process
		$_ptr_Variable:=Get pointer:C304(Cal_t_VariableName)
		$_ptr_Variable->:=CAL_D_RETURNDate
	End if 
	
End if 

Process_End
<>FloatingCalender:=0
ERR_MethodTrackerReturn("GEN_CalInProcess"; $_t_oldMethodName)