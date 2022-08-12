//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_PrefsDeclareDefaults
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_PrefsDeclareDefaults
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SR_at_EmailPrintOption1;0)
	//ARRAY TEXT(SR_at_EmailPrintOption2;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3;0)
	//ARRAY TEXT(SR_at_EmailPrintOption4;0)
	//ARRAY TEXT(SR_t_EmailPrintOption2Role;0)
	//ARRAY TEXT(SR_t_EmailPrintOption3Role;0)
	C_TEXT:C284($_t_oldMethodName; SR_t_EmailPrintOption2Cont; SR_t_EmailPrintOption2Email; SR_t_EmailPrintOption2Pers; SR_t_EmailPrintOption3Cont; SR_t_EmailPrintOption3Email; SR_t_EmailPrintOption3Pers)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_PrefsDeclareDefaults")



//*********************** added 26/11/08 v631b120i -kmw *********************
//ensure vars are declared before saving to blob
If ((Type:C295(SR_at_EmailPrintOption1)=Is undefined:K8:13) | (Is a variable:C294(->SR_at_EmailPrintOption1)=False:C215))
	ARRAY TEXT:C222(SR_at_EmailPrintOption1; 0)
End if 
If ((Type:C295(SR_at_EmailPrintOption2)=Is undefined:K8:13) | (Is a variable:C294(->SR_at_EmailPrintOption2)=False:C215))
	ARRAY TEXT:C222(SR_at_EmailPrintOption2; 0)
End if 
If ((Type:C295(SR_at_EmailPrintOption3)=Is undefined:K8:13) | (Is a variable:C294(->SR_at_EmailPrintOption3)=False:C215))
	ARRAY TEXT:C222(SR_at_EmailPrintOption3; 0)
End if 
If ((Type:C295(SR_at_EmailPrintOption4)=Is undefined:K8:13) | (Is a variable:C294(->SR_at_EmailPrintOption4)=False:C215))
	ARRAY TEXT:C222(SR_at_EmailPrintOption4; 0)
End if 

//************ Changed to array of values 20/02/09 -kmw ************
//C_TEXT(SR_t_EmailPrintOption2Role)
//C_TEXT(SR_t_EmailPrintOption3Role)
C_TEXT:C284(SR_t_EmailPrintOption2Role; SR_t_EmailPrintOption2Email; SR_t_EmailPrintOption2Cont; SR_t_EmailPrintOption2Pers)
C_TEXT:C284(SR_t_EmailPrintOption3Role; SR_t_EmailPrintOption3Email; SR_t_EmailPrintOption3Cont; SR_t_EmailPrintOption3Pers)




//********************************************************************

//********************************************************************************
ERR_MethodTrackerReturn("Reports_PrefsDeclareDefaults"; $_t_oldMethodName)
