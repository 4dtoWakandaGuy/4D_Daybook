If (False:C215)
	//object Name: [SCRIPTS]Scripts_in.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/08/2012 19:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(SMC_ad_LastModifiedDates;0)
	//ARRAY TEXT(SMC_at_LastEditedPersons;0)
	//ARRAY TEXT(SMC_at_LastModifiedTexts;0)
	C_TEXT:C284($_t_oldMethodName; SMC_T_LastModifiedData)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SCRIPTS].Scripts_in.Variable4"; Form event code:C388)
ARRAY TEXT:C222(SMC_at_LastEditedPersons; 0)
ARRAY DATE:C224(SMC_ad_LastModifiedDates; 0)
ARRAY TEXT:C222(SMC_at_LastModifiedTexts; 0)
SMC_T_LastModifiedData:=""
SET BLOB SIZE:C606([SCRIPTS:80]Modified_Info:14; 0)
FORM GOTO PAGE:C247(1)
ERR_MethodTrackerReturn("OBJ [SCRIPTS].Scripts_in.Variable4"; $_t_oldMethodName)