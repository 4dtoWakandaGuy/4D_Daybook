//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_SWActAr
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
	//ARRAY TEXT(<>WP_at_DocumentDiaryActionCode;0)
	//ARRAY TEXT(<>WP_at_DocumentDiaryActionName;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_SWActAr")
//Letters_SWActAr
READ ONLY:C145([ACTIONS:13])
QUERY:C277([ACTIONS:13]; [ACTIONS:13]DocumentManager_Action:7=True:C214)
SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; <>WP_at_DocumentDiaryActionCode; [ACTIONS:13]Action_Name:2; <>WP_at_DocumentDiaryActionName)
SORT ARRAY:C229(<>WP_at_DocumentDiaryActionName; <>WP_at_DocumentDiaryActionCode; >)
If (Size of array:C274(<>WP_at_DocumentDiaryActionCode)=0)
	Gen_Alert("Please first define Action(s) as WP Document Actions in the Data Manager")
	CANCEL:C270
Else 
	<>WP_at_DocumentDiaryActionCode:=Find in array:C230(<>WP_at_DocumentDiaryActionName; "@Let@")
	If (<>WP_at_DocumentDiaryActionCode=0)
		<>WP_at_DocumentDiaryActionCode:=1
		<>WP_at_DocumentDiaryActionName:=1
	Else 
		<>WP_at_DocumentDiaryActionName:=<>WP_at_DocumentDiaryActionCode
	End if 
End if 
ERR_MethodTrackerReturn("Letters_SWActAr"; $_t_oldMethodName)