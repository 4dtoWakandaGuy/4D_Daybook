//%attributes = {}
If (False:C215)
	//Project Method Name:      Quit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/05/2012 14:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array LONGINT(<>PRC_al_ProcessNum;0)
	C_BOOLEAN:C305(<>holdQuit; <>SYS_bo_QuitCalled)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Quit")
//I  `Quit
//modified NG September 2000
//this method is called from the 'on exit' database method now
//because it is also called from the menus and i dont want to change the menus
//i have modified this routine so that on the first call (from a menu)
//it sets a flag to true and then quits 4D


//the reason for moving this to a new system is so that
If (<>holdQuit)
	Repeat 
		DelayTicks(10)
	Until (<>holdQuit=False:C215)
	FLUSH CACHE:C297
	
End if 

// Modified 25/04/02 pb
//NG modifying for version 5.3 because in OSX this method is not called if you use the 4D menu to quit
<>SYS_bo_QuitCalled:=True:C214
If (Not:C34(Undefined:C82(<>PRC_al_ProcessNum)))
	Menu_Record("Quit"; "Quit")  // not sure what this does so better leave it alone pb
	
	If (Size of array:C274(<>PRC_al_ProcessNum)>0)
		If (QuitCheckUserProcsRunning=True:C214)  // OK to quit
			QUIT 4D:C291  // cleanup stuff is handled in ON EXIT db method
			
			
		End if 
	Else 
		QUIT 4D:C291
	End if 
Else 
	QUIT 4D:C291
End if 
ERR_MethodTrackerReturn("Quit"; $_t_oldMethodName)