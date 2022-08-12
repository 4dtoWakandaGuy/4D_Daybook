//%attributes = {}
If (False:C215)
	//Project Method Name:      LIC_GetMacaddress
	//------------------ Method Notes ------------------
	//This method gets the MAC address of the machine the system is being installed on
	//Note this should run server side
	//This is iin development. the code currently is mac os on ly
	//------------------ Revision Control ----------------
	//Date Created: 08/07/2010 08:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_LengthFound; 0)
	ARRAY LONGINT:C221($_al_PositionFound; 0)
	ARRAY TEXT:C222($_at_FoundMacs; 0)
	C_BOOLEAN:C305($_bo_Found)
	C_LONGINT:C283($_l_Start)
	C_TEXT:C284($_t_Errors; $_t_oldMethodName; $_t_Pattern; $_t_SubString; inputVal; outputVal)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LIC_GetMacaddress")
ARRAY LONGINT:C221($_al_PositionFound; 0)
ARRAY LONGINT:C221($_al_LengthFound; 0)
ARRAY TEXT:C222($_at_FoundMacs; 0)
inputVal:=" "
LAUNCH EXTERNAL PROCESS:C811("/sbin/ifconfig en0 ether"; inputVal; outputVal; $_t_Errors)
$_t_Pattern:="([0-9a-f]{1,2}:){5,13}[0-9a-f]{1,2}"
$_l_Start:=1

Repeat 
	$_bo_Found:=Match regex:C1019($_t_Pattern; outputVal; $_l_Start; $_al_PositionFound; $_al_LengthFound)
	If ($_bo_Found)
		$_l_Start:=$_al_PositionFound{0}+$_al_LengthFound{0}
		$_t_SubString:=Substring:C12(outputVal; $_al_PositionFound{0}; $_al_LengthFound{0})
		APPEND TO ARRAY:C911($_at_FoundMacs; $_t_SubString)
	End if 
Until (Not:C34($_bo_Found))
//NG $_at_FoundMacs is an array of mac addresses for this machine-multiples if multiple network cards?
//with a pc version of the same we can store this and if the mac address changes cause the licence to fail. We will issue a new licence up to x times automatically(machine changes) but limit the frequency.

//TRACE
//then check the array$_at_FoundMacs

//You could change
//LAUNCH EXTERNAL PROCESS("/sbin/ifconfig en0 ether";inputVal;outputVal)
//by
//LAUNCH EXTERNAL PROCESS("/sbin/ifconfig -a";inputVal;outputVal)
//t`o get ALL mac addresses
ERR_MethodTrackerReturn("LIC_GetMacaddress"; $_t_oldMethodName)