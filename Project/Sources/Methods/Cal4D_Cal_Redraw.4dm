//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_Redraw
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/12/2009 13:36`Method: Cal4D_Cal_Redraw
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Cal_bo_CalisVisible; <>Cal_bo_FormUpdateNeeded; <>Cal_bo_MonthUpdateNeeded)
	C_LONGINT:C283(<>CAL_l_LastClientUpdateTime; $_l_ProcessNumber)
	C_TEXT:C284(<>CAL_t_CalendarProcessName; <>CAL_t_FullAndMinisProcName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_Redraw")

Cal4D_Init



If (<>Cal_bo_CalisVisible)
	$_l_ProcessNumber:=Current process:C322
	Case of 
		: ($_l_ProcessNumber=Process number:C372(<>CAL_t_CalendarProcessName))
			<>Cal_bo_FormUpdateNeeded:=False:C215
			<>CAL_l_LastClientUpdateTime:=Cal4D_DateAndTimeToLongint(True:C214)  // Set this before reading the data. Better too soon than too late.
			If (False:C215)
				If (<>Cal_bo_MonthUpdateNeeded)  // This stuff only needs to be called if we change months.
					<>Cal_bo_MonthUpdateNeeded:=False:C215
					//Cal4D_SetupMonth  ` Set some IP variables that describe where things start on this month's display.
					//Cal4D_SetNumbers  ` Set the numbers to the correct values for the selected month.
				End if 
				
				//Cal4D_SetObjectColors
				//Cal4D_PlaceMonthYearText
				//Cal4D_PlaceNavButtons
				//Cal4D_PlaceDaysOfWeek
				//Cal4D_PlaceBoxes  ` Move the boxes into the correct positions.
				//Cal4D_PlaceEvents
			End if 
			
		: ($_l_ProcessNumber=Process number:C372(<>CAL_t_FullAndMinisProcName))
			<>Cal_bo_FormUpdateNeeded:=False:C215
			<>CAL_l_LastClientUpdateTime:=Cal4D_DateAndTimeToLongint(True:C214)  // Set this before reading the data. Better too soon than too late.
			
		Else 
			<>Cal_bo_FormUpdateNeeded:=True:C214
			POST OUTSIDE CALL:C329($_l_ProcessNumber)
			
	End case 
	
	
	
	If ($_l_ProcessNumber=Current process:C322)
		
	Else 
		
	End if 
End if 
ERR_MethodTrackerReturn("Cal4D_Cal_Redraw"; $_t_oldMethodName)