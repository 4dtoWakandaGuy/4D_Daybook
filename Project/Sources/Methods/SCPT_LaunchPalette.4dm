//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_LaunchPalette
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/08/2012 12:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SCPT_l_PaletteWIndow; DB_l_CURRENTDISPLAYEDFORM; SCPT_l_ExecutionState)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_LaunchPalette")
//This method will open the scripts palette
//if the pallete is not running this will launch it. if it is running already this will call it setting the displayed list of macros to the current table.
//it will also set the 'call back' process for the palette to interacte with as the current process
While (Semaphore:C143("SCPT_TalkingToPalette"))
	DelayTicks(2)
End while 
If (<>SCPT_l_PaletteWIndow>0)
	SHOW PROCESS:C325(<>SCPT_l_PaletteWIndow)
	//Get the state of the process-if its busy running a script in another process dont talk to  it
	GET PROCESS VARIABLE:C371(<>SCPT_l_PaletteWIndow; SCPT_l_ExecutionState; SCPT_l_ExecutionState)
	If (SCPT_l_ExecutionState=0)
		If (Count parameters:C259=0)
			SET PROCESS VARIABLE:C370(<>SCPT_l_PaletteWIndow; SCPT_l_ParentProcess; Current process:C322)
			SET PROCESS VARIABLE:C370(<>SCPT_l_PaletteWIndow; DB_l_CURRENTDISPLAYEDFORM; DB_l_CURRENTDISPLAYEDFORM)
		Else 
			SET PROCESS VARIABLE:C370(<>SCPT_l_PaletteWIndow; SCPT_l_ParentProcess; 0)
			SET PROCESS VARIABLE:C370(<>SCPT_l_PaletteWIndow; DB_l_CURRENTDISPLAYEDFORM; 0)
			//Wonder if context would be useful here...
		End if 
		POST OUTSIDE CALL:C329(<>SCPT_l_PaletteWIndow)
	Else 
		//Can't call palette its busy
		Gen_Alert("The script palette is busy please retry")
		
	End if 
	CLEAR SEMAPHORE:C144("SCPT_TalkingToPalette")
	
Else 
	
	If (Count parameters:C259=0)
		If (DB_l_CURRENTDISPLAYEDFORM>0)
			<>SCPT_l_PaletteWIndow:=New process:C317("SCPT_Palette"; 256000; "Sripts Palette"; Current process:C322; DB_l_CURRENTDISPLAYEDFORM)
		Else 
			<>SCPT_l_PaletteWIndow:=New process:C317("SCPT_Palette"; 256000; "Sripts Palette"; 0; 0)
		End if 
	Else 
		
		<>SCPT_l_PaletteWIndow:=New process:C317("SCPT_Palette"; 256000; "Sripts Palette"; 0; 0)
	End if 
End if 
CLEAR SEMAPHORE:C144("SCPT_TalkingToPalette")
//DB_l_CURRENTDISPLAYEDFORM
ERR_MethodTrackerReturn("SCPT_LaunchPalette"; $_t_oldMethodName)