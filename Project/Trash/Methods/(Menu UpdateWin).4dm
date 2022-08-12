//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Menu UpdateWin
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu UpdateWin")
Open window:C153(1; 1; Screen width:C187-1; Screen height:C188-1; 2)
CLOSE WINDOW:C154
ERR_MethodTrackerReturn("Menu UpdateWin"; $_t_oldMethodName)