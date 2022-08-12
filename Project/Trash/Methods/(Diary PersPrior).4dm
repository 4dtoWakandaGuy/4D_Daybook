//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary PersPrior
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary PersPrior")
//see also Diary_InLPM
If ([DIARY:12]Done:14)
	[DIARY:12]Personal_Priority:31:=""
Else 
	[DIARY:12]Personal_Priority:31:=[DIARY:12]Person:8+(" "*(5-(Length:C16([DIARY:12]Person:8))))+Substring:C12([DIARY:12]Priority:17; 1; 2)
End if 
ERR_MethodTrackerReturn("Diary PersPrior"; $_t_oldMethodName)