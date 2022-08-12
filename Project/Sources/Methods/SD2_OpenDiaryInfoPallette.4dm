//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_OpenDiaryInfoPallette
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($2)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_OpenDiaryInfoPallette")
//This method opens a diary record in a companiion window-it is associated to and watches the main process(the company etc)
//When that Process_Ends then the companion window closes-and runs and code such as asking the user to set a result
If (Count parameters:C259>=2)
	//Note that we are running this already in a process-seperate to the workflow window BUT That process does not run any proc start etc
	If ($1#"") & ($2#0)
		QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$1)
		If (Records in selection:C76([DIARY:12])=1)
			//we are going to open a small pallette showing the date and action of the diary record. As this is a companion record it may contain little information
			//the window will close when the diary closes.
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("SD2_OpenDiaryInfoPallette"; $_t_oldMethodName)