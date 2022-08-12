If (False:C215)
	//Table Form Method Name: [USER]Thermometer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 17:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; Therm_bo_CloseThermometer; vDisallowStop; vDontAutoClose)
	C_LONGINT:C283(THERM_but_Cancel; THERM_l_Thermometer)
	C_TEXT:C284($_t_oldMethodName; Therm_t_Message)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].Thermometer"; Form event code:C388)

Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "Thermometer")
		//THERM_l_Thermometer:=◊_Thermometer
		// Therm_t_Message:=◊_Message
		//◊Close_Thermo:=False
		Therm_bo_CloseThermometer:=False:C215
		
		
		If (vDisallowStop)  //added 27/06/08 -kmw
			OBJECT SET VISIBLE:C603(THERM_but_Cancel; False:C215)  //added 27/06/08 -kmw
		Else 
			OBJECT SET VISIBLE:C603(THERM_but_Cancel; True:C214)  //added 27/06/08 -kmw
		End if   //added 27/06/08 -kmw
		INT_SetDialog
		//
		SET TIMER:C645((60*5))  //set timer - added 1/07/08, kmw
		
		
	: (Form event code:C388=On Outside Call:K2:11)
		//THERM_l_Thermometer:=◊_Thermometer
		// Therm_t_Message:=◊_Message
		//If (◊Close_Thermo)
		If (Therm_bo_CloseThermometer)
			CANCEL:C270
		Else   //added 1/07/08 -kmw
			SET TIMER:C645((60*5))  //reset timer - added 1/07/08, kmw
		End if 
		
	: (Form event code:C388=On Timer:K2:25)  //added 1/07/08 -kmw
		//It didn't happen very often but had a problem where the window would sometimes...
		//... forever remain open after it had fininshed (and/or possibly just as it opened also).
		//I thought it might be due to some kind of timing issue - for PERFORMANCE...
		//... reasons I am using relatively primitive interprocess comunications with...
		//... little in the way of validation and/or race condition protection.
		//This was a deliberate decision because in this case the worst that should...
		//... happen is a relatively minor display issue (ie relatively Minor_In that it...
		//... won't lead to incorrect data being saved any where or system crashing).
		
		//Therefore if all else fails, then if for ANY reason the progress window...
		//... remains open for more than 5 seconds without getting an outside call...
		//... from the calling process then we need to shut it automatically.
		
		
		If (vDontAutoClose=False:C215)  //added 02/03/09 -kmw v631b120o
			CANCEL:C270
		End if   //added 02/03/09 -kmw v631b120o
		
	: (Form event code:C388=On Unload:K2:2)
		//◊Close_Thermo:=False
		Therm_bo_CloseThermometer:=False:C215
		//◊_Message:=""
		Therm_t_Message:=""
		//◊_Thermometer:=0
		THERM_l_Thermometer:=0
End case 
ERR_MethodTrackerReturn("FM [USER].Thermometer"; $_t_oldMethodName)
