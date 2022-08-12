//%attributes = {}

//Project Method Name:      CCM_TEST
//------------------ Method Notes ------------------="+String($4))
//but am n
// ----------------------------------------------------
// Creator: Nigel Greenlee
//Date & time: 02/12/2009 15:12`Method: CCM_TEST
//Description
//------------------ Revision Control ----------------
//Date Created:  10/12/2019
//Created BY:  Unknown
//Date Modified: 
//Modified By DefaultUser
//Modification notes 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_UrlParameters; 0)
	C_REAL:C285($4; $9)
	C_TEXT:C284($_t_oldMethodName; $1; $10; $11; $12; $13; $14; $15; $16; $17; $2)
	C_TEXT:C284($3; $5; $6; $7; $8)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_TEST")

If (False:C215)
	
Else 
	//CCM_AuthorizeNetSubmit ("AUTH_CAPTURE";"92KgL2uD";"4nT73z4473vLJfXF";1.9;"";"nigel";"Greenlee";"4111111111111111";!31/01/2015!)
End if 
ERR_MethodTrackerReturn("CCM_TEST"; $_t_oldMethodName)