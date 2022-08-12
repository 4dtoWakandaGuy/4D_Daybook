//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_User_Name
	//------------------ Method Notes ------------------
	//*****************************************************************************
	////
	////  Cal4D_User_Name
	////
	////  Written by Charles Vass - 09/11/2009, 15:58
	////
	////  Purpose:
	////
	////  $1 - type - purpose
	////
	////
	//*****************************************************************************
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 15:30`Method: Cal4D_User_Name
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ReadOnlyState)
	C_TEXT:C284($_t_oldMethodName; $_t_User; $0; SD_T_CurrentViewedDiary)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_User_Name")
$_bo_ReadOnlyState:=Read only state:C362([PERSONNEL:11])

If (Not:C34($_bo_ReadOnlyState))
	READ ONLY:C145([PERSONNEL:11])
End if 

//========================    Method Actions    ==================================

QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=SD_T_CurrentViewedDiary)
If (Records in selection:C76([PERSONNEL:11])=1)
	$_t_User:=[PERSONNEL:11]Name:2  //This will swapped to a new fied for the persons calender name
Else 
	$_t_User:="Unknown"
End if 
REDUCE SELECTION:C351([PERSONNEL:11]; 0)

//========================    Clean up and Exit    =================================

If (Not:C34($_bo_ReadOnlyState))
	READ WRITE:C146([PERSONNEL:11])
End if 

$0:=$_t_User
ERR_MethodTrackerReturn("Cal4D_User_Name"; $_t_oldMethodName)