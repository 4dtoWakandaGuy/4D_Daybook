//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_ClearEventArrays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 15:42`Method: Cal4D_ClearEventArrays
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(<>Cal4D_ad_EventOEndDates;0)
	//ARRAY DATE(<>Cal4D_ad_EventOStartDates;0)
	//ARRAY DATE(<>CAL4D_ad_EventLendDates;0)
	//ARRAY DATE(<>CAL4D_ad_EventStartDates;0)
	//ARRAY LONGINT(<>CAL4D_al_EventIDS;0)
	//ARRAY LONGINT(<>Cal4D_al_EventColors;0)
	//ARRAY LONGINT(<>Cal4D_al_EventGroupIDs;0)
	//ARRAY LONGINT(<>CAL4D_al_EventlEndTimes;0)
	//ARRAY LONGINT(<>CAL4D_al_EventlStartTimes;0)
	//ARRAY TEXT(<>Cal4D_at_EventNotes;0)
	//ARRAY TEXT(<>CAL4D_at_EventTitles;0)
	//ARRAY TEXT(<>CAL4D_at_EventTypes;0)
	//ARRAY TIME(<>Cal4D_ati_EventOEndTimes;0)
	//ARRAY TIME(<>Cal4D_ati_EventOStartTimes;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_ClearEventArrays")

ARRAY LONGINT:C221(<>Cal_al_EventIDS; 0)
ARRAY TEXT:C222(<>Cal_at_EventTypes; 0)
ARRAY TEXT:C222(<>Cal_at_EventTitles; 0)
ARRAY DATE:C224(<>Cal_ad_EventOStartDates; 0)
ARRAY TIME:C1223(<>Cal_ati_EventOStartTimes; 0)
ARRAY DATE:C224(<>Cal_ad_EventOEndDates; 0)
ARRAY TIME:C1223(<>Cal_ati_EventOEndTimes; 0)
ARRAY LONGINT:C221(<>Cal_al_EventColors; 0)
ARRAY LONGINT:C221(<>Cal_al_EventGroupIDs; 0)
ARRAY TEXT:C222(<>Cal_at_EventNotes; 0)

ARRAY DATE:C224(<>Cal_ad_EventStartDates; 0)
ARRAY LONGINT:C221(<>Cal_al_EventlStartTimes; 0)
ARRAY DATE:C224(<>Cal_ad_EventLendDates; 0)
ARRAY LONGINT:C221(<>Cal_al_EventlEndTimes; 0)
ERR_MethodTrackerReturn("Cal4D_ClearEventArrays"; $_t_oldMethodName)