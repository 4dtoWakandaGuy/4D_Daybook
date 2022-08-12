//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_InLPM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 19:51:53If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284(<>CallCode; <>CompCode; <>ContCode; <>JobCode; <>OrderCode; <>ProdCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InLPM")
[DIARY:12]Export:24:=Export_Stamp3([DIARY:12]Export:24)
DB_bo_RecordModified:=True:C214
<>CompCode:=[DIARY:12]Company_Code:1
<>ContCode:=[DIARY:12]Contact_Code:2
<>CallCode:=[DIARY:12]Call_Code:25
<>OrderCode:=[DIARY:12]Order_Code:26
<>JobCode:=[DIARY:12]Job_Code:19
<>ProdCode:=[DIARY:12]Product_Code:13
If ([DIARY:12]Done:14)
	[DIARY:12]Personal_Priority:31:=""
Else 
	[DIARY:12]Personal_Priority:31:=[DIARY:12]Person:8+(" "*(5-(Length:C16([DIARY:12]Person:8))))+Substring:C12([DIARY:12]Priority:17; 1; 2)
End if 
ERR_MethodTrackerReturn("Diary_InLPM"; $_t_oldMethodName)