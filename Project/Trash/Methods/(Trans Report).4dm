//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Trans Report
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
	C_LONGINT:C283(vTr)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans Report")
//trans Report
Start_Process
If (Trans_File)
	READ ONLY:C145
	While (vTr=1)
		Trans_Sel
		Gen_ModMid("Trans Reports"; "Master"; ->[TRANSACTIONS:29]; ->vTr; "Transactions"; "")
	End while 
End if 

Process_End
ERR_MethodTrackerReturn("Trans Report"; $_t_oldMethodName)