//%attributes = {}
If (False:C215)
	//Project Method Name:      COM_GETLASTCOMMENT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/11/2012 17:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("COM_GETLASTCOMMENT")
If ([COMPANIES:2]Comments:30="")
	QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="COM"; *)
	QUERY:C277([DIARY:12];  & ; [DIARY:12]Company_Code:1=[COMPANIES:2]Company_Code:1)
	ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Time_Stamp:45; <)
	$0:=[DIARY:12]Result_Description:12
Else 
	$0:=[COMPANIES:2]Comments:30
End if 
ERR_MethodTrackerReturn("COM_GETLASTCOMMENT"; $_t_oldMethodName)