//%attributes = {}
If (False:C215)
	//Project Method Name:      OPEN_AUTOTHERM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/11/2009 20:17`Method: OPEN_AUTOTHERM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($3; $4; DSPLY_bo_DisplayProgressBars; DSPLY_bo_PrefsLoaded; THRM_bo_DisallowStop; THRM_bo_DontAutoClose; THRM_bo_NeverStart; THRM_bo_Started; Therm_bo_CloseThermometer)
	C_LONGINT:C283($2; THRM_l_NumberOfLoops; THRM_l_PredictedTicksTrigger; THRM_l_StartTickCount)
	C_TEXT:C284($_t_oldMethodName; $1; THRM_T_ThermMessage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OPEN_AUTOTHERM")

//OPEN_AUTOTHERM -Added 27/02/09 v631b120o -kmw

//Autotherm is called in same way as normal Thermometer methods and...
//... in fact it ends up calling them anyway.

//The difference in behaviour is that Autotherm tries to determine how long...
//...the loop is predicted to take and if it thinks it's going to last for...
//...at least a certain amount of time (specified in a param) then only...
//... then will it display the progress message, otherwise it doesn't bother...
//...This is because very short, (and therefore "flickery") progress messages...
//... or even moderately short displays of progress message probably...
//... do more harm than good in terms of improving user experience.

//Suggested value is about 5 seconds (300 ticks) - (based on current research in interface design).

//(NOTE: Ideally if there is going to be a delay between 1 to 5 seconds then developer...
//...should change the cursor to something indicating the system is busy...
//...e.g...hour glass or spinning beachball or whatever....Obviously if less than...
//... a second then no real feedback is required other than any initial graphic change...
//...such as a button down or a flash or a highlight effect (or whatever)...
//... which generally 4D takes care of anyway).


//IMPORTANT: In inital tests it's still not particularly accurate - but it seems...
//... to be with an error margin of 20-30% which is good enough for our purposes...
//...particularly when aiming for about the 5 second mark...


THRM_T_ThermMessage:=$1

THRM_l_PredictedTicksTrigger:=$2

//**************************** added 02/03/09 v631b120o -kmw ****************************
If (Count parameters:C259>2)
	THRM_bo_DisallowStop:=$3
Else 
	THRM_bo_DisallowStop:=False:C215
End if 

If (Count parameters:C259>3)
	THRM_bo_DontAutoClose:=$4
Else 
	THRM_bo_DontAutoClose:=False:C215
End if 
//*********************************************************************************************
If (Not:C34(DSPLY_bo_PrefsLoaded))
	//◊Close_Thermo:=True
	DSPLY_LoadPrefs
End if 
If (DSPLY_bo_DisplayProgressBars)
	//OPEN_THERMOMETER ("Gathering print preferences...";300;True;True)  //Disallow user auto close -kmw 03/03/09 v631b120o
	
	//added 02/03/09 v631b120o -kmw
	
	THRM_bo_Started:=False:C215
	
	THRM_bo_NeverStart:=False:C215
	
	THRM_l_NumberOfLoops:=0
	
	THRM_l_StartTickCount:=Tickcount:C458
	
End if   //added 02/03/09 v631b120o -kmw
ERR_MethodTrackerReturn("OPEN_AUTOTHERM"; $_t_oldMethodName)