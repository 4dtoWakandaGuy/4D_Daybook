//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Reports Event
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/04/2011 18:15 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>BUTTPROC; $1; $2; $3; vOrdI)
	C_TEXT:C284($_t_oldMethodName; vButtDisREP)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports Event")
//Reports Event
Case of 
	: (($2=11) | ($2=14))  //zoomed; zoomed brought to front
		If ($2=11)
			vOrdI:=$3
		End if 
		vButtDisREP:="I DPMONPFSSSRCADT"
		
		
	: (($2=12) | ($2=15))  //unzoomed; closing
		vOrdI:=0
		vButtDisREP:="I  PMO   SSSRCADT"
		Input_Buttons(->[DOCUMENTS:7]; ->vButtDisREP)
End case 
ERR_MethodTrackerReturn("Reports Event"; $_t_oldMethodName)