//%attributes = {}
If (False:C215)
	//Project Method Name:      SET_AUTOTHERM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/11/2009 20:17`Method: SET_AUTOTHERM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DSPLY_bo_DisplayProgressBars; DSPLY_bo_PrefsLoaded; THRM_bo_DisallowStop; THRM_bo_DontAutoClose; THRM_bo_NeverStart; THRM_bo_Started; Therm_bo_CloseThermometer)
	C_LONGINT:C283($2; $3; $THRM_l_Count; $THRM_l_Max; $THRM_l_TicksSinceStart; THRM_l_NumberOfLoops; THRM_l_PredictedTicks; THRM_l_PredictedTicksTrigger; THRM_l_StartTickCount)
	C_REAL:C285($THRM_R_Multiplier1; $THRM_R_Multiplier2)
	C_TEXT:C284($_t_oldMethodName; $1; $THRM_T_Message; THRM_T_ThermMessage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SET_AUTOTHERM")

//SET_AUTOTHERM -Added 27/02/09 v631b120o -kmw

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


$THRM_T_Message:=$1

$THRM_l_Count:=$2

$THRM_l_Max:=$3

If (Not:C34(DSPLY_bo_PrefsLoaded))
	//◊Close_Thermo:=True
	DSPLY_LoadPrefs
End if 
If (DSPLY_bo_DisplayProgressBars)
	
	
	If (THRM_bo_NeverStart=False:C215)
		
		
		THRM_l_NumberOfLoops:=THRM_l_NumberOfLoops+1
		
		
		If (THRM_bo_Started)
			SET_THERMOMETER($THRM_T_Message; (($THRM_l_Count*100)\$THRM_l_Max))  //does integer division for speed - is run many times and don't need accuracy here
		Else 
			$THRM_l_TicksSinceStart:=Tickcount:C458-THRM_l_StartTickCount
			If (($THRM_l_TicksSinceStart>30) & (THRM_l_NumberOfLoops>3)) | (($THRM_l_TicksSinceStart>120) & (THRM_l_NumberOfLoops>1))  //been going for at least .75 of a second AND through at least 3 loops (ensure we get a decent sample time so we can get a reasonable prediction for how long its going to take).
				
				//NOTE: This section of code is a little complicated (and so might...
				//... seem like it slows things down) but remember it only...
				//... gets called once at most.
				
				
				$THRM_R_Multiplier1:=($THRM_l_Count*100)/$THRM_l_Max  //does real division for accuracy - is run once only and need accuracy here
				
				$THRM_R_Multiplier2:=(100/$THRM_R_Multiplier1)  //does real division for accuracy - is run once only and need accuracy here
				
				THRM_l_PredictedTicks:=$THRM_R_Multiplier2*$THRM_l_TicksSinceStart
				
				If (THRM_l_PredictedTicks>THRM_l_PredictedTicksTrigger)
					//OPEN_THERMOMETER (THRM_T_ThermMessage)
					//If (THRM_bo_DisallowStop)  `Added disallow stop param 02/03/09 -kmw v631b120o
					
					OPEN_THERMOMETER(THRM_T_ThermMessage; THRM_bo_DisallowStop; THRM_bo_DontAutoClose)  //Added disallow stop and don't autoclose params 02/03/09 -kmw v631b120o
					//Else   `Added disallow stop param 02/03/09 -kmw v631b120o
					//OPEN_THERMOMETER (THRM_T_ThermMessage)  `Added disallow stop param 02/03/09 -kmw v631b120o
					//End if   `Added disallow stop param 02/03/09 -kmw v631b120o
					THRM_bo_Started:=True:C214
					SET_THERMOMETER($1; $2)
				Else 
					THRM_bo_NeverStart:=True:C214
				End if 
			End if 
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("SET_AUTOTHERM"; $_t_oldMethodName)