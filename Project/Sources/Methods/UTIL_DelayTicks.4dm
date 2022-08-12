//%attributes = {}

If (False:C215)
	//Project Method Name:      UTIL_DelayTicks
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  27/01/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_InExitMode; <>UNIT_bo_UnitTesting)
	C_LONGINT:C283($_l_applicationType; $_l_CurrentTime; $_l_DelayTiming; $_l_EndTime; $_l_ProcessNUmber; $_l_processState; $_l_ProcessTime; $1)
	C_REAL:C285($_R_EndTicks; $_R_StartTicks)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("UTIL_DelayTicks")
If (False:C215)
	//Project Method Name:      UTIL_DelayTicks
	//Parameter Detail:
	//------------------ Method Narrative ------------------
	
	//------------------ Methods/Table List ----------------
	
	//Table(If any): 
	
	//Module: 
	
	//Calling Menu/Method/Form/Object Method: 
	//
	//Related Methods: 
	
	//
	//------------------ Assumptions ----------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2015
	//Created BY: Nigel Greenlee
	
	//////21/03/2017
	//Modified By: Nigel Greenlee
	
End if 

//---------- Type Parameters & Local Variables ----------
If (True:C214)
End if 
//---------- Reassign Passed Parameters OR get values ----------

If (Count parameters:C259>=1)
	$_l_DelayTiming:=$1
	If ($_l_DelayTiming<1)
		$_l_DelayTiming:=2
	End if 
	
	
Else 
	
	
	$_l_DelayTiming:=2  //default delay
	
	
End if 

//-------------------- Main Method -------------------
$_l_applicationType:=Application type:C494
PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_processState; $_l_ProcessTime)

If ($_l_DelayTiming>=60)  //delay form more than one second
	$_l_CurrentTime:=Current time:C178*1
	$_l_EndTime:=$_l_CurrentTime+($_l_DelayTiming/60)
	If ($_l_EndTime<$_l_CurrentTime)  //this is just a failsafe to make sure we dont have a negative delay because that would mean we delay for ever
		$_l_EndTime:=$_l_CurrentTime+60
	End if 
	While ($_l_CurrentTime<$_l_EndTime)
		If (<>SYS_bo_InExitMode)  //this to ensure that if we are in a LOOOONG delay and we quit we exit the delay
			$_l_DelayTiming:=1
			$_l_EndTime:=$_l_CurrentTime
		End if 
		DELAY PROCESS:C323(Current process:C322; $_l_DelayTiming)  //
		//here i need to add in to check we are not in the application process
		
		//IDLE
		If (Application type:C494#4D Server:K5:6)
			If ($_t_ProcessName="Application Process")
				//because delay process will not have delayed for the required time we have to stay here
				IDLE:C311
				$_l_CurrentTime:=Current time:C178*1
			Else 
				$_l_CurrentTime:=$_l_EndTime
			End if 
			
			
		Else 
			$_l_CurrentTime:=$_l_EndTime
		End if 
		
	End while 
Else 
	$_R_StartTicks:=Tickcount:C458
	$_R_EndTicks:=$_R_StartTicks+$_l_DelayTiming
	
	//short delay
	If ($_R_EndTicks<$_R_StartTicks)
		$_R_EndTicks:=$_R_StartTicks+10
	End if 
	While ($_R_StartTicks<$_R_EndTicks)
		If (<>SYS_bo_InExitMode)  //this to ensure that if we are in a LOOOONG delay and we quit we exit the delay
			$_l_DelayTiming:=1
			$_R_EndTicks:=$_R_StartTicks
		End if 
		DELAY PROCESS:C323(Current process:C322; $_l_DelayTiming)
		If (Application type:C494#4D Server:K5:6)
			If ($_t_ProcessName="Application Process")
				//because delay process will not have delayed for the required time we have to stay here
				IDLE:C311
				$_R_StartTicks:=Tickcount:C458
			Else 
				$_R_StartTicks:=$_R_EndTicks
			End if 
			
			
		Else 
			$_R_StartTicks:=$_R_EndTicks
		End if 
	End while 
End if 
ERR_MethodTrackerReturn("UTIL_DelayTicks"; $_t_oldMethodName)