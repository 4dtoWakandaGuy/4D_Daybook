//%attributes = {}
If (False:C215)
	//Project Method Name:      CLOSE_AUTOTHERM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/11/2009 20:17`Method: CLOSE_AUTOTHERM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DSPLY_bo_DisplayProgressBars; DSPLY_bo_PrefsLoaded; THRM_bo_DisallowStop; THRM_bo_DontAutoClose; THRM_bo_NeverStart; THRM_bo_Started; Therm_bo_CloseThermometer)
	C_LONGINT:C283($_l_TicksSinceStart; THRM_l_PredictedTicks; THRM_l_StartTickCount)
	C_TEXT:C284($_t_Message; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CLOSE_AUTOTHERM")

//CLOSE_AUTOTHERM -Added 27/02/09 v631b120o -kmw

//Autotherm is called in same way as normal Thermometer methods and...
//... in fact it ends up calling them anyway.

//The difference in behaviour is that Autotherm tries to determine how long...
//...the loop is predicted to take and if it thinks it's going to last for...
//...at least a certain amount of time (specified in a param) then only...
//... then will it display the progress message, otherwise it doesn't bother...
//...This is because very short, (and therefore "flickery") progress messages...
//... or even moderately short displays of progress message probably...
//... do more harm than good in terms of improving user experience.

//Suggested value is about 5 seconds (based on current research in interface design).

//(NOTE: Ideally if there is going to be a delay between 1 to 5 seconds then developer...
//...should change the cursor to something indicating the system is busy...
//...e.g...hour glass or spinning beachball or whatever....Obviously if less than...
//... a second then no real feedback is required other than any initial graphic change...
//...such as a button down or a flash or a highlight effect (or whatever)...
//... which generally 4D takes care of anyway).


//IMPORTANT: In inital tests it's still not particularly accurate - but it seems...
//... to be with an error margin of 20-30% which is good enough for our purposes...
//...particularly when aiming for about the 5 second mark...
If (Not:C34(DSPLY_bo_PrefsLoaded))
	//◊Close_Thermo:=True
	DSPLY_LoadPrefs
End if 
If (DSPLY_bo_DisplayProgressBars)
	
	
	
	If (False:C215)  //Use this for testing
		$_l_TicksSinceStart:=Tickcount:C458-THRM_l_StartTickCount
		
		$_t_Message:="Predicted Ticks: "+String:C10(THRM_l_PredictedTicks)+Char:C90(13)
		$_t_Message:=$_t_Message+"Actual Ticks: "+String:C10($_l_TicksSinceStart)
		Gen_Alert($_t_Message)
	End if 
	
	
	If (THRM_bo_Started)  //only close it if need to
		CLOSE_THERMOMETER
		THRM_bo_Started:=False:C215
		THRM_bo_NeverStart:=False:C215
	End if 
	
	
End if 

//**************************** added 02/03/09 v631b120o -kmw ****************************
THRM_bo_DisallowStop:=False:C215

THRM_bo_DontAutoClose:=False:C215
//*********************************************************************************************
ERR_MethodTrackerReturn("CLOSE_AUTOTHERM"; $_t_oldMethodName)